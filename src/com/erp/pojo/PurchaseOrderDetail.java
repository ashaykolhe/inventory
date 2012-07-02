package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 29, 2012
 * Time: 3:52:49 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "purchase_order_detail")
public class PurchaseOrderDetail {
    @Id
      @Column(name = "id")
      @GeneratedValue(strategy = GenerationType.AUTO)
         private Long id;
         @Column(name = "ordered_qty",nullable = true)
        private Double orderedQty;
         @Column(name = "Rate",nullable = true)
        private Double rate;


        @Column(name = "description",nullable = true)
        private String description;
    @ManyToOne()
               @JoinColumn(name="item_id")
             private Item item;
       @Column(name = "amount",nullable = true)
           private Double amount;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getOrderedQty() {
        return orderedQty;
    }

    public void setOrderedQty(Double orderedQty) {
        this.orderedQty = orderedQty;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "PurchaseOrderDetail{" +
                "id=" + id +
                ", orderedQty=" + orderedQty +
                ", rate=" + rate +
                ", description='" + description + '\'' +
                ", item=" + item +
                ", amount=" + amount +
                '}';
    }
}
