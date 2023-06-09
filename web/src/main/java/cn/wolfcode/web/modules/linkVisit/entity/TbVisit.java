package cn.wolfcode.web.modules.linkVisit.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.wolfcode.web.commons.utils.ExcelImport;
import com.baomidou.mybatisplus.annotation.TableField;
import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.UpdateGroup;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 拜访信息表
 * </p>
 *
 * @author wbb
 * @since 2023-06-01
 */
public class TbVisit implements Serializable {

    private static final long serialVersionUID = 1L;
    public static long getSerialVersionUID(){
        return serialVersionUID;
    }
    /**
     * 唯一id
     */

    private String id;

    /**
     * 客户id
     */
    @NotBlank(message = "客户不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "所属企业ID")
    @ExcelImport("所属企业ID")
    private String custId;

    @TableField(exist = false)
    @Excel(name = "所属企业")
    @ExcelImport("所属企业")
    private String custName;
    public String getCustName(){return custName;}
    public void setCustName(String value){custName=value;}

    /**
     * 联系人id
     */
    @NotBlank(message = "联系人不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "联系人ID")
    @ExcelImport("联系人ID")
    private String linkmanId;

    @TableField(exist = false)
    @Excel(name = "联系人")
    @ExcelImport("联系人")
    private String linkman;
    public String getLinkman(){return linkman;}
    public void setLinkman(String value){linkman=value;}
    /**
     * 拜访方式, 1 上门走访, 2 电话拜访
     */
    @Excel(name = "拜访方式",replace = {"上门走访_1","电话拜访_2"})
    @ExcelImport(value = "拜访方式",kv = "1-上门走访;2-电话拜访")
    private Integer visitType;

    /**
     * 拜访原因
     */
    @NotBlank(message = "拜访原因不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 100,message = "拜访原因不能超过100字", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "拜访原因")
    @ExcelImport("拜访原因")
    private String visitReason;

    /**
     * 交流内容
     */
    @NotBlank(message = "交流内容不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Length(max = 1000,message = "交流内容不能超过1000字", groups = {AddGroup.class, UpdateGroup.class})
    @Excel(name = "交流内容")
    @ExcelImport("交流内容")
    private String content;

    /**
     * 拜访时间
     */
    @Excel(name = "拜访时间")
    @ExcelImport("拜访时间")
    private LocalDate visitDate;


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
    public String getLinkmanId() {
        return linkmanId;
    }

    public void setLinkmanId(String linkmanId) {
        this.linkmanId = linkmanId;
    }
    public Integer getVisitType() {
        return visitType;
    }

    public void setVisitType(Integer visitType) {
        this.visitType = visitType;
    }
    public String getVisitReason() {
        return visitReason;
    }

    public void setVisitReason(String visitReason) {
        this.visitReason = visitReason;
    }
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public LocalDate getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(LocalDate visitDate) {
        this.visitDate = visitDate;
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
        return "TbVisit{" +
            "id=" + id +
            ", custId=" + custId +
            ", linkmanId=" + linkmanId +
            ", visitType=" + visitType +
            ", visitReason=" + visitReason +
            ", content=" + content +
            ", visitDate=" + visitDate +
            ", inputUser=" + inputUser +
            ", inputTime=" + inputTime +
        "}";
    }
}
