package com.erp.dao;

import com.erp.pojo.CompanyInfo;

/**
 * Created by IntelliJ IDEA.
 * User: Atul
 * Date: Jul 3, 2012
 * Time: 3:27:48 PM
 * To change this template use File | Settings | File Templates.
 */
public class CompanyDao extends BaseDao<CompanyInfo,Long>
{
    public CompanyDao()
    {
        super(CompanyInfo.class);
    }

    public boolean saveCompany(CompanyInfo company)
    {
        sessionProvider.get().save(company);
        return true;
    }


    
}
