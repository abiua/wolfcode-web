package cn.wolfcode.web.modules.order.mapper;

import cn.wolfcode.web.modules.order.entity.TbOrderInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>TbOrderInfoMapper
 * @since 2023-06-07
 */
public interface TbOrderInfoMapper extends BaseMapper<TbOrderInfo> {

    List<TbOrderInfo> queryByTime(@Param("start")  LocalDateTime start,
                                  @Param("end")  LocalDateTime end);

}
