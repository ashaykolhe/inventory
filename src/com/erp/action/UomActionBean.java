    package com.erp.action;

    import com.erp.pojo.Uom;
    import com.erp.dao.UomDao;
    import com.google.inject.Inject;

    import java.util.List;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;

    /**
    * Created by IntelliJ IDEA.
    * User: Minal
    * Date: Feb 15, 2012
    * Time: 2:59:30 PM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class UomActionBean extends BaseActionBean{
    List<Uom> uomlst;
    private Uom uom;
    @Inject
    UomDao uomdao;


    public Uom getUom() {
    if(id != 0) {
    return uomdao.findById(id);
    }
    return uom;
    }



    public void setUom(Uom uom) {
    this.uom = uom;
    }

    public List<Uom> getUomlst() {
    return uomlst;
    }

    public void setUomlst(List<Uom> uomlst) {
    this.uomlst = uomlst;
    }


    @DefaultHandler
    public Resolution paginationUom(){
    uomlst=uomdao.getUom();
    return new JavaScriptResolution(uomlst);
    }

    //Add Uom
    public Resolution adduom(){
    uomdao.SaveUom(getUom());
    uomlst=uomdao.getUom();
    return new ForwardResolution("jsp/displaytag/uom.jsp");
    }
    //Delete Uom
    public Resolution delete(){
    uomdao.delete(getUom());
    uomlst=uomdao.getUom();
    return new ForwardResolution("jsp/displaytag/uom.jsp");
    }
    //Get uom list by id
    public Resolution readname(){
    uom= uomdao.findById(id);
    return new JavaScriptResolution(uom);
    }
    //Update Uom
    public Resolution update(){
    
    uomdao.update(getUom());
    uomlst=uomdao.getUom();
    return new ForwardResolution("jsp/displaytag/uom.jsp");
    }
        
    }
