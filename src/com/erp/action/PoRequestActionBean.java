    package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import com.erp.pojo.PurchaseOrderRequest;
    import com.erp.pojo.PurchaseOrderRequestDetail;
    import com.erp.pojo.Item;
    import com.erp.pojo.Vendor;
    import com.erp.dao.PoRequestDao;
    import com.erp.dao.ItemDao;
    import com.erp.dao.VendorDao;
    import com.google.inject.Inject;

    import java.util.List;
    import java.util.ArrayList;
    import java.util.Iterator;

    /**
    * Created by IntelliJ IDEA.
    * User: Minal
    * Date: Jun 7, 2012
    * Time: 5:56:22 PM
    * To change this template use File | Settings | File Templates.
    */
    public class PoRequestActionBean extends BaseActionBean{
    @Inject  PoRequestDao poDao;
    @Inject
    VendorDao vendorDao;
    @Inject
    ItemDao itemdao;
    private List<Item> itemidlst;
    private List<Vendor> vendorlst;
    private PurchaseOrderRequest poRequest;
    private List<PurchaseOrderRequestDetail> poRequestarray = new ArrayList<PurchaseOrderRequestDetail>();
    private List<PurchaseOrderRequest> poReqlst;
    private List listforitemorderqty;
    private String emailid;
    private List<String> listOfEmail;

        public List<String> getListOfEmail() {
            return listOfEmail;
        }

        public void setListOfEmail(List<String> listOfEmail) {
            this.listOfEmail = listOfEmail;
        }

        public List<Vendor> getVendorlst() {
            return vendorlst;
        }

        public void setVendorlst(List<Vendor> vendorlst) {
            this.vendorlst = vendorlst;
        }

        public String getEmailid() {
            return emailid;
        }

        public void setEmailid(String emailid) {
            this.emailid = emailid;
        }

        public List getListforitemorderqty() {
            return listforitemorderqty;
        }

        public void setListforitemorderqty(List listforitemorderqty) {
            this.listforitemorderqty = listforitemorderqty;
        }

        public PurchaseOrderRequest getPoRequest() {
    return poRequest;
    }

    public void setPoRequest(PurchaseOrderRequest poRequest) {
    this.poRequest = poRequest;
    }

    public List<PurchaseOrderRequestDetail> getPoRequestarray() {
    return poRequestarray;
    }

    public void setPoRequestarray(List<PurchaseOrderRequestDetail> poRequestarray) {
    this.poRequestarray = poRequestarray;
    }

    public List<Item> getItemidlst() {
    return itemidlst;
    }

    public void setItemidlst(List<Item> itemidlst) {
    this.itemidlst = itemidlst;
    }

    public List<PurchaseOrderRequest> getPoReqlst() {
    return poReqlst;
    }

    public void setPoReqlst(List<PurchaseOrderRequest> poReqlst) {
    this.poReqlst = poReqlst;
    }

    @DefaultHandler
    public Resolution addPOReqLink(){
    itemidlst= itemdao.getItem();
    return new ForwardResolution("jsp/requestPO.jsp");
    }

    public Resolution addPoRequest(){
    poDao.SavePORequest(getPoRequest(),poRequestarray);
    getContext().getMessages().add(new LocalizableMessage("/PurchaseRequest.action.add.success"));
    return new RedirectResolution(PoRequestActionBean.class,"addPOReqLink");
    }

    public Resolution cancel()
    {

    return new ForwardResolution(PoRequestActionBean.class,"addPOReqLink");
    }
    public Resolution approvePOLink()
    {
    poReqlst=poDao.getPoApprove();
    return new ForwardResolution("jsp/approveRequestPo.jsp");
    }
    public Resolution notificationPoLink()
    {
       
      poReqlst=poDao.getPoRequestLst();
        listforitemorderqty=poDao.listForItemOrderQty();
        vendorlst=vendorDao.listAll();
        itemidlst=itemdao.getItemForDelete();
      
    return new ForwardResolution("jsp/notificationPo.jsp");
    }
    public Resolution viewapprovepo(){
    poDao.setApprovePO(getId());
    return new ForwardResolution(PoRequestActionBean.class,"approvePOLink");
    }
    public Resolution sendemail()
    {
         
        poDao.sendemail(emailid);
        return new RedirectResolution(PoRequestActionBean.class,"notificationPoLink");
    }
        public Resolution trylst()
        {
            System.out.println("in try lst");
            Iterator<String> it=listOfEmail.iterator();
            while(it.hasNext()) {
                String s = it.next();
                if(s != null)
                {
                    String[] tokens = s.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
                           for(String t : tokens) {
                               System.out.println("> "+t);
                               poDao.sendemail(t);
                           }
                }

            }
            return new RedirectResolution(PoRequestActionBean.class);
        }

}
