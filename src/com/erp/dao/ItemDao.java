package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.Item;
import com.erp.pojo.DailyStockRecord;
import com.wideplay.warp.persist.Transactional;
import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:27:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class ItemDao extends BaseDao<Item,Long> {
    public ItemDao() {
        super(Item.class);
    }

    public boolean checkUomPresent(String addUomName) {
     
        String u;
        boolean f=false;
        try{
            u= (String) sessionProvider.get().createQuery("select name from Uom where deleted='0' and name='"+addUomName+"'").uniqueResult();
            if(u!=null)
                f=true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    public boolean checkItemPresent(String addItemName) {

        String u;
        boolean f=false;
        try{
            u= (String) sessionProvider.get().createQuery("select name from Item where deleted='0' and name='"+addItemName+"'").uniqueResult();
            if(u!=null)
                f=true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;  //To change body of implemented methods use File | Settings | File Templates.
    }
    public boolean checkSectionPresent(String addSectionName) {
        String u;
        boolean f=false;
        try{
            u= (String) sessionProvider.get().createQuery("select name from Section where deleted='0' and name='"+addSectionName+"'").uniqueResult();
            if(u!=null)
                f=true;
        }
        finally{
        }

        return f;  //To change body of implemented methods use File | Settings | File Templates.
    }
    public List<String> getItemCodelst(){
        return (List<String>)sessionProvider.get().createQuery("select itemCode from Item where deleted='0'").list();
    }
    public List<Item> getItemForDelete(){
        //return (List<Item>)sessionProvider.get().createSQLQuery("select  FROM item i LEFT OUTER JOIN purchase_order_detail p on (i.id=p.item_id) WHERE p.item_id IS  NULL").list();
        return (List<Item>)sessionProvider.get().createQuery("from Item i WHERE i.id not in (select p.item.id from PurchaseOrderDetail p) and deleted='0'").list();
    }
     public List<String> getItemNamelst(){
        return (List<String>)sessionProvider.get().createQuery("select name from Item where deleted='0'").list();
    }
    public List<String> allItem() {
        return sessionProvider.get().createQuery("Select name from Item").list();
    }

    @Transactional
    public List<Item> searchByName(String name) {
        return (List<Item>)sessionProvider.get().createQuery("FROM Item WHERE name LIKE '"+name+"%'").list();
    }

    @Transactional
    public List<Item> getAllDeletedItem() {
        return (List<Item>)sessionProvider.get().createQuery("FROM Item where deleted='1'").list();
    }
    @Transactional
    public boolean SaveItem(Item item)
    {
        try {
            if(item!=null){
                String subname=((String) sessionProvider.get().createQuery("SELECT name FROM Section WHERE id='"+item.getSection().getId()+"'").uniqueResult()).substring(0,3).toUpperCase();//getSection().getName();
                String sname= ((String) sessionProvider.get().createQuery("SELECT max(itemCode) FROM Item WHERE itemCode like '"+subname+"%'").uniqueResult());
                if(sname==null)
                    item.setItemCode(subname+1000);
                else{
                    long l=Long.parseLong(sname.substring(3));

                    l=l+1;
                    item.setItemCode(subname+l);
                }
                sessionProvider.get().save(item);
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
    public void delete(Item item)  {
        try{
            item.setDeleted(1);
            sessionProvider.get().update(item);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //find by id
    public Item findById(Long id){
        return (Item)sessionProvider.get().createQuery("from Item where id='"+id+"'").uniqueResult();
    }
    public Item findByName(String name){
        return (Item)sessionProvider.get().createQuery("from Item where name='"+name+"'").uniqueResult();
    }

    public List getItemId(){
        return sessionProvider.get().createQuery("select id from Item where deleted='0'").list();
    }

    public List getItemCode(){
        return sessionProvider.get().createQuery("select itemCode from Item where deleted='0'").list();
    }

    public List getItem(){
        return sessionProvider.get().createQuery("from Item where deleted='0'").list();
    }

    public List getItemNamelist(){
        return sessionProvider.get().createQuery("select name from Item where deleted='0'").list();
    }
    @Transactional
    public void update(Item item)  {
        try{
            if(item!=null){
                String subname=((String) sessionProvider.get().createQuery("SELECT name FROM Section WHERE id='"+item.getSection().getId()+"'").uniqueResult()).substring(0,3).toUpperCase();//getSection().getName();
                String sname= ((String) sessionProvider.get().createQuery("SELECT max(itemCode) FROM Item WHERE itemCode like '"+subname+"%'").uniqueResult());
                if(subname.contains(item.getItemCode()))
                {
                    item.setItemCode(item.getItemCode());
                }
                else{
                    if(sname==null)
                        item.setItemCode(subname+1000);
                    else{
                        long l=Long.parseLong(sname.substring(3));
                      
                        l=l+1;
                        item.setItemCode(subname+l);
                    }
                }
                sessionProvider.get().update(item);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public List<String> getItemUomlst() {
        return sessionProvider.get().createQuery("Select DISTINCT i.uom.name from Item i where deleted='0' ").list();
    }
    public List<String> getItemSectionlst() {
        return sessionProvider.get().createQuery("Select DISTINCT i.section.name from Item i where deleted='0' ").list();
    }
    public List<Item> searchByItemCode(String name) {
        return (List<Item>)sessionProvider.get().createQuery("FROM Item WHERE itemCode LIKE '"+name+"%'").list();
    }
    public List<Item> searchByItemUom(String name) {
        return (List<Item>)sessionProvider.get().createQuery("FROM Item i WHERE i.uom.name LIKE '"+name+"%'").list();
    }
    public List<Item> searchByItemSection(Long id) {
        return (List<Item>)sessionProvider.get().createQuery("FROM Item i WHERE i.section.id ='"+id+"'").list();
    }
     public List<Item> searchByItemSection(String id) {
        return (List<Item>)sessionProvider.get().createQuery("FROM Item i WHERE i.section.name ='"+id+"'").list();
    }
    public DailyStockRecord getEntryData(String itemcode) {
        return (DailyStockRecord) sessionProvider.get().createQuery("FROM DailyStockRecord d WHERE d.item.itemCode ='"+itemcode+"' order by d.date ASC").setMaxResults(1).uniqueResult();
    }
     public DailyStockRecord getExitData(String itemcode) {
            return (DailyStockRecord) sessionProvider.get().createQuery("FROM DailyStockRecord d WHERE d.item.itemCode ='"+itemcode+"' order by d.date DESC ").setMaxResults(1).uniqueResult();
        }
    public void restoreAllItem()
    {
        sessionProvider.get().createQuery("UPDATE Item SET deleted=0 WHERE deleted=1").executeUpdate();
        System.out.println("items are restored");
    }
    public void restoreItem(int id)
    {
        sessionProvider.get().createQuery("UPDATE Item SET deleted=0 WHERE id="+id).executeUpdate();
        System.out.println("items are restored");
    }

}
