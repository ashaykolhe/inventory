package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.Role;
import com.wideplay.warp.persist.Transactional;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 24, 2012
 * Time: 3:17:46 PM
 * To change this template use File | Settings | File Templates.
 */
public class RoleDao extends BaseDao<Role,Long> {
    public RoleDao() {
        super(Role.class);
    }
     public boolean checkRolePresent(String addUomName) {
       
        String u;
        boolean f=false;
        try{
            u= (String) sessionProvider.get().createQuery("select name from Role where deleted='0' and name='"+addUomName+"'").uniqueResult();
            if(u!=null)
                f=true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public List getRole(){
        return sessionProvider.get().createQuery("from Role where deleted='0' and id <> 1").list();
    }
    @Transactional
    public boolean SaveRole(Role role)

    {
        try {
            if(role!=null){
                 role.setDeleted(0);
                sessionProvider.get().save(role);
                          return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }

    public Role findById(Long id){
        Role ud=null;

        return (Role)sessionProvider.get().createQuery("from Role where id='"+id+"'").uniqueResult();
    }
    @Transactional
    public void delete(Role role) {
        try{
            role.setDeleted(1);
            sessionProvider.get().update(role);
        }catch (Exception e){
            e.printStackTrace();

        }
    }
    @Transactional
    public void update(Role role) {
        try{     role.setDeleted(0);
            sessionProvider.get().update(role);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
     public Role findByLatestId(Long id){
        Role ud=null;

        return (Role)sessionProvider.get().createQuery("from Role where id=(select max(id) from Role)").uniqueResult();
    }

  
}
