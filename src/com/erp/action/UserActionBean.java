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
     private String name;
     private String addUserName;
     private String password;
    private  boolean flag;
    private User user;
    private Role role;
    private static String count="0";
       private static Long tempid;
          private List<Role> rolelst;
   private List<RolePermissions> rolePermission;
    private List<UserPermissions> userPermission;
    private List<String> usernamelist;
    private static String test;

    public static String getTest() {
        return test;
    }

    public static void setTest(String test) {
        UserActionBean.test = test;
    }

    public static Long getTempid() {
        return tempid;
    }

    public static void setTempid(Long tempid) {
        UserActionBean.tempid = tempid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getUsernamelist() {
        return usernamelist;
    }

    public void setUsernamelist(List<String> usernamelist) {
        this.usernamelist = usernamelist;
    }

    public static String getCount() {
        return count;
    }

    public static void setCount(String count) {
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
        count="0";
        return new ForwardResolution("jsp/addUser.jsp");
   }
    
    @RolesAllowed({PermissionConstants.ADD_USERS})
   public Resolution addUser(){


        if(count.equalsIgnoreCase("0"))
        {

         userDao.SaveUser(user);

//            System.out.println("countcountcountcountcountcount in adduser save"+count);
        }
        else
        {
            System.out.println("getusergetusergetusergetuser"+user);

            userDao.update(user);

//         System.out.println("countcountcountcountcountcount in adduser befre"+count);
        }
        count="0";

//          rolelst=roledao.getRole();
//        System.out.println("countcountcountcountcountcount in adduer after"+count);
//        System.out.println("useruseruseruseruseruseruser"+user);

        role=roledao.find(user.getRole().getId()) ;
          rolePermission=role.getRolePermissions();
//        rolelst=roledao.getRole();
        test="a";
        System.out.println(role);

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
      id=userDao.findIdByLatestUpdate();
      System.out.println("idididididididiididi in update"+id);


        role=userDao.findById(userDao.findIdByLatestUpdate()).getRole();
      

          rolePermission=role.getRolePermissions();
    //  test="b";
        return new RedirectResolution(UserActionBean.class,"updateUserLink");

  }
    //get user list by id
     public Resolution userlist(){
        System.out.println("idididid   in userlist "+id);
         user= userDao.findByUsername(name);
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
    public Resolution grantRolePermissionstep(){
/*
         for(Iterator<RolePermissions> revoke=rolePermission.iterator();revoke.hasNext();){
             RolePermissions temp=revoke.next();
             if(temp.getAdd()==null && temp.getUpdate()==null && temp.getDelete()==null){
                 revoke.remove();
             }

         }
*/

     // if ( count==1 )
         System.out.println(id);
        // if(test.equalsIgnoreCase("a"))
         //{
      role=userDao.latestuser().getRole();
       //else
     // role=roledao.findById(id);
         System.out.printf("temptemptemptemptemptemp"+role);
        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
//        rolelst=roledao.getRole();
         user=userDao.latestuser();//}
       // System.out.println("countcountcountcountcountcount"+count);
     /*   else
          role=userDao.findById(userDao.findIdByLatestUpdate()).getRole();
       System.out.printf("temptemptemptemptemptemp"+role);
        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
        user=userDao.findById(userDao.findIdByLatestUpdate());

           userPermission=user.getUserPermissions();
         System.out.println("userPermissionuserPermissionuserPermission"+userPermission); */
        return new ForwardResolution("jsp/userPermissionstep.jsp");
    }
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
     // role=roledao.findByLatestId(id);
       //else
         role=roledao.findById(id);
         System.out.printf("temptemptemptemptemptemp"+role);
        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
        rolelst=roledao.getRole();
         user=userDao.latestuser();
       // System.out.println("countcountcountcountcountcount"+count);

       return new RedirectResolution(UserActionBean.class,"rolePermissionLink");
    }
    @RolesAllowed({PermissionConstants.USER_PERMISSIONS})
    public Resolution grantUserPermissionstep(){
/*
        for(Iterator<UserPermissions> revoke=userPermission.iterator();revoke.hasNext();){
            UserPermissions temp=revoke.next();
            if(temp.getAdd()==null && temp.getUpdate()==null && temp.getDelete()==null){
                revoke.remove();
            }

        }
*/
       //if(test.equalsIgnoreCase("a"))
       //{
        User temp=userDao.findByLatestId(id);
        temp.setUserPermissions(userPermission);
        userDao.SaveUser(temp);
         System.out.printf("temptemptemptemptemptempin user"+temp);
        userlst=userDao.getUser();
       //}
       /* else
       {
         User temp=userDao.findById(userDao.findIdByLatestUpdate());
        temp.setUserPermissions(userPermission);
        userDao.SaveUser(temp);
         System.out.printf("temptemptemptemptemptempin user"+temp);
        userlst=userDao.getUser();

       } */
         return new RedirectResolution(UserActionBean.class,"addUserLink");
    }
    public Resolution grantUserPermission(){
/*
        for(Iterator<UserPermissions> revoke=userPermission.iterator();revoke.hasNext();){
            UserPermissions temp=revoke.next();
            if(temp.getAdd()==null && temp.getUpdate()==null && temp.getDelete()==null){
                revoke.remove();
            }

        }
*/
        System.out.println("ididdiddididiididdi in user permission"+id);
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
        System.out.println("ididdiddididiididdi in user permission"+id);
        userPermission=userDao.findById(id).getUserPermissions();
        System.out.println(" userPermission userPermission userPermission userPermission"+ userPermission);
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
      public Resolution userLink(){
       user=userDao.latestuser();
          System.out.println("useruseruseruseruseruser in userlink"+user);
        rolelst=roledao.getRole();
          role=user.getRole();
                 count="a";
          flag=true;
            System.out.println("countcountcountcountcountcount in adduer"+count);
        return new ForwardResolution("jsp/addUser.jsp");
   }
     public Resolution roleLink(){
       role=userDao.latestuser().getRole();
         id=userDao.latestuser().getRole().getId();
       //else
     // role=roledao.findById(id);
       //  role=roledao.findById(id);
         System.out.printf("temptemptemptemptemptemp role"+role);
         System.out.printf("temptemptemptemptemptemp id"+id);
          rolePermission=roledao.findById(id).getRolePermissions();
        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
       // rolelst=roledao.getRole();
         user=userDao.latestuser();
                 //count="a";
          flag=true;
            System.out.println("countcountcountcountcountcount in adduer"+count);
        return new ForwardResolution("jsp/rolePermissionstep.jsp");
   }
    public Resolution userlistforupdate() {
        usernamelist=userDao.getUserNamelist();
         System.out.println("usernamelistusernamelistusernamelist in usernamelist"+usernamelist);
         return new JavaScriptResolution(usernamelist);
    }
   /* public Resolution grantRolePermissionupdate(){
/*
         for(Iterator<RolePermissions> revoke=rolePermission.iterator();revoke.hasNext();){
             RolePermissions temp=revoke.next();
             if(temp.getAdd()==null && temp.getUpdate()==null && temp.getDelete()==null){
                 revoke.remove();
             }

         }
*/

     // if ( count==1 )
     // role=roledao.findByLatestId(id);
       //else
        //id=userDao.findIdByLatestUpdate();
         //role=roledao.findById(tempid);
      /*    System.out.println("idididididididiididitemp in update 2"+tempid);

           role=userDao.findById(userDao.findIdByLatestUpdate()).getRole();
       //else
     // role=roledao.findById(id);
         System.out.printf("temptemptemptemptemptemp"+role);
        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
//        rolelst=roledao.getRole();

        role.setRolePermissions(rolePermission);
        roledao.SaveRole(role);
        rolelst=roledao.getRole();
         user=userDao.findById(userDao.findIdByLatestUpdate());
       // System.out.println("countcountcountcountcountcount"+count);
          role=userDao.findById(userDao.findIdByLatestUpdate()).getRole();
           rolePermission=role.getRolePermissions();

       return new ForwardResolution("jsp/rolePermissionstep.jsp");
    }*/

}
