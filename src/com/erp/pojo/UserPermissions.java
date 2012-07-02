package com.erp.pojo;

import javax.persistence.*;
import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Ashay
 * Date: Mar 26, 2012
 * Time: 11:45:23 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "userpermissions")
public class UserPermissions {
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


    @Override
    public String toString() {
        return "UserPermissions{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", add='" + add + '\'' +
                ", update='" + update + '\'' +
                ", delete='" + delete + '\'' +
                '}';
    }
}
