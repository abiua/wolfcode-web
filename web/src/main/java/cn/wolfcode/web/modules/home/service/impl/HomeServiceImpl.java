package cn.wolfcode.web.modules.home.service.impl;

import cn.wolfcode.web.modules.custinfo.service.ITbCustomerService;
import cn.wolfcode.web.modules.home.service.IHomeService;
import cn.wolfcode.web.modules.sys.service.SysUserLoginLogService;
import cn.wolfcode.web.modules.sys.service.SysUserOperationLogService;
import cn.wolfcode.web.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 客户信息 服务实现类
 * </p>
 *
 * @author 陈天狼
 * @since 2022-06-20
 */
@Service
public class HomeServiceImpl implements IHomeService {

    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysUserLoginLogService sysUserLoginLogService;
    @Autowired
    private SysUserOperationLogService sysUserOperationLogService;
    @Autowired
    private ITbCustomerService iTbCustomerService;


    /**
     * 登录量
     * @return int
     */
    @Override
    public int getLoginCount() {
        return sysUserLoginLogService.count();
    }


    /**
     * 用户量
     * @return int
     */
    @Override
    public int getUserCount() {
        return sysUserService.count();
    }

    /**
     * 访问量
     * @return int
     */
    @Override
    public int getOperationLogCount() {
        return sysUserOperationLogService.count();
    }

    /**
     * 企业用户量
     * @return int
     */
    @Override
    public int getCustInfoCount() {
        return iTbCustomerService.count();
    }
}
