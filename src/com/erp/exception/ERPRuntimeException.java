package com.erp.exception;

/**
 * User: rahul
 * Time: 6 Nov, 2009 1:06:30 PM
 */
public abstract class ERPRuntimeException extends RuntimeException {
  protected ERPRuntimeException() {
  }

  protected ERPRuntimeException(String message) {
    super(message);
  }

  public ERPRuntimeException(Throwable e) {
    super(e);
  }
}
