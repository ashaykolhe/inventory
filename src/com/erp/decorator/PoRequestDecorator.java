package com.erp.decorator;

import com.erp.pojo.Item;

import javax.persistence.Column;
import java.util.Date;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Jul 6, 2012
 * Time: 2:39:41 PM
 * To change this template use File | Settings | File Templates.
 */
public class PoRequestDecorator {
    private Long id;
    private  String user;
    private  String department;
    private  String location;
    private  int deleted;
    private Date createDate;
    private  String approvePO;
    private String itemName;
    private  String itemsection;
    private Double orderedQty;

    public PoRequestDecorator(Long id, String user, String department, String location, int deleted, Date createDate, String approvePO, String itemName, String itemsection, Double orderedQty) {
        this.id = id;
        this.user = user;
        this.department = department;
        this.location = location;
        this.deleted = deleted;
        this.createDate = createDate;
        this.approvePO = approvePO;
        this.itemName = itemName;
        this.itemsection = itemsection;
        this.orderedQty = orderedQty;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getApprovePO() {
        return approvePO;
    }

    public void setApprovePO(String approvePO) {
        this.approvePO = approvePO;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemsection() {
        return itemsection;
    }

    public void setItemsection(String itemsection) {
        this.itemsection = itemsection;
    }

    public Double getOrderedQty() {
        return orderedQty;
    }

    public void setOrderedQty(Double orderedQty) {
        this.orderedQty = orderedQty;
    }

    @Override
    public String toString() {
        return "PoRequestDecorator{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", department='" + department + '\'' +
                ", location='" + location + '\'' +
                ", deleted=" + deleted +
                ", createDate=" + createDate +
                ", approvePO='" + approvePO + '\'' +
                ", itemName='" + itemName + '\'' +
                ", itemsection='" + itemsection + '\'' +
                ", orderedQty=" + orderedQty +
                '}';
    }
}
