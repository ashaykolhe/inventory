package com.erp.action;
import java.util.List;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.HttpCache;
import net.sourceforge.stripes.ajax.JavaScriptResolution;
import com.erp.pojo.Role;
import com.erp.constants.PermissionConstants;
import com.erp.dao.RoleDao;
import com.google.inject.Inject;

import javax.annotation.security.RolesAllowed;
/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 27, 2012
 * Time: 11:04:10 AM
 * To change this template use File | Settings | File Templates.
 */
@HttpCache(allow = false)
public class RoleActionBean extends BaseActionBean{
    List<Role> rolelst;
    protected Role role;
      @Inject
    protected RoleDao roledao;
     private boolean flag;
       private String addRoleName;

    public String getAddRoleName() {
        return addRoleName;
    }

    public void setAddRoleName(String addRoleName) {
        this.addRoleName = addRoleName;
    }

    public List<Role> getRolelst() {
        return rolelst;
    }

    public void setRolelst(List<Role> rolelst) {
        this.rolelst = rolelst;
    }

    public Role getRole() {
        if(id != 0) {

            return roledao.findById(id);
        }
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @DefaultHandler
    public Resolution paginationRole(){
        rolelst=roledao.getRole();
        return new JavaScriptResolution(rolelst);
    }

    //To get role unique list by id
    public Resolution readname(){
        role= roledao.findById(id);
        return new JavaScriptResolution(role);
    }
    @RolesAllowed({PermissionConstants.ADD_MANAGEROLE})
//Add role
public Resolution addroledb(){
        roledao.SaveRole(getRole());
        rolelst=roledao.getRole();
        return new ForwardResolution("jsp/displaytag/role.jsp");
    }

    @RolesAllowed({PermissionConstants.DELETE_MANAGEROLE})
//Delete role
public Resolution delete1(){
        roledao.delete(getRole());
        rolelst=roledao.getRole();
        return new ForwardResolution("jsp/displaytag/role.jsp");
    }

    @RolesAllowed({PermissionConstants.UPDATE_MANAGEROLE})
//Update role
public Resolution update(){
        roledao.update(getRole());
        rolelst=roledao.getRole();
        return new ForwardResolution("jsp/displaytag/role.jsp");
    }

      public Resolution checkRoleAlreadyPresent()
    {
       
    flag=roledao.checkRolePresent(addRoleName);
    return new JavaScriptResolution(flag);
    }
}
