package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.text.SimpleDateFormat;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 24, 2012
 * Time: 12:08:25 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "storeissue")
public class StoreIssue {
    @Id
    @Column(name = "id")
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne()
    @JoinColumn(name="requisition_id",nullable = false)
    private Requisition requisition;

    @Column(name = "issue_date")
    private Date issueDate;

     @OneToMany(cascade = CascadeType.ALL)
   @JoinTable(name = "storeissue_has_storeissuedetail",
    joinColumns = { @JoinColumn(name = "storeissue_id") }, inverseJoinColumns = { @JoinColumn(name = "storeissue_detail_id") })
   private List<StoreIssueDetail> storeissuedetailarray = new ArrayList<StoreIssueDetail>();

    public List<StoreIssueDetail> getStoreissuedetailarray() {
        return storeissuedetailarray;
    }

    public void setStoreissuedetailarray(List<StoreIssueDetail> storeissuedetailarray) {
        this.storeissuedetailarray = storeissuedetailarray;
    }

    public Long getId() {
        
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Requisition getRequisition() {
        return requisition;
    }

    public void setRequisition(Requisition requisition) {
        this.requisition = requisition;
    }

    public Date getIssueDate() {
       
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    @Override
    public String toString() {
        return "StoreIssue{" +
                "id=" + id +
                ", requisition=" + requisition +
                ", issueDate=" + issueDate +
                ", storeissuedetailarray=" + storeissuedetailarray +
                '}';
    }
}
