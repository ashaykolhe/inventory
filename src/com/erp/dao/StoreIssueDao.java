package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.*;
import com.erp.utils.BaseUtils;
import com.wideplay.warp.persist.Transactional;

import java.util.*;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.text.DateFormat;

import org.hibernate.Query;
import org.hibernate.Criteria;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 28, 2012
 * Time: 12:34:35 PM
 * To change this template use File | Settings | File Templates.
 */
public class StoreIssueDao extends BaseDao<StoreIssue,Long>{
    public StoreIssueDao() {
        super(StoreIssue.class);
    }

    @Transactional
    public void update(StoreIssue storeissue,List<StoreIssueDetail> storeissuedetailarray) {
        try{
            for(Iterator<StoreIssueDetail> i=storeissuedetailarray.iterator();i.hasNext();){
                StoreIssueDetail s=(StoreIssueDetail)i.next();
                if(s==null){
                    i.remove();
                }
                else if(s.getIssueQty()==0){
                    i.remove();
                }
            }
            storeissue.setStoreissuedetailarray(storeissuedetailarray);
            sessionProvider.get().update(storeissue);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public List getRequisition(){
        return sessionProvider.get().createQuery("From Requisition").list();
    }

    @Transactional
    public boolean SaveStoreIssue(StoreIssue storeissue, List<StoreIssueDetail> storeissuedetail) {
        try {
            for(Iterator<StoreIssueDetail> i=storeissuedetail.iterator();i.hasNext();){
                StoreIssueDetail r=(StoreIssueDetail)i.next();
                if(r==null){
                    i.remove();
                    continue;
                }

                Query strQuerydb = sessionProvider.get().createSQLQuery("Select id,closing_quantity,issued_quantity,open_quantity,received_quantity,create_date from daily_stock where item_id='"+r.getItem().getId()+"'");
                List<?> lst1 = strQuerydb.list();
                  BigInteger id=null;
                double closing_quantity=0,issued_quantity=0,open_quantity=0,received_quantity=0;
                String sst = null,datedb=null;
                Date   datewithtime=null;
                if(lst1!=null)
                {
                Iterator idb=lst1.iterator();
              
                while (idb.hasNext()){
                    Object[] rowData=(Object[])idb.next();
                    id=(BigInteger)rowData[0];
                    closing_quantity=(Double)rowData[1];
                    issued_quantity=(Double)rowData[2];
                    open_quantity=(Double)rowData[3];
                    received_quantity=(Double)rowData[4];
                    datedb = (rowData[5].toString()).substring(0,10);
                    datewithtime=(Date)rowData[5] ;

                }
                if(BaseUtils.getCurrentTimestamp().equals(datedb)){

                    String idstg=id.toString();
                    long id1ong=Long.parseLong(idstg);
                    DailyStockRecord dailystock = (DailyStockRecord) sessionProvider.get().get(DailyStockRecord.class, id1ong);

                    dailystock.setOpenQuantity(open_quantity);
                    dailystock.setReceivedQuantity(received_quantity);
                    dailystock.setIssuedQuantity(issued_quantity+r.getIssueQty());
                    dailystock.setItem(r.getItem());
                    dailystock.setClosingQuantity(closing_quantity-r.getIssueQty());
                    if (dailystock.getDate() == null) dailystock.setDate(new Date());
                    sessionProvider.get().update(dailystock);

                }
                else
                {
                    DailyStockRecord dailystock=new DailyStockRecord();
                    dailystock.setOpenQuantity(closing_quantity);
                    dailystock.setReceivedQuantity(0);
                    dailystock.setIssuedQuantity(r.getIssueQty());
                    dailystock.setItem(r.getItem());
                    dailystock.setClosingQuantity(closing_quantity-r.getIssueQty());
                    if (dailystock.getDate() == null) dailystock.setDate(new Date());
                    sessionProvider.get().save(dailystock);
                }

            }
            }
            if(storeissue!=null){
                if (storeissue.getIssueDate() == null) storeissue.setIssueDate(new Date());
                Long q=(Long)sessionProvider.get().createQuery("select max(id) from StoreIssue").uniqueResult();
                           if(q==null)
                {
                    storeissue.setId(1000l);
                }
                else
                {
                storeissue.setId(q+1);

                }
                storeissue.setStoreissuedetailarray(storeissuedetail);
                sessionProvider.get().save(storeissue);

                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }


    public StoreIssue findById(long id) {
        return (StoreIssue)sessionProvider.get().createQuery("from StoreIssue where id='"+id+"'").uniqueResult();
    }


    public List requisitionIds() {
        return sessionProvider.get().createSQLQuery("SELECT r.id FROM requisition r LEFT OUTER JOIN storeissue s on r.id=s.requisition_id WHERE s.requisition_id IS NULL").list();
    }
    public List issuedids() {
        return sessionProvider.get().createSQLQuery("SELECT DISTINCT s.requisition_id FROM requisition r LEFT OUTER JOIN storeissue s on (r.id=s.requisition_id) WHERE s.requisition_id IS NOT NULL and issue_date like '"+ BaseUtils.getCurrentTimestamp()+"%'").list();
    }


    public List<StoreIssue> searchByName(Long  n){
        return (List<StoreIssue>)sessionProvider.get().createQuery("FROM StoreIssue WHERE id='"+n+"'").list();
    }
    public Double getDailyStockVal(Double itemcode) {
        {
            double closing_quantity=0;
            try {


                Query strQuerydb = sessionProvider.get().createSQLQuery("Select closing_quantity,issued_quantity from daily_stock where item_id='"+itemcode+"'");
                List<?> lst1 = strQuerydb.list();
                Iterator idb=lst1.iterator();


                while (idb.hasNext()){
                    Object[] rowData=(Object[])idb.next();
                     closing_quantity=(Double)rowData[0];

                }


            }catch (Exception e){
                e.printStackTrace();

            }

            return closing_quantity;
        }
    }

    @Transactional
    public List<Long> allStoreIssue() {

        return sessionProvider.get().createQuery("Select id from StoreIssue").list();
    }


    @Transactional
    public StoreIssue latestStoreIssue(){

        return (StoreIssue)sessionProvider.get().createQuery("from StoreIssue where id=(select max(id) from StoreIssue)").uniqueResult();
    }

    @Transactional
    public List<DailyStockRecord> getDailyStockDate() {
        {
            return (List<DailyStockRecord>)sessionProvider.get().createQuery("from DailyStockRecord WHERE date LIKE '"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"%'").list();
        }
    }

    @Transactional
    public List<DailyStockRecord> getDailyStockDate(String s) {
        return (List<DailyStockRecord>)sessionProvider.get().createQuery("from DailyStockRecord WHERE date LIKE '"+s+"%'").list();
    }
    @Transactional
    public List<DailyStockRecord> getDailyStockMonth(String itemcodetxt,int month, int year) {

        if(month<=9)
            return (List<DailyStockRecord>)sessionProvider.get().createQuery("from DailyStockRecord d WHERE d.item.name='"+itemcodetxt+"' and d.date LIKE '"+year+"-"+0+month+"%'").list();
        else
            return (List<DailyStockRecord>)sessionProvider.get().createQuery("from DailyStockRecord d WHERE d.item.name='"+itemcodetxt+"' and d.date LIKE '"+year+"-"+month+"%'").list();

    }
    @Transactional
    public List<DailyStockRecord> getDailyStockYear(String itemcodetxt,int year) {

        return (List<DailyStockRecord>)sessionProvider.get().createQuery("from DailyStockRecord d WHERE d.item.name='"+itemcodetxt+"' and d.date LIKE '"+year+"-%'").list();

    }

    @Transactional
    public List<DailyStockRecord> getDailyStockByItemCode(String itemcodetxt,int month, int year)
    {
              
        if(month<=9)
        {
            return (List<DailyStockRecord>)sessionProvider.get().createQuery(" FROM DailyStockRecord d WHERE d.item.name='"+itemcodetxt+"' and  d.date LIKE '"+year+"-"+0+month+"%'").list();
        }
        else
        {
            return (List<DailyStockRecord>)sessionProvider.get().createQuery(" FROM DailyStockRecord d  WHERE d.item.name='"+itemcodetxt+"' and d.date  LIKE '"+year+"-"+month+"%'").list();
        }

      
    }

    @Transactional
    public List<DailyStockRecord> getDailyStockByFromTo(String itemcodetxt,String fromdate, String todate) {

        return (List<DailyStockRecord>)sessionProvider.get().createQuery("from DailyStockRecord d WHERE d.item.name='"+itemcodetxt+"' and  d.date BETWEEN '"+fromdate+"%' AND '"+todate+"%'").list();

    }

    @Transactional
    public List<StoreIssue> searchBySiId(Long  n){

        return (List<StoreIssue>)sessionProvider.get().createQuery("FROM StoreIssue WHERE id='"+n+"'").list();
    }


    public List<StoreIssue> searchBySiRequisitionId(Long n) {
        return (List<StoreIssue>)sessionProvider.get().createQuery("FROM StoreIssue s WHERE s.requisition.id='"+n+"'").list();
    }

    @Transactional
    public List getDailyStockByItemCode(String itemcodetxt)
    {
        List results;
        String sql="SELECT d.id,d.create_date,i.name,i.item_code,d.closing_quantity,d.issued_quantity,d.open_quantity,d.received_quantity,d.remark FROM daily_stock d LEFT OUTER JOIN item i on d.item_id=i.id WHERE i.item_code='"+itemcodetxt+"'";
        Query query = sessionProvider.get().createSQLQuery(sql);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        results = query.list();
        return results;
    }


    @Transactional
    public List<StoreIssue> searchBySiDate(String sdate){
        sdate=sdate.replace("/","-");
        try{
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = (Date)formatter.parse(sdate);
            sdate = formatter.format(date);

        }
        catch (ParseException e)
        {
            System.out.println("Exception :"+e);
        }
        return sessionProvider.get().createQuery("FROM StoreIssue WHERE issueDate LIKE '"+sdate+"%'").list();
    }

    public int daysBetween(Date d1, Date d2){

        return (int) ((d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
    }


}
