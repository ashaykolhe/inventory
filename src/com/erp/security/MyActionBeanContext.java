/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package com.erp.security;

import com.google.inject.Inject;
import com.erp.pojo.User;
import com.erp.dao.UserDao;
import net.sourceforge.stripes.action.ActionBeanContext;


public class MyActionBeanContext extends ActionBeanContext {

    private static final String USER = "user";

    @Inject protected UserDao userDao;

    public void setUser(User user) {

        setCurrent(USER, user!=null ? user.getUser_id() : 0);
    }
    public User getUser() {
        Long userId = getCurrent(USER, null);
        return userDao.findById(userId);
    }
    protected void setCurrent(String key, Object value) {
        getRequest().getSession().setAttribute(key, value);
    }
    @SuppressWarnings("unchecked")
    protected <T> T getCurrent(String key, T defaultValue) {
        T value = (T) getRequest().getSession().getAttribute(key);
        if (value == null) {
            value = defaultValue;
            setCurrent(key, value);
        }
        return value;
    }

    public void logout(){
        setUser(null);

/*
        HttpSession session=getRequest().getSession();
        if(session!=null){
            session.invalidate();
        }
*/
    }

}

