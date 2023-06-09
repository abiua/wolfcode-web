package cn.wolfcode.web.modules.order.entity;

import cn.wolfcode.web.commons.utils.ExcelImport;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.UpdateGroup;
import org.hibernate.validator.constraints.Length;

import javax.print.attribute.standard.MediaSize;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wbb
 * @since 2023-06-07
 */
public class TbOrderInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 所属企业id
     */
    @Excel(name = "所属企业ID")
    @ExcelImport("所属企业ID")
    private String custId;

    @TableField(exist = false)
    @Excel(name = "所属企业")
    @ExcelImport("所属企业")
    private String custIdName;

    public static long getSerialVersionUID(){
        return serialVersionUID;
    }

    public String getCustIdName() {
        return custIdName;
    }

    public void setCustIdName(String custIdName) {
        this.custIdName = custIdName;
    }

    /**
     * 产品名称
     */
    @Length(max = 50,message = "产品名称不能超过50字!!!",groups = {AddGroup.class, UpdateGroup.class})
    @NotBlank(message = "产品名称不能为空",groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "产品名称")
    @ExcelImport("产品名称")
    private String prodName;

    /**
     * 产品数量
     */
    @Excel(name = "数量")
    @ExcelImport("数量")
    private Integer amounts;

    /**
     * 产品价格
     */
    @Excel(name = "价格")
    @ExcelImport("价格")
    private Float price;

    /**
     * 状态 0 未发货 1 已发货 2 已收货
     */
    @Excel(name = "状态",replace = {"未发货_0","已发货_1","已收货_2"})
    @ExcelImport(value = "状态",kv = "0-未发货;1-已发货;2-已收货")
    private Integer status;

    /**
     * 收货人--通过企业id获得
     */
    @Excel(name = "收货人ID")
    @ExcelImport("收货人ID")
    private String receiver;


    /**
     * 收货名称
     */
    @TableField(exist = false)
    @Excel(name = "收货人")
    @ExcelImport("收货人")
    private String receiverName;
    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * 收货人电话
     */
    @Length(max = 20,message = "收货人电话字数不能超过20",groups = {AddGroup.class,UpdateGroup.class})
    @Excel(name = "收货人电话")
    @ExcelImport("收货人电话")
    private String linkPhone;

    /**
     * 收货地址
     */

    @Excel(name = "收货地址")
    @ExcelImport("收货地址")
    private String address;

    /**
     * 物流
     */
    @Excel(name = "物流")
    @ExcelImport("物流")
    private String logistcs;

    /**
     * 物流单号
     */
    @Excel(name = "物流单号")
    @ExcelImport("物流单号")
    private String logisticsCode;

    /**
     * 发货时间
     */
    @Excel(name = "发货时间")
    @ExcelImport("发货时间")
    private LocalDateTime deliverTime;

    /**
     * 收货时间
     */
    @Excel(name = "收货时间")
    @ExcelImport("收货时间")
    private LocalDateTime receiveTime;

    /**
     * 录入人
     */
    private String inputUser;

    @TableField(exist = false)
    @Excel(name = "录入人")
    private String inputUserName;

    public String getInputUserName() {
        return inputUserName;
    }

    public void setInputUserName(String inputUserName) {
        this.inputUserName = inputUserName;
    }
    /**
     * 录入时间
     */
    @Excel(name = "录入时间")
    private LocalDateTime inputTime;

    public String getInputUser() {
        return inputUser;
    }

    public void setInputUser(String inputUser) {
        this.inputUser = inputUser;
    }

    public LocalDateTime getInputTime() {
        return inputTime;
    }

    public void setInputTime(LocalDateTime inputTime) {
        this.inputTime = inputTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }
    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }
    public Integer getAmounts() {
        return amounts;
    }

    public void setAmounts(Integer amounts) {
        this.amounts = amounts;
    }
    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getLogistcs() {
        return logistcs;
    }

    public void setLogistcs(String logistcs) {
        this.logistcs = logistcs;
    }
    public String getLogisticsCode() {
        return logisticsCode;
    }

    public void setLogisticsCode(String logisticsCode) {
        this.logisticsCode = logisticsCode;
    }
    public LocalDateTime getDeliverTime() {
        return deliverTime;
    }

    public void setDeliverTime(LocalDateTime deliverTime) {
        this.deliverTime = deliverTime;
    }
    public LocalDateTime getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(LocalDateTime receiveTime) {
        this.receiveTime = receiveTime;
    }

    @Override
    public String toString() {
        return "TbOrderInfo{" +
            "id=" + id +
            ", custId=" + custId +
            ", prodName=" + prodName +
            ", amounts=" + amounts +
            ", price=" + price +
            ", status=" + status +
            ", receiver=" + receiver +
            ", linkPhone=" + linkPhone +
            ", address=" + address +
            ", logistcs=" + logistcs +
            ", logisticsCode=" + logisticsCode +
            ", deliverTime=" + deliverTime +
            ", receiveTime=" + receiveTime +
        "}";
    }
}
