package cn.wolfcode.web.modules.custinfo.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.UpdateGroup;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 客户信息
 * </p>
 *
 * @author wbb
 * @since 2023-05-30
 */
public class TbCustomer implements Serializable {




    private static final long serialVersionUID = 1L;

    public static final String CUSTOMERNAME_COL = "企业名称";
    public static final String LEGALLEADER_COL = "法定代表人";


    private String id;

    /**
     * 企业名称
     */
    @NotBlank(message = "请填写企业名称", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max=100, message="企业名称不能超过100字！！", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "企业名称")
    private String customerName;

    /**
     * 法定代表人
     */
    @Length(max=30, message = "法定代表人名字不能超过30字!!", groups = {AddGroup.class,UpdateGroup.class})
    @Excel(name = "法定代表人")
    private String legalLeader;

    /**
     * 成立时间
     */
    private LocalDate registerDate;

    /**
     * 经营状态, 0 开业、1 注销、2 破产
     */
    private Integer openStatus;

    /**
     * 所属地区省份
     */
    private String province;

    /**
     * 注册资本,(万元)
     */
    private String regCapital;

    /**
     * 所属行业
     */
    private String industry;

    /**
     * 经营范围
     */
    private String scope;

    /**
     * 注册地址
     */
    private String regAddr;

    /**
     * 录入时间
     */
    private LocalDateTime inputTime;

    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

    @TableField(exist = false)
    private String provinceName;
    public static long getSerialVersionUID(){
        return serialVersionUID;
    }
    public String getProvinceName(){return provinceName; }
    public void setProvinceName(String value){ this.provinceName = value; }
    /**
     * 录入人
     */
    private String inputUserId;
    @TableField(exist = false)
    private String inputUserName;
    public String getInputUserName() {
        return inputUserName;
    }
    public void setInputUserName(String inputUserName) {
        this.inputUserName = inputUserName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    public String getLegalLeader() {
        return legalLeader;
    }

    public void setLegalLeader(String legalLeader) {
        this.legalLeader = legalLeader;
    }
    public LocalDate getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(LocalDate registerDate) {
        this.registerDate = registerDate;
    }
    public Integer getOpenStatus() {
        return openStatus;
    }

    public void setOpenStatus(Integer openStatus) {
        this.openStatus = openStatus;
    }
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
    public String getRegCapital() {
        return regCapital;
    }

    public void setRegCapital(String regCapital) {
        this.regCapital = regCapital;
    }
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }
    public String getRegAddr() {
        return regAddr;
    }

    public void setRegAddr(String regAddr) {
        this.regAddr = regAddr;
    }
    public LocalDateTime getInputTime() {
        return inputTime;
    }

    public void setInputTime(LocalDateTime inputTime) {
        this.inputTime = inputTime;
    }
    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }
    public String getInputUserId() {
        return inputUserId;
    }

    public void setInputUserId(String inputUserId) {
        this.inputUserId = inputUserId;
    }



    @Override
    public String toString() {
        return "TbCustomer{" +
            "id=" + id +
            ", customerName=" + customerName +
            ", legalLeader=" + legalLeader +
            ", registerDate=" + registerDate +
            ", openStatus=" + openStatus +
            ", province=" + province +
            ", regCapital=" + regCapital +
            ", industry=" + industry +
            ", scope=" + scope +
            ", regAddr=" + regAddr +
            ", inputTime=" + inputTime +
            ", updateTime=" + updateTime +
            ", inputUserId=" + inputUserId +
        "}";
    }
}
