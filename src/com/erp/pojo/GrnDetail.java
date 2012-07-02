package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 21, 2012
 * Time: 10:16:39 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "grn_detail")
public class GrnDetail {
      @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
     private Long id;
     @Column(name = "challan_qty",nullable = true)
    private Double challanQty;
     @Column(name = "received_qty",nullable = true)
    private Double receivedQty;
     @Column(name = "accepted_qty",nullable = true)
    private Double acceptedQty;
      @Column(name = "value",nullable = true)
    private Double value;
      @Column(name = "remark",nullable = true)
    private String remark;
     @ManyToOne()
        @JoinColumn(name="item_id")
      private Item item;
    
    
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getChallanQty() {
        return challanQty;
    }

    public void setChallanQty(Double challanQty) {
        this.challanQty = challanQty;
    }

    public Double getReceivedQty() {
        return receivedQty;
    }

    public void setReceivedQty(Double receivedQty) {
        this.receivedQty = receivedQty;
    }

    public Double getAcceptedQty() {
        return acceptedQty;
    }

    public void setAcceptedQty(Double acceptedQty) {
        this.acceptedQty = acceptedQty;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "GrnDetail{" +
                "id=" + id +
                ", challanQty=" + challanQty +
                ", receivedQty=" + receivedQty +
                ", acceptedQty=" + acceptedQty +
                ", value=" + value +
                ", remark='" + remark + '\'' +
                ", item=" + item +
                '}';
    }
}
