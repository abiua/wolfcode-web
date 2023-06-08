package cn.wolfcode.web.modules.order.service.impl;

import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import cn.wolfcode.web.modules.order.mapper.TbOrderInfoMapper;
import cn.wolfcode.web.modules.order.service.ITbOrderInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wbb
 * @since 2023-06-07
 */
@Service
public class TbOrderInfoServiceImpl extends ServiceImpl<TbOrderInfoMapper, TbOrderInfo> implements ITbOrderInfoService {

    @Autowired
    private TbOrderInfoMapper tbOrderInfoMapper;
    @Override
    public List<TbOrderInfo> queryByTime(LocalDateTime start, LocalDateTime end) {
        return tbOrderInfoMapper.queryByTime(start, end);
    }
}
