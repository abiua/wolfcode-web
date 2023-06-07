package cn.wolfcode.web.modules.linkVisit.controller;

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
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.linkVisit.entity.TbVisit;
import cn.wolfcode.web.modules.linkVisit.service.ITbVisitService;

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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author wbb
 * @since 2023-06-01
 */
@Controller
@RequestMapping("linkVisitInfo")
public class TbVisitController extends BaseController {

    @Autowired
    private ITbVisitService entityService;

    @Autowired
    private ITbCustomerService customerService;

    @Autowired
    private ITbCustLinkmanService linkmanService;

    @Autowired
    private SysUserService sysUserService;

    private static final String LogModule = "TbVisit";

    @GetMapping("/list.html")
    public String list() {
        return "linkVisit/linkVisitInfo/list";
    }

    @RequestMapping("/add.html")
    @PreAuthorize("hasAuthority('linkVisit:linkVisitInfo:add')")
    public ModelAndView toAdd(ModelAndView mv) {

        //选择客户
        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);

        mv.setViewName("linkVisit/linkVisitInfo/add");
        return mv;

    }

    @GetMapping("/{id}.html")
    @PreAuthorize("hasAuthority('linkVisit:linkVisitInfo:update')")
    public ModelAndView toUpdate(@PathVariable("id") String id, ModelAndView mv) {

        //选择客户
        List<TbCustomer> customerList = customerService.list();
        mv.addObject("customerList",customerList);

        //选择联系人
        List<TbCustLinkman> linkmanList = linkmanService.list();
        mv.addObject("linkmanList",linkmanList);

        mv.setViewName("linkVisit/linkVisitInfo/update");
        mv.addObject("obj", entityService.getById(id));
        mv.addObject("id", id);
        return mv;
    }

    @RequestMapping("list")
    @PreAuthorize("hasAuthority('linkVisit:linkVisitInfo:list')")
    public ResponseEntity page(LayuiPage layuiPage, String parameterName) {
        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);
        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());

        page = entityService.lambdaQuery().like(StringUtils.isNotEmpty(parameterName),TbVisit::getVisitReason,parameterName).page(page);

        List<TbVisit> records = page.getRecords();
        for (TbVisit record : records) {
            String linkman = linkmanService.getById(record.getLinkmanId()).getLinkman();
            String custName = customerService.getById(record.getCustId()).getCustomerName();
            String inputUserName = sysUserService.getById(record.getInputUser()).getUsername();
            record.setLinkman(linkman);
            record.setCustName(custName);
            record.setInputUserName(inputUserName);
        }
        return ResponseEntity.ok(LayuiTools.toLayuiTableModel(page));
    }

    @SameUrlData
    @PostMapping("save")
    @SysLog(value = LogModules.SAVE, module =LogModule)
    @PreAuthorize("hasAuthority('linkVisit:linkVisitInfo:add')")
    public ResponseEntity<ApiModel> save(@Validated({AddGroup.class}) @RequestBody TbVisit entity, HttpServletRequest request) {
        entity.setInputTime(LocalDateTime.now());
        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUser(loginUser.getUserId());

        entityService.save(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SameUrlData
    @SysLog(value = LogModules.UPDATE, module = LogModule)
    @PutMapping("update")
    @PreAuthorize("hasAuthority('linkVisit:linkVisitInfo:update')")
    public ResponseEntity<ApiModel> update(@Validated({UpdateGroup.class}) @RequestBody TbVisit entity, HttpServletRequest request) {
        entity.setInputTime(LocalDateTime.now());
        SysUser loginUser = (SysUser)request.getSession().getAttribute(LoginForm.LOGIN_USER_KEY);
        entity.setInputUser(loginUser.getUserId());
        entityService.updateById(entity);
        return ResponseEntity.ok(ApiModel.ok());
    }

    @SysLog(value = LogModules.DELETE, module = LogModule)
    @DeleteMapping("delete/{id}")
    @PreAuthorize("hasAuthority('linkVisit:linkVisitInfo:delete')")
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
    public void export(HttpServletResponse response, String parameterName){
        //1.导出内容
        List<TbVisit> visitReasons = entityService.lambdaQuery()
                .like(StringUtils.isNotEmpty(parameterName), TbVisit::getVisitReason, parameterName)
                .list();

        for (TbVisit visit : visitReasons) {
            visit.setInputUserName(sysUserService.getById(visit.getInputUser()).getUsername());
            visit.setLinkman(linkmanService.getById(visit.getLinkmanId()).getLinkman());
            visit.setCustName(customerService.getById(visit.getCustId()).getCustomerName());
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
        Workbook excel = ExcelExportUtil.exportExcel(params, TbVisit.class, visitReasons);

        //4.导出
        try {
            /**
             * 参数一 HttpServletResponse
             * 参数二 导出表名
             * 参数三 workbook对象
             */
            PoiExportHelper.exportExcel(response,"联系人走访表",excel);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

}
