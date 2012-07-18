package com.erp.dao;

import com.erp.pojo.Vendor;
import com.erp.pojo.Item;
import com.erp.dao.BaseDao;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Date;

import org.hibernate.criterion.Restrictions;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 17, 2012
 * Time: 3:38:36 PM
 * To change this template use File | Settings | File Templates.
 */
public class VendorDao extends BaseDao<Vendor,Long>{
    public VendorDao() {
        super(Vendor.class);
    }

    @Transactional
    public boolean SaveVendor(Vendor vendor)
    {
        try {
            if(vendor!=null){
                if (vendor.getCreateDate() == null) vendor.setCreateDate(new Date());
                String subname="v";
                String sname= ((String) sessionProvider.get().createQuery("SELECT max(vendorCode) FROM Vendor WHERE vendorCode like '"+subname+"%'").uniqueResult());
                if(sname==null)
                    vendor.setVendorCode(subname+1000);
                else{
                    long l=Long.parseLong(sname.substring(1));
                
                    l=l+1;
                    vendor.setVendorCode(subname+l);
                }
                sessionProvider.get().save(vendor);

                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }
    //delete
    @Transactional
    public void delete(Vendor vendor)  {
        try{

            vendor.setDeleted(1);
            sessionProvider.get().update(vendor);



        }catch (Exception e){
            e.printStackTrace();

        }
    }
    public Vendor findById(Long id){
        return (Vendor)sessionProvider.get().createQuery("from Vendor where id='"+id+"'").uniqueResult();
    }

    public List getVendor(){
        return sessionProvider.get().createQuery("from Vendor where deleted='0'").list();
    }
    //update
    @Transactional
    public void update(Vendor vendor)  {
        try{
            sessionProvider.get().update(vendor);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Vendor> findByName(String fname) {
        return (List<Vendor>)sessionProvider.get().createQuery("from Vendor where name='"+fname+"'").list();
    }

    public List<String> allVendor() {
        return sessionProvider.get().createQuery("Select name from Vendor where deleted='0'").list();
    }

    public List<Vendor> searchByName(String name) {
        return (List<Vendor>)sessionProvider.get().createQuery("FROM Vendor WHERE name='"+name+"'").list();
    }


    public List<Vendor> searchByVendorId(String vendorid) {
        return (List<Vendor>)sessionProvider.get().createQuery("FROM Vendor WHERE vendorCode='"+vendorid+"'").list();
    }

    public List<Vendor> searchByVendorProduct(String vendorproduct) {
        return (List<Vendor>)sessionProvider.get().createQuery("FROM Vendor WHERE productSupplied='"+vendorproduct+"'").list();
    }

    public List<String> vendorIdLst() {
        return sessionProvider.get().createQuery("select vendorCode from Vendor where deleted='0'").list();
    }
    public List<String> vendorProductlst() {
        return sessionProvider.get().createQuery("select distinct productSupplied from Vendor where deleted='0'").list();
    }
    @Transactional
    public void updateVendorForRate(long id, int rate) {
        Vendor vendor=null;
        Long vid=id;
        vendor=(Vendor)sessionProvider.get().createCriteria(Vendor.class).add(Restrictions.eq("id",vid.intValue())).uniqueResult();
        vendor.setVendorRate(rate);
        super.save(vendor);
    }

    @Transactional
    public List<Vendor> getAllDeletedVendor() {
        return (List<Vendor>)sessionProvider.get().createQuery("FROM Vendor where deleted='1'").list();
    }

    public void restoreAllVendor()
    {
        sessionProvider.get().createQuery("UPDATE Vendor SET deleted=0 WHERE deleted=1").executeUpdate();
        
    }
    public void restoreVendor(int id)
    {
        sessionProvider.get().createQuery("UPDATE Vendor SET deleted=0 WHERE id="+id).executeUpdate();

    }
}


