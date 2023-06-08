package cn.wolfcode.web.modules.order.controller;

import cn.wolfcode.web.commons.entity.LayuiPage;
import cn.wolfcode.web.commons.utils.LayuiTools;
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
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import cn.wolfcode.web.modules.order.service.ITbOrderInfoService;

import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.SameUrlData;
import link.ahsj.core.annotations.SysLog;
import link.ahsj.core.annotations.UpdateGroup;
import link.ahsj.core.entitys.ApiModel;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
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
    public ResponseEntity page(LayuiPage layuiPage, String parameterName) {
        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);

        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());
        TbCustomer tbCustomers = customerService.lambdaQuery()
                .like(StringUtils.isNotEmpty(parameterName), TbCustomer::getCustomerName, parameterName)
                .list().get(0);
        page = entityService.lambdaQuery()
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

}
