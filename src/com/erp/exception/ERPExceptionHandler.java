package com.erp.exception;

import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.ErrorResolution;
import net.sourceforge.stripes.exception.DefaultExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

public class ERPExceptionHandler extends DefaultExceptionHandler {

  private static Logger logger = LoggerFactory.getLogger(ERPExceptionHandler.class);
  
  public Resolution handleERPWebException(ERPWebException e, HttpServletRequest request, HttpServletResponse response) {
    logger.error("General Error. Catching Exception :"+e.getClass().getName()+" : errorCode = "+e.getErrorCode()+" : errorMessage = "+e.getErrorMessage()+" : resolution = "+e.getResolution().toString());
    logger.error("Root Exception Detail :" , e);
    return e.getResolution();
  }

  public Resolution handleGeneric(net.sourceforge.stripes.exception.ActionBeanNotFoundException e, HttpServletRequest request, HttpServletResponse response) {
    return new ErrorResolution(404, "Page Not Found or Invalid request.");
  }

  public Resolution handleGeneric(Exception e, HttpServletRequest request, HttpServletResponse response) {
    logger.error("Exception Detail :" , e);
    return new ForwardResolution("../web/unhandledError.jsp");
  }

}
