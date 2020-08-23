/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Dao;

import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import com.mycompany.news9live_spring_jdbc.Beans.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author KANISHK
 */
public class UserDao {
    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
     public List<User> getBranchUserWise(String branch) {
        List<User> list = new ArrayList();
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT branch.name,branch.sno,branch.code FROM user_banch inner join branch on branch.sno=user_banch.branch where user_banch.username=? ");
            ps.setString(1, branch);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User item = new User();
                item.setSno(rs.getInt("sno"));
                item.setBranchName(rs.getString("name"));
                item.setBranchCode(rs.getString("code"));
                list.add(item);
              //  item = null;
            }
            con.close();
            ps.close();
            rs.close();
        } catch (Exception e) {
            System.err.println("Error at getBranchList() " + e.toString());
        }
        return list;
    }
     
     public int saveuser(String name,String mob,String username,String password,String designation,String branch) {

        String sql = "insert into login (username,password,usertype,employeename,mobile,designation) values('" + username+ "','" + password+ "','U','" +name+ "','" + mob+ "','" + designation+ "')";
        return template.update(sql);
    }
      public int saveuserbranch(String username,String branch) {

        String sql = "insert into user_banch (username,branch) values('" + username+ "','" + branch+ "')";
        return template.update(sql);
    }
     
     public static boolean useralreadyExist(String branch,String username)
    {
        boolean result = false;
        try{

            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT usercode FROM `user_banch` WHERE branch=? and username=?");
            ps.setString(1, branch);
           // ps.setString(1, memberid);
            ps.setString(2, username);

            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                result = true;
            }
            con.close();
            rs.close();
            ps.close();

        }catch(Exception e)
        {
            System.err.println("Failed at branchCodexist():"+e.toString());
        }
        return result;
    }
   public static ArrayList<User> getUsersList(String username, String branch, String usertype, String limit, String search) {
        ArrayList<User> list = new ArrayList();
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            String snoquery = username.equalsIgnoreCase("") || username.equalsIgnoreCase("select") ? "" : " and login.username='" + username + "'";
            String userquery = branch.equalsIgnoreCase("") || branch.equalsIgnoreCase("select") ? "" : " and user_banch.branch='" + branch + "'";
            String limitquery = limit.equalsIgnoreCase("") || branch.equalsIgnoreCase("0") ? "" : " ASC limit " + limit + " ";
            String searchquery = search.equalsIgnoreCase("") || search.equalsIgnoreCase("select") ? "" : " and login.employeename like '%" + search + "%'";

            if (usertype.equalsIgnoreCase("A")) {
                userquery = "";
            }
            PreparedStatement ps = con.prepareStatement("SELECT login.username,login.`password`,login.spass,login.mobile,login.designation,login.usertype,login.employeename,user_banch.branch,branch.name as branchname,blocked,createuser,updateuser,deleteuser,userauthentication,createitem,updateitem,deleteitem,createparty,updateparty,deleteparty,createchallan,updatechallan,deletechallan,createinvoice,updateinvoice,deleteinvoice,printchallan,printinvoice FROM `login` INNER JOIN user_banch on user_banch.username=login.username inner join branch on branch.sno=user_banch.branch where login.username is not null" + snoquery + userquery + searchquery + " order by login.username  " + limitquery + " ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User item = new User();
                item.setName(rs.getString("employeename"));
                item.setUsername(rs.getString("username"));
                item.setPassword(rs.getString("password"));
                item.setSecurityPassword(rs.getString("spass"));
                item.setMobile(rs.getString("mobile"));
                item.setDesignation(rs.getString("designation"));
                item.setUserType(rs.getString("usertype"));
                item.setBranch(rs.getString("branch"));
                item.setBranchname(rs.getString("branchname"));
                String blockedStatus = rs.getString("blocked");
                String createUserStatus = rs.getString("createuser");
                String updateUserStatus = rs.getString("updateuser");
                String deleteUserStatus = rs.getString("deleteuser");
                String authenticationUserStatus = rs.getString("userauthentication");
                String createItemStatus = rs.getString("createitem");
                String updateItemStatus = rs.getString("updateitem");
                String deleteItemStatus = rs.getString("deleteitem");
                 String createpartyStatus = rs.getString("createparty");
                String updatepartyStatus = rs.getString("updateparty");
                String deletepartyStatus = rs.getString("deleteparty");
                 String createchallanStatus = rs.getString("createchallan");
                String updatechallanStatus = rs.getString("updatechallan");
                String deletechallanStatus = rs.getString("deletechallan");
                String printchallanStatus = rs.getString("printchallan");
 
                String createinvoiceStatus = rs.getString("createinvoice");
                String updateinvoiceStatus = rs.getString("updateinvoice");
                String deleteinvoiceStatus = rs.getString("deleteinvoice");
                String printinvoiceStatus = rs.getString("printinvoice");
               
                item.setBlockedStatus(blockedStatus);
                item.setCreateUserStatus(createUserStatus);
                item.setUpdateUserStatus(updateUserStatus);
                item.setDeleteUserStatus(deleteUserStatus);
                item.setCreateItemStatus(createItemStatus);
                item.setUpdateItemStatus(updateItemStatus);
                item.setDeleteItemStatus(deleteItemStatus);
                 item.setCreatepartyStatus(createpartyStatus);
                item.setUpdatepartyStatus(updatepartyStatus);
                item.setDeletepartyStatus(deletepartyStatus);
                 item.setCreatechallanStatus(createchallanStatus);
                item.setUpdatechallanStatus(updatechallanStatus);
                item.setDeletechallanStatus(deletechallanStatus);
                 item.setCreateinvoiceStatus(createinvoiceStatus);
                item.setUpdateinvoiceStatus(updateinvoiceStatus);
                item.setDeleteinvoiceStatus(deleteinvoiceStatus);
                                item.setPrintinvoiceStatus(printinvoiceStatus);
                                item.setPrintchallanStatus(printchallanStatus);

                item.setAuthenticationUserStatus(authenticationUserStatus);

                item.setBlockedCheckedUncheck(blockedStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setCreateUserCheckedUncheck(createUserStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setUpdateUserCheckedUncheck(updateUserStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setDeleteUserCheckedUncheck(deleteUserStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setCreateItemCheckedUncheck(createItemStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setUpdateItemCheckedUncheck(updateItemStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setDeleteItemCheckedUncheck(deleteItemStatus.equalsIgnoreCase("Y") ? "checked" : "");
                 item.setCreatepartyCheckedUncheck(createpartyStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setUpdatepartyCheckedUncheck(updatepartyStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setDeletepartyCheckedUncheck(deletepartyStatus.equalsIgnoreCase("Y") ? "checked" : "");
                 item.setCreatechallanCheckedUncheck(createchallanStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setUpdatechallanCheckedUncheck(updatechallanStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setDeletechallanCheckedUncheck(deletechallanStatus.equalsIgnoreCase("Y") ? "checked" : "");
                 item.setCreateinvoiceCheckedUncheck(createinvoiceStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setUpdateinvoiceCheckedUncheck(updateinvoiceStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setDeleteinvoiceCheckedUncheck(deleteinvoiceStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setAuthenticationUserCheckedUncheck(authenticationUserStatus.equalsIgnoreCase("Y") ? "checked" : "");
                               item.setPrintchallanCheckedUncheck(printchallanStatus.equalsIgnoreCase("Y") ? "checked" : "");
                item.setPrintinvoiceCheckedUncheck(printinvoiceStatus.equalsIgnoreCase("Y") ? "checked" : "");

                list.add(item);
                item = null;

            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }
        return list;
    }

    public static User getUsersListDetail(String username, String branch, String usertype, String limit, String search) {
        User item = new User();
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            String snoquery = username.equalsIgnoreCase("") || username.equalsIgnoreCase("select") ? "" : " and login.username='" + username + "'";
            String userquery = branch.equalsIgnoreCase("") || branch.equalsIgnoreCase("select") ? "" : " and user_banch.branch='" + branch + "'";
            String limitquery = limit.equalsIgnoreCase("") || branch.equalsIgnoreCase("0") ? "" : " ASC limit " + limit + " ";
            String searchquery = search.equalsIgnoreCase("") || search.equalsIgnoreCase("select") ? "" : " and login.employeename like '%" + search + "%'";

            if (usertype.equalsIgnoreCase("A")) {
                userquery = "";
            }
            PreparedStatement ps = con.prepareStatement("SELECT login.username,login.`password`,login.spass,login.mobile,login.designation,login.usertype,login.employeename,user_banch.branch FROM `login` INNER JOIN user_banch on user_banch.username=login.username where login.username is not null" + snoquery + userquery + searchquery + " order by login.username  " + limitquery + " ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                item.setName(rs.getString("employeename"));
                item.setUserName(rs.getString("username"));
                item.setPassword(rs.getString("password"));
                item.setSecurityPassword(rs.getString("spass"));
                item.setMobile(rs.getString("mobile"));
                item.setDesignation(rs.getString("designation"));
                item.setUserType(rs.getString("usertype"));
                item.setBranch(rs.getString("branch"));
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }
        return item;
    }

}
