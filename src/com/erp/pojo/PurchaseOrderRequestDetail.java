package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Jun 7, 2012
 * Time: 4:05:05 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "purchase_req_detail")
public class PurchaseOrderRequestDetail {
    @Id
      @Column(name = "id")
      @GeneratedValue(strategy = GenerationType.AUTO)
         private Long id;

               @ManyToOne()
               @JoinColumn(name="item_id")
             private Item item;
      @Column(name = "ordered_qty",nullable = true)
        private Double orderedQty;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Double getOrderedQty() {
        return orderedQty;
    }

    public void setOrderedQty(Double orderedQty) {
        this.orderedQty = orderedQty;
    }

    @Override
    public String toString() {
        return "PurchaseOrderRequestDetail{" +
                "id=" + id +
                ", item=" + item +
                ", orderedQty=" + orderedQty +
                '}';
    }
}
