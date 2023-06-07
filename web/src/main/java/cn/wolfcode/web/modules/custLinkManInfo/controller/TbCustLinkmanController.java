package cn.wolfcode.web.modules.custLinkManInfo.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.wolfcode.web.commons.entity.LayuiPage;
import cn.wolfcode.web.commons.utils.LayuiTools;
import cn.wolfcode.web.commons.utils.PoiExportHelper;
import cn.wolfcode.web.commons.utils.SystemCheckUtils;
import cn.wolfcode.web.modules.BaseController;
import cn.wolfcode.web.modules.custinfo.entity.TbCustomer;
import cn.wolfcode.web.modules.custinfo.service.ITbCustomerService;
import cn.wolfcode.web.modules.log.LogModules;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import cn.wolfcode.web.modules.sys.form.LoginForm;
import cn.wolfcode.web.modules.sys.service.SysUserService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.custLinkManInfo.service.ITbCustLinkmanService;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wbb
 * @since 2023-05-31
 */
@Controller
@RequestMapping("custLinkManInfo")
public class TbCustLinkmanController extends BaseController {

    @Autowired
    private ITbCustLinkmanService entityService;

    @Autowired
    private ITbCustomerService customerService;

    @Autowired
    private SysUserService sysUserService;

    private static final String LogModule = "TbCustLinkman";

    @GetMapping("/list.html")
    public String list() {
        return "custLinkMan/custLinkManInfo/list";
    }

    @RequestMapping("/add.html")
    @PreAuthorize("hasAuthority('custLinkMan:custLinkManInfo:add')")
    public ModelAndView toAdd(ModelAndView mv) {
        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);
        mv.setViewName("custLinkMan/custLinkManInfo/add");
        return mv;
    }

    @GetMapping("/{id}.html")
    @PreAuthorize("hasAuthority('custLinkMan:custLinkManInfo:update')")
    public ModelAndView toUpdate(@PathVariable("id") String id, ModelAndView mv) {
        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);
        mv.setViewName("custLinkMan/custLinkManInfo/update");
        mv.addObject("obj", entityService.getById(id));
        mv.addObject("id", id);
        return mv;
    }

    @RequestMapping("list")
    @PreAuthorize("hasAuthority('custLinkMan:custLinkManInfo:list')")
    public ResponseEntity page(LayuiPage layuiPage,String parameterName) {
        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);
        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());

        page = entityService.lambdaQuery()
                .like(StringUtils.isNotEmpty(parameterName), TbCustLinkman::getLinkman, parameterName)
                .or()
                .like(StringUtils.isNotEmpty(parameterName), TbCustLinkman::getPhone, parameterName)
                .page(page);

        List<TbCustLinkman> records = page.getRecords();
        for (TbCustLinkman record : records) {
            String custId = record.getCustId();
            TbCustomer customer = customerService.getById(custId);
            record.setCustLinkName(customer.getCustomerName());

            SysUser inputUser = sysUserService.getById(record.getInputUser());
            record.setInputUserName(inputUser.getUsername());
        }
        return ResponseEntity.ok(LayuiTools.toLayuiTableModel(page));
    }

    @SameUrlData
    @PostMapping("save")
    @SysLog(value = LogModules.SAVE, module =LogModule)
    @PreAuthorize("hasAuthority('custLinkMan:custLinkManInfo:add')")
    public ResponseEntity<ApiModel> save(@Validated({AddGroup.class}) @RequestBody TbCustLinkman entity, HttpServletRequest request) {
        entity.setInputTime(LocalDateTime.now());
        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUser(loginUser.getUserId());
        entityService.save(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SameUrlData
    @SysLog(value = LogModules.UPDATE, module = LogModule)
    @PutMapping("update")
    @PreAuthorize("hasAuthority('custLinkMan:custLinkManInfo:update')")
    public ResponseEntity<ApiModel> update(@Validated({UpdateGroup.class}) @RequestBody TbCustLinkman entity) {
        entityService.updateById(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SysLog(value = LogModules.DELETE, module = LogModule)
    @DeleteMapping("delete/{id}")
    @PreAuthorize("hasAuthority('custLinkMan:custLinkManInfo:delete')")
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
    public void export(HttpServletResponse response,String parameterName){
        //1.导出内容
        List<TbCustLinkman> linkmen = entityService.lambdaQuery()
                .like(StringUtils.isNotEmpty(parameterName), TbCustLinkman::getLinkman, parameterName)
                .or()
                .like(StringUtils.isNotEmpty(parameterName), TbCustLinkman::getPhone, parameterName)
                .list();

        for (TbCustLinkman linkman : linkmen) {
            TbCustomer customer = customerService.getById(linkman.getCustId());
            linkman.setCustName(customer.getCustomerName());
            System.out.println(sysUserService.getById(linkman.getInputUser()).getUsername());
            linkman.setInputUserName(sysUserService.getById(linkman.getInputUser()).getUsername());
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
        Workbook excel = ExcelExportUtil.exportExcel(params, TbCustLinkman.class, linkmen);

        //4.导出
        try {
            /**
             * 参数一 HttpServletResponse
             * 参数二 导出表名
             * 参数三 workbook对象
             */
            PoiExportHelper.exportExcel(response,"客户联系人",excel);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("listByCustomerId")
    public ResponseEntity listByCustomerId(String custId){
        List<TbCustLinkman> list = entityService.lambdaQuery().eq(StringUtils.isNotEmpty(custId), TbCustLinkman::getCustId, custId).list();
        return ResponseEntity.ok(ApiModel.data(list));
    }

}
