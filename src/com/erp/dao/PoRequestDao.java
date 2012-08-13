package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.PurchaseOrderRequest;
import com.erp.pojo.PurchaseOrderRequestDetail;
import com.erp.pojo.Vendor;
import com.erp.pojo.Item;
import com.wideplay.warp.persist.Transactional;

import java.util.*;
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
        Query query = sessionProvider.get().createSQLQuery("select por.id,it.name,por.user,por.location,por.department,por.create_date,prd.ordered_qty from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id where por.approve_po='No'");
//        Query query = sessionProvider.get().createSQLQuery("select v.name as vendorname,v.email_id,it.name,por.user,por.location,por.department,por.create_date,prd.ordered_qty from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id left outer join vendor v on v.product_supplied=it.name where por.approve_po='No'").addScalar("vendorname").addScalar("name").addScalar("ordered_qty").addScalar("location").addScalar("department").addScalar("user").addScalar("create_date").addScalar("email_id");
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP); 
        results = query.list();
        return results;
    }

    public void sendemail(String em) {
        try {
                Properties prop = new Properties();
                int iloop=0;
                String [] html2 = new String[2000];
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
                email.addRecipient("",emailTo, Message.RecipientType.TO);
                email.setFromAddress("",emailFrom);

                email.setSubject("Hi this is mail from Revolutrix Testers to check enterpride");
            
                email.setText("for approval of purchase order");

                List<Vendor> vendorlst=sessionProvider.get().createQuery("from Vendor v WHERE v.emailId='"+em+"'").list();
//                    List<Item> itemlst=sessionProvider.get().createSQLQuery("select it.name,prd.ordered_qty from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id where por.approve_po='No'").list();
                    List<Item> itemlst=sessionProvider.get().createQuery("FROM Item i").list();
            Iterator<Vendor> itforvendor=vendorlst.iterator();
            String sample="one :<br>";
            String htm="";
            for(Iterator<Item> it=itemlst.iterator();it.hasNext();){
                 Item i=(Item)it.next();
                while(itforvendor.hasNext()) {
                   Vendor vendor=(Vendor)itforvendor.next();
                    if(vendor.getProductSupplied().contains(i.getName()))
                    {
                        System.out.println("it contain item ");
                          String[] tokens=vendor.getProductSupplied().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
                         List finallst = new ArrayList();
                         for(String t : tokens){
                               System.out.println("t >"+t);
//                            System.out.println("llllll"+sessionProvider.get().createSQLQuery("select it.name,SUM(prd.ordered_qty) as total_ordered_qty from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id where por.approve_po='No' and it.name='"+t+"'").setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).uniqueResult());
                           htm=sessionProvider.get().createSQLQuery("select it.name as ItemName,SUM(prd.ordered_qty) as OrderedQuantity from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id where por.approve_po='No' and it.name='"+t+"'").addScalar("ItemName").addScalar("OrderedQuantity").setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).uniqueResult().toString();
                            htm=htm.replace("{","");htm=htm.replace("}","");
                           
                          sample=sample+"<br>"+htm;
                        }

//                        email.setTextHTML("<html>\n" +
//                                       "<body>\n" +
//                                       "<table width=\"48%\" border=\"1\" cellspacing=\"1\">\n" +
//                                       "  <tr>\n" +
//                                       "    <td width=\"14%\">SR No</td>\n" +
//                                       "    <td width=\"41%\">Item Name</td>\n" +
//                                       "    <td width=\"45%\">Ordered Quantity</td>\n" +
//                                       "  </tr>\n" +
//                                       "  <tr>\n" +
//                                       "    <td>"+finallstit.next()+"</td>\n" +
//                                    "    <td>"++"</td>\n" +
//                                    "    <td>"++"</td>\n" +
//                                       "  </tr>\n" +
//                                       "</table>\n" +
//                                       "</body>\n" +
//                                       "</html>");



                        String html1="<html>\n" +
                                                   "<body>\n" +
                                                   "<table width=\"48%\" border=\"1\" cellspacing=\"1\">\n" +
                                                   "  <tr>\n" +
                                                   "    <td width=\"41%\">Item Name</td>\n" +
                                                   "    <td width=\"45%\">Ordered Quantity</td>\n" +
                                                   "  </tr>\n" +
                                                   "  <tr>\n";

                                  String html3= "  </tr>\n" +
                                                   "</table>\n" +
                                                   "</body>\n" +
                                                   "</html>";

                    }
                      else if(vendor.getProductSupplied().equalsIgnoreCase(i.getName()))
                        {
                            htm=sessionProvider.get().createSQLQuery("select it.name as ItemName,SUM(prd.ordered_qty) as OrderedQuantity from purchase_order_request por inner join purchase_req_has_purchasedetail_req detail on por.id=detail.purchase_req_no INNER JOIN purchase_req_detail prd on detail.purchase_req_detail_id=prd.id INNER JOIN item it on prd.item_id=it.id where por.approve_po='No' and it.name='"+vendor.getProductSupplied()+"'").addScalar("ItemName").addScalar("OrderedQuantity").setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).uniqueResult().toString();
                                                       htm=htm.replace("{","");htm=htm.replace("}","");

                                                     sample=sample+"<br>"+htm;

                        }
               }
               }
            email.setTextHTML(sample);
            new Mailer(hostName,port,emailFrom,pass, TransportStrategy.SMTP_SSL).sendMail(email);

        } catch (Exception e) {
            e.printStackTrace();
        }

       }
}


