package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 17, 2012
 * Time: 3:33:33 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity

public class Vendor {
    @Id
   @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "address")
    private String address;
    @Column(name = "phone_no")
    private String phoneNo;
    @Column(name = "email_id")
    private String emailId;
    @Column(name = "product_supplied")
    private String productSupplied;
    @Column(name = "account_name")
    private String accountName;
    @Column(name = "account_no")
    private String accountNo;
    @Column(name = "bank")
    private String bank;
    @Column(name = "branch")
    private String branch;
    @Column(name = "ifsc_code")
    private String ifscCode;
   @Column(name = "create_date")
   private Date createDate;
    @Column(name = "deleted",nullable = true)
    private  int deleted;
    @Column(name = "sales_tax")
   private String salestax;
    @Column(name = "service_tax")
   private String servicetax;
    @Column(name = "pan_no")
   private String panno;
     @Column(name = "vendor_code")
      private String vendorCode;
    @Column(name = "vendor_rate")
    private int vendorRate;

    public int getVendorRate() {
        return vendorRate;
    }

    public void setVendorRate(int vendorRate) {
        this.vendorRate = vendorRate;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public String getPanno() {
        return panno;
    }

    public void setPanno(String panno) {
        this.panno = panno;
    }

    public String getServicetax() {
        return servicetax;
    }

    public void setServicetax(String servicetax) {
        this.servicetax = servicetax;
    }

    public String getSalestax() {
        return salestax;
    }

    public void setSalestax(String salestax) {
        this.salestax = salestax;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getProductSupplied() {
        return productSupplied;
    }

    public void setProductSupplied(String productSupplied) {
        this.productSupplied = productSupplied;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getIfscCode() {
        return ifscCode;
    }

    public void setIfscCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "Vendor{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                ", emailId='" + emailId + '\'' +
                ", productSupplied='" + productSupplied + '\'' +
                ", accountName='" + accountName + '\'' +
                ", accountNo='" + accountNo + '\'' +
                ", bank='" + bank + '\'' +
                ", branch='" + branch + '\'' +
                ", ifscCode='" + ifscCode + '\'' +
                ", createDate=" + createDate +
                ", deleted=" + deleted +
                ", salestax='" + salestax + '\'' +
                ", servicetax='" + servicetax + '\'' +
                ", panno='" + panno + '\'' +
                ", vendorCode='" + vendorCode + '\'' +
                ", vendorRate='" + vendorRate + '\'' +
                '}';
    }
}
