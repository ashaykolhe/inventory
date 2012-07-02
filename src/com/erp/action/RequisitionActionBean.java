    package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;

    import java.util.List;
    import java.util.ArrayList;

    import com.erp.pojo.Requisition;
    import com.erp.pojo.RequisitionDetail;
    import com.erp.pojo.Item;
    import com.erp.constants.PermissionConstants;
    import com.erp.dao.RequisitionDao;
    import com.erp.dao.StoreIssueDao;
    import com.erp.dao.ItemDao;
    import com.google.inject.Inject;

    import javax.annotation.security.RolesAllowed;

    /**
    * Created by IntelliJ IDEA.
    * User: Milind
    * Date: Feb 23, 2012
    * Time: 11:57:26 AM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class RequisitionActionBean extends BaseActionBean{
    @Inject
    RequisitionDao requisitiondao;
    @Inject
    protected StoreIssueDao storeissuedao;
    @Inject
    ItemDao itemdao;
    List<Requisition> requisitionlst=null;
    private Requisition requisition;
    private Item item;
    private List<Item> itemidlst;
    private RequisitionDetail requisitiondetail;
    private List<RequisitionDetail> requisitiondetailarray = new ArrayList<RequisitionDetail>();
    private int requisitionid ;
    private List requisitionIds;
    private  String popup=null;

    public String getPopup() {
    return popup;
    }

    public void setPopup(String popup) {
    this.popup = popup;
    }

    public int getRequisitionid() {
    return requisitionid;
    }

    public void setRequisitionid(int requisitionid) {
    this.requisitionid = requisitionid;
    }

    public List getRequisitionIds() {
    return requisitionIds;
    }

    public void setRequisitionIds(List requisitionIds) {
    this.requisitionIds = requisitionIds;
    }

    public RequisitionDetail getRequisitiondetail() {
    return requisitiondetail;
    }

    public void setRequisitiondetail(RequisitionDetail requisitiondetail) {
    this.requisitiondetail = requisitiondetail;
    }

    public Item getItem() {
    return item;
    }

    public void setItem(Item item) {
    this.item = item;
    }

    public List<RequisitionDetail> getRequisitiondetailarray() {
    return requisitiondetailarray;
    }

    public void setRequisitiondetailarray(List<RequisitionDetail> requisitiondetailarray) {
    this.requisitiondetailarray = requisitiondetailarray;
    }

    public List<Item> getItemidlst() {
    return itemidlst;
    }

    public void setItemidlst(List<Item> itemidlst) {
    this.itemidlst = itemidlst;
    }

    public List<Requisition> getRequisitionlst() {
    return requisitionlst;
    }

    public void setRequisitionlst(List<Requisition> requisitionlst) {
    this.requisitionlst = requisitionlst;
    }

    public Requisition getRequisition() {
    if(id != 0) {

    return requisitiondao.findById(id);
    }

    return requisition;
    }

    public void setRequisition(Requisition requisition) {
    this.requisition = requisition;
    }

    @RolesAllowed({PermissionConstants.ADD_REQUISITION})
    @DefaultHandler
    //Redirect to add requisition page
    public Resolution addRequisitionLink()
    {
    itemidlst= itemdao.getItem();
    return new ForwardResolution("jsp/addRequisition.jsp");
    }

    public Resolution redirectStore(){
    return new ForwardResolution("jsp/redirectStoreIssue.jsp");
    }
    @RolesAllowed({PermissionConstants.ADD_REQUISITION})
    //Add requisition
    public Resolution addrequisition()
    {
    requisitiondao.SaveRequisition(getRequisition(),requisitiondetailarray);
    requisitionIds=storeissuedao.requisitionIds();
    itemidlst= itemdao.getItem();
    getContext().getMessages().add(new LocalizableMessage("/Requisition.action.add.success"));
    return new RedirectResolution(RequisitionActionBean.class,"redirectStore");

    }

    @RolesAllowed({PermissionConstants.UPDATE_REQUISITION})
    //Redirect to update requisition page
    public Resolution updateRequisitionLink()
    {
    requisitionlst=storeissuedao.requisitionIds();
    return new ForwardResolution("jsp/updateRequisitionPage.jsp");
    }
    //get requisition by id for update
    public Resolution updateRequisition()
    {
    requisition=requisitiondao.findById(getId());
    itemidlst= itemdao.getItem();
    requisitionlst=storeissuedao.requisitionIds();
    return new ForwardResolution("jsp/updateRequisitionPage.jsp");
    }
    @RolesAllowed({PermissionConstants.UPDATE_REQUISITION})
    //Update requisition
    public Resolution update()
    {
    requisitiondao.update(getRequisition(),requisitiondetailarray);
    requisitionlst=requisitiondao.getRequisition();
    return new RedirectResolution("jsp/updateRequisitionPage.jsp");
    }
    //Get dropdown item list
    public Resolution getItemDetails()
    {
    item= itemdao.findById(id);
    return new JavaScriptResolution(item);
    }
    public Resolution cancel()
    {
    return new RedirectResolution(RequisitionActionBean.class,"addRequisitionLink");
    }

    }
