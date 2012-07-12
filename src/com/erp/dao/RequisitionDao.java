package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.Requisition;
import com.erp.pojo.RequisitionDetail;
import com.erp.pojo.Grn;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Date;
import java.util.Iterator;

import org.hibernate.criterion.Restrictions;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 23, 2012
 * Time: 2:08:05 PM
 * To change this template use File | Settings | File Templates.
 */
public class RequisitionDao extends BaseDao<Requisition,Long> {

    public RequisitionDao() {
        super(Requisition.class);
    }

    @Transactional
    public boolean SaveRequisition(Requisition requisition, List<RequisitionDetail> requisitiondetail) {
        try {

            for(Iterator<RequisitionDetail> i=requisitiondetail.iterator();i.hasNext();){
                RequisitionDetail r=(RequisitionDetail)i.next();

                if(r==null){
                    i.remove();

                }else if(r.getRequiredQty()==null){
                    i.remove();
                }
            }

            if(requisition!=null){
                if (requisition.getRequisitionDate() == null) requisition.setRequisitionDate(new Date());
                Long q=(Long)sessionProvider.get().createQuery("select max(id) from Requisition").uniqueResult();
                if(q==null)
                {
                    requisition.setId(1000l);
                }
                else
                {
                     requisition.setId(q+1);

                }
                requisition.setRequisitiondetailarray(requisitiondetail);
                sessionProvider.get().save(requisition);

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
    public void update(Requisition requisition, List<RequisitionDetail> requisitiondetail) {
        try{
            for(Iterator<RequisitionDetail> i=requisitiondetail.iterator();i.hasNext();){
                RequisitionDetail g=(RequisitionDetail)i.next();

                if(g==null){
                    i.remove();

                }else if(g.getRequiredQty()==null){
                    i.remove();
                }
            }
                        requisition.setRequisitiondetailarray(requisitiondetail);
            sessionProvider.get().update(requisition);
        }catch (Exception e){
            e.printStackTrace();

        }
    }

    @Transactional
    public List getRequisition() {
        return sessionProvider.get().createQuery("From Requisition").list();
    }
    @Transactional
    public Requisition findById(Long id) {
        return (Requisition)sessionProvider.get().createCriteria(Requisition.class).add(Restrictions.eq("id",id)).uniqueResult();
    }

    public  Requisition latestrequisition()
    {
        return (Requisition)sessionProvider.get().createQuery("from Requisition where id=(select max(id) from Requisition)").uniqueResult();

    }

    public Requisition getRequisitionWithAvailableQuantity(Requisition req) {
        for(Iterator<RequisitionDetail> ird=req.getRequisitiondetailarray().iterator();ird.hasNext();){
            RequisitionDetail rd=ird.next();
        Double closing_quantity=(Double)sessionProvider.get().createSQLQuery("select closing_quantity from daily_stock where create_date=(select max(create_date) from daily_stock where item_id='"+rd.getItem().getId()+"' ) AND item_id='"+rd.getItem().getId()+"'").uniqueResult();
            rd.setAvailableQuantity(closing_quantity==null?0.0:closing_quantity);
        }
        return req;
    }

     @Transactional
    public List<Requisition> getRequisitionByMonth(int month, int year) {

        if(month<=9)
            return (List<Requisition>)sessionProvider.get().createQuery("from Requisition WHERE requisitionDate LIKE '"+year+"-"+0+month+"%'").list();
        else
            return (List<Requisition>)sessionProvider.get().createQuery("from Requisition WHERE requisitionDate LIKE '"+year+"-"+month+"%'").list();

    }
}

