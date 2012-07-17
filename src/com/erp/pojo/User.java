package com.erp.pojo;

import javax.persistence.*;
import java.util.List;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 9, 2012
 * Time: 10:54:52 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long user_id;
    private  int deleted;
     @Column(length = 60)
    private String name;
       @Column(length = 60)
    private String dep;
        @Column(length = 60)
    private String emailId;
        @Column(length = 60)
    private String empId;
     @Column(length = 60)
    private String username;
    @Column(length = 60)
    private String password;
 
      @Column(name = "create_date")
  private Date createDate;
      @ManyToOne()
        @JoinColumn(name="role_id")
    private Role role;


    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_has_userpermissions",
        joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "permission_id", referencedColumnName = "id")
    )
    private List<UserPermissions> userPermissions;

    public List<UserPermissions> getUserPermissions() {
        return userPermissions;
    }

    public void setUserPermissions(List<UserPermissions> userPermissions) {
        this.userPermissions = userPermissions;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }



    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", deleted=" + deleted +
                ", name='" + name + '\'' +
                ", dep='" + dep + '\'' +
                ", emailId='" + emailId + '\'' +
                ", empId='" + empId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", createDate=" + createDate +
                ", role=" + role +
                ", userPermissions=" + userPermissions +
                '}';
    }
}
