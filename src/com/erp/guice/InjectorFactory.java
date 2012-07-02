package com.erp.guice;

import com.google.inject.Injector;
import com.google.inject.Guice;
import com.google.inject.matcher.Matchers;
import com.wideplay.warp.persist.PersistenceService;
import com.wideplay.warp.persist.UnitOfWork;
import com.erp.listener.HibernateListener;

/**
 * User: rahul
 * Time: 20 Jul, 2009 4:07:01 PM
 */
public class InjectorFactory {

  private static final Injector injector;

  public static Injector getInjector() {
    return injector;
  }

  static {
    injector = Guice.createInjector(
        PersistenceService.usingHibernate()
            .across(UnitOfWork.REQUEST)
            .forAll(Matchers.any()).buildModule(),
        new HibernateModuleImpl(HibernateListener.hibernateConfig)

        );
  }

}
