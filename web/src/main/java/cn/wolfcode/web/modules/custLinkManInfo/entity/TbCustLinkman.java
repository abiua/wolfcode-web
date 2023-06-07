package cn.wolfcode.web.modules.custLinkManInfo.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.google.common.primitives.UnsignedInteger;
import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.UpdateGroup;
import lombok.Data;
import lombok.ToString;
import org.checkerframework.checker.index.qual.LessThan;
import org.checkerframework.checker.signedness.qual.Unsigned;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.NumberFormat;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 客户联系人
 * </p>
 *
 * @author wbb
 * @since 2023-05-31
 */
@Data
@ToString
public class TbCustLinkman implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    @TableField(exist = false)
    @Excel(name = "所属企业")
    private String custName;
    public String getCustName() {
        return custName;
    }
    public void setCustName(String custName) {
        this.custName = custName;
    }

    public static long getSerialVersionUID(){
        return serialVersionUID;
    }
    public String getCustLinkName(){return custName;}
    public void setCustLinkName(String value){ this.custName = value; }
    /**
     * 客户id
     */
    private String custId;

    /**
     * 联系人名字
     */
    @NotBlank(message = "联系人名字未填写", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max=30, message = "联系人名字不能超过30字", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "联系人的名字")
    private String linkman;

    /**
     * 性别 1 男 0 女
     */
    @Excel(name = "性别",replace = {"男_1","女_0"})
    private Integer sex;

    /**
     * 年龄
     */
    @LessThan("100")
    @Excel(name = "年龄")
    private Integer age;

    /**
     * 联系人电话
     */
    @NumberFormat
    @NotBlank(message = "手机号未填写", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 20, message = "手机号不能超过20位", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "电话")
    private String phone;

    /**
     * 职位
     */
    @Length(max = 20, message = "职位不能超过20位", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "职位")
    private String position;

    /**
     * 部门
     */
    @Length(max = 20, message = "部门不能超过20位", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "部门")
    private String department;

    /**
     * 备注信息?
     */
    @Excel(name = "备注信息")
    private String remark;

    /**
     * 录入人
     */
    private String inputUser;
    @Excel(name = "录入人")
    @TableField(exist = false)
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
    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }
    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
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

    @Override
    public String toString() {
        return "TbCustLinkman{" +
            "id=" + id +
            ", custId=" + custId +
            ", linkman=" + linkman +
            ", sex=" + sex +
            ", age=" + age +
            ", phone=" + phone +
            ", position=" + position +
            ", department=" + department +
            ", remark=" + remark +
            ", inputUser=" + inputUser +
            ", inputTime=" + inputTime +
        "}";
    }
}
