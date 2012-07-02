package com.erp.security;

import org.hibernate.SessionFactory;
import org.hibernate.context.ManagedSessionContext;
import com.google.inject.Provider;
import com.google.inject.Inject;
import com.wideplay.warp.persist.WorkManager;

/**
 * User: rahul
 * Time: 7 Jan, 2010 6:00:50 PM
 */
public class BatchProcessWorkManager implements WorkManager {

  private final Provider<SessionFactory> sessionFactoryProvider;

  @Inject
  public BatchProcessWorkManager(Provider<SessionFactory> sessionFactoryProvider) {
    this.sessionFactoryProvider = sessionFactoryProvider;
  }

  public void beginWork() {
    // do nothing if a session is already open
      System.out.println("begin work");
    if (ManagedSessionContext.hasBind(sessionFactoryProvider.get())) {
        System.out.println("session factory binded");
      return;
    }

    // open session
    ManagedSessionContext.bind(sessionFactoryProvider.get().openSession());
      System.out.println("session open");
  }

  public void endWork() {
    // do nothing if there is no session open
      System.out.println("endwork");
    SessionFactory sessionFactory = sessionFactoryProvider.get();
    if (!ManagedSessionContext.hasBind(sessionFactory)) {
        System.out.println("sessionfactory no bind");
      return;
    }

    // close session when done
    try {
      sessionFactory.getCurrentSession().close();
        System.out.println("current session closed");
    } finally {
      ManagedSessionContext.unbind(sessionFactory);
    }
  }
}
