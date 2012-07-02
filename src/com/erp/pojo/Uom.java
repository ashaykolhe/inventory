package com.erp.pojo;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 13, 2012
 * Time: 3:17:19 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "uom")

public class Uom {
     @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
      private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "name")
    private String name;
      @Column(name = "deleted",nullable = true)
    private  int deleted;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "Uom{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", deleted=" + deleted +
                '}';
    }
}