    package com.erp.action;
    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;
    import com.erp.pojo.*;
    import com.erp.constants.PermissionConstants;
    import com.erp.dao.*;
    import com.google.inject.Inject;

    import javax.annotation.security.RolesAllowed;
    import java.util.List;
    import java.util.Iterator;
    import java.util.ArrayList;

    /**
    * Created by IntelliJ IDEA.
    * User: Milind
    * Date: Mar 2, 2012
    * Time: 10:35:45 AM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class SearchActionBean extends BaseActionBean{
    @Inject
    protected StoreIssueDao storeissuedao;
    @Inject
    ItemDao itemdao;
    @Inject
    protected VendorDao vendordao;
    @Inject
    RequisitionDao requisitiondao;
    @Inject
    PurchaseOrderDao purchaseorderdao;
    @Inject  protected GrnDao grndao;
    @Inject  protected TermsDao termdao;
    private  List<Item> itemlst;
    private List<Vendor> vendorlst;
    private String name;
    private String viewmenu,viewsubmenu;
    private Double tot;
    private String ajaxSubmenu;
    private Long no;
    private String search;
    public  List<String> vendorhlst;
    private String q;
    private List<String> itemnamelst;
    private List<Grn> grnlst;
    public  List<Long> temp;
    public  String temp1;
    private String searchSubmenu;
    private String searchMenu;
    public  List<String> grnnolst;
    private List<StoreIssue> storeissuelst ;
    public  List<String> storeissuenolst  ;
    private List<PurchaseOrder> purchaseOrderlst ;
    public  List<String> PurchaseOrderNolst  ;
    public  List<Long> tempSI;
    private PurchaseOrder purchaseOrder;
    private  String hdnvalue;
    public StoreIssue storeissue;
    private String date;
    private String fromdate,todate;
    private Grn grn;
    private Terms term;

    public String getViewmenu() {
    return viewmenu;
    }

    public void setViewmenu(String viewmenu) {
    this.viewmenu = viewmenu;
    }

    public String getViewsubmenu() {
    return viewsubmenu;
    }

    public void setViewsubmenu(String viewsubmenu) {
    this.viewsubmenu = viewsubmenu;
    }

    public Terms getTerm() {
    return term;
    }

    public void setTerm(Terms term) {
    this.term = term;
    }

    public Double getTot() {
    return tot;
    }

    public void setTot(Double tot) {
    this.tot = tot;
    }

    public Grn getGrn() {
    return grn;
    }

    public void setGrn(Grn grn) {
    this.grn = grn;
    }

    public String getFromdate() {
    return fromdate;
    }

    public void setFromdate(String fromdate) {
    this.fromdate = fromdate;
    }

    public String getTodate() {
    return todate;
    }

    public void setTodate(String todate) {
    this.todate = todate;
    }

    public String getDate() {
    return date;
    }

    public void setDate(String date) {
    this.date = date;
    }

    public String getAjaxSubmenu() {
    return ajaxSubmenu;
    }

    public void setAjaxSubmenu(String ajaxSubmenu) {
    this.ajaxSubmenu = ajaxSubmenu;
    }

    public String getTemp1() {
    return temp1;
    }

    public void setTemp1(String temp1) {
    this.temp1 = temp1;
    }

    public String getSearchMenu() {
    return searchMenu;
    }

    public void setSearchMenu(String searchMenu) {
    this.searchMenu = searchMenu;
    }

    public String getSearchSubmenu() {
    return searchSubmenu;
    }

    public void setSearchSubmenu(String searchSubmenu) {
    this.searchSubmenu = searchSubmenu;
    }

    public Long getNo() {
    return no;
    }

    public void setNo(Long no) {
    this.no = no;
    }

    public PurchaseOrder getPurchaseOrder() {
    return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
    this.purchaseOrder = purchaseOrder;
    }

    public List<String> getItemnamelst() {
    return itemnamelst;
    }

    public void setItemnamelst(List<String> itemnamelst) {
    this.itemnamelst = itemnamelst;
    }

    public List<String> getVendorhlst() {
    return vendorhlst;
    }

    public void setVendorhlst(List<String> vendorhlst) {
    this.vendorhlst = vendorhlst;
    }

    public String getQ() {
    return q;
    }

    public void setQ(String q) {
    this.q = q;
    }

    public String getName() {
    return name;
    }

    public void setName(String name) {
    this.name = name;
    }

    public String getSearch() {
    return search;
    }

    public void setSearch(String search) {
    this.search = search;
    }

    public List<Item> getItemlst() {
    return itemlst;
    }

    public void setItemlst(List<Item> itemlst) {
    this.itemlst = itemlst;
    }

    public List<Vendor> getVendorlst() {
    return vendorlst;
    }

    public void setVendorlst(List<Vendor> vendorlst) {
    this.vendorlst = vendorlst;
    }

    public List<Grn> getGrnlst() {
    return grnlst;
    }

    public void setGrnlst(List<Grn> grnlst) {
    this.grnlst = grnlst;
    }

    public List<Long> getTemp() {
    return temp;
    }

    public void setTemp(List<Long> temp) {
    this.temp = temp;
    }

    public List<String> getGrnnolst() {
    return grnnolst;
    }

    public void setGrnnolst(List<String> grnnolst) {
    this.grnnolst = grnnolst;
    }

    public List<String> getStoreissuenolst() {
    return storeissuenolst;
    }

    public void setStoreissuenolst(List<String> storeissuenolst) {
    this.storeissuenolst = storeissuenolst;
    }

    public List<Long> getTempSI() {
    return tempSI;
    }

    public void setTempSI(List<Long> tempSI) {
    this.tempSI = tempSI;
    }

    public List<StoreIssue> getStoreissuelst() {
    return storeissuelst;
    }

    public void setStoreissuelst(List<StoreIssue> storeissuelst) {
    this.storeissuelst = storeissuelst;
    }

    public List<PurchaseOrder> getPurchaseOrderlst() {
    return purchaseOrderlst;
    }

    public void setPurchaseOrderlst(List<PurchaseOrder> purchaseOrderlst) {
    this.purchaseOrderlst = purchaseOrderlst;
    }

    public List<String> getPurchaseOrderNolst() {
    return PurchaseOrderNolst;
    }

    public void setPurchaseOrderNolst(List<String> purchaseOrderNolst) {
    PurchaseOrderNolst = purchaseOrderNolst;
    }

    public String getHdnvalue() {
    return hdnvalue;
    }

    public void setHdnvalue(String hdnvalue) {
    this.hdnvalue = hdnvalue;
    }

    public StoreIssue getStoreissue() {
    return storeissue;
    }

    public void setStoreissue(StoreIssue storeissue) {
    this.storeissue = storeissue;
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    @DefaultHandler
    public Resolution searchLink()
    {

    return new ForwardResolution("jsp/search.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution search()
    {
    //Purchase Order Submenu function for different inputs
    if(searchSubmenu.equalsIgnoreCase("poNumber"))
    purchaseOrderlst=purchaseorderdao.searchByName(getName());
    if(searchSubmenu.equalsIgnoreCase("poVendorName"))
    purchaseOrderlst=purchaseorderdao.searchByPoVendorName(getName());
    if(searchSubmenu.equalsIgnoreCase("poVendorId"))
    purchaseOrderlst=purchaseorderdao.searchByPoVendorId(getName());
    if(searchSubmenu.equalsIgnoreCase("poDate"))
    purchaseOrderlst=purchaseorderdao.searchByPoDate(date);
    if(searchSubmenu.equalsIgnoreCase("poBetweenDate"))
    purchaseOrderlst=purchaseorderdao.searchByFromTo(fromdate,todate);
    // GRN
    if(searchSubmenu.equalsIgnoreCase("grnNumber"))
    grnlst=grndao.searchByGrnNumber(Long.parseLong(getName()));
    if(searchSubmenu.equalsIgnoreCase("grnPoNumber"))
    grnlst=grndao.searchByGrnPONumber(getName());
    if(searchSubmenu.equalsIgnoreCase("grnVendorName"))
    grnlst=grndao.searchByGrnVendorName(getName());
    if(searchSubmenu.equalsIgnoreCase("grnVendorId"))
    grnlst=grndao.searchByGrnVendorId(getName());
    if(searchSubmenu.equalsIgnoreCase("grnDate"))
    grnlst=grndao.searchByGrnDate(date);
    if(searchSubmenu.equalsIgnoreCase("grnOrderDate"))
    grnlst=grndao.searchByGrnOrderDate(date);
    if(searchSubmenu.equalsIgnoreCase("grnBetweenDate"))
    grnlst=grndao.searchByGrnFromTo(fromdate,todate);
    //Item
    if(searchSubmenu.equalsIgnoreCase("itemiName"))
    itemlst=itemdao.searchByName(getName());
    if(searchSubmenu.equalsIgnoreCase("itemiCode"))
    itemlst=itemdao.searchByItemCode(getName());
    if(searchSubmenu.equalsIgnoreCase("itemUom"))
    itemlst=itemdao.searchByItemUom(getName());
    if(searchSubmenu.equalsIgnoreCase("itemSection"))
    itemlst=itemdao.searchByItemSection(getName());
    //Vendor
    if(searchSubmenu.equalsIgnoreCase("vendorName"))
    vendorlst=vendordao.searchByName(getName());
    if(searchSubmenu.equalsIgnoreCase("vendorId"))
    vendorlst=vendordao.searchByVendorId(getName());
    if(searchSubmenu.equalsIgnoreCase("vendorProduct"))
    vendorlst=vendordao.searchByVendorProduct(getName());
    //Store Issue
    if(searchSubmenu.equalsIgnoreCase("siNumber"))
    storeissuelst=storeissuedao.searchBySiId(Long.parseLong(getName()));
    if(searchSubmenu.equalsIgnoreCase("siRequisitionId"))
    storeissuelst=storeissuedao.searchBySiRequisitionId(Long.parseLong(getName()));
    if(searchSubmenu.equalsIgnoreCase("siDate"))
    storeissuelst=storeissuedao.searchBySiDate(date);
    return new ForwardResolution("jsp/search.jsp").addParameter("name",name).addParameter("searchSubmenu",searchSubmenu);
    }
    public Resolution autovendor()
    {
    if(ajaxSubmenu.equalsIgnoreCase("vendorName"))
    vendorhlst=vendordao.allVendor();
    else if(ajaxSubmenu.equalsIgnoreCase("vendorId"))
    vendorhlst=vendordao.vendorIdLst();
    else if(ajaxSubmenu.equalsIgnoreCase("vendorProduct"))
    vendorhlst=vendordao.vendorProductlst();
    return new JavaScriptResolution(vendorhlst);
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution def()
    {
    if(search.equalsIgnoreCase("byVendorName"))
    {
    vendorhlst=vendordao.allVendor();
    return new JavaScriptResolution(vendorhlst);
    }
    else if(search.equalsIgnoreCase("byItemName"))
    {
    itemnamelst=itemdao.allItem();
    return new JavaScriptResolution(itemnamelst);
    }
    else
    return new JavaScriptResolution(null);
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution autoitem()
    {
    if(ajaxSubmenu.equalsIgnoreCase("itemiName"))
    itemnamelst=itemdao.allItem();
    if(ajaxSubmenu.equalsIgnoreCase("itemiCode"))
    itemnamelst=itemdao.getItemCodelst();
    if(ajaxSubmenu.equalsIgnoreCase("itemUom"))
    itemnamelst=itemdao.getItemUomlst();
    if(ajaxSubmenu.equalsIgnoreCase("itemSection"))
    itemnamelst=itemdao.getItemSectionlst();
    return new JavaScriptResolution(itemnamelst);
    }
    public Resolution autogrn()
    {
    if(ajaxSubmenu.equalsIgnoreCase("grnPoNumber"))
    grnnolst=grndao.getGrnPoNumberLst();
    if(ajaxSubmenu.equalsIgnoreCase("grnVendorName"))
    grnnolst=grndao.getGrnVendorNameLst();
    if(ajaxSubmenu.equalsIgnoreCase("grnVendorId"))
    grnnolst=grndao.getGrnVendorIdLst();
    if(ajaxSubmenu.equalsIgnoreCase("grnNumber"))
    {
    temp=grndao.allGrnno();
    grnnolst=new ArrayList<String>();
    for(Iterator<Long> i=temp.iterator();i.hasNext();){
    grnnolst.add(i.next().toString());
    }
    }
    return new JavaScriptResolution(grnnolst);
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution autoStoreIssue ()
    {
    tempSI=storeissuedao.allStoreIssue();
    storeissuenolst=new ArrayList<String>();
    for(Iterator<Long> i=tempSI.iterator();i.hasNext();){
    storeissuenolst.add(i.next().toString());
    }
    return new JavaScriptResolution(storeissuenolst);
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution autoPurchaseOrder()
    {
    if(ajaxSubmenu.equalsIgnoreCase("poVendorName"))
    PurchaseOrderNolst=purchaseorderdao.getPoVendorNameLst();
    if(ajaxSubmenu.equalsIgnoreCase("poVendorId"))
    PurchaseOrderNolst=purchaseorderdao.getPoVendorIdLst();
    if(ajaxSubmenu.equalsIgnoreCase("poNumber"))
    PurchaseOrderNolst=purchaseorderdao.getAllPurchaseOrderNo();
    return new JavaScriptResolution(PurchaseOrderNolst);
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution print()
    {

    itemlst=getItemlst();
    vendorlst=getVendorlst();
    grnlst=getGrnlst();
    if(hdnvalue.equals("test"))
    {
    hdnvalue="receipt";
    search="byStoreIssueNo";
    searchMenu=viewmenu;
    if(viewsubmenu.equalsIgnoreCase("siRequisitionId"))
    {
    searchSubmenu=viewsubmenu;
    storeissuelst=storeissuedao.searchBySiRequisitionId(Long.parseLong(getName()));
    }
    if(viewsubmenu.equalsIgnoreCase("siNumber"))
    {
    searchSubmenu=viewsubmenu;
    storeissuelst=storeissuedao.searchBySiId(Long.parseLong(getName()));
    }
    if(viewsubmenu.equalsIgnoreCase("siDate"))
    {
    searchSubmenu=viewsubmenu;
    storeissuelst=storeissuedao.searchBySiDate(date);
    }
    }
    if(hdnvalue.equals("testpurchase"))
    {
    hdnvalue="receiptpurchase";
    search="byPurchaseOrder";
    searchMenu=viewmenu;
    if(viewsubmenu.equalsIgnoreCase("poVendorId"))
    {
    searchSubmenu=viewsubmenu;
    purchaseOrderlst=purchaseorderdao.searchByPoVendorId(getName());
    }
    if(viewsubmenu.equalsIgnoreCase("poVendorName"))
    {
    searchSubmenu=viewsubmenu;
    purchaseOrderlst=purchaseorderdao.searchByPoVendorName(getName());
    }
    if(viewsubmenu.equalsIgnoreCase("poNumber"))
    {
    searchSubmenu=viewsubmenu;
    purchaseOrderlst=purchaseorderdao.searchByName(getName());
    }
    if(viewsubmenu.equalsIgnoreCase("poDate"))
    {
    searchSubmenu=viewsubmenu;
    purchaseOrderlst=purchaseorderdao.searchByPoDate(date);
    }
    if(viewsubmenu.equalsIgnoreCase("poBetweenDate"))
    {
    searchSubmenu=viewsubmenu;
    purchaseOrderlst=purchaseorderdao.searchByFromTo(fromdate,todate);
    }
    }
    if(hdnvalue.equals("testgrn"))
    {

    hdnvalue="receiptgrn";
    search="byGrn";
    searchMenu=viewmenu;
    if(viewsubmenu.equalsIgnoreCase("grnVendorId"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnVendorId(getName());
    }
    if(viewsubmenu.equalsIgnoreCase("grnVendorName"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnVendorName(getName());
    }
    if(viewsubmenu.equalsIgnoreCase("grnPoNumber"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnPONumber(getName());
    }
    if(viewsubmenu.equalsIgnoreCase("grnNumber"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnNumber(getId());
    }
    if(viewsubmenu.equalsIgnoreCase("grnDate"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnDate(date);
    }
    if(viewsubmenu.equalsIgnoreCase("grnOrderDate"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnOrderDate(date);
    }
    if(viewsubmenu.equalsIgnoreCase("grnBetweenDate"))
    {
    searchSubmenu=viewsubmenu;
    grnlst=grndao.searchByGrnFromTo(fromdate,todate);
    }
    }
    return new ForwardResolution("jsp/search.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution redirectpopup()
    {
    storeissue=storeissuedao.findById(getId());
    storeissuelst=getStoreissuelst();
    return new ForwardResolution("jsp/receipt/storeIssueSlip.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution redirectgrnpopup()
    {
    tot=0.0;
    grn=grndao.findById(getId());                               
    Iterator<GrnDetail> it=grn.getGrndetailarray().iterator();
    while (it.hasNext())
    {
    tot=tot+it.next().getValue();
    }
    return new ForwardResolution("jsp/receipt/searchGrnSlip.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_SEARCH,PermissionConstants.UPDATE_SEARCH,PermissionConstants.DELETE_SEARCH})
    public Resolution redirectpurchase()
    {        term=termdao.findByMaxId();
    purchaseOrder=purchaseorderdao.findById(getId());

    return new ForwardResolution("jsp/receipt/purchaseOrderSlip.jsp");
    }
    

    
    }
