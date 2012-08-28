package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Apr 25, 2012
 * Time: 1:10:46 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "terms")
public class Terms {
     @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
     @Column(name = "first_term",length = 5000)
      private String firstTerm;

      @Column(name = "second_term")
      private String secondTerm;

      @Column(name = "third_term")
      private String thirdTerm;
      @Column(name = "forth_term")
      private String forthTerm;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstTerm() {
        return firstTerm;
    }

    public void setFirstTerm(String firstTerm) {
        this.firstTerm = firstTerm;
    }

    public String getSecondTerm() {
        return secondTerm;
    }

    public void setSecondTerm(String secondTerm) {
        this.secondTerm = secondTerm;
    }

    public String getThirdTerm() {
        return thirdTerm;
    }

    public void setThirdTerm(String thirdTerm) {
        this.thirdTerm = thirdTerm;
    }

    public String getForthTerm() {
        return forthTerm;
    }

    public void setForthTerm(String forthTerm) {
        this.forthTerm = forthTerm;
    }



    @Override
    public String toString() {
        return "Terms{" +
                "id=" + id +
                ", firstTerm='" + firstTerm + '\'' +
                ", secondTerm='" + secondTerm + '\'' +
                ", thirdTerm='" + thirdTerm + '\'' +
                ", forthTerm='" + forthTerm + '\'' +
              
                '}';
    }
}
