package com.erp.action;

import com.google.inject.Inject;
import com.erp.dao.ItemDao;
import com.erp.dao.VendorDao;
import com.erp.dao.PurchaseOrderDao;
import com.erp.pojo.Item;
import com.erp.pojo.Vendor;
import com.erp.pojo.PurchaseOrder;
import net.sourceforge.stripes.action.HttpCache;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;

import java.util.Iterator;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Atul
 * Date: Jul 17, 2012
 * Time: 5:40:31 PM
 * To change this template use File | Settings | File Templates.
 */
@HttpCache(allow = false)
public class RestoreActionBean extends BaseActionBean
{
    @Inject
    ItemDao itemdao;
    @Inject
    VendorDao vendorDao;
    @Inject
    PurchaseOrderDao purchaseOrderDao;

    private List<Vendor> venodorList;
    private List<Integer> vendorListForRestore;

    private List<Item> itemlst;
     private List<Integer> itemLstForRestore;

    private List<PurchaseOrder> poList;
    private List<Integer> poListForRestore;

    private boolean restorelistempty;
    private String restoreAll;


    public List<PurchaseOrder> getPoList() {
        return poList;
    }

    public void setPoList(List<PurchaseOrder> poList) {
        this.poList = poList;
    }

    public List<Integer> getPoListForRestore() {
        return poListForRestore;
    }

    public void setPoListForRestore(List<Integer> poListForRestore) {
        this.poListForRestore = poListForRestore;
    }

    public List<Integer> getVendorListForRestore() {
        return vendorListForRestore;
    }

    public void setVendorListForRestore(List<Integer> vendorListForRestore) {
        this.vendorListForRestore = vendorListForRestore;
    }

    public List<Vendor> getVenodorList() {
        return venodorList;
    }

    public void setVenodorList(List<Vendor> venodorList) {
        this.venodorList = venodorList;
    }

    public List<Item> getItemlst() {
        return itemlst;
    }

    public void setItemlst(List<Item> itemlst) {
        this.itemlst = itemlst;
    }

    public boolean isRestorelistempty() {
        return restorelistempty;
    }

    public void setRestorelistempty(boolean restorelistempty) {
        this.restorelistempty = restorelistempty;
    }

    public String getRestoreAll() {
        return restoreAll;
    }

    public void setRestoreAll(String restoreAll) {
        this.restoreAll = restoreAll;
    }

    public List<Integer> getItemLstForRestore() {
        return itemLstForRestore;
    }

    public void setItemLstForRestore(List<Integer> itemLstForRestore) {
        this.itemLstForRestore = itemLstForRestore;
    }




    public Resolution restoreItemLink()
    {
        itemlst=itemdao.getAllDeletedItem();
        System.out.println(itemlst.size());
        if(itemlst.size()>0)
        {
            restorelistempty=false;
        }else{
        restorelistempty=true;}
        return new ForwardResolution("jsp/restore.jsp");
    }



    public Resolution restoreItem()
    {
        if(restoreAll!=null)
        {
             System.out.println("hhhhh"+restoreAll);
            itemdao.restoreAllItem();
        }
        else
        {
            Iterator itr=itemLstForRestore.iterator();

            while(itr.hasNext())
            {
                    Integer id=(Integer)itr.next();
                    if(id==null)
                    {
                        itr.remove();
                    }
                else{
                        itemdao.restoreItem(id);
                       System.out.println(id);
                    }
            }
        }
       return new RedirectResolution(RestoreActionBean.class,"restoreItemLink");
    }

    public Resolution restoreVendorLink()
    {
        venodorList=vendorDao.getAllDeletedVendor();
        System.out.println("hhhhhh");

        System.out.println("sssssssss"+venodorList.size());
        if(venodorList.size()>0)
        {
            restorelistempty=false;
        }else{
        restorelistempty=true;}
        return new ForwardResolution("jsp/restoreVendor.jsp");
    }

    public Resolution restoreVendor()
    {
        if(restoreAll!=null)
        {
             System.out.println("hhhhh"+restoreAll);
             vendorDao.restoreAllVendor();
        }
        else
        {
            Iterator itr=vendorListForRestore.iterator();

            while(itr.hasNext())
            {
                    Integer id=(Integer)itr.next();
                    if(id==null)
                    {
                        itr.remove();
                    }
                else{
                       vendorDao.restoreVendor(id);
                       System.out.println(id);
                    }
            }
        }
       return new RedirectResolution(RestoreActionBean.class,"restoreVendorLink");
    }

    public Resolution restorePOLink()
    {
        poList=purchaseOrderDao.getAllDeletedPO();
        System.out.println("in the restoer purchase order resoln");

        System.out.println("sssssssss"+poList.size());
        if(poList.size()>0)
        {
            restorelistempty=false;
        }else{
        restorelistempty=true;}
        return new ForwardResolution("jsp/restorePurchaseOrder.jsp");
    }
    public Resolution restorePurchaseOrder()
    {
        if(restoreAll!=null)
        {
             System.out.println("hhhhh"+restoreAll);
            purchaseOrderDao.restoreAllPO();
        }
        else
        {
            Iterator itr=poListForRestore.iterator();

            while(itr.hasNext())
            {
                    Integer id=(Integer)itr.next();
                    if(id==null)
                    {
                        itr.remove();
                    }
                else{
                       purchaseOrderDao.restorePO(id);
                       System.out.println(id);
                    }
            }
        }
       return new RedirectResolution(RestoreActionBean.class,"restorePOLink");
    }
}
