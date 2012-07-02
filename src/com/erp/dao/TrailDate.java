package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.Traildate;
import com.wideplay.warp.persist.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Iterator;

import org.hibernate.Query;

/**
 * Created by IntelliJ IDEA.
 * User: Atul
 * Date: Apr 18, 2012
 * Time: 3:52:07 PM
 * To change this template use File | Settings | File Templates.
 */
public class TrailDate extends BaseDao<Traildate,Long>
{
    public TrailDate() {
        super(Traildate.class);
    }

    @Transactional
    public int checkPeriod(Traildate traildate)
    {
        Traildate td=new Traildate();
        try
        {
            Query qry=sessionProvider.get().createQuery("from Traildate");
            List l=qry.list();
            Iterator it=l.iterator();
            if(!it.hasNext())
            {
                Date d=new Date();
                Date d1=new Date();
                d1.setDate(d.getDate()+15);
                traildate.setDate1(d);
                traildate.setDate2(d1);
                sessionProvider.get().save(traildate);
                return 1;
            }
            else
            {
                td=(Traildate)sessionProvider.get().load(Traildate.class,1);
                Date d=new Date();
                if(d.compareTo(td.getDate1())==-1)
                {
                    return 0;
                }
                else
                if(d.compareTo(td.getDate2())==1)
                {
                    return 0;
                }
                else{
                    return 1;
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return 0;
    }


}
