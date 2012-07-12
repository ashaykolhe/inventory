package com.erp.dao;

import com.erp.pojo.User;
import com.erp.exception.LoginException;
import com.erp.dao.BaseDao;
import com.wideplay.warp.persist.Transactional;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:46:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserDao extends BaseDao<User,Long>{
    public UserDao() {
        super(User.class);
    }

    public boolean checkUserPresent(String addUserName) {
        String u;
        boolean f=false;
        try{
            u= (String) sessionProvider.get().createQuery("select username from User where deleted='0' and username='"+addUserName+"'").uniqueResult();
            if(u!=null)
                f=true;
        }
        finally{
        }
        return f;  //To change body of implemented methods use File | Settings | File Templates.
    }
    @Transactional
    public User authenticate(User u) throws LoginException {
        User val=(User)sessionProvider.get().createQuery("from User where username=:user and password=:pass and deleted=:del").setString("user",u.getUsername()).setString("pass",u.getPassword()).setInteger("del",0).uniqueResult();
        if(val==null){
            throw new LoginException("invalid credentials");
        }
        return val;
    }

    @Transactional
    public boolean SaveUser(User u)
    {
        try {
            if(u!=null){
                sessionProvider.get().save(u);
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }


    public User findById(Long id){
        return (User)sessionProvider.get().createQuery("from User where id='"+id+"'").uniqueResult();
    }


    public List getUser(){
        return sessionProvider.get().createQuery("from User where deleted='0' and user_id <> 1").list();
    }

    @Transactional
    public void update(User user)  {
        try{
            sessionProvider.get().update(user);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Transactional
    public void delete(User user)  {
        try{
            user.setDeleted(1);
            sessionProvider.get().update(user);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
          public User latestuser() {
        return (User)sessionProvider.get().createQuery("from User where id=(select max(id) from User)").uniqueResult();

    }
   
}



