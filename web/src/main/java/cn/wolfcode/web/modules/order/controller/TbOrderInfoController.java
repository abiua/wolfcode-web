package cn.wolfcode.web.modules.order.controller;

import cn.wolfcode.web.commons.entity.LayuiPage;
import cn.wolfcode.web.commons.utils.LayuiTools;
import cn.wolfcode.web.commons.utils.SystemCheckUtils;
import cn.wolfcode.web.modules.BaseController;
import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.custinfo.entity.TbCustomer;
import cn.wolfcode.web.modules.custinfo.service.ITbCustomerService;
import cn.wolfcode.web.modules.log.LogModules;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import cn.wolfcode.web.modules.sys.form.LoginForm;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import cn.wolfcode.web.modules.order.service.ITbOrderInfoService;

import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.SameUrlData;
import link.ahsj.core.annotations.SysLog;
import link.ahsj.core.annotations.UpdateGroup;
import link.ahsj.core.entitys.ApiModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.List;

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
    public ResponseEntity page(LayuiPage layuiPage) {
        SystemCheckUtils.getInstance().checkMaxPage(layuiPage);
        IPage page = new Page<>(layuiPage.getPage(), layuiPage.getLimit());

        return ResponseEntity.ok(LayuiTools.toLayuiTableModel(entityService.page(page)));
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
