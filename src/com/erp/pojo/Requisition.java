package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 23, 2012
 * Time: 10:48:11 AM
 * To change this template use File | Settings | File Templates.
 */

@Entity
public class Requisition {
    @Id
   @Column(name = "id")
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "name_of_contractor")
    private String nameOfContractor;
    @Column(name ="name_of_user")
    private String nameOfUser;
    @Column(name ="job")
    private String job;
    @Column(name ="drawing_no")
    private String drawingNo;
    @Column(name ="part_no")
    private  String partNo;
    @Column(name ="use_material_return")
     private String useMaterialReturn;
    @Column(name ="person_authorising")
    private String personAuthorising;
    @Column(name ="requisition_date")
    private Date requisitionDate;

     @OneToMany(cascade = CascadeType.ALL)
   @JoinTable(name = "requisition_has_requisitiondetail",
    joinColumns = { @JoinColumn(name = "requisition_id") }, inverseJoinColumns = { @JoinColumn(name = "requisition_detail_id") })
   private List<RequisitionDetail> requisitiondetailarray = new ArrayList<RequisitionDetail>();

    public List<RequisitionDetail> getRequisitiondetailarray() {
        return requisitiondetailarray;
    }

    public void setRequisitiondetailarray(List<RequisitionDetail> requisitiondetailarray) {
        this.requisitiondetailarray = requisitiondetailarray;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameOfContractor() {
        return nameOfContractor;
    }

    public void setNameOfContractor(String nameOfContractor) {
        this.nameOfContractor = nameOfContractor;
    }

    public String getNameOfUser() {
        return nameOfUser;
    }

    public void setNameOfUser(String nameOfUser) {
        this.nameOfUser = nameOfUser;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getDrawingNo() {
        return drawingNo;
    }

    public void setDrawingNo(String drawingNo) {
        this.drawingNo = drawingNo;
    }

    public String getPartNo() {
        return partNo;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }


    public String getPersonAuthorising() {
        return personAuthorising;
    }

    public void setPersonAuthorising(String personAuthorising) {
        this.personAuthorising = personAuthorising;
    }

    public Date getRequisitionDate() {
        return requisitionDate;
    }

    public void setRequisitionDate(Date requisitionDate) {
        this.requisitionDate = requisitionDate;
    }

    public String getUseMaterialReturn() {
        return useMaterialReturn;
    }

    public void setUseMaterialReturn(String useMaterialReturn) {
        this.useMaterialReturn = useMaterialReturn;
    }

    @Override
    public String toString() {
        return "Requisition{" +
                "id=" + id +
                ", nameOfContractor='" + nameOfContractor + '\'' +
                ", nameOfUser='" + nameOfUser + '\'' +
                ", job='" + job + '\'' +
                ", drawingNo='" + drawingNo + '\'' +
                ", partNo='" + partNo + '\'' +
                ", useMaterialReturn='" + useMaterialReturn + '\'' +
                ", personAuthorising='" + personAuthorising + '\'' +
                ", requisitionDate=" + requisitionDate +
                ", requisitiondetailarray=" + requisitiondetailarray +
                '}';
    }
}
