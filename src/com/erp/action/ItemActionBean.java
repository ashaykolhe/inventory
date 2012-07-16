    package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;

    import java.util.List;
    import java.util.Date;
    import java.util.Iterator;

    import com.erp.pojo.Item;
    import com.erp.pojo.Uom;
    import com.erp.pojo.Section;
    import com.erp.pojo.DailyStockRecord;
    import com.erp.constants.PermissionConstants;
    import com.erp.dao.ItemDao;
    import com.erp.dao.SectionDao;
    import com.erp.dao.UomDao;
    import com.google.inject.Inject;

    import javax.annotation.security.RolesAllowed;

    /**
    * Created by IntelliJ IDEA.
    * User: Minal
    * Date: Feb 13, 2012
    * Time: 9:59:26 AM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class ItemActionBean extends BaseActionBean{
    @Inject
    ItemDao itemdao;
    @Inject
    SectionDao sectiondao;
    @Inject
    UomDao uomdao;
    private static final String UPDATEITEM="jsp/updateItem.jsp";
    private List<Uom> uomlst;
    private List<Section> sectionlst;
    private List<Item> itemlst;
    private List<Item> itemlistbysection;
    private Item itemnew;
    private String inStock;
    private List<String> itemcodelst;
    private List<String> sectionnamelist;
    private List<String> itemnamelist;
    private boolean flag;
    private String addUomName;
    private String addSectionName;
    private String addItemName;
    private String itemcode;
    private String sectionname;
    private String itemName;
    private DailyStockRecord first,last;
    private Integer noOfDays;
    private boolean restorelistempty;
    private String restoreAll;
    private List<Integer> itemLstForRestore;
   

        public List<Integer> getItemLstForRestore() {
            return itemLstForRestore;
        }

        public void setItemLstForRestore(List<Integer> itemLstForRestore) {
            this.itemLstForRestore = itemLstForRestore;
        }

        public String getRestoreAll() {
            return restoreAll;
        }

        public void setRestoreAll(String restoreAll) {
            this.restoreAll = restoreAll;
        }

        public boolean isRestorelistempty() {
            return restorelistempty;
        }

        public void setRestorelistempty(boolean restorelistempty) {
            this.restorelistempty = restorelistempty;
        }

        public String getItemName() {
            return itemName;
        }

        public void setItemName(String itemName) {
            this.itemName = itemName;
        }

        public List<String> getItemnamelist() {
            return itemnamelist;
        }

        public void setItemnamelist(List<String> itemnamelist) {
            this.itemnamelist = itemnamelist;
        }

        public List<Item> getItemlistbysection() {
            return itemlistbysection;
        }

        public void setItemlistbysection(List<Item> itemlistbysection) {
            this.itemlistbysection = itemlistbysection;
        }

        public String getSectionname() {
            return sectionname;
        }

        public void setSectionname(String sectionname) {
            this.sectionname = sectionname;
        }

        public List<String> getSectionnamelist() {
            return sectionnamelist;
        }

        public void setSectionnamelist(List<String> sectionnamelist) {
            this.sectionnamelist = sectionnamelist;
        }

        public String getInStock() {
    return inStock;
    }

    public void setInStock(String inStock) {
    this.inStock = inStock;
    }

    public Integer getNoOfDays() {
    return noOfDays;
    }

    public void setNoOfDays(Integer noOfDays) {
    this.noOfDays = noOfDays;
    }

    public DailyStockRecord getFirst() {
    return first;
    }

    public void setFirst(DailyStockRecord first) {
    this.first = first;
    }

    public DailyStockRecord getLast() {
    return last;
    }

    public void setLast(DailyStockRecord last) {
    this.last = last;
    }

    public String getItemcode() {
    return itemcode;
    }

    public void setItemcode(String itemcode) {
    this.itemcode = itemcode;
    }

    public List<String> getItemcodelst() {
    return itemcodelst;
    }

    public void setItemcodelst(List<String> itemcodelst) {
    this.itemcodelst = itemcodelst;
    }

    public String getAddItemName() {
    return addItemName;
    }

    public void setAddItemName(String addItemName) {
    this.addItemName = addItemName;
    }

    public String getAddSectionName() {
    return addSectionName;
    }

    public void setAddSectionName(String addSectionName) {
    this.addSectionName = addSectionName;
    }

    public String getAddUomName() {
    return addUomName;
    }

    public void setAddUomName(String addUomName) {
    this.addUomName = addUomName;
    }

    public boolean isFlag() {
    return flag;
    }

    public void setFlag(boolean flag) {
    this.flag = flag;
    }

    public List<Item> getItemlst() {
    return itemlst;
    }

    public void setItemlst(List<Item> itemlst) {
    this.itemlst = itemlst;
    }

    public Item getItemnew() {
    if(id != 0) {

    return itemdao.findById(id);
    }
    return itemnew;
    }

    public void setItemnew(Item itemnew) {
    this.itemnew = itemnew;
    }



    public List<Uom> getUomlst() {
    return uomlst;
    }

    public void setUomlst(List<Uom> uomlst) {
    this.uomlst = uomlst;
    }

    public List<Section> getSectionlst() {
    return sectionlst;
    }

    public void setSectionlst(List<Section> sectionlst) {
    this.sectionlst = sectionlst;
    }

    @RolesAllowed({PermissionConstants.ADD_ITEM})
    @DefaultHandler
    //Redirect to add item page

    public Resolution pagedirect()
    {
        uomlst=uomdao.getUom();
        sectionlst=sectiondao.getSection();
        itemlst=itemdao.getItem();

        return new ForwardResolution("jsp/addItem.jsp");
    }


    public Resolution checkUomAlreadyPresent()
    {
        flag=itemdao.checkUomPresent(addUomName);
        return new JavaScriptResolution(flag);
    }


    public Resolution checkSectionAlreadyPresent()
    {
        flag=itemdao.checkSectionPresent(addSectionName);
        return new JavaScriptResolution(flag);
    }


    public Resolution checkItemAlreadyPresent()
    {
        flag=itemdao.checkItemPresent(addItemName);
        return new JavaScriptResolution(flag);
    }

    @RolesAllowed({PermissionConstants.DELETE_ITEM})
    //Delete a item
    public Resolution delete()
    {

        itemnew=itemdao.findById(id);


        itemdao.delete(itemnew);
        itemlst=itemdao.getItemForDelete();
        getContext().getMessages().add(new LocalizableMessage("/Item.action.delete.success"));
        return new ForwardResolution("jsp/deleteItem.jsp");
    }

    public Resolution cancel()
    {

        return new RedirectResolution(ItemActionBean.class,"pagedirect");
    }


    @RolesAllowed({PermissionConstants.ADD_ITEM})
    //Add a item
    public Resolution additem()
    {
        itemdao.SaveItem(itemnew);
        getContext().getMessages().add(new LocalizableMessage("/Item.action.add.success"));
        return new RedirectResolution(ItemActionBean.class,"pagedirect");
    }

    @RolesAllowed({PermissionConstants.DELETE_ITEM})
    //Redirect to delete item page
    public Resolution deleteitemlink()
    {

        itemlst=itemdao.getItemForDelete();
        System.out.println(itemlst.size());

        return new ForwardResolution("jsp/deleteItem.jsp");
    }

    @RolesAllowed({PermissionConstants.UPDATE_ITEM})
    //Redirect to update item page
    public Resolution updateitemlink()
    {
        itemnamelist=itemdao.getItem();
        System.out.println("in update item llink"+itemnamelist);
        return new ForwardResolution(UPDATEITEM);
    }
     public Resolution getItemNameForUpdate()
     {
         itemnamelist=itemdao.getItemNamelist();
         System.out.println("in the item name for upadte"+itemnamelist);
         return new JavaScriptResolution(itemnamelist);
     }


    @RolesAllowed({PermissionConstants.UPDATE_ITEM})
    //get list of item
    public Resolution getitem()
    {

        itemnew= itemdao.findByName(itemName);
        System.out.println("iten name in get itemmmm"+itemName);
        uomlst=uomdao.getUom();
        sectionlst=sectiondao.getSection();
        itemlst=itemdao.getItem();
        System.out.println("item in the get item"+itemnew);
        return new ForwardResolution("jsp/updateItem.jsp");
    }


    @RolesAllowed({PermissionConstants.UPDATE_ITEM})
    //Update a item
    public Resolution updateitem()
    {

        itemdao.update(itemnew);
        itemlst=itemdao.getItem();
        getContext().getMessages().add(new LocalizableMessage("/Item.action.update.success"));
        return new RedirectResolution(ItemActionBean.class,"updateitemlink");
    }


    public Resolution itemage()
    {
        return new ForwardResolution("/jsp/itemage.jsp");
    }


    public Resolution itemcodeforage()
    {

        itemcodelst=itemdao.getItemCodelst();
        return new JavaScriptResolution(itemcodelst);
    }


    public Resolution sectionDetails()
    {
        sectionnamelist=sectiondao.getSectionNameList();
        System.out.println("in the sectiondetails..."+sectionnamelist);
        return new JavaScriptResolution(sectionnamelist);
    }


    public Resolution calculateage()
    {
        itemcodelst=itemdao.getItemCodelst();
        first=itemdao.getEntryData(itemcode);
        last=itemdao.getExitData(itemcode);
        if(last !=null || first !=null)
        {

            if(last.getClosingQuantity()>0.0)
            inStock="Yes";
            else
                {

                    inStock="No";
                }
                itemcode="getAge";
                noOfDays=(int)( (new Date().getTime() - first.getDate().getTime()) / (1000 * 60 * 60 * 24))+1;
        }
        else
        {
            itemlst=itemdao.searchByItemCode(getItemcode());
            itemcode="NotInList";
        }

        return new ForwardResolution("jsp/itemage.jsp");
    }
    public Resolution viewSectionLink()
    {
        return new ForwardResolution("jsp/viewSection.jsp");
    }
    public Resolution getItemBySection()
    {
        itemlistbysection=itemdao.searchByItemSection(sectionname);
        System.out.println("sesectionname"+itemlistbysection);
        return new ForwardResolution("jsp/viewSection.jsp");
    }

    public Resolution restoreItemLink()
    {
        itemlst=itemdao.getAllDeletedItem();
        System.out.println(itemlst.size());
        if(itemlst.size()>0)
        {
            restorelistempty=false;
        }else{
        restorelistempty=true;}
        return new ForwardResolution("jsp/restore.jsp");
    }
    public Resolution restoreItem()
    {
        if(restoreAll!=null)
        {
             System.out.println("hhhhh"+restoreAll);
            itemdao.restoreAllItem();
        }
        else
        {
            Iterator itr=itemLstForRestore.iterator();

            while(itr.hasNext())
            {
                    Integer id=(Integer)itr.next();
                    if(id==null)
                    {
                        itr.remove();
                    }
                else{
                        itemdao.restoreItem(id);
                       System.out.println(id);
                    }


            }
        }
       return new RedirectResolution(ItemActionBean.class,"restoreItemLink");
    }
    


}
