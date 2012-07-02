package com.erp.guice;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.config.Configuration;
import net.sourceforge.stripes.exception.StripesServletException;
import net.sourceforge.stripes.util.Log;
import org.stripesbook.reload.core.ClassCache;

import java.util.Set;

/**
 * Author: Kani
 * Date: Mar 30, 2009
 */
public class GuiceReloadActionResolver extends GuiceActionResolver {
  private static final Log log = Log.getInstance(GuiceReloadActionResolver.class);

  private ClassCache cache = new ClassCache();

  /**
   * Adds the initially loaded Action Beans to the class cache.
   */
  @Override
  public void init(Configuration config) throws Exception {
      super.init(config);
      for (Class<? extends ActionBean> cls : getActionBeanClasses()) {
          cache.add(cls.getName(), cls);
      }
      log.warn("########################################################################");
      log.warn("# Stripes-Reload                                                       #");
      log.warn("# Enjoy developing with Stripes!                                       #");
      log.warn("# Please don't forget to turn off Stripes-Reload in production.        #");
      log.warn("# For more info, see http://www.stripesbook.org/stripes-reload.html    #");
      log.warn("########################################################################");
  }
  /**
   * Reloads an Action Bean class if it has been modified since the last time the class was loaded.
   */
  @Override
  protected ActionBean makeNewActionBean(Class<? extends ActionBean> type, ActionBeanContext ctx)
      throws Exception
  {
      String className = type.getName();
      log.debug("makeNewActionBean: ", className);
      boolean reloaded = cache.needToReload(className);
      Class<?> cls = cache.getResource(className);
      ActionBean actionBean = injectFromGuice(cls);
      if (reloaded) {
          addActionBean(actionBean.getClass());
      }
      return actionBean;
  }
  /**
   * Rescans for Action Beans if no Action Bean that matches the URL binding is found.
   */
  @Override
  public ActionBean getActionBean(ActionBeanContext context, String urlBinding)
      throws StripesServletException
  {
      log.debug("getActionBean: ", urlBinding);
      try {
          return super.getActionBean(context, urlBinding);
      }
      catch (StripesServletException exc) {
          rescanFor(urlBinding);
          return super.getActionBean(context, urlBinding);
      }
  }
  /**
   * Rescans for Action Beans if no Action Bean that matches the path is found.
   */
  @Override
  public Class<? extends ActionBean> getActionBeanType(String path) {
      log.debug("getActionBeanType for path: ", path);

      Class<? extends ActionBean> cls = super.getActionBeanType(path);
      if (cls == null && !path.endsWith(".jsp")) {
          cls = rescanFor(path);
      }
      return cls;
  }
  /**
   * Redoes the scan that Stripes normally does at startup to find Action Beans, and looks for an
   * Action Bean that is bound to the given URL.
   *
   * @param urlBinding the URL binding of the Action Bean.
   * @return the Action Bean that is bound to the URL, or {@code null} if none was found.
   */
  protected Class<? extends ActionBean> rescanFor(String urlBinding) {
      Set<Class<? extends ActionBean>> classes = findClasses();
      for (Class<? extends ActionBean> cls : classes) {
          if (urlBinding.equals(getUrlBinding(cls))) {
              addActionBean(cls);
              return cls;
          }
      }
      return null;
  }

}
