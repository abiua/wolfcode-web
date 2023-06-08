package cn.wolfcode.web.modules.custLinkManInfo.service;

import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 客户联系人 服务类
 * </p>
 *
 * @author wbb
 * @since 2023-05-31
 */
public interface ITbCustLinkmanService extends IService<TbCustLinkman> {

    public List<TbCustLinkman> batchUserInfo(List<String> ids);
}
