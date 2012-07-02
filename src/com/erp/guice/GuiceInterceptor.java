package com.erp.guice;


import com.google.inject.Injector;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.config.Configuration;
import net.sourceforge.stripes.controller.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.FilterConfig;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author Animesh Jain
 * With lots of help from sberan@gmail.com (Sam Beran)
 */
@Intercepts({
    LifecycleStage.ActionBeanResolution,
    LifecycleStage.BindingAndValidation
    })
public class GuiceInterceptor implements Interceptor {
  private static final Log log = LogFactory.getLog(GuiceInterceptor.class);

  public static final String INJECTOR_FACTORY_CLASS = "GuiceInjector.Class";
  public static final String INJECTOR_FACTORY_METHOD = "GuiceInjector.Method";

  /**
   * 
   * calling injectors post creation on Action beans and Interceptors
   * @param context
   * @return
   * @throws Exception
   */
  public Resolution intercept(ExecutionContext context) throws Exception {
    Configuration conf = StripesFilter.getConfiguration();

    FilterConfig filterConfig = conf.getBootstrapPropertyResolver().getFilterConfig();
    String className = filterConfig.getInitParameter(INJECTOR_FACTORY_CLASS);
    String methodName = filterConfig.getInitParameter(INJECTOR_FACTORY_METHOD);

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

//    if (context.getActionBean() != null) injector.injectMembers(context.getActionBean());
    if (context.getActionBeanContext() != null) injector.injectMembers(context.getActionBeanContext());

    for (Interceptor interceptor : conf.getInterceptors(context.getLifecycleStage())) {
      if (interceptor != null) injector.injectMembers(interceptor);
    }

    return context.proceed();
  }

}
