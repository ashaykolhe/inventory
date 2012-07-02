package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.Terms;
import com.wideplay.warp.persist.Transactional;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Apr 25, 2012
 * Time: 1:15:38 PM
 * To change this template use File | Settings | File Templates.
 */
public class TermsDao extends BaseDao<Terms,Long>{
    public TermsDao() {
        super(Terms.class);
    }

    public Terms findByMaxId() {
         return (Terms)sessionProvider.get().createQuery("from Terms where id=(select max(id) from Terms)").uniqueResult();
    }
   
     @Transactional
    public boolean SaveTerm(Terms terms) {
       try {
            if(terms!=null){

                sessionProvider.get().merge(terms);
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
