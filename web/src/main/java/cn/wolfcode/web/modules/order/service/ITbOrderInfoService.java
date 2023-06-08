package cn.wolfcode.web.modules.order.service;

import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wbb
 * @since 2023-06-07
 */
public interface ITbOrderInfoService extends IService<TbOrderInfo> {

    List<TbOrderInfo> queryByTime(LocalDateTime start, LocalDateTime end);
}
