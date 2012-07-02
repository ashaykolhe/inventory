package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 29, 2012
 * Time: 10:08:27 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "daily_stock")
public class DailyStockRecord {
     @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "open_quantity")
    private double openQuantity;
    @Column(name = "received_quantity")
    private double receivedQuantity;
     @Column(name = "issued_quantity")
    private double issuedQuantity;
    @Column(name = "closing_quantity")
    private double closingQuantity;
    @Column(name = "remark")
    private String remark;
    @Column(name = "create_date")
    private Date date;
   @ManyToOne()
        @JoinColumn(name="item_id")
      private Item item;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getOpenQuantity() {
        return openQuantity;
    }

    public void setOpenQuantity(double openQuantity) {
        this.openQuantity = openQuantity;
    }

    public double getReceivedQuantity() {
        return receivedQuantity;
    }

    public void setReceivedQuantity(double receivedQuantity) {
        this.receivedQuantity = receivedQuantity;
    }

    public double getIssuedQuantity() {
        return issuedQuantity;
    }

    public void setIssuedQuantity(double issuedQuantity) {
        this.issuedQuantity = issuedQuantity;
    }

    public double getClosingQuantity() {
        return closingQuantity;
    }

    public void setClosingQuantity(double closingQuantity) {
        this.closingQuantity = closingQuantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "DailyStockRecord{" +
                "id=" + id +
                ", openQuantity=" + openQuantity +
                ", receivedQuantity=" + receivedQuantity +
                ", issuedQuantity=" + issuedQuantity +
                ", closingQuantity=" + closingQuantity +
                ", remark='" + remark + '\'' +
                ", date=" + date +
                ", item=" + item +
                '}';
    }
}
