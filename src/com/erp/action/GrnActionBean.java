package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;
    import com.erp.pojo.*;

    import com.erp.constants.PermissionConstants;
    import com.erp.utils.Converter;
    import com.erp.dao.GrnDao;
    import com.erp.dao.PurchaseOrderDao;
    import com.erp.dao.VendorDao;
    import com.erp.dao.ItemDao;
    import com.google.inject.Inject;

    import javax.annotation.security.RolesAllowed;

    import java.util.List;

    import java.util.Iterator;
    import java.util.ArrayList;

    import java.io.FileInputStream;


    /**
    * Created by IntelliJ IDEA.
    * User: Minal
    * Date: Feb 20, 2012
    * Time: 4:42:02 PM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class GrnActionBean extends BaseActionBean{
    @Inject
    GrnDao grndao;
    @Inject
    PurchaseOrderDao purchaseorderdao;
    @Inject
    VendorDao vendordao;
    @Inject
    ItemDao itemdao;
    private Grn grn;
        private ArrayList<GrnDetail> faqlst=new ArrayList();
    private List<Vendor> vendorlst;
    private List<Item> itemidlst;
    private List<Grn> grnlst;
    private Item item;
    private List<PurchaseOrder> purchaseorderlst;
    private List<GrnDetail> grndetailarray;
    private List<GrnDetail> grndetailarrayclone;
    private GrnDetail grndetail;
    private PurchaseOrder purchaseOrder;
    private String hdnvalue;
    private Double tot;
    protected long  iddrop;
    private String content;
    private String grnnopdf;
    private String vendorName;


        public List<GrnDetail> getGrndetailarrayclone() {
            return grndetailarrayclone;
        }

        public void setGrndetailarrayclone(List<GrnDetail> grndetailarrayclone) {
            this.grndetailarrayclone = grndetailarrayclone;
        }

        public ArrayList getFaqlst() {
            return faqlst;
        }

        public void setFaqlst(ArrayList faqlst) {
            this.faqlst = faqlst;
        }

        public String getContent() {
    return content;
    }

    public void setContent(String content) {
    this.content = content;
    }

    public String getGrnnopdf() {
    return grnnopdf;
    }

    public void setGrnnopdf(String grnnopdf) {
    this.grnnopdf = grnnopdf;
    }

    public String getVendorName() {
    return vendorName;
    }

    public void setVendorName(String vendorName) {
    this.vendorName = vendorName;
    }

    public Double getTot() {
    return tot;
    }

    public void setTot(Double tot) {
    this.tot = tot;
    }

    public String getHdnvalue() {
    return hdnvalue;
    }

    public void setHdnvalue(String hdnvalue) {
    this.hdnvalue = hdnvalue;
    }

    public PurchaseOrder getPurchaseOrder() {

    return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
    this.purchaseOrder = purchaseOrder;
    }
    public Grn getGrn() {
    if(id != 0) {


       return grndao.findById(id);
    }
    return grn;
    }

    public void setGrn(Grn grn) {
    this.grn = grn;
    }

    public GrnDetail getGrndetail() {

    return grndetail;
    }

    public void setGrndetail(GrnDetail grndetail) {
    this.grndetail = grndetail;
    }

    public List<GrnDetail> getGrndetailarray() {
    return grndetailarray;
    }

    public void setGrndetailarray(List<GrnDetail> grndetailarray) {
    this.grndetailarray = grndetailarray;
    }

    public List<Vendor> getVendorlst() {
    return vendorlst;
    }

    public void setVendorlst(List<Vendor> vendorlst) {
    this.vendorlst = vendorlst;
    }

    public List<Item> getItemidlst() {
    return itemidlst;
    }

    public void setItemidlst(List<Item> itemidlst) {
    this.itemidlst = itemidlst;
    }

    public Item getItem() {
    return item;
    }

    public void setItem(Item item) {
    this.item = item;
    }

    public List<Grn> getGrnlst() {
    return grnlst;
    }

    public void setGrnlst(List<Grn> grnlst) {
    this.grnlst = grnlst;
    }

    public List<PurchaseOrder> getPurchaseorderlst() {

    return purchaseorderlst;
    }

    public void setPurchaseorderlst(List<PurchaseOrder> purchaseorderlst) {
    this.purchaseorderlst = purchaseorderlst;
    }

    public long getIddrop() {
    return iddrop;
    }

    public void setIddrop(long iddrop) {
    this.iddrop = iddrop;
    }


    @RolesAllowed({PermissionConstants.ADD_GRN})
    @DefaultHandler
    //Redirect to add grn page
    public Resolution addGrnLink(){
    purchaseorderlst=purchaseorderdao.getPoByStatus();
    vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    return new ForwardResolution("jsp/addGrn.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_GRN})
    //Add Grn
    public Resolution addGrn(){
       Iterator it=grndetailarray.iterator();
        while (it.hasNext()) {
            System.out.println("GRN not clone :"+it.next());

        }
//        Iterator it1=grndetailarrayclone.iterator();
//        while (it1.hasNext()) {
//            System.out.println("GRN :"+it1.next());
//
//        }
//   Iterator it1=grndetailarrayclone.iterator();
//        while (it1.hasNext()) {
//            System.out.println("GRN clone :"+it1.next());
//
//        }
//   //
 grndao.SaveGrn(getGrn(),grndetailarray);
    purchaseorderlst=purchaseorderdao.getPoByStatus();
    getContext().getMessages().add(new LocalizableMessage("/GRN.action.add.success"));
    return new RedirectResolution(GrnActionBean.class,"addGrnLink");
    }
    //Get dropdown item list
    public Resolution getItemDetails(){

    item= itemdao.findById(id);
    return new JavaScriptResolution(item);
    }

    @RolesAllowed({PermissionConstants.UPDATE_GRN})
    //Redirect to update grn page
    public Resolution updateGrnLink(){
    grnlst=grndao.getTodayGrn();
    return new ForwardResolution("jsp/updateGrn.jsp");
    }
    //Get grn detail by its id
    @RolesAllowed({PermissionConstants.UPDATE_GRN})
    public Resolution getGrnButton()
    {
    grn=grndao.findById(id);
    purchaseorderlst=purchaseorderdao.getPurchaseOrder();
    grnlst=grndao.getTodayGrn();
    vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    return new ForwardResolution("jsp/updateGrn.jsp");

    }
    //Update  grn
    @RolesAllowed({PermissionConstants.UPDATE_GRN})
    public Resolution updategrn(){
    grndao.update(getGrn(),grndetailarray);
    grnlst=grndao.getTodayGrn();
    getContext().getMessages().add(new LocalizableMessage("/GRN.action.update.success"));
    return new RedirectResolution("jsp/updateGrn.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_GRN})
    //add grn detail by purchase order
    public Resolution getorderlstforgrn(){
    purchaseOrder =purchaseorderdao.findById(iddrop);
    purchaseorderlst=purchaseorderdao.getPoByStatus();
    vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    return new ForwardResolution("jsp/addGrn.jsp");
    }

    @RolesAllowed({PermissionConstants.ADD_APPROVEGRN})
    public Resolution verify(){
    grnlst=grndao.unverifiedGrnList();
    return new ForwardResolution("jsp/verifyGrn.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_GRNPAYMENTS})
    public Resolution ApprovedGrnByAccountant(){
    grnlst=grndao.approvedGrnByAM();
    return new ForwardResolution("jsp/approvedGrnByAm.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_APPROVEGRN,PermissionConstants.ADD_GRNPAYMENTS})
    public Resolution proceedForPayment(){
    grn=grndao.findById(id);
    if(hdnvalue.equals("test"))
      {
            hdnvalue="receipt";
      }    else
    {
     hdnvalue="receiptclose";
    }
    grnlst=grndao.unverifiedGrnList();
    return new RedirectResolution(GrnActionBean.class,"verify").addParameter("hdnvalue",hdnvalue).addParameter("id",id);

    }
    public Resolution redirectpopup()
    {
    tot=0.0;
    grn=grndao.findById(getId());
    hdnvalue="receiptclose";
    Iterator<GrnDetail> it=grn.getGrndetailarray().iterator();
    while (it.hasNext())
    {
    tot=tot+it.next().getValue();
    }
    return new ForwardResolution("jsp/receipt/verifyGrnSlip.jsp");
    }

    public Resolution redirectpopupforverified()
    {
    tot=0.0;
    grn=grndao.findById(getId());
    Iterator<GrnDetail> it=grn.getGrndetailarray().iterator();
    while (it.hasNext())
    {
    tot=tot+it.next().getValue();
    }
      return new ForwardResolution("jsp/receipt/verifiedGrnSlip.jsp");
    }

    @RolesAllowed({PermissionConstants.ADD_GRNPAYMENTS})
    public Resolution forAccountant(){
    grnlst=grndao.verifiedGrnList();
    return new ForwardResolution("jsp/grnPaymentAccountant.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_APPROVEGRN})
    public Resolution ApprovedGrnByManager(){
    grnlst=grndao.approvedGrnBySM();
    return new ForwardResolution("jsp/approvedGrnBySm.jsp");
    }

    @RolesAllowed({PermissionConstants.ADD_GRNPAYMENTS})
    public Resolution makePayment(){
    grn=grndao.findById(id);
    hdnvalue="receipt";
    grnlst=grndao.verifiedGrnList();
    return new ForwardResolution(GrnActionBean.class,"forAccountant").addParameter("hdnvalue",hdnvalue);

    }

    @RolesAllowed({PermissionConstants.ADD_GRNPAYMENTS})
    public Resolution success(){

    grndao.setPaymentStatusSuccess(getGrn().getId());
    grnlst=grndao.verifiedGrnList();
       hdnvalue="test12";
    return new RedirectResolution(GrnActionBean.class,"forAccountant").addParameter("hdnvalue",hdnvalue);

    }

    @RolesAllowed({PermissionConstants.ADD_APPROVEGRN})
    public Resolution verification(){
    grndao.setVerifiedToY(getGrn().getId());
    grnlst=grndao.unverifiedGrnList();

    hdnvalue="test12";

    return new RedirectResolution(GrnActionBean.class,"verify").addParameter("hdnvalue",hdnvalue);
    }

    public Resolution print(){
    String path=null;
    FileInputStream sis=null;
    try{
    path= Converter.convert(content,vendorName+"_"+grnnopdf);
    sis=new FileInputStream(path);
    }catch(Exception e){
    System.out.println("achtung "+e.getMessage());
    }
       return new StreamingResolution("application/pdf",sis);
    }
    public Resolution res()
    {
       // Iterator<GrnDetail> itt=grndetailarray.iterator();
       System.out.println("in res mmmm :"+faqlst);
        Iterator<GrnDetail> it=faqlst.iterator();
        while (it.hasNext()) {
            System.out.println("faqlst   :"+it.next().getAcceptedQty());


        }
        return new JavaScriptResolution(faqlst);
    }
}

