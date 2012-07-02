package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.PurchaseOrderRequest;
import com.erp.pojo.PurchaseOrderRequestDetail;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Iterator;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Jun 8, 2012
 * Time: 10:52:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class PoRequestDao extends BaseDao<PurchaseOrderRequest,Long> {
    public PoRequestDao() {
        super(PurchaseOrderRequest.class);
    }

    @Transactional
    public boolean SavePORequest(PurchaseOrderRequest poRequest, List<PurchaseOrderRequestDetail> poRequestDetail){

         try {
                   PurchaseOrderRequestDetail g=null;
                   for(Iterator<PurchaseOrderRequestDetail> i=poRequestDetail.iterator();i.hasNext();){
                       g=(PurchaseOrderRequestDetail)i.next();
                       if(g==null){
                           i.remove();
                           continue;
                       }else if(g.getOrderedQty()==null){
                           i.remove();
                           continue;
                       }

                   }
                   if(poRequest!=null){
                       if (poRequest.getCreateDate() == null) poRequest.setCreateDate(new Date());
                                          poRequest.setPurchasereqdetailarray(poRequestDetail);
                       sessionProvider.get().save(poRequest);
                       return true;
                   }else{
                       return false;
                   }
               }catch (Exception e){
                   e.printStackTrace();
                   return false;
               }

      }

    public List<PurchaseOrderRequest> getPoApprove() {

        return (List<PurchaseOrderRequest>)sessionProvider.get().createQuery("from PurchaseOrderRequest where  approvePO='No' and deleted='0' ").list();
    }

     @Transactional
    public void setApprovePO(long id) {
      sessionProvider.get().createQuery("UPDATE PurchaseOrderRequest SET approvePO='Yes' WHERE id="+id+"").executeUpdate();
    }
    }


