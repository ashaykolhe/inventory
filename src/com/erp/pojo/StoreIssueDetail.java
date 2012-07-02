package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 24, 2012
 * Time: 12:15:14 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class StoreIssueDetail {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;



    @Column(name = "cost_centre")
    private String costCentre;


    @Column(name = "issue_quantity")
    private double issueQty;

     @ManyToOne()
     @JoinColumn(name="item_id")
     private Item item;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public String getCostCentre() {
        return costCentre;
    }

    public void setCostCentre(String costCentre) {
        this.costCentre = costCentre;
    }


    public double getIssueQty() {
        return issueQty;
    }

    public void setIssueQty(double issueQty) {
        this.issueQty = issueQty;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "StoreIssueDetail{" +
                "id=" + id +
                ", costCentre='" + costCentre + '\'' +
                ", issueQty=" + issueQty +
                ", item=" + item +
                '}';
    }
}
