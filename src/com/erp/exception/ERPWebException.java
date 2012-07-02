package com.erp.exception;

import net.sourceforge.stripes.action.Resolution;

/**
 * This exception will gracefully handle output of the exception to the web client.
 *
 * It can either be a browser or a web service. the exception contains a resolution
 * {@link net.sourceforge.stripes.action.Resolution}
 * to which it will forward with a detailed client message
 *
 * These will be handled by {@link com.erp.exception.ERPExceptionHandler} in most cases
 */
public abstract class ERPWebException extends RuntimeException {
  protected ERPWebException() {
  }

  protected ERPWebException(String message) {
    super(message);
  }

  protected ERPWebException(Throwable e) {
    super(e);
  }

  public abstract Long getErrorCode();
  public abstract String getErrorMessage();
  public abstract Resolution getResolution();

}
