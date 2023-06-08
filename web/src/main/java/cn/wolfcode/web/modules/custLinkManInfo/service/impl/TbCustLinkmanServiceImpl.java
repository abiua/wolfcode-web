package cn.wolfcode.web.modules.custLinkManInfo.service.impl;

import cn.wolfcode.web.modules.custLinkManInfo.entity.TbCustLinkman;
import cn.wolfcode.web.modules.custLinkManInfo.mapper.TbCustLinkmanMapper;
import cn.wolfcode.web.modules.custLinkManInfo.service.ITbCustLinkmanService;
import cn.wolfcode.web.modules.sys.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 客户联系人 服务实现类
 * </p>
 *
 * @author wbb
 * @since 2023-05-31
 */
@Service
public class TbCustLinkmanServiceImpl extends ServiceImpl<TbCustLinkmanMapper, TbCustLinkman> implements ITbCustLinkmanService {

    @Override
    public List<TbCustLinkman> batchUserInfo(List<String> ids) {
        return baseMapper.selectBatchIds(ids);
    }
}
