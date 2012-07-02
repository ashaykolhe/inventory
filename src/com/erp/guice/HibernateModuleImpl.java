package com.erp.guice;

import org.hibernate.cfg.AnnotationConfiguration;

import java.io.File;

/**
 * Author: Kani
 * Date: Sep 14, 2008
 */
public class HibernateModuleImpl extends HibernateModule {
  private File file;

  public HibernateModuleImpl(File file) {
    this.file = file;
  }

  public File getHibernateConfigFilePath() {
    return file;
  }

  public void buildConfiguration(AnnotationConfiguration annotationConfiguration) {
  }

  protected void configure() {
    super.configure();
  }

}
