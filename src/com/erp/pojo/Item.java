package com.erp.pojo;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 13, 2012
 * Time: 3:53:42 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "item")
public class Item {
     @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

    @Column(name = "name")
      private String name;

      @Column(name = "item_code")
      private String itemCode;

      @Column(name = "rol")
      private int rol;

    @Column(name = "expiry_date")
      private String expiryDate;

        @ManyToOne()
        @JoinColumn(name="uom_id",nullable = false)
      private Uom uom;

       @ManyToOne()
        @JoinColumn(name="section_id",nullable = false)
      private Section section;
    @Column(name = "deleted",nullable = true)
    private  int deleted;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public Uom getUom() {
        return uom;
    }

    public void setUom(Uom uom) {
        this.uom = uom;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", itemCode='" + itemCode + '\'' +
                ", rol=" + rol +
                ", expiryDate='" + expiryDate + '\'' +
                ", uom=" + uom +
                ", section=" + section +
                ", deleted=" + deleted +
                '}';
    }

   
}
