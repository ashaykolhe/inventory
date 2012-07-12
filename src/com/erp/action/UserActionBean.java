package com.erp.action;

import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.ajax.JavaScriptResolution;

import java.util.List;

import com.erp.pojo.User;
import com.erp.pojo.Role;
import com.erp.pojo.RolePermissions;
import com.erp.pojo.UserPermissions;
import com.erp.constants.PermissionConstants;
import com.erp.utils.PasswordEncryptor;
import com.erp.guice.InjectorFactory;
import com.erp.dao.RoleDao;
import com.google.inject.Inject;

import javax.annotation.security.RolesAllowed;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 20, 2012
 * Time: 3:33:43 PM
 * To change this template use File | Settings | File Templates.
 */
@HttpCache(allow = false)
public class UserActionBean extends BaseActionBean{
    @Inject
    protected RoleDao roledao;

    private List<User> userlst;

     private String addUserName;
     private String password;
    private  boolean flag;
    private User user;
    private Role role;
    private static int count=0;

          private List<Role> rolelst;
   private List<RolePermissions> rolePermission;
    private List<UserPermissions> userPermission;

    public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
        UserActionBean.count = count;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<UserPermissions> getUserPermission() {
        return userPermission;
    }

    public void setUserPermission(List<UserPermissions> userPermission) {
        this.userPermission = userPermission;
    }

    public List<User> getUserlst() {
        return userlst;
    }
    public void setUserlst(List<User> userlst) {
           this.userlst = userlst;

       }

    public String getAddUserName() {
        return addUserName;
    }

    public void setAddUserName(String addUserName) {
        this.addUserName = addUserName;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

 

    public List<Role> getRolelst() {
        return rolelst;
    }

    public void setRolelst(List<Role> rolelst) {
        this.rolelst = rolelst;
    }

    public List<RolePermissions> getRolePermission() {
        return rolePermission;
    }

    public void setRolePermission(List<RolePermissions> rolePermission) {
        this.rolePermission = rolePermission;
    }

    @RolesAllowed({PermissionConstants.ADD_USERS})
    @DefaultHandler
    //Redirect to add user page
    public Resolution addUserLink(){
        userlst=userDao.getUser();
                 rolelst=roledao.getRole();

        return new ForwardResolution("jsp/addUser.jsp");
   }
    
    @RolesAllowed({PermissionConstants.ADD_USERS})
   public Resolution addUser(){
         userDao.SaveUser(getUser());
          rolelst=roledao.getRole();
          user=userDao.latestuser();
        System.out.println("useruseruseruseruseruseruser"+user);
        count++;
        System.out.println("countcountcountcountcountcount"+count);
     return new ForwardResolution("jsp/rolePermissionstep.jsp");
           //return new RedirectResolution(UserActionBean.class,"addUserLink");
   }

    @RolesAllowed({PermissionConstants.UPDATE_USERS})
    //Redirect to update user page
 public Resolution updateUserLink(){
     userlst=userDao.getUser();
        return new ForwardResolution("jsp/updateUser.jsp");
   }
    //Update user
     @RolesAllowed({PermissionConstants.UPDATE_USERS})
  public Resolution updateUser()
  {
        userDao.update(getUser());
            userlst=userDao.getUser();
        return new RedirectResolution(UserActionBean.class,"updateUserLink");

  }
    //get user list by id
     public Resolution userlist(){

         user= userDao.findById(id);
          rolelst=roledao.getRole();
         userlst=userDao.getUser();
         return new ForwardResolution("jsp/updateUser.jsp");
    }

    @RolesAllowed({PermissionConstants.DELETE_USERS})
    //redirect to delete page
     public Resolution deleteUserLink(){
            userlst=userDao.getUser();

      return new ForwardResolution("jsp/deleteUser.jsp");
   }
    @RolesAllowed({PermissionConstants.DELETE_USERS})
    //delete user
    public Resolution delete(){

        userDao.delete(getUser());
                 userlst=userDao.getUser();
        return new ForwardResolution(UserActionBean.class,"deleteUserLink");
    }

    @RolesAllowed({PermissionConstants.ROLE_PERMISSIONS})
    //Redirect to user permission page
     public Resolution rolePermissionLink(){
         rolelst=roledao.getRole();
          return new ForwardResolution("jsp/rolePermission.jsp");
     }
    

    @RolesAllowed({PermissionConstants.USER_PERMISSIONS})
    //Redirect to user permission page
     public Resolution userPermissionLink(){
         userlst=userDao.getUser();
          return new ForwardResolution("jsp/userPermission.jsp");
     }
     @RolesAllowed({PermissionConstants.ROLE_PERMISSIONS})
    public Resolution grantRolePermission(){
/*
         for(Iterator<RolePermissions> revoke=rolePermission.iterator();revoke.hasNext();){
             RolePermissions temp=revoke.next();
             if(temp.getAdd()==null && temp.getUpdate()==null && temp.getDelete()==null){
                 revoke.remove();
             }

         }
*/

     // if ( count==1 )
      role=roledao.findByLatestId(id);
       //else
     // role=roledao.findById(id);
         System.out.printf("temptemptemptemptemptemp"+role);
        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
        rolelst=roledao.getRole();
         user=userDao.latestuser();
        System.out.println("countcountcountcountcountcount"+count);
         count=0;
        return new ForwardResolution("jsp/userPermissionstep.jsp");
    }
    @RolesAllowed({PermissionConstants.USER_PERMISSIONS})
    public Resolution grantUserPermission(){
/*
        for(Iterator<UserPermissions> revoke=userPermission.iterator();revoke.hasNext();){
            UserPermissions temp=revoke.next();
            if(temp.getAdd()==null && temp.getUpdate()==null && temp.getDelete()==null){
                revoke.remove();
            }

        }
*/

        User temp=userDao.findById(id);
        temp.setUserPermissions(userPermission);
        userDao.SaveUser(temp);
        userlst=userDao.getUser();
         return new RedirectResolution(UserActionBean.class,"userPermissionLink");
    }

    
    public Resolution getRolePermissionsById(){
        rolePermission=roledao.findById(id).getRolePermissions();
        rolelst=roledao.getRole();
        return new ForwardResolution("jsp/rolePermission.jsp");
    }

    public Resolution getUserPermissionsById(){
        userPermission=userDao.findById(id).getUserPermissions();
        userlst=userDao.getUser();
        return new ForwardResolution("jsp/userPermission.jsp");
    }

    public Resolution checkUserAlreadyPresent()
       {
          
             flag=userDao.checkUserPresent(addUserName);
           return new JavaScriptResolution(flag);
       }
    
   public Resolution  changePasswordLink (){
     return new ForwardResolution("jsp/changePassword.jsp");   
   }
public Resolution checkPassword()
    {
       if(getContext().getUser().getPassword().equals(InjectorFactory.getInjector().getInstance(PasswordEncryptor.class).hash(addUserName))){
           flag=false;
       }else flag=true;

        return new JavaScriptResolution(flag);
    }

   public Resolution updatePassword(){
       getContext().getUser().setPassword(InjectorFactory.getInjector().getInstance(PasswordEncryptor.class).hash(password));
       userDao.SaveUser(getUser());
       return new ForwardResolution(UserActionBean.class,"changePasswordLink");
   }

}
