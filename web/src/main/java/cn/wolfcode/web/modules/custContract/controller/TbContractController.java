package cn.wolfcode.web.modules.custContract.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.wolfcode.web.commons.entity.LayuiPage;
import cn.wolfcode.web.commons.utils.LayuiTools;
import cn.wolfcode.web.commons.utils.PoiExportHelper;
import cn.wolfcode.web.commons.utils.SystemCheckUtils;
import cn.wolfcode.web.modules.BaseController;
import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.custinfo.entity.TbCustomer;
import cn.wolfcode.web.modules.custinfo.service.ITbCustomerService;
import cn.wolfcode.web.modules.log.LogModules;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import cn.wolfcode.web.modules.sys.form.LoginForm;
import cn.wolfcode.web.modules.sys.service.SysUserService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.custContract.entity.TbContract;
import cn.wolfcode.web.modules.custContract.service.ITbContractService;


import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.SameUrlData;
import link.ahsj.core.annotations.SysLog;
import link.ahsj.core.annotations.UpdateGroup;
import link.ahsj.core.entitys.ApiModel;
import link.ahsj.core.exception.AppServerException;
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
import java.util.ArrayList;
import java.util.List;

/**
 * @author wbb
 * @since 2023-06-02
 */
@Controller
@RequestMapping("custContractInfo")
public class TbContractController extends BaseController {

    @Autowired
    private ITbContractService entityService;

    private static final String LogModule = "TbContract";

    @Autowired
    private ITbCustomerService customerService;

    @Autowired
    private ITbContractService contractService;

    @Autowired
    private SysUserService sysUserService;

    @GetMapping("/list.html")
    public String list() {
        return "custContract/custContractInfo/list";

//        mv.addObject("obj", entityService.getById(id));
//        mv.setViewName("custContract/custContractInfo/list");
//        return mv;
    }

    @RequestMapping("/add.html")
    @PreAuthorize("hasAuthority('custContract:custContractInfo:add')")
    public ModelAndView toAdd(ModelAndView mv) {
        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);
        mv.setViewName("custContract/custContractInfo/add");
        return mv;
    }

    @GetMapping("/{id}.html")
    @PreAuthorize("hasAuthority('custContract:custContractInfo:update')")
    public ModelAndView toUpdate(@PathVariable("id") String id, ModelAndView mv) {
        TbContract contract = entityService.getById(id);
//        if (contract.getAuditStatus()==0) {
//            mv.setViewName("custContract/custContractInfo/update");
//            throw new AppServerException("无法修改");
//        }

        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);
        mv.setViewName("custContract/custContractInfo/update");
        mv.addObject("obj", entityService.getById(id));
        mv.addObject("id", id);
        return mv;
    }

    @RequestMapping("list")
    @PreAuthorize("hasAuthority('custContract:custContractInfo:list')")
    public ResponseEntity page(LayuiPage layuiPage,String parameterName,String nullifyStatus,String affixSealStatus, String auditStatus) {
        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);
        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());

        page = entityService.lambdaQuery()
                .like(StringUtils.isNotEmpty(parameterName), TbContract::getContractName, parameterName)
                .or()
                .like(StringUtils.isNotEmpty(parameterName), TbContract::getContractCode, parameterName)
                .eq(StringUtils.isNotEmpty(auditStatus), TbContract::getAuditStatus, auditStatus)
                .eq(!StringUtils.isEmpty(affixSealStatus),TbContract::getAffixSealStatus,affixSealStatus)
                .eq(!StringUtils.isEmpty(nullifyStatus),TbContract::getNullifyStatus,nullifyStatus)
                .page(page);

        List<TbContract> records = page.getRecords();
        for (TbContract record : records) {
            TbCustomer customer = customerService.getById(record.getCustId());
            record.setCustIdName(customer.getCustomerName());

            //录入人
             SysUser sysUser = sysUserService.getById(record.getInputUser());
             record.setInputName(sysUser.getUsername());
        }

        return ResponseEntity.ok(LayuiTools.toLayuiTableModel(page));
    }

    @SameUrlData
    @PostMapping("save")
    @SysLog(value = LogModules.SAVE, module =LogModule)
    @PreAuthorize("hasAuthority('custContract:custContractInfo:add')")
    public ResponseEntity<ApiModel> save(@Validated({AddGroup.class}) @RequestBody TbContract entity, HttpServletRequest request) {
        //录入时间
        entity.setInputTime(LocalDateTime.now());
        //录入人
        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUser(loginUser.getUserId());
        entityService.save(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SameUrlData
    @SysLog(value = LogModules.UPDATE, module = LogModule)
    @PutMapping("update")
    @PreAuthorize("hasAuthority('custContract:custContractInfo:update')")
    public ResponseEntity<ApiModel> update(@Validated({UpdateGroup.class}) @RequestBody TbContract entity) {


        entity.setUpdateTime(LocalDateTime.now());//修改时间录入
        entityService.updateById(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SysLog(value = LogModules.DELETE, module = LogModule)
    @DeleteMapping("delete/{id}")
    @PreAuthorize("hasAuthority('custContract:custContractInfo:delete')")
    public ResponseEntity<ApiModel> delete(@PathVariable("id") String id) {
        entityService.removeById(id);
        return ResponseEntity.ok(ApiModel.ok());
    }


    @RequestMapping("export")
    public void export(HttpServletResponse response, String parameterName,
                       String affixSealStatus,String nullifyStatus,String auditStatus){
        //1.导出内容
        List<TbContract> contracts = entityService.lambdaQuery()
                .and(item-> item.like(StringUtils.isNotEmpty(parameterName), TbContract::getContractCode, parameterName)
                                .or()
                                .like(StringUtils.isNotEmpty(parameterName), TbContract::getContractName, parameterName))
                .and(item-> item.eq(StringUtils.isNotEmpty(affixSealStatus),TbContract::getAffixSealStatus,affixSealStatus)
                            .eq(StringUtils.isNotEmpty(nullifyStatus),TbContract::getNullifyStatus,nullifyStatus)
                            .eq(StringUtils.isNotEmpty(auditStatus),TbContract::getAuditStatus,auditStatus)
                )
                .list();

        for (TbContract contract : contracts) {
            contract.setCustIdName(customerService.getById(contract.getCustId()).getCustomerName());
            contract.setInputName(sysUserService.getById(contract.getInputUser()).getUsername());
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
        Workbook excel = ExcelExportUtil.exportExcel(params, TbContract.class, contracts);

        //4.导出
        try {
            /**
             * 参数一 HttpServletResponse
             * 参数二 导出表名
             * 参数三 workbook对象
             */
            PoiExportHelper.exportExcel(response,"合同表",excel);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

}
