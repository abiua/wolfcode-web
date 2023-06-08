package cn.wolfcode.web.commons.utils;

import link.ahsj.core.entitys.KeyValue;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author Eastern unbeaten
 * @Email chenshiyun2011@163.com
 * @Date 2022/6/19 9:52 下午
 */
public class CityUtils {
    public static List<KeyValue> citys = new ArrayList<KeyValue>() {{
        add(new KeyValue("100000", "中国"));
        add(new KeyValue("110000", "北京"));
        add(new KeyValue("120000", "天津"));
        add(new KeyValue("130000", "河北"));
        add(new KeyValue("140000", "山西"));
        add(new KeyValue("150000", "内蒙古"));
        add(new KeyValue("210000", "辽宁"));
        add(new KeyValue("220000", "吉林"));
        add(new KeyValue("230000", "黑龙江"));
        add(new KeyValue("310000", "上海"));
        add(new KeyValue("320000", "江苏"));
        add(new KeyValue("330000", "浙江"));
        add(new KeyValue("340000", "安徽"));
        add(new KeyValue("350000", "福建"));
        add(new KeyValue("360000", "江西"));
        add(new KeyValue("370000", "山东"));
        add(new KeyValue("410000", "河南"));
        add(new KeyValue("420000", "湖北"));
        add(new KeyValue("430000", "湖南"));
        add(new KeyValue("440000", "广东"));
        add(new KeyValue("450000", "广西"));
        add(new KeyValue("460000", "海南"));
        add(new KeyValue("500000", "重庆"));
        add(new KeyValue("510000", "四川"));
        add(new KeyValue("520000", "贵州"));
        add(new KeyValue("530000", "云南"));
        add(new KeyValue("540000", "西藏"));
        add(new KeyValue("610000", "陕西"));
        add(new KeyValue("620000", "甘肃"));
        add(new KeyValue("630000", "青海"));
        add(new KeyValue("640000", "宁夏"));
        add(new KeyValue("650000", "新疆"));
    }};
    public static Map<String,Object> codeAndName;
    public static Map<Object,String> nameAndCode;
    static {
        codeAndName = citys.stream().collect(Collectors.toMap(KeyValue::getKey, KeyValue::getValue));
        nameAndCode = citys.stream().collect(Collectors.toMap(KeyValue::getValue, KeyValue::getKey));
    }
    /**
     * 根据地域编码查询省份
     * @param cityKey
     * @return
     */
    public static String getCityValue(String cityKey) {
        return codeAndName.getOrDefault(cityKey, "").toString();
    }
    /**
     * 根据省份查询地域编码
     * @param cityName
     * @return
     */
    public static String getCityKey(String cityName) {
        return nameAndCode.getOrDefault(cityName, "");
    }
}