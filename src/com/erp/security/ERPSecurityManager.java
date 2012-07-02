package com.erp.security;

import org.stripesstuff.plugin.security.InstanceBasedSecurityManager;
import org.stripesstuff.plugin.security.SecurityHandler;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.ErrorResolution;

import java.lang.reflect.Method;
import java.util.Iterator;

import com.erp.pojo.User;
import com.erp.pojo.Role;
import com.erp.pojo.RolePermissions;
import com.erp.pojo.UserPermissions;
import com.erp.action.BaseActionBean;
import com.erp.action.LoginActionBean;
import com.erp.constants.PermissionConstants;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 * User: Ashay
 * Date: Mar 19, 2012
 * Time: 3:47:08 PM
 * To change this template use File | Settings | File Templates.
 */
public class ERPSecurityManager extends InstanceBasedSecurityManager implements SecurityHandler{
    @Override
    protected Boolean hasRoleName(ActionBean actionBean, Method method, String s) {
        User user=getUser(actionBean);

        if(user!=null){
            Role role=user.getRole();

            if(role.getName().equalsIgnoreCase("superadmin")){
                return true;
            }
            return checkModule(user,s);
        }
        return false;
    }

    public Boolean checkModule(User user,String role){
        boolean rolePermission=false;

        if(user.getUserPermissions().isEmpty()){
            rolePermission=true;
        }else{
            for(Iterator<UserPermissions> i=user.getUserPermissions().iterator();i.hasNext();){
                UserPermissions userPermissions =i.next();
                if(role.contains(userPermissions.getName())){
                    if(userPermissions.getAdd()==null && userPermissions.getUpdate()==null && userPermissions.getDelete()==null){
                        rolePermission=true;
                    }else{
                        rolePermission=false;
                        break;
                    }
                }

            }

        }

        if(rolePermission){
            if(role.contains("ADD")){
                for(Iterator<RolePermissions> i=user.getRole().getRolePermissions().iterator();i.hasNext();){
                    RolePermissions rolePermissions =i.next();
                    if(role.contains(rolePermissions.getName())){
                        if(rolePermissions.getAdd()!=null && rolePermissions.getAdd().equalsIgnoreCase("true")){
                            return true;
                        }
                    }

                }

            }else if(role.contains("UPDATE")){
                for(Iterator<RolePermissions> i=user.getRole().getRolePermissions().iterator();i.hasNext();){
                    RolePermissions rolePermissions =i.next();
                    if(role.contains(rolePermissions.getName())){
                        if(rolePermissions.getUpdate()!=null && rolePermissions.getUpdate().equalsIgnoreCase("true")){
                            return true;
                        }
                    }

                }
            }else if(role.contains("DELETE")){
                for(Iterator<RolePermissions> i=user.getRole().getRolePermissions().iterator();i.hasNext();){
                    RolePermissions rolePermissions =i.next();
                    if(role.contains(rolePermissions.getName())){
                        if(rolePermissions.getDelete()!=null && rolePermissions.getDelete().equalsIgnoreCase("true")){
                            return true;
                        }
                    }

                }

            }

            return false;
        }else{
            if(role.contains("ADD")){
                for(Iterator<UserPermissions> i=user.getUserPermissions().iterator();i.hasNext();){
                    UserPermissions userPermissions =i.next();
                    if(role.contains(userPermissions.getName())){
                        if(userPermissions.getAdd()!=null && userPermissions.getAdd().equalsIgnoreCase("true")){
                            return true;
                        }
                    }

                }

            }else if(role.contains("UPDATE")){
                for(Iterator<UserPermissions> i=user.getUserPermissions().iterator();i.hasNext();){
                    UserPermissions userPermissions =i.next();
                    if(role.contains(userPermissions.getName())){
                        if(userPermissions.getUpdate()!=null && userPermissions.getUpdate().equalsIgnoreCase("true")){
                            return true;
                        }
                    }

                }
            }else if(role.contains("DELETE")){
                for(Iterator<UserPermissions> i=user.getUserPermissions().iterator();i.hasNext();){
                    UserPermissions userPermissions =i.next();
                    if(role.contains(userPermissions.getName())){
                        if(userPermissions.getDelete()!=null && userPermissions.getDelete().equalsIgnoreCase("true")){
                            return true;
                        }
                    }

                }

            }
        }

        return false;
    }


    @Override
    protected Boolean isUserAuthenticated(ActionBean actionBean, Method method) {
        return getUser(actionBean)!=null;    //To change body of overridden methods use File | Settings | File Templates.
    }

    public Resolution handleAccessDenied(ActionBean actionBean, Method method) {
        if(!(isUserAuthenticated(actionBean,method))){
            RedirectResolution resolution=new RedirectResolution(LoginActionBean.class);
            if(actionBean.getContext().getRequest().getMethod().equalsIgnoreCase("GET") || actionBean.getContext().getRequest().getMethod().equalsIgnoreCase("POST")){
                String logout="";
                resolution.addParameter("logout",logout);
            }

            return resolution;
        }
        return new ErrorResolution(HttpServletResponse.SC_UNAUTHORIZED);
    }


    private User getUser(ActionBean bean){
        return ((BaseActionBean)bean).getContext().getUser();
    }
}
