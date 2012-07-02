package com.erp.pojo;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Mar 2, 2012
 * Time: 11:47:22 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "rolepermissions")
public class RolePermissions {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String name;

    @Column(name = "add_menu")
    private String add;
    @Column(name = "update_menu")
    private String update;
    @Column(name = "delete_menu")
    private String delete;

    @ManyToMany(mappedBy = "rolePermissions")
    private List<Role> roles=new ArrayList<Role>();

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getUpdate() {
        return update;
    }

    public void setUpdate(String update) {

        this.update = update;
    }

    public String getDelete() {
        return delete;
    }

    public void setDelete(String delete) {
        this.delete = delete;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "RolePermissions{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", add=" + add +
                ", update=" + update +
                ", delete=" + delete +
                '}';
    }
}
