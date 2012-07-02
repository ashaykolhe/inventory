package com.erp.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;


/**
 * Author: Kani
 * Date: Aug 29, 2008
 */
public class BaseUtils {
  private static Logger logger = LoggerFactory.getLogger(BaseUtils.class);
  public static String newline = System.getProperty("line.separator");




  public static String getCurrentTimestamp() {
    return new Timestamp(System.currentTimeMillis()).toString().substring(0,10);
  }


}
