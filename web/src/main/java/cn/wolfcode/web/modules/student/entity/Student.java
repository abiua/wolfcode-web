package cn.wolfcode.web.modules.student.entity;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wbb
 * @since 2023-05-30
 */
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String username;

    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Student{" +
            "id=" + id +
            ", username=" + username +
            ", address=" + address +
        "}";
    }
}
