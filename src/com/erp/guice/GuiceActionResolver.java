package com.erp.guice;


import com.google.inject.Injector;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.config.Configuration;
import net.sourceforge.stripes.controller.NameBasedActionResolver;
import net.sourceforge.stripes.controller.StripesFilter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.FilterConfig;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * <p>Responsible for the creation of Guiced up ActionBean instances.</p>
 *
 * <p> Rather than using Class.newInstance(), an ActionBean instances is created
 * using GuiceInjectorFactory.
 * StripesFilter must be configured to use this ActionResolver, or one which
 * overrides ActionResolver.makeNewActionBean() in the following way:</p>
 * <p>
 * <pre>
 *   @Override
 *   protected ActionBean makeNewActionBean(Class<? extends ActionBean> type,
 *           ActionBeanContext context) {
 *       return GuiceInjectorFactory.makeGuicedActionBean(type, context);
 *   }
 * </pre>
 * </p>
 * <p> This will allow guice to inject constructors as well as members in the ActionBean
 * like so: </p>
 *
 * <p><code>
 *   public class MyActionBean implements ActionBean {
 *
 *      &#064;Inject
 *      public MyActionBean(MyService service){
 *        ...
 *      }
 *
 *      public Resolution list() {
 *        ...
 *      }
 *
 *      ...
 *   }
 * </code></p>
 *
 * @author Sam Beran
 */
public class GuiceActionResolver extends NameBasedActionResolver {
  private static final Log log = LogFactory.getLog(GuiceActionResolver.class);

  @Override
  protected ActionBean makeNewActionBean(Class<? extends ActionBean> type,
                                         ActionBeanContext context) throws Exception {

    return injectFromGuice(type);
  }

  protected ActionBean injectFromGuice(Class type) throws Exception {
    Configuration conf = StripesFilter.getConfiguration();

    FilterConfig filterConfig = conf.getBootstrapPropertyResolver().getFilterConfig();
    String className = filterConfig.getInitParameter(GuiceInterceptor.INJECTOR_FACTORY_CLASS);
    String methodName = filterConfig.getInitParameter(GuiceInterceptor.INJECTOR_FACTORY_METHOD);

    Injector injector = null;
    try {
      Class clazz = Class.forName(className);
      Method method = clazz.getMethod(methodName);
      injector = (Injector) method.invoke(null);
    } catch (ClassNotFoundException e) {
      log.error("Injector factory class not found - "+className, e);
      throw new Exception("Injector factory class not found - "+methodName, e);
    } catch (NoSuchMethodException e) {
      log.error("Injector factory method not found - "+methodName+" in class "+className, e);
      throw new Exception("Injector factory method not found - "+methodName+" in class "+className, e);
    } catch (SecurityException e) {
      log.error("SecurityException when trying to invoke - "+methodName+" in class "+className, e);
      throw new Exception("SecurityException when trying to invoke - "+methodName+" in class "+className, e);
    } catch (IllegalAccessException e) {
      log.error("IllegalAccessException when trying to invoke - "+methodName+" in class "+className, e);
      throw new Exception("IllegalAccessException when trying to invoke - "+methodName+" in class "+className, e);
    } catch (IllegalArgumentException e) {
      log.error("IllegalArgumentException when trying to invoke - "+methodName+" in class "+className, e);
      throw new Exception("IllegalArgumentException when trying to invoke - "+methodName+" in class "+className, e);
    } catch (InvocationTargetException e) {
      log.error("InvocationTargetException when trying to invoke - "+methodName+" in class "+className, e);
      throw new Exception("InvocationTargetException when trying to invoke - "+methodName+" in class "+className, e);
    }
    return (ActionBean) injector.getInstance(type);
  }

}
