package cn.wolfcode.web.modules.linkVisit.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import link.ahsj.core.annotations.AddGroup;
import link.ahsj.core.annotations.UpdateGroup;

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
    private String custId;

    @TableField(exist = false)
    private String custName;
    public String getCustName(){return custName;}
    public void setCustName(String value){custName=value;}

    /**
     * 联系人id
     */
    @NotBlank(message = "联系人不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String linkmanId;

    @TableField(exist = false)
    private String linkman;
    public String getLinkman(){return linkman;}
    public void setLinkman(String value){linkman=value;}
    /**
     * 拜访方式, 1 上门走访, 2 电话拜访
     */
    private Integer visitType;

    /**
     * 拜访原因
     */
    @NotBlank(message = "拜访原因不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String visitReason;

    /**
     * 交流内容
     */
    @NotBlank(message = "交流情况不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String content;

    /**
     * 拜访时间
     */
    private LocalDate visitDate;


    /**
     * 录入人
     */
    private String inputUser;

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
