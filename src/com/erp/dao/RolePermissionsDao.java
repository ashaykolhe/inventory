package com.erp.dao;

import com.erp.dao.BaseDao;
import com.erp.pojo.RolePermissions;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Iterator;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Mar 2, 2012
 * Time: 11:54:42 AM
 * To change this template use File | Settings | File Templates.
 */
public class RolePermissionsDao extends BaseDao <RolePermissions,Long> {
    public RolePermissionsDao() {
        super(RolePermissions.class);
    }

    @Transactional
    public void saveRolePermissions(List<RolePermissions> rolePermissions) {
        try {
            
            for(Iterator<RolePermissions> i= rolePermissions.iterator();i.hasNext();){
                sessionProvider.get().save(i.next());
            }

        }catch (Exception e){
            e.printStackTrace();

        }
    }

    //get all list
    @Transactional
    public List getRolePermissions(){
        String hql="from RolePermissions where deleted='0' and name <> 'superadmin'";
        
        return sessionProvider.get().createQuery(hql).list();
    }
}
