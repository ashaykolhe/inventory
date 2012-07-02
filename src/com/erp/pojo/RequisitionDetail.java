package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 27, 2012
 * Time: 5:27:53 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "requisition_detail")
public class RequisitionDetail {
     @Id
     @Column(name = "id")
     @GeneratedValue(strategy = GenerationType.AUTO)
     private Long id;

     @Column(name = "required_qty",nullable = true)
     private Double requiredQty;

     @ManyToOne()
     @JoinColumn(name="item_id")
     private Item item;

    @Transient
    private Double availableQuantity;

    public Double getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(Double availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getRequiredQty() {
        return requiredQty;
    }

    public void setRequiredQty(Double requiredQty) {
        this.requiredQty = requiredQty;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "RequisitionDetail{" +
                "id=" + id +
                ", requiredQty=" + requiredQty +
                ", item=" + item +
                ", availableQuantity=" + availableQuantity +
                '}';
    }
}
