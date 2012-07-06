package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Jun 7, 2012
 * Time: 2:54:56 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "purchase_order_request")
public class PurchaseOrderRequest {
  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  @Column(name="user")
     private  String user;

  @Column(name="department")
     private  String department;
      @Column(name="location")
     private  String location;
     @Column(name = "deleted")
    private  int deleted;
     @Column(name = "create_date")
    private Date createDate;
    @Column(name = "approve_po")
    private  String approvePO;
     @OneToMany(cascade = CascadeType.ALL)
  @JoinTable(name = "purchase_req_has_purchasedetail_req",
  joinColumns = { @JoinColumn(name = "purchase_req_no") }, inverseJoinColumns = { @JoinColumn(name = "purchase_req_detail_id") })
  private List<PurchaseOrderRequestDetail> purchasereqdetailarray = new ArrayList<PurchaseOrderRequestDetail>();

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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

    public List<PurchaseOrderRequestDetail> getPurchasereqdetailarray() {
        return purchasereqdetailarray;
    }

    public void setPurchasereqdetailarray(List<PurchaseOrderRequestDetail> purchasereqdetailarray) {
        this.purchasereqdetailarray = purchasereqdetailarray;
    }

    @Override
    public String toString() {
        return "PurchaseOrderRequest{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", department='" + department + '\'' +
                ", location='" + location + '\'' +
                ", deleted=" + deleted +
                ", createDate=" + createDate +
                ", approvePO='" + approvePO + '\'' +
                ", purchasereqdetailarray=" + purchasereqdetailarray +
                '}';
    }
}
