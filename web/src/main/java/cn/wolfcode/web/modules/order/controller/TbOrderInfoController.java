package cn.wolfcode.web.modules.order.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.wolfcode.web.commons.entity.LayuiPage;
import cn.wolfcode.web.commons.utils.LayuiTools;
import cn.wolfcode.web.commons.utils.PoiExportHelper;
import cn.wolfcode.web.commons.utils.SystemCheckUtils;
import cn.wolfcode.web.modules.BaseController;
import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.custLinkManInfo.service.ITbCustLinkmanService;
import cn.wolfcode.web.modules.custinfo.entity.TbCustomer;
import cn.wolfcode.web.modules.custinfo.service.ITbCustomerService;
import cn.wolfcode.web.modules.log.LogModules;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import cn.wolfcode.web.modules.sys.form.LoginForm;
import cn.wolfcode.web.modules.sys.service.SysUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import cn.wolfcode.web.modules.order.service.ITbOrderInfoService;

import com.baomidou.mybatisplus.extension.service.IService;
import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.SameUrlData;
import link.ahsj.core.annotations.SysLog;
import link.ahsj.core.annotations.UpdateGroup;
import link.ahsj.core.entitys.ApiModel;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @author wbb
 * @since 2023-06-07
 */
@Controller
@RequestMapping("orderInfo")
public class TbOrderInfoController extends BaseController {

    @Autowired
    private ITbOrderInfoService entityService;

    @Autowired
    private ITbCustomerService customerService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ITbCustLinkmanService tbCustLinkmanService;

    private static final String LogModule = "TbOrderInfo";


    @Autowired
    private IService<TbOrderInfo> userService;
    public List<TbOrderInfo> queryUsers(LocalDate startTime, LocalDate endTime) {
        QueryWrapper<TbOrderInfo> wrapper = new QueryWrapper<>();
        // between 方法用于添加时间段条件
        wrapper.between("create_time", startTime, endTime);
        // selectSql 方法用于在查询语句中添加 SQL 函数
        wrapper.select("*, TIMESTAMPDIFF(SECOND, create_time, NOW()) as time_diff");

        List<TbOrderInfo> userList = userService.list(wrapper);
        // 处理查询结果
        return userList;
    }


    @GetMapping("/list.html")
    public String list() {
        return "order/orderInfo/list";
    }

    @RequestMapping("/add.html")
    @PreAuthorize("hasAuthority('order:orderInfo:add')")
    public ModelAndView toAdd(ModelAndView mv) {

        List<TbCustomer> customerList = customerService.list();

        mv.addObject("customerList",customerList);

        mv.setViewName("order/orderInfo/add");
        return mv;
    }

    @GetMapping("/{id}.html")
    @PreAuthorize("hasAuthority('order:orderInfo:update')")
    public ModelAndView toUpdate(@PathVariable("id") String id, ModelAndView mv) {
        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);
        mv.setViewName("order/orderInfo/update");
        mv.addObject("obj", entityService.getById(id));
        mv.addObject("id", id);
        return mv;
    }

    @RequestMapping("list")
    @PreAuthorize("hasAuthority('order:orderInfo:list')")
    public ResponseEntity page(LayuiPage layuiPage, String parameterName, String startDate, String endDate) {
        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);
        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());

        System.out.println("startDate:"+startDate);
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        List<TbOrderInfo> orderInfoList;

        LocalDateTime startTime=null;
        LocalDateTime endTime=null;

        if (StringUtils.isNotEmpty(startDate)){
             startTime = LocalDateTime.parse(startDate, df);
        }

        if (StringUtils.isNotEmpty(endDate)){
             endTime = LocalDateTime.parse(endDate, df);
        }

        if (StringUtils.isNotEmpty(startDate) || StringUtils.isNotEmpty(endDate)) {
            orderInfoList = entityService.queryByTime(startTime,endTime);
        }
        else {
            orderInfoList = entityService.list();
        }
        if (orderInfoList.size()!=0) {
            List<String> order_time = new ArrayList<>();
            for (TbOrderInfo info : orderInfoList) {
                order_time.add(info.getId());
            }
            TbCustomer tbCustomers = customerService.lambdaQuery()
                    .like(StringUtils.isNotEmpty(parameterName), TbCustomer::getCustomerName, parameterName)
                    .list().get(0);
            page = entityService.lambdaQuery()
                    .in(TbOrderInfo::getId, order_time)
                    .like(StringUtils.isNotEmpty(parameterName), TbOrderInfo::getCustId, tbCustomers.getId())
                    .page(page);

            List<TbOrderInfo> records = page.getRecords();
            List<String> ids = new ArrayList<>();
            for (TbOrderInfo record : records) {
                ids.add(record.getReceiver());
            }
            Map<String, String> collect = tbCustLinkmanService.batchUserInfo(ids).stream().collect(Collectors.toMap(TbCustLinkman::getId, TbCustLinkman::getLinkman));
            for (TbOrderInfo record : records) {
                TbCustomer customer = customerService.getById(record.getCustId());
                record.setCustIdName(customer.getCustomerName());

                SysUser inputUser = sysUserService.getById(record.getInputUser());
                record.setInputUserName(inputUser.getUsername());

                record.setReceiverName(collect.getOrDefault(record.getReceiver(), ""));
            }
        }

        return ResponseEntity.ok(LayuiTools.toLayuiTableModel(page));
    }

    @SameUrlData
    @PostMapping("save")
    @SysLog(value = LogModules.SAVE, module =LogModule)
    @PreAuthorize("hasAuthority('order:orderInfo:add')")
    public ResponseEntity<ApiModel> save(@Validated({AddGroup.class}) @RequestBody TbOrderInfo entity, HttpServletRequest request) {

        entity.setInputTime(LocalDateTime.now());
        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUser(loginUser.getUserId());

        entityService.save(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SameUrlData
    @SysLog(value = LogModules.UPDATE, module = LogModule)
    @PutMapping("update")
    @PreAuthorize("hasAuthority('order:orderInfo:update')")
    public ResponseEntity<ApiModel> update(@Validated({UpdateGroup.class}) @RequestBody TbOrderInfo entity) {

        //当状态是收货的时候 发货时间修改
        if(entity.getStatus()==2){
            entity.setReceiveTime(LocalDateTime.now());
        }
        if(entity.getStatus()==1){
            entity.setDeliverTime(LocalDateTime.now());
        }
        entityService.updateById(entity);

        return ResponseEntity.ok(ApiModel.ok());
    }

    @SysLog(value = LogModules.DELETE, module = LogModule)
    @DeleteMapping("delete/{id}")
    @PreAuthorize("hasAuthority('order:orderInfo:delete')")
    public ResponseEntity<ApiModel> delete(@PathVariable("id") String id) {
        entityService.removeById(id);
        return ResponseEntity.ok(ApiModel.ok());
    }

    /**
     * 导出
     *
     * @param parameterName
     *
     */
    @RequestMapping("export")
    public void export(HttpServletResponse response, String parameterName,String startDate,String endDate){

        System.out.println(startDate);

        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        List<TbOrderInfo> orderInfoList;

        LocalDateTime startTime=null;
        LocalDateTime endTime=null;

        if (StringUtils.isNotEmpty(startDate) && !"undefined".equals(startDate)){
            startTime = LocalDateTime.parse(startDate, df);
        }

        if (StringUtils.isNotEmpty(endDate) && !"undefined".equals(endDate)){
            endTime = LocalDateTime.parse(endDate, df);
        }

        if ((StringUtils.isNotEmpty(startDate)&&!"undefined".equals(startDate)) || (StringUtils.isNotEmpty(endDate) && !"undefined".equals(endDate))) {
            orderInfoList = entityService.queryByTime(startTime,endTime);
        }
        else {
            orderInfoList = entityService.list();
        }
        if (orderInfoList.size()!=0) {
            List<String> order_time = new ArrayList<>();
            for (TbOrderInfo info : orderInfoList) {
                order_time.add(info.getId());
            }
            TbCustomer tbCustomers = customerService.lambdaQuery()
                    .like(StringUtils.isNotEmpty(parameterName), TbCustomer::getCustomerName, parameterName)
                    .list().get(0);
            List<TbOrderInfo> orderInfos = entityService.lambdaQuery()
                    .in(TbOrderInfo::getId, order_time)
                    .like(StringUtils.isNotEmpty(parameterName), TbOrderInfo::getCustId, tbCustomers.getId()).list();



        //1.导出内容


        for (TbOrderInfo orderInfo : orderInfos) {

            orderInfo.setCustIdName(customerService.getById(orderInfo.getCustId()).getCustomerName());

            orderInfo.setReceiverName(tbCustLinkmanService.getById(orderInfo.getReceiver()).getLinkman());

            orderInfo.setInputUserName(sysUserService.getById(orderInfo.getInputUser()).getUsername());

        }

        //2.样式
        ExportParams params = new ExportParams();

        //3.组装对象
        /**
         * 参数一 样式
         * 参数二 实体类
         * 参数三 导出内容
         *
         * error数组越界：未在实体类中设置导出字段
         */
        Workbook excel = ExcelExportUtil.exportExcel(params, TbOrderInfo.class, orderInfos);

        //4.导出
        try {
            /**
             * 参数一 HttpServletResponse
             * 参数二 导出表名
             * 参数三 workbook对象
             */
            PoiExportHelper.exportExcel(response,"订货单",excel);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

}}
