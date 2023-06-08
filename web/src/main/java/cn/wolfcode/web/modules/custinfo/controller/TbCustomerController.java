package cn.wolfcode.web.modules.custinfo.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import cn.wolfcode.web.commons.entity.ExcelExportEntityWrapper;
import cn.wolfcode.web.commons.entity.LayuiPage;
import cn.wolfcode.web.commons.utils.*;
import cn.wolfcode.web.modules.BaseController;
import cn.wolfcode.web.modules.custContract.entity.TbContract;
import cn.wolfcode.web.modules.custContract.service.ITbContractService;
import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.custLinkManInfo.service.ITbCustLinkmanService;
import cn.wolfcode.web.modules.linkVisit.entity.TbVisit;
import cn.wolfcode.web.modules.linkVisit.service.ITbVisitService;
import cn.wolfcode.web.modules.log.LogModules;
import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import cn.wolfcode.web.modules.order.service.ITbOrderInfoService;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import cn.wolfcode.web.modules.sys.form.LoginForm;
import cn.wolfcode.web.modules.sys.service.SysUserService;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.custinfo.entity.TbCustomer;
import cn.wolfcode.web.modules.custinfo.service.ITbCustomerService;

import link.ahsj.core.annotations.*;
import link.ahsj.core.entitys.ApiModel;
import link.ahsj.core.entitys.KeyValue;
import link.ahsj.core.exception.AppServerException;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;

/**
 * @author wbb
 * @since 2023-05-30
 */
@Controller
@RequestMapping("custinfo")
public class TbCustomerController extends BaseController {

    @Autowired
    private ITbCustomerService entityService;

    @Autowired
    private ITbCustLinkmanService custLinkmanService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ITbVisitService visitService;

    @Autowired
    private ITbContractService contractService;

    @Autowired
    private ITbOrderInfoService orderInfoService;


    private static final String LogModule = "TbCustomer";

    @GetMapping("/list.html")
    public ModelAndView list(ModelAndView mv) {

        List<KeyValue> citys = CityUtils.citys;

        mv.addObject("citys",citys);
        mv.setViewName("cust/custinfo/list");
        return mv;
    }

    @RequestMapping("/add.html")
    @PreAuthorize("hasAuthority('cust:custinfo:add')")
    public ModelAndView toAdd(ModelAndView mv) {
        List<KeyValue> citys = CityUtils.citys;
        mv.addObject("citys",citys);

        mv.setViewName("cust/custinfo/add");
        return mv;
    }

    @GetMapping("/{id}.html")
    @PreAuthorize("hasAuthority('cust:custinfo:update')")
    public ModelAndView toUpdate(@PathVariable("id") String id, ModelAndView mv) {
        List<KeyValue> citys = CityUtils.citys;
        mv.addObject("citys",citys);
        mv.setViewName("cust/custinfo/update");
        mv.addObject("obj", entityService.getById(id));
        mv.addObject("id", id);
        return mv;
    }

    @RequestMapping("list")
    @PreAuthorize("hasAuthority('cust:custinfo:list')")
    public ResponseEntity page(LayuiPage layuiPage,String parameterName,String province,String openStatus) {

        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);
        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());

        if ("".equals(CityUtils.getCityValue(province))){
            province=null;
        };

        if ("".equals(openStatus)){
            openStatus = null;
        }

        if ("\n".equals(parameterName)){
            parameterName=null;
        }
        page = entityService.lambdaQuery()
                .eq(StringUtils.isNotEmpty(province),TbCustomer::getProvince,province)
                .eq(StringUtils.isNotEmpty(openStatus),TbCustomer::getOpenStatus,openStatus)
                .like(StringUtils.isNotEmpty(parameterName),TbCustomer::getCustomerName, parameterName)
                .page(page);


        List<TbCustomer> records = page.getRecords();

        for (TbCustomer record : records) {
            String cityValue = CityUtils.getCityValue(record.getProvince());
            SysUser inputUser = sysUserService.getById(record.getInputUserId());
            record.setProvinceName(cityValue);
            record.setInputUserName(inputUser.getUsername());
        }




        return ResponseEntity.ok(LayuiTools.toLayuiTableModel(page));
    }

    @SameUrlData
    @PostMapping("save")
    @SysLog(value = LogModules.SAVE, module =LogModule)
    @PreAuthorize("hasAuthority('cust:custinfo:add')")
    public ResponseEntity<ApiModel> save(@Validated({AddGroup.class}) @RequestBody TbCustomer entity,
                                         HttpServletRequest request) {


        //设置录入时间和录入人
        entity.setInputTime(LocalDateTime.now());
        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUserId(loginUser.getUserId());

        //判断企业名称是否重复
        Integer count = entityService.lambdaQuery().eq(StringUtils.isNotEmpty(entity.getCustomerName()), TbCustomer::getCustomerName, entity.getCustomerName()).count();
        if (count>0){
            throw new AppServerException("该企业名称重复");
        }

        entityService.save(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SameUrlData
    @SysLog(value = LogModules.UPDATE, module = LogModule)
    @PutMapping("update")
    @PreAuthorize("hasAuthority('cust:custinfo:update')")
    public ResponseEntity<ApiModel> update(@Validated({UpdateGroup.class}) @RequestBody TbCustomer entity,HttpServletRequest request) {

        //判断企业名称是否重复
        Integer count = entityService.lambdaQuery().eq(StringUtils.isNotEmpty(entity.getCustomerName()), TbCustomer::getCustomerName, entity.getCustomerName())
                .ne(TbCustomer::getId,entity.getId())
                .count();
        if (count>0){
            throw new AppServerException("该企业名称重复");
        }

        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUserId(loginUser.getUserId());
        entity.setUpdateTime(LocalDateTime.now());
        entityService.updateById(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SysLog(value = LogModules.DELETE, module = LogModule)
    @DeleteMapping("delete/{id}")
    @PreAuthorize("hasAuthority('cust:custinfo:delete')")
    public ResponseEntity<ApiModel> delete(@PathVariable("id") String id) {

        //删除企业时同时删除旗下联系人
        custLinkmanService.lambdaUpdate().eq(TbCustLinkman::getCustId,id).remove();

        //删除企业时同时删除其访客访问记录
        visitService.lambdaUpdate().eq(TbVisit::getCustId,id).remove();

        //删除企业时同时删除合同表内容
        contractService.lambdaUpdate().eq(TbContract::getCustId,id).remove();

        //删除企业时同时删除订货单表内容
        orderInfoService.lambdaUpdate().eq(TbOrderInfo::getCustId,id).remove();

        //删除企业
        entityService.removeById(id);
        return ResponseEntity.ok(ApiModel.ok());
    }

    //导入功能

    @RequestMapping("import.html")
    public ModelAndView custImport(ModelAndView modelAndView){
        modelAndView.setViewName("cust/custinfo/importCust");
        return modelAndView;
    }

    @RequestMapping("template")
    public void template(HttpServletResponse response){
        //構建excel模板字段
        ExcelExportEntityWrapper excelExportEntityWrapper = new ExcelExportEntityWrapper();
        excelExportEntityWrapper.entity(TbCustomer.CUSTOMERNAME_COL,"customerName",40)
                .entity(TbCustomer.LEGALLEADER_COL,"legalLeader",20)
                .entity(TbCustomer.REGISTERDATE_COL,"registerDate",20)
                .entity(TbCustomer.OPENSTATUS_COL,"openStatus",20)
                .entity(TbCustomer.PROVINCENAME_COL,"provinceName",20)
                .entity(TbCustomer.REGCAPITAL_COL,"regCapital",20)
                .entity(TbCustomer.INDUSTRY_COL,"industry",20)
                .entity(TbCustomer.SCOPE_COL,"scope",20)
                .entity(TbCustomer.REGADDR_COL,"regAddr",20)
                .entity(TbCustomer.INPUTTIME_COL,"inputTime",20)
                .entity(TbCustomer.INPUTUSERNAME_COL,"inputUserName",20);
        //組裝workbook
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(), excelExportEntityWrapper.getResult(), new ArrayList<>());


        try {
            PoiExportHelper.exportExcel(response,"客户联系人",workbook);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("import")
    public ResponseEntity importCust(MultipartFile file,HttpServletRequest request) throws Exception {

        List<TbCustomer> importResult = ExcelUtils.readMultipartFile(file, TbCustomer.class);

//        ImportParams importParams = PoiImportHelper.buildImportParams(new String[]{
//                TbCustomer.CUSTOMERNAME_COL,
//                TbCustomer.LEGALLEADER_COL,
//                TbCustomer.REGISTERDATE_COL,
//                TbCustomer.OPENSTATUS_COL,
//                TbCustomer.PROVINCENAME_COL,
//                TbCustomer.REGCAPITAL_COL,
//                TbCustomer.INDUSTRY_COL,
//                TbCustomer.SCOPE_COL,
//                TbCustomer.REGADDR_COL,
//                TbCustomer.INPUTTIME_COL,
//                TbCustomer.INPUTUSERNAME_COL
//        }, new Class[]{
//                ImportGroup.class
//        });



        for (TbCustomer customer : importResult) {
            customer.setInputTime(LocalDateTime.now());

            SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
            customer.setInputUserId(loginUser.getUserId());

            customer.setProvince(CityUtils.getCityKey(customer.getProvinceName()));
        }

        //插入到数据库
        boolean b = entityService.saveBatch(importResult);

        return b ? ResponseEntity.ok(ApiModel.ok()): ResponseEntity.ok(ApiModel.error());
    }


    //导出功能
    @RequestMapping("export")
    public void export(HttpServletResponse response,String parameterName,String province,String openStatus){
        System.out.println("parameterName:"+parameterName);
        System.out.println("province:"+province);
        System.out.println("openStatus:"+openStatus);
        //1.导出内容
        List<TbCustomer> customers = entityService.lambdaQuery()
                .like(StringUtils.isNotEmpty(parameterName), TbCustomer::getCustomerName, parameterName)
                .or()
                .like(StringUtils.isNotEmpty(province), TbCustomer::getProvince, province)
                .or()
                .like(StringUtils.isNotEmpty(openStatus), TbCustomer::getOpenStatus, openStatus)
                .list();

        for (TbCustomer customer : customers) {
            customer.setProvinceName(CityUtils.getCityValue(customer.getProvince()));
            customer.setInputUserName(sysUserService.getById(customer.getInputUserId()).getUsername());
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
        Workbook excel = ExcelExportUtil.exportExcel(params, TbCustomer.class, customers);

        //4.导出
        try {
            /**
             * 参数一 HttpServletResponse
             * 参数二 导出表名
             * 参数三 workbook对象
             */
            PoiExportHelper.exportExcel(response,"企业客户信息",excel);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
