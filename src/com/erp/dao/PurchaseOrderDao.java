package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.PurchaseOrder;
import com.erp.pojo.PurchaseOrderDetail;
import com.erp.pojo.Grn;
import com.erp.pojo.Vendor;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Iterator;
import java.util.Date;
import java.util.Properties;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;


import org.hibernate.Query;
import org.codemonkey.simplejavamail.Email;
import org.codemonkey.simplejavamail.Mailer;
import org.codemonkey.simplejavamail.TransportStrategy;

import javax.mail.Message.RecipientType;
import javax.mail.util.ByteArrayDataSource;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Mar 1, 2012
 * Time: 12:18:18 PM
 * To change this template use File | Settings | File Templates.
 */
public class PurchaseOrderDao extends BaseDao<PurchaseOrder, Long>  {
    public PurchaseOrderDao() {
        super(PurchaseOrder.class);
    }

    public List<PurchaseOrder> getApproveByLm() {
        return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder where status='open' and approvePO='Yes' and approvePOByVp='No' and generatedPO='1' and deleted='0'").list();
    }


    public List<PurchaseOrder> getPoApprove() {
        return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder where status='open' and approvePO='No' and generatedPO='1'and deleted='0' ").list();
    }

    @Transactional
    public boolean SavePurchaseOrder(PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> purchasedetail){
        try {
            PurchaseOrderDetail g=null;
            for(Iterator<PurchaseOrderDetail> i=purchasedetail.iterator();i.hasNext();){
                g=(PurchaseOrderDetail)i.next();
                if(g==null){
                    i.remove();
                    continue;
                }else if(g.getOrderedQty()==null){
                    i.remove();
                    continue;
                }
                         }
            if(purchaseOrder!=null){
                if (purchaseOrder.getCreateDate() == null) purchaseOrder.setCreateDate(new Date());
                Query q=sessionProvider.get().createQuery("select max(id) from PurchaseOrder");
                List list=q.list();
                String a=null;
                if(list.contains(null))
                {
                    a="PO1000";
                }
                else
                {
                    PurchaseOrder ponumber=(PurchaseOrder)sessionProvider.get().createQuery("from PurchaseOrder where id=(select  max(id) from PurchaseOrder)").uniqueResult();
                    String orderno=ponumber.getPurchaseOrderNo();
                    int i=Integer.parseInt(orderno.substring(2));
                    i++;
                    a="PO"+i;
                }
                purchaseOrder.setGeneratedPO(0);
                purchaseOrder.setApprovePO("No");
                purchaseOrder.setApprovePOByVp("No");
                purchaseOrder.setPurchaseOrderNo(a);
                purchaseOrder.setPurchasedetailarray(purchasedetail);
                sessionProvider.get().save(purchaseOrder);
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }

   public List<PurchaseOrder> getPurchaseOrder(){
       return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder where generatedPO=0 and deleted=0").list();
   }
     public List<PurchaseOrder> getPurchaseOrderForView(){
       return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder where  deleted=0").list();
   }
    @Transactional
    public void update(PurchaseOrder purchaseOrder,List<PurchaseOrderDetail> purchasedetail){
        PurchaseOrderDetail g=null;
        try{
            for(Iterator<PurchaseOrderDetail> i=purchasedetail.iterator();i.hasNext();){
                g =(PurchaseOrderDetail)i.next();
                if(g==null){
                    i.remove();

                }else if(g.getOrderedQty()==null){
                    i.remove();
                }
            }
            purchaseOrder.setGeneratedPO(0);
            purchaseOrder.setApprovePO("No");
              purchaseOrder.setApprovePOByVp("No");
            if (purchaseOrder.getCreateDate() == null) purchaseOrder.setCreateDate(new Date());
            purchaseOrder.setPurchasedetailarray(purchasedetail);
            sessionProvider.get().merge(purchaseOrder);
        }catch (Exception e){
            e.printStackTrace();

        }
    }

    public PurchaseOrder findById(Long id){
        return (PurchaseOrder)sessionProvider.get().createQuery("from PurchaseOrder where id='"+id+"'").uniqueResult();
    }
    @Transactional
    public void deletePO( PurchaseOrder purchaseOrder)  {
        try{
                 purchaseOrder.setDeleted(1);
                 purchaseOrder.setGeneratedPO(0);
                 purchaseOrder.setApprovePO("No");
                 purchaseOrder.setApprovePOByVp("No");
            sessionProvider.get().update(purchaseOrder);

        }catch (Exception e){
            e.printStackTrace();

        }
    }
    public PurchaseOrder latestPurchaseOrder() {
        return (PurchaseOrder)sessionProvider.get().createQuery("from PurchaseOrder where id=(select max(id) from PurchaseOrder)").uniqueResult();

    }
    @Transactional
    public void generatePurchaseOrder(PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> purchasedetail) {
        try{
            for(Iterator<PurchaseOrderDetail> i=purchasedetail.iterator();i.hasNext();){
                PurchaseOrderDetail g=(PurchaseOrderDetail)i.next();

                if(g==null){
                    i.remove();

                }else if(g.getOrderedQty()==null){
                    i.remove();
                }
            }
            purchaseOrder.setGeneratedPO(1);
            purchaseOrder.setApprovePO("No");
              purchaseOrder.setApprovePOByVp("No");
            if (purchaseOrder.getCreateDate() == null) purchaseOrder.setCreateDate(new Date());
            purchaseOrder.setPurchasedetailarray(purchasedetail);
            sessionProvider.get().update(purchaseOrder);
        }catch (Exception e){
            e.printStackTrace();

        }
    }

    public List<String> getAllPurchaseOrderNo() {
        return sessionProvider.get().createSQLQuery("Select purchase_order_no from purchase_order").list();
    }
    public PurchaseOrder findByLastUpdate() {
        return (PurchaseOrder)sessionProvider.get().createQuery("from PurchaseOrder order by id desc").uniqueResult();
    }

    public List<PurchaseOrder> getPoByStatus(){
        return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder where status='open' and approvePOByVp='Yes' and generatedPO='1' and deleted='0'").list();
    }

    public List<String> allPOnoForSearch() {
        return sessionProvider.get().createQuery("Select id from PurchaseOrder").list();
    }
    public List<PurchaseOrder> searchByName(String  n){
        return sessionProvider.get().createQuery("FROM PurchaseOrder WHERE purchaseOrderNo='"+n+"'").list();
    }

    public List<PurchaseOrder> searchByPoVendorName(String vendorname){
        return sessionProvider.get().createQuery("FROM PurchaseOrder p WHERE p.vendor.name='"+vendorname+"'").list();
    }
    public List<PurchaseOrder> searchByPoVendorId(String vendorcode){
        return sessionProvider.get().createQuery("FROM PurchaseOrder p WHERE p.vendor.vendorCode='"+vendorcode+"'").list();
    }

    public List<PurchaseOrder> searchByPoDate(String sdate){
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
        return sessionProvider.get().createQuery("FROM PurchaseOrder p WHERE p.createDate LIKE '"+sdate+"%'").list();
    }

    public List<PurchaseOrder> searchByFromTo(String fromdate, String todate)
    {
        fromdate=fromdate.replace("/","-");
        todate=todate.replace("/","-");
        try{
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date fdate = (Date)formatter.parse(fromdate);
            Date tdate = (Date)formatter.parse(todate);
            fromdate = formatter.format(fdate);
            todate = formatter.format(tdate);

        }
        catch (ParseException e)
        {
            System.out.println("Exception :"+e);
        }

        return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder WHERE createDate BETWEEN '"+fromdate+"%' AND '"+todate+"%'").list();
    }
    @Transactional
    public void setApprovePO(long id) {
      sessionProvider.get().createQuery("UPDATE PurchaseOrder SET approvePO='Yes' WHERE id="+id+"").executeUpdate();
    }
    
     @Transactional
    public void setApprovePOByVp(long id) {
      sessionProvider.get().createQuery("UPDATE PurchaseOrder SET approvePOByVp='Yes' WHERE id="+id+"").executeUpdate();
    }
    public List<String> getPoVendorNameLst() {
        return sessionProvider.get().createQuery("Select DISTINCT p.vendor.name from PurchaseOrder p where deleted='0'").list();
    }
    public List<String> getPoVendorIdLst() {
        return sessionProvider.get().createQuery("Select DISTINCT p.vendor.vendorCode from PurchaseOrder p where deleted='0'").list();
    }
    	
    public void sendGeneralMail(long id) {
        try {
                Properties prop = new Properties();
                prop.load(this.getClass().getResourceAsStream("/email.properties"));
                Email email=new Email();
                String drivePath=prop.getProperty("drivePath");
                String emailFrom=prop.getProperty("emailFrom");
                String mimetype=prop.getProperty("mimetype");
                String fileExtension=prop.getProperty("fileExtension");
                String pass=prop.getProperty("pass");
                int port=Integer.parseInt(prop.getProperty("port"));
                String hostName=prop.getProperty("hostName");
                PurchaseOrder po=findById(id);
                String emailTo=po.getVendor().getEmailId();
                final String name=""+po.getVendor().getName()+""+"_"+po.getPurchaseOrderNo()+fileExtension;
                byte []data=null;
                File file = new File(drivePath+name);
                FileInputStream fis = null;
                fis = new FileInputStream(file);
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                data = new byte[(int) file.length()] ;

                for (int readNum; (readNum = fis.read(data)) != -1;) {
                bos.write(data, 0, readNum); //no doubt here is 0
                //Writes len bytes from the specified byte array starting at offset off to this byte array output stream.
                System.out.println("read " + readNum + " bytes,");
                }
                final ByteArrayDataSource dataSource = new ByteArrayDataSource(data,mimetype);

                email.addRecipient("",emailTo,RecipientType.TO);
                email.setFromAddress("",emailFrom);
                email.addAttachment(name,dataSource);
                email.setSubject("Hi this is mail from er.milind27@gmail.com to check enterpride");
                email.setText("for approval of purchase order");

                new Mailer(hostName,port,emailFrom,pass,TransportStrategy.SMTP_SSL).sendMail(email);

        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

       }

     @Transactional
    public List<PurchaseOrder> getPoByMonth(int month, int year) {

        if(month<=9)
            return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder WHERE createDate LIKE '"+year+"-"+0+month+"%'").list();
        else
            return (List<PurchaseOrder>)sessionProvider.get().createQuery("from PurchaseOrder WHERE createDate LIKE '"+year+"-"+month+"%'").list();

    }
    @Transactional
    public List<PurchaseOrder> getAllDeletedPO() {
        return (List<PurchaseOrder>)sessionProvider.get().createQuery("FROM PurchaseOrder where deleted='1'").list();
    }

    public void restoreAllPO()
    {
        sessionProvider.get().createQuery("UPDATE PurchaseOrder SET deleted=0 WHERE deleted=1").executeUpdate();

    }
    public void restorePO(int id)
    {
        sessionProvider.get().createQuery("UPDATE PurchaseOrder SET deleted=0 WHERE id="+id).executeUpdate();

    }
}
