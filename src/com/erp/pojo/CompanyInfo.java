package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Atul
 * Date: Jul 3, 2012
 * Time: 2:40:11 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class CompanyInfo
{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int compid;
    @Column(name = "comp_name",length = 50)
    private String compName;
    @Column(name = "comp_logo",length = 25)
    private String compLogo;
    @Column(name = "comp_address",length = 80)
    private String compAddress;
    @Column(name = "comp_city",length = 25)
    private String compCity;
    @Column(name = "comp_state",length = 25)
    private String compState;
    @Column(name = "comp_country",length = 25)
    private String compCountry;
    @Column(name = "comp_pin",length = 10)
    private String compPin;
    @Column(name = "comp_phone",length = 25)
    private String compPhone;
    @Column(name = "comp_email",length = 25)
    private String compEmail;
    @Column(name = "comp_fax",length = 25)
    private String compFax;
    @Column(name = "comp_tin",length = 25)
    private String compTin;
    @Column(name = "comp_pan",length = 25)
    private String compPan;
    @Column(name = "comp_excise",length = 25)
    private String compExcise;
    @Column(name = "comp_ecc",length = 25)
    private String compEcc;
    @Column(name = "licenseKey",length = 25)
    private String licenseKey;
    @Column(name = "deleted")
    private int deleted;

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public int getCompid() {
        return compid;
    }

    public void setCompid(int compid) {
        this.compid = compid;
    }

    public String getCompName() {
        return compName;
    }

    public void setCompName(String compName) {
        this.compName = compName;
    }

    public String getCompLogo() {
        return compLogo;
    }

    public void setCompLogo(String compLogo) {
        this.compLogo = compLogo;
    }

    public String getCompAddress() {
        return compAddress;
    }

    public void setCompAddress(String compAddress) {
        this.compAddress = compAddress;
    }

    public String getCompCity() {
        return compCity;
    }

    public void setCompCity(String compCity) {
        this.compCity = compCity;
    }

    public String getCompState() {
        return compState;
    }

    public void setCompState(String compState) {
        this.compState = compState;
    }

    public String getCompCountry() {
        return compCountry;
    }

    public void setCompCountry(String compCountry) {
        this.compCountry = compCountry;
    }

    public String getCompPin() {
        return compPin;
    }

    public void setCompPin(String compPin) {
        this.compPin = compPin;
    }

    public String getCompPhone() {
        return compPhone;
    }

    public void setCompPhone(String compPhone) {
        this.compPhone = compPhone;
    }

    public String getCompEmail() {
        return compEmail;
    }

    public void setCompEmail(String compEmail) {
        this.compEmail = compEmail;
    }

    public String getCompFax() {
        return compFax;
    }

    public void setCompFax(String compFax) {
        this.compFax = compFax;
    }

    public String getCompTin() {
        return compTin;
    }

    public void setCompTin(String compTin) {
        this.compTin = compTin;
    }

    public String getCompPan() {
        return compPan;
    }

    public void setCompPan(String compPan) {
        this.compPan = compPan;
    }

    public String getCompExcise() {
        return compExcise;
    }

    public void setCompExcise(String compExcise) {
        this.compExcise = compExcise;
    }

    public String getCompEcc() {
        return compEcc;
    }

    public void setCompEcc(String compEcc) {
        this.compEcc = compEcc;
    }

    public String getLicenseKey() {
        return licenseKey;
    }

    public void setLicenseKey(String licenseKey) {
        this.licenseKey = licenseKey;
    }

    @Override
    public String toString() {
        return "CompanyInfo{" +
                "compid=" + compid +
                ", compName='" + compName + '\'' +
                ", compLogo='" + compLogo + '\'' +
                ", compAddress='" + compAddress + '\'' +
                ", compCity='" + compCity + '\'' +
                ", compState='" + compState + '\'' +
                ", compCountry='" + compCountry + '\'' +
                ", compPin='" + compPin + '\'' +
                ", compPhone='" + compPhone + '\'' +
                ", compEmail='" + compEmail + '\'' +
                ", compFax='" + compFax + '\'' +
                ", compTin='" + compTin + '\'' +
                ", compPan='" + compPan + '\'' +
                ", compExcise='" + compExcise + '\'' +
                ", compEcc='" + compEcc + '\'' +
                ", licenseKey='" + licenseKey + '\'' +
                ", deleted=" + deleted +
                '}';
    }
}
