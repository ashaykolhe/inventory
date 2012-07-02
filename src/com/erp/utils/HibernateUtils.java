package com.erp.utils;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.context.ManagedSessionContext;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 9, 2012
 * Time: 11:39:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateUtils {
    private static SessionFactory sf;
    public HibernateUtils() {
    }

    static{
        sf=new AnnotationConfiguration().configure().buildSessionFactory();
    }

    public static SessionFactory getSessionFactory(){
        return sf;
    }

    public static Session getSession(){
        return getSessionFactory().openSession();
    }


}
