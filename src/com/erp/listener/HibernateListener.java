package com.erp.listener; /**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 9, 2012
 * Time: 12:18:17 PM
 * To change this template use File | Settings | File Templates.
 */

import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;
import org.apache.log4j.PropertyConfigurator;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.erp.utils.HibernateUtils;
import com.erp.guice.InjectorFactory;
import com.erp.security.BatchProcessWorkManager;

import java.util.Locale;
import java.util.TimeZone;
import java.io.File;

public class HibernateListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {
    public static File hibernateConfig;
    private BatchProcessWorkManager batchProcessManager;
    // Public constructor is required by servlet spec
    public HibernateListener() {

    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent event) {
        /* This method is called when the servlet context is
           initialized(when the Web application is deployed). 
           You can initialize servlet context related data here.
        */
          TimeZone.setDefault(TimeZone.getTimeZone("IST"));
        Locale.setDefault(Locale.ENGLISH);
               PropertyConfigurator.configure(event.getServletContext().getRealPath("/")+ "/WEB-INF/classes/logger-config.properties");
               org.slf4j.Logger logger = LoggerFactory.getLogger(HibernateListener.class);
        logger.debug("Log4j + slf4j Initialised Successfully ... ");

        String fileName=event.getServletContext().getRealPath("/")+ "/WEB-INF/classes/hibernate.cfg.xml";
        hibernateConfig=new File(fileName);
        InjectorFactory.getInjector();
//        batchProcessManager = InjectorFactory.getInjector().getInstance(BatchProcessWorkManager.class);
//        batchProcessManager.beginWork();
    }

    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is invoked when the Servlet Context 
           (the Web application) is undeployed or 
           Application Server shuts down.
        */

       // sf.close();
//        batchProcessManager.endWork();
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute 
           is added to a session.
        */
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute
           is removed from a session.
        */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is invoked when an attibute
           is replaced in a session.
        */
    }
}
