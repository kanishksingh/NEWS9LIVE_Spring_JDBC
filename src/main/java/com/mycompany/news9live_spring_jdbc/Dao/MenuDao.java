/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Dao;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author KANISHK
 */
public class MenuDao {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int saveMenu(Menu p) {
        String sql = "insert into mastermenu (menuname) values('" + p.getMenuName() + "')";
        return template.update(sql);
    }

    public int updateMenu(Menu p) {
        String sql = "update mastermenu set menuname='" + p.getMenuName() + "',hide_show='" + p.getHide_show() + "' where sno=" + p.getSno() + "";
        return template.update(sql);
    }

    public int deleteMenu(int id) {
        String sql = "delete from mastermenu where sno=" + id + "";
        return template.update(sql);
    }

    public Menu getMenuById(int id) {
        String sql = "select * from mastermenu where sno=?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Menu>(Menu.class));
    }

    public List<Menu> getMenuList() {
        return template.query("select * from mastermenu", new RowMapper<Menu>() {
            public Menu mapRow(ResultSet rs, int row) throws SQLException {
                Menu e = new Menu();
                e.setSno(rs.getInt(1));
                e.setMenuName(rs.getString(2));
                e.setHide_show(rs.getString(3));
                return e;
            }
        });
    }

//Sub Menu
    public static List<Menu> getMenus() {
        List<Menu> list = new ArrayList();
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            con = Utils.ConnectionUtils.getConnection();

            ps = con.prepareStatement("select * from mastermenu where sno is not null and hide_show='Y' order by sno asc limit 10");
            rs = ps.executeQuery();
            while (rs.next()) {
                Menu party1 = new Menu();
                party1.setSno(rs.getInt(1));
                party1.setMenuName(rs.getString(2));

                list.add(party1);

            }

        } catch (Exception e) {
            System.err.println("Failed at getPartyDetails() " + e.toString());
        } finally {

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }

        return list;
    }
  public static List<Menu> getMenusPublished() {
        List<Menu> list = new ArrayList();
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            con = Utils.ConnectionUtils.getConnection();

            ps = con.prepareStatement("select mastermenu.sno,mastermenu.menuname,menupublish.menusno,menupublish.sno as menupublishedsno,menupublish.submenus from mastermenu inner join menupublish on menupublish.menusno=mastermenu.sno where hide_show='Y' order by mastermenu.sno asc ");
            rs = ps.executeQuery();
            while (rs.next()) {
                Menu party1 = new Menu();
                party1.setSno(rs.getInt("menupublishedsno"));
                party1.setMenuName(rs.getString("menuname"));
                party1.setMenuSno(rs.getInt("menusno"));
                party1.setSubMenuName(rs.getString("submenus"));

                list.add(party1);

            }

        } catch (Exception e) {
            System.err.println("Failed at getPartyDetails() " + e.toString());
        } finally {

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }

        return list;
    }
 
    public  List<Menu> getSubMenuByMenu(int menusno) {
        List<Menu> list = new ArrayList();
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            con = Utils.ConnectionUtils.getConnection();

            ps = con.prepareStatement("select master_submenu.sno,master_submenu.menusno,master_submenu.submenuname,mastermenu.menuname from master_submenu inner join mastermenu on mastermenu.sno=master_submenu.menusno where master_submenu.menusno=? and master_submenu.hide_show='Y'");
            ps.setInt(1, menusno);
            rs = ps.executeQuery();
            while (rs.next()) {
                Menu party1 = new Menu();
                party1.setSno(rs.getInt(1));
                party1.setMenuSno(rs.getInt(2));
                party1.setSubMenuName(rs.getString(3));
                party1.setMenuName(rs.getString(4));

                list.add(party1);

            }

        } catch (Exception e) {
            System.err.println("Failed at getPartyDetails() " + e.toString());
        } finally {

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }

        return list;
    }
    public List<Menu> getSubMenuList() {
        return template.query("select master_submenu.sno,master_submenu.menusno,master_submenu.submenuname,mastermenu.menuname,master_submenu.hide_show from master_submenu inner join mastermenu on mastermenu.sno=master_submenu.menusno", new RowMapper<Menu>() {
            public Menu mapRow(ResultSet rs, int row) throws SQLException {
                Menu e = new Menu();
                e.setSno(rs.getInt(1));
                e.setMenuSno(rs.getInt(2));
                e.setSubMenuName(rs.getString(3));
                e.setMenuName(rs.getString(4));
                e.setHide_show(rs.getString(5));

                return e;
            }
        });
    }

    public int saveSubMenu(String menu, String sub) {

        String sql = "insert into master_submenu (menusno,submenuname) values('" + menu + "','" + sub + "')";
        return template.update(sql);
    }

    public int updateSubMenu(String menu, String sub, int sno,String hideshow) {
        String sql = "update master_submenu set menusno='" + menu + "',submenuname='" + sub + "',hide_show='" + hideshow + "' where sno=" + sno + "";
        return template.update(sql);
    }

    public int deleteSubMenu(int id) {
        String sql = "delete from master_submenu where sno=" + id + "";
        return template.update(sql);
    }

    public Menu getSubMenuById(int id) {
        String sql = "select * from master_submenu where sno=?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Menu>(Menu.class));
    }
     public  Menu getSubMenuName1(int sno) {
        Menu party1 = new Menu();
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            con = Utils.ConnectionUtils.getConnection();

            ps = con.prepareStatement("select * from master_submenu where sno=?");
            ps.setInt(1, sno);
            rs = ps.executeQuery();
            while (rs.next()) {
                party1.setSno(rs.getInt(1));
                party1.setMenuSno(rs.getInt(2));
                party1.setSubMenuName(rs.getString(3));
            }

        } catch (Exception e) {
            System.err.println("Failed at getPartyDetails() " + e.toString());
        } finally {

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }

        return party1;
    }
 

    public static String getNavMenu() {
        String value = "";

        ArrayList<Menu> list = new ArrayList();
        ArrayList<Menu> list1 = new ArrayList();

        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        Connection con = null;
        ResultSet rs = null;
        ResultSet rs1 = null;

        try {

            con = Utils.ConnectionUtils.getConnection();
            ps = con.prepareStatement("select sno,menuname from mastermenu");

            rs = ps.executeQuery();
            while (rs.next()) {
                Menu party = new Menu();
                party.setSno(rs.getInt(1));
                party.setMenuName(rs.getString(2));
                ps1 = con.prepareStatement("select master_submenu.sno,master_submenu.menusno,master_submenu.submenuname,mastermenu.menuname from master_submenu inner join mastermenu on mastermenu.sno=master_submenu.menusno where master_submenu.menusno='" + rs.getInt(1) + "'");

                rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    Menu party1 = new Menu();
                    party1.setSno(rs1.getInt(1));
                    party1.setMenuSno(rs1.getInt(2));
                    party1.setSubMenuName(rs1.getString(3));
                    party1.setMenuName(rs1.getString(4));

                    list1.add(party1);

                }

                list.add(party);
//                party = null;

            }
            Gson gson = new Gson();
            String menulist = gson.toJson(list, new TypeToken<ArrayList<Menu>>() {
            }.getType());
            JSONArray jsonmenulist = new JSONArray(menulist);
            String submenulist = gson.toJson(list1, new TypeToken<ArrayList<Menu>>() {
            }.getType());
            JSONArray jsonsubmenulist = new JSONArray(submenulist);
            JSONObject combined = new JSONObject();
            combined.put("Menulist", jsonmenulist);
            combined.put("SubMenu", (jsonsubmenulist));

            value = combined.toString();

        } catch (Exception e) {
            System.err.println("Failed at getPartyDetails() " + e.toString());
        } finally {
            if (rs != null || rs1 != null) {
                try {
                    rs.close();
                    rs1.close();

                } catch (Exception e) {
                }
            }
            if (ps != null || ps1 != null) {
                try {
                    ps.close();
                    ps1.close();

                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }

        return value;
    }

    public static void main(String[] args) {

//        System.out.println(getSubMenuByMenu(15));
    }

}
