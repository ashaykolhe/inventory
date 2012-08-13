    package com.erp.action;

    import net.sourceforge.stripes.action.*;

    import com.erp.exception.LoginException;
    import com.erp.dao.TrailDate;
    import com.erp.dao.VendorDao;
    import com.erp.pojo.Traildate;
    import com.erp.pojo.Vendor;
    import com.google.inject.Inject;

    import java.util.List;

    /**
    * Created by IntelliJ IDEA.
    * User: Milind
    * Date: Feb 9, 2012
    * Time: 10:42:59 AM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class LoginActionBean extends BaseActionBean{
    @Inject
    protected TrailDate traildate;
    protected VendorDao vendorDao;
        private List<Vendor> vendorList;

        public List<Vendor> getVendorList() {
            return vendorList;
        }

        public void setVendorList(List<Vendor> vendorList) {
            this.vendorList = vendorList;
        }

        @DefaultHandler
    public Resolution login()
    {
    if(traildate.checkPeriod(new Traildate())==1)
    {
        try
        {
            getContext().setUser(userDao.authenticate(getUser()));

        }
        catch(LoginException le)
        {
            getContext().getMessages().add(new SimpleMessage("Invalid User"));

            return new RedirectResolution(LoginActionBean.class,"redirectlogin");
        }

        return new ForwardResolution(LoginActionBean.class,"redirectToHome");
    }
    else
    {
        getContext().getMessages().add(new SimpleMessage("Trial period is over"));
        return new RedirectResolution(LoginActionBean.class,"redirectlogin");
    }

    }
    public Resolution redirectToHome()
    {
       // vendorList=vendorDao.listAll();
        return new ForwardResolution("jsp/addItem.jsp");
    }
    public Resolution redirectlogin()
    {

        return new ForwardResolution("jsp/login.jsp");
    }

    public Resolution logout(){
    getContext().logout();
    return new RedirectResolution(LoginActionBean.class,"redirectlogin");
    }
    }
