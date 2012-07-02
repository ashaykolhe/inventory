package com.erp.guice;

import com.google.inject.AbstractModule;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.Provider;
import com.wideplay.warp.persist.PersistenceService;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import java.io.File;

/**
 * Author: Kani
 * Date: Aug 28, 2008
 */
public abstract class HibernateModule extends AbstractModule {
  private static Logger logger = LoggerFactory.getLogger(HibernateModule.class);
    
  public abstract File getHibernateConfigFilePath();

  public abstract void buildConfiguration(AnnotationConfiguration annotationConfiguration);
  
  protected void configure() {
    final AnnotationConfiguration annotationConfiguration = new AnnotationConfiguration();
    annotationConfiguration.configure(getHibernateConfigFilePath());
    buildConfiguration(annotationConfiguration);
    bind(Configuration.class).toInstance(annotationConfiguration);
    bind(Initializer.class).asEagerSingleton();
  }

  @Singleton
  public static class Initializer {

    @Inject
    Initializer(PersistenceService service, Provider<SessionFactory> sessionFactoryProvider) throws Exception {
      try {
        service.start();
      } catch (Exception e) {
        logger.error("Error starting up Hibernate: ", e);
        throw e;
      }
    }
  }

}
