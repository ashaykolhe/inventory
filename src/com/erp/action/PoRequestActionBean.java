    package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import com.erp.pojo.PurchaseOrderRequest;
    import com.erp.pojo.PurchaseOrderRequestDetail;
    import com.erp.pojo.Item;
    import com.erp.dao.PoRequestDao;
    import com.erp.dao.ItemDao;
    import com.google.inject.Inject;

    import java.util.List;
    import java.util.ArrayList;

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
    ItemDao itemdao;
    private List<Item> itemidlst;
    private PurchaseOrderRequest poRequest;
    private List<PurchaseOrderRequestDetail> poRequestarray = new ArrayList<PurchaseOrderRequestDetail>();
    private List<PurchaseOrderRequest> poReqlst;

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
        System.out.println("ppppppppppp"+poReqlst); 
    return new ForwardResolution("jsp/notificationPo.jsp");
    }
    public Resolution viewapprovepo(){
    poDao.setApprovePO(getId());
    return new ForwardResolution(PoRequestActionBean.class,"approvePOLink");
    }

    }
