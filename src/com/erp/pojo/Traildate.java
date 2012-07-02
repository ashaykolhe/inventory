package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Atul
 * Date: Apr 18, 2012
 * Time: 3:45:54 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "trialdate")
public class Traildate
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "initial_date")
    private Date date1;
    @Column(name = "expiry_date")
    private Date date2;

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }

    public Date getDate2() {
        return date2;
    }

    public void setDate2(Date date2) {
        this.date2 = date2;
    }
}
