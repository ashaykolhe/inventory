package com.erp.pojo;

import javax.persistence.*;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 21, 2012
 * Time: 9:54:39 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "grn")
public class Grn {

      @Id
  @Column(name = "grn_no")
//  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
   @Column(name = "order_no")
    private String orderNo;

    @Temporal(TemporalType.TIMESTAMP)
     @Column(name = "order_date")
   private Date orderDate;
     @Column(name = "challan_no")
    private String challanNo;

    @Temporal(TemporalType.TIMESTAMP)
     @Column(name = "challan_date")
   private Date challanDate;
     @Column(name = "bill_no")
    private String billNo;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "bill_date")
   private Date billDate;
    @Column(name = "bill_value")
    private Double billValue;
     @Column(name = "truck_no")
    private String truckNo;

    @Temporal(TemporalType.TIMESTAMP)
     @Column(name = "create_date")
   private Date createDate;
     @Column(name = "deleted",nullable = true)
    private  int deleted;
     @Column(name = "status")
    private String status;

    @ManyToOne()
           @JoinColumn(name="purchaseorder_id",nullable = false)
         private PurchaseOrder purchaseOrder;


    @OneToMany(cascade = CascadeType.ALL)
   @JoinTable(name = "grn_has_grndetail",
    joinColumns = { @JoinColumn(name = "grn_no") }, inverseJoinColumns = { @JoinColumn(name = "grn_detail_id") })
   private List<GrnDetail> grndetailarray = new ArrayList<GrnDetail>();

    private String verified;

    @Column(name = "payment_status")
    private String paymentStatus;

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getVerified() {
        return verified;
    }

    public void setVerified(String verified) {
        this.verified = verified;
    }

    public List<GrnDetail> getGrndetailarray() {
        return grndetailarray;
    }

    public void setGrndetailarray(List<GrnDetail> grndetailarray) {
        this.grndetailarray = grndetailarray;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }



    public Date getChallanDate() {
        return challanDate;
    }

    public void setChallanDate(Date challanDate) {
        this.challanDate = challanDate;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getChallanNo() {
        return challanNo;
    }

    public void setChallanNo(String challanNo) {
        this.challanNo = challanNo;
    }

    public String getBillNo() {
        return billNo;
    }

    public void setBillNo(String billNo) {
        this.billNo = billNo;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public Double getBillValue() {
        return billValue;
    }

    public void setBillValue(Double billValue) {
        this.billValue = billValue;
    }

    public String getTruckNo() {
        return truckNo;
    }

    public void setTruckNo(String truckNo) {
        this.truckNo = truckNo;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Grn{" +
                "id=" + id +
//                ", orderNo='" + orderNo + '\'' +
//                ", orderDate=" + orderDate +
//                ", challanNo='" + challanNo + '\'' +
//                ", challanDate=" + challanDate +
//                ", billNo='" + billNo + '\'' +
//                ", billDate=" + billDate +
//                ", billValue=" + billValue +
//                ", truckNo='" + truckNo + '\'' +
                ", createDate=" + createDate +
//                ", deleted=" + deleted +
//                ", status='" + status + '\'' +
//                ", purchaseOrder=" + purchaseOrder +
//                ", grndetailarray=" + grndetailarray +
//                ", verified='" + verified + '\'' +
                '}';
    }
}
