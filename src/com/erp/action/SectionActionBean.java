    package com.erp.action;

    import net.sourceforge.stripes.action.Resolution;
    import net.sourceforge.stripes.action.ForwardResolution;
    import net.sourceforge.stripes.action.DefaultHandler;
    import net.sourceforge.stripes.action.HttpCache;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;
    import com.google.inject.Inject;
    import com.erp.pojo.Section;
    import com.erp.dao.SectionDao;

    import java.util.List;

    /**
    * Created by IntelliJ IDEA.
    * User: Minal
    * Date: Feb 15, 2012
    * Time: 2:10:25 PM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class SectionActionBean extends BaseActionBean{
    List<Section> sectionlst;
    private Section section;
    @Inject
    SectionDao sectiondao;

    public List<Section> getSectionlst() {
    return sectionlst;
    }

    public void setSectionlst(List<Section> sectionlst) {
    this.sectionlst = sectionlst;
    }

    public Section getSection() {
    if(id != 0) {

    return sectiondao.findById(id);
    }

    return section;
    }

    public void setSection(Section section) {
    this.section = section;
    }

    @DefaultHandler
    public Resolution paginationSection(){
    sectionlst=sectiondao.getSection();
    return new JavaScriptResolution(sectionlst);
    }

    //To get section unique list by id
    public Resolution readname(){
    section= sectiondao.findById(id);
    return new JavaScriptResolution(section);
    }
    //Add section
    public Resolution addsection(){
    sectiondao.SaveSection(getSection());
    sectionlst=sectiondao.getSection();
    return new ForwardResolution("jsp/displaytag/section.jsp");
    }
    //Delete section
    public Resolution delete(){
    sectiondao.delete(getSection());
    sectionlst=sectiondao.getSection();
    return new ForwardResolution("jsp/displaytag/section.jsp");
    }

    //Update section
    public Resolution update(){
    sectiondao.update(getSection());
    sectionlst=sectiondao.getSection();
    return new ForwardResolution("jsp/displaytag/section.jsp");
    }
    }
