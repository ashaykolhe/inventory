package com.erp.action;

import com.google.inject.Inject;
import com.erp.dao.CompanyDao;
import com.erp.pojo.CompanyInfo;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;

/**
 * Created by IntelliJ IDEA.
 * User: Atul
 * Date: Jul 3, 2012
 * Time: 3:22:58 PM
 * To change this template use File | Settings | File Templates.
 */
public class CompanyActionBean extends BaseActionBean
{
    @Inject
    CompanyDao companyDao;

    private static final String ADDCOMPANY="jsp/addCompany.jsp";
    private CompanyInfo companyInfo;

    public CompanyInfo getCompanyInfo() {
        return companyInfo;
    }

    public void setCompanyInfo(CompanyInfo companyInfo) {
        this.companyInfo = companyInfo;
    }

    @DefaultHandler
    public Resolution pre()
    {

        return new ForwardResolution(ADDCOMPANY);
    }
    public Resolution addCompany()
    {
        
        companyDao.save(companyInfo);
        return new RedirectResolution(CompanyActionBean.class,"pre");
    }
}
