    package com.erp.action;

    import com.erp.pojo.*;
    import com.erp.constants.PermissionConstants;
    import com.erp.utils.Converter;
    import com.erp.dao.PurchaseOrderDao;
    import com.erp.dao.VendorDao;
    import com.erp.dao.ItemDao;
    import com.erp.dao.TermsDao;
    import com.google.inject.Inject;
    import com.wideplay.warp.persist.Transactional;

    import java.util.List;
    import java.util.ArrayList;
    import java.io.FileInputStream;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;

    import javax.annotation.security.RolesAllowed;

    /**
    * Created by IntelliJ IDEA.
    * User: Admin
    * Date: Feb 29, 2012
    * Time: 5:34:00 PM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class PurchaseOrderActionBean extends BaseActionBean{
    @Inject
    PurchaseOrderDao purchaseorderdao;
    @Inject
    VendorDao vendordao;
    @Inject
    ItemDao itemdao;
    @Inject  protected TermsDao termdao;
    private List<Vendor> vendorlst;
    private List<Item> itemidlst;
    private List<PurchaseOrder> purchaseorderlst;
    private Item item;
    private String content;
    private String purchaseOrderNumber;
    private String vendorName;
    private Terms term;
    private String hdnvalue;
    private List<PurchaseOrderDetail> purchasedetailarray = new ArrayList<PurchaseOrderDetail>();
    private PurchaseOrder purchaseOrder;

    private  String test;

    public String getHdnvalue() {
    return hdnvalue;
    }

    public void setHdnvalue(String hdnvalue) {
    this.hdnvalue = hdnvalue;
    }

    public Terms getTerm() {
    return term;
    }

    public void setTerm(Terms term) {
    this.term = term;
    }

    public String getContent() {
    return content;
    }

    public void setContent(String content) {
    this.content = content;
    }

    public String getPurchaseOrderNumber() {
    return purchaseOrderNumber;
    }

    public void setPurchaseOrderNumber(String purchaseOrderNumber) {
    this.purchaseOrderNumber = purchaseOrderNumber;
    }

    public String getVendorName() {
    return vendorName;
    }

    public void setVendorName(String vendorName) {
    this.vendorName = vendorName;
    }

    public PurchaseOrder getPurchaseOrder() {
    if(id != 0) {
    return purchaseorderdao.findById(id);
    }
    return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
    this.purchaseOrder = purchaseOrder;
    }
    public List<PurchaseOrder> getPurchaseorderlst() {
    return purchaseorderlst;
    }

    public void setPurchaseorderlst(List<PurchaseOrder> purchaseorderlst) {
    this.purchaseorderlst = purchaseorderlst;
    }

    public Item getItem() {
    return item;
    }

    public void setItem(Item item) {
    this.item = item;
    }

    public List<PurchaseOrderDetail> getPurchasedetailarray() {
    return purchasedetailarray;
    }

    public void setPurchasedetailarray(List<PurchaseOrderDetail> purchasedetailarray) {
    this.purchasedetailarray = purchasedetailarray;
    }

    public PurchaseOrderDetail getGrndetail() {
    return grndetail;
    }

    public void setGrndetail(PurchaseOrderDetail grndetail) {
    this.grndetail = grndetail;
    }

    private PurchaseOrderDetail grndetail;

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

    public String getTest() {
    return test;
    }

    public void setTest(String test) {
    this.test = test;
    }

    @RolesAllowed({PermissionConstants.ADD_PURCHASEORDER})
    @DefaultHandler
    public Resolution addPOLink(){
    vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    return new ForwardResolution("jsp/addPurchaseOrder.jsp");
    }

    public Resolution getItemDetails(){
    item= itemdao.findById(id);
    return new JavaScriptResolution(item);
    }

    public Resolution previewPurchaseOrder(){
    purchaseOrder=purchaseorderdao.latestPurchaseOrder();
    return new ForwardResolution("jsp/previewPurchaseOrder.jsp");
    }


    @RolesAllowed({PermissionConstants.ADD_PURCHASEORDER})
    public Resolution addPurchaseOrder(){
    purchaseorderdao.SavePurchaseOrder(getPurchaseOrder(),purchasedetailarray);
    getContext().getMessages().add(new LocalizableMessage("/Purchase.action.add.success"));
    return new RedirectResolution(PurchaseOrderActionBean.class,"previewPurchaseOrder");
    }

    @RolesAllowed({PermissionConstants.UPDATE_PURCHASEORDER})
    public Resolution updatePurchaseOrder(){
    purchaseorderdao.update(getPurchaseOrder(),purchasedetailarray);
    getContext().getMessages().add(new LocalizableMessage("/Purchase.action.update.success"));
    return new RedirectResolution(PurchaseOrderActionBean.class,"previewPurchaseOrder");
    }

    @RolesAllowed({PermissionConstants.UPDATE_PURCHASEORDER})
    public Resolution updatePOLink(){

    vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    purchaseOrder=purchaseorderdao.latestPurchaseOrder();
    return new ForwardResolution("jsp/updatePurchaseOrder.jsp");
    }

    @RolesAllowed({PermissionConstants.DELETE_PURCHASEORDER})
    public Resolution deletePOLink(){
    purchaseorderlst=purchaseorderdao.getPurchaseOrder();
    return new ForwardResolution("jsp/deletePurchaseOrder.jsp");
    }

    @RolesAllowed({PermissionConstants.ADD_PURCHASEORDER})
    public Resolution generatePurchaseOrder()
    {
    vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    if(test.equals("gettestvalue"))
    {
    test="updatereceipt";
    } else{
    test="addreceipt";
    }
    purchaseorderdao.generatePurchaseOrder(getPurchaseOrder(),purchasedetailarray);
    getContext().getMessages().add(new LocalizableMessage("/Purchase.action.generate.success"));
    return new RedirectResolution(PurchaseOrderActionBean.class,"addPOLink").addParameter("test",test).addParameter("id",id);
    }
    @RolesAllowed({PermissionConstants.DELETE_PURCHASEORDER})
    public Resolution delete(){
    purchaseorderdao.deletePO(getPurchaseOrder());
    purchaseorderlst=purchaseorderdao.getPurchaseOrder();
    getContext().getMessages().add(new LocalizableMessage("/Purchase.action.delete.success"));
    return new RedirectResolution(PurchaseOrderActionBean.class,"deletePOLink");
    }
    public Resolution cancel()
    {
     return new ForwardResolution(PurchaseOrderActionBean.class,"addPOLink");
    }


    public Resolution generatePurchaseOrderLink()
    {
    purchaseorderlst= purchaseorderdao.getPurchaseOrder();
    return new ForwardResolution("jsp/generatePurchaseOrder.jsp");
    }

    public Resolution getToGenaratePurchaseOrder()
    {
    purchaseorderlst= purchaseorderdao.getPurchaseOrder();
    purchaseOrder=purchaseorderdao.findById(getId());
    return new ForwardResolution(PurchaseOrderActionBean.class,"generatePurchaseOrderLink");
    }

    public Resolution generateUpdatePOLink()
    {                   vendorlst=vendordao.getVendor();
    itemidlst= itemdao.getItem();
    purchaseOrder=purchaseorderdao.findById(getId());
    return new ForwardResolution("jsp/updateGeneratePurchaseOrder.jsp");
    }
    public Resolution redirectPreviewGeneratePO(){
    return new ForwardResolution("jsp/previewGeneratePurchaseOrder.jsp");
    }
    @RolesAllowed({PermissionConstants.UPDATE_PURCHASEORDER})
    public Resolution updateGeneratePurchaseOrder()
    {
    purchaseorderdao.update(getPurchaseOrder(),purchasedetailarray);
    purchaseOrder=purchaseorderdao.findById(getId());
    getContext().getMessages().add(new LocalizableMessage("/Purchase.action.update.success"));
    return new RedirectResolution(PurchaseOrderActionBean.class,"redirectPreviewGeneratePO").addParameter("id",id);
    }

    public Resolution  redirectPurchaseOrderSlip (){
    return new ForwardResolution("jsp/receipt/purchaseOrderSlip.jsp");
    }
    public Resolution redirectpopup()
    {
    purchaseOrder=purchaseorderdao.latestPurchaseOrder();
    term=termdao.findByMaxId();
    return new ForwardResolution(PurchaseOrderActionBean.class,"redirectPurchaseOrderSlip");
    }
    public Resolution redirectpopupUpdate()
    {
    purchaseOrder=purchaseorderdao.findById(getId());
    term=termdao.findByMaxId();
    return new ForwardResolution(PurchaseOrderActionBean.class,"redirectPurchaseOrderSlip");
    }
    public Resolution print(){
    String path=null;
    FileInputStream sis=null;
    try{
    path= Converter.convert(content,vendorName+"_"+purchaseOrderNumber);
    sis=new FileInputStream(path);
    }catch(Exception e){
    System.out.println("achtung "+e.getMessage());
    }
    return new StreamingResolution("application/pdf",sis);
    }

    public Resolution termsPageRedirect()
    {
    term=termdao.findByMaxId();
    return new ForwardResolution("jsp/addTerms.jsp");

    }
    public Resolution saveTerm()
    {
    termdao.SaveTerm(term);
    getContext().getMessages().add(new LocalizableMessage("/Purchase.action.term.add.success"));
    return new RedirectResolution(PurchaseOrderActionBean.class,"termsPageRedirect");
    }
    public Resolution approvePOLink()
    {
    purchaseorderlst=purchaseorderdao.getPoApprove();
    return new ForwardResolution("jsp/approvePO.jsp");
    }
    public Resolution viewapprovepo()
    {
    hdnvalue="redirectpopup";
    return new ForwardResolution(PurchaseOrderActionBean.class,"approvePOLink");
    }
    public Resolution approveVp()
    {
    purchaseorderlst=purchaseorderdao.getApproveByLm();
    return new ForwardResolution("jsp/pendingPOForVp.jsp");
    }
    public Resolution viewForVp()
    {
    hdnvalue="redirectpopup";
    purchaseorderlst=purchaseorderdao.getApproveByLm();
    return new ForwardResolution(PurchaseOrderActionBean.class,"approveVp");

    }
    public Resolution redirectlmpopup()
    {
    term=termdao.findByMaxId();
    purchaseOrder=purchaseorderdao.findById(getId());
    return new ForwardResolution("jsp/receipt/verifyPurchaseOrderSlipSM.jsp");
    }
    public Resolution redirectPopupVp()
    {
    term=termdao.findByMaxId();
    purchaseOrder=purchaseorderdao.findById(getId());
    return new ForwardResolution("jsp/receipt/verifyPurcahseOrderVp.jsp");
    }
    public Resolution verifyByManger()
    {
    hdnvalue="closePopup";
    purchaseorderdao.setApprovePO(getId());
    purchaseorderlst=purchaseorderdao.getPoApprove();
    return new ForwardResolution("jsp/approvePO.jsp");

    }
    public Resolution setApprovePO()
    {
    purchaseorderlst=purchaseorderdao.getPoApprove();
    return new ForwardResolution("jsp/approvePO.jsp");
    }

    public Resolution sendemail()
    {          hdnvalue="closePopup";
    purchaseorderdao.sendGeneralMail(getId());
    purchaseorderdao.setApprovePOByVp(getId());
    purchaseorderlst=purchaseorderdao.getApproveByLm();
    return new ForwardResolution(PurchaseOrderActionBean.class,"approveVp");
    }
    public Resolution viewPOLink(){
         purchaseorderlst=purchaseorderdao.getPurchaseOrderForView();
        return new ForwardResolution("jsp/viewPo.jsp");
    }

       public Resolution printView(){
         purchaseorderlst=purchaseorderdao.getPurchaseOrderForView();
            hdnvalue="receiptpurchase";
        return new ForwardResolution("jsp/viewPo.jsp").addParameter("id",id);
    }
    public Resolution redirectpurchase()
    {        term=termdao.findByMaxId();
    purchaseOrder=purchaseorderdao.findById(getId());

    return new ForwardResolution("jsp/receipt/purchaseOrderSlip.jsp");
    }
    }
