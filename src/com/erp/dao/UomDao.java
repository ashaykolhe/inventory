package com.erp.dao;

import java.util.List;

import com.erp.dao.BaseDao;

import com.erp.pojo.Uom;
import com.wideplay.warp.persist.Transactional;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:44:24 PM
 * To change this template use File | Settings | File Templates.
 */
public class UomDao extends BaseDao<Uom,Long>{
    public UomDao() {
        super(Uom.class);
    }

    @Transactional
    public List getUom(){

        return sessionProvider.get().createQuery("from Uom where deleted='0'").list();
    }
    @Transactional
    public boolean SaveUom(Uom uom)

    {
        try {


            if(uom!=null){
                sessionProvider.get().save(uom);

                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }

    @Transactional
    public void delete(Uom uom){
        try{

            uom.setDeleted(1);
            sessionProvider.get().update(uom);



        }catch (Exception e){
            e.printStackTrace();

        }
    }
    @Transactional
    public Uom findById(Long id){
        return (Uom)sessionProvider.get().createQuery("from Uom where id='"+id+"'").uniqueResult();

    }
    @Transactional
    public void update(Uom uom){
        try{
            sessionProvider.get().update(uom);
        }catch (Exception e){
            e.printStackTrace();

        }
    }
}


