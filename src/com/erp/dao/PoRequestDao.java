package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.PurchaseOrderRequest;
import com.erp.pojo.PurchaseOrderRequestDetail;
import com.erp.pojo.Vendor;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Iterator;
import java.util.Date;
import java.util.Properties;
import java.io.File;
import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;

import org.hibernate.Query;
import org.hibernate.Criteria;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.codemonkey.simplejavamail.Email;
import org.codemonkey.simplejavamail.Mailer;
import org.codemonkey.simplejavamail.TransportStrategy;

import javax.mail.util.ByteArrayDataSource;
import javax.mail.Message;

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

    public List<PurchaseOrderRequest> getPoRequestLst() {
    return (List<PurchaseOrderRequest>)sessionProvider.get().createQuery("from PurchaseOrderRequest where  approvePO='No' and deleted='0' ").list();    
    }
    public List listForItemOrderQty()
    {
        List results;
        Query query = sessionProvider.get().createSQLQuery("select it.name,por.user,por.location,por.department,por.create_date,prd.ordered_qty from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id where por.approve_po='No'");
//        Query query = sessionProvider.get().createSQLQuery("select v.name as vendorname,v.email_id,it.name,por.user,por.location,por.department,por.create_date,prd.ordered_qty from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id left outer join vendor v on v.product_supplied=it.name where por.approve_po='No'").addScalar("vendorname").addScalar("name").addScalar("ordered_qty").addScalar("location").addScalar("department").addScalar("user").addScalar("create_date").addScalar("email_id");
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP); 
        results = query.list();
        return results;
    }

    public void sendemail(String em) {
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

                String emailTo=em;
                final String name="demo"+fileExtension;
                byte []data=null;
                File file = new File(drivePath+name);
                FileInputStream fis = null;
                fis = new FileInputStream(file);
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                data = new byte[(int) file.length()] ;

                for (int readNum; (readNum = fis.read(data)) != -1;) {
                bos.write(data, 0, readNum); //no doubt here is 0
                //Writes len bytes from the specified byte array starting at offset off to this byte array output stream.
              
                }
                final ByteArrayDataSource dataSource = new ByteArrayDataSource(data,mimetype);

                email.addRecipient("",emailTo, Message.RecipientType.TO);
                email.setFromAddress("",emailFrom);
                email.addAttachment(name,dataSource);
                email.setSubject("Hi this is mail from er.milind27@gmail.com to check enterpride");
                email.setText("for approval of purchase order");

                new Mailer(hostName,port,emailFrom,pass, TransportStrategy.SMTP_SSL).sendMail(email);

        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

       }
}


