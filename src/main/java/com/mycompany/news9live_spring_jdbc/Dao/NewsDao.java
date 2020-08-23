/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Dao;

import Utils.RandomCaptcha;
import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import com.mycompany.news9live_spring_jdbc.Beans.News;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.swing.JOptionPane;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author KANISHK
 */
public class NewsDao {

    private String saveDirectory = "D:/News9Live_ProjectImages/KhabarImage/";

    @Autowired
    ServletContext context;

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public boolean AddNewKhabarjarahatke(MultipartFile rimage, String dateplace, String title, String Subheading, String content, String username) {

        Connection con = null;
        PreparedStatement ps = null;
        int rows = 0;
        boolean result = false;

        String random = RandomCaptcha.fastestRandomStringWithMixedCase(15);
        String currentdate = String.valueOf(java.time.LocalDate.now());
        String rimagefilename = "", rimagefilepath = "";
        long rimagesize = 0;
        String relativeWebPath = "/resources/Dynamic_FileAttachment/KhabarJaraHatke/";
        String absoluteFilePath = context.getRealPath("") + File.separator + relativeWebPath;

        String savePath = absoluteFilePath + File.separator + currentdate;
        System.err.println(savePath);
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        if (!rimage.isEmpty()) {
            try {
                byte[] bytes = rimage.getBytes();
                String basename = FilenameUtils.getBaseName(rimage.getOriginalFilename());
                String extension = FilenameUtils.getExtension(rimage.getOriginalFilename());
                rimagefilename = "khabarjarahatke" + random + "." + extension;
                rimagesize = rimage.getSize();
                rimagefilepath = savePath + File.separator + rimagefilename;
                File serverFile = new File(savePath + File.separator + rimagefilename);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.flush();
                stream.close();
            } catch (Exception e) {
                rimagefilename = "";
                rimagefilepath = "";
                rimagesize = 0;
            }
        }
        try {

            con = Utils.ConnectionUtils.getConnection();
            ps = con.prepareStatement("insert into master_khabarjarahatke (dateplace,title,subheading,content,folderpath,filename,filepath,enteredby,enteredon,filesize) values(?,?,?,?,?,?,?,?,NOW(),?)");

            ps.setString(1, dateplace);
            ps.setString(2, title);
            ps.setString(3, Subheading);
            ps.setString(4, content);
            ps.setString(5, relativeWebPath + File.separator + currentdate);
            ps.setString(6, rimagefilename);
            ps.setString(7, rimagefilepath);
            ps.setString(8, username);

            ps.setLong(9, rimagesize);

            rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;

            }
        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e.toString());
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
        return result;
    }

    public List<News> getKhabarjarahatke() {
        List<News> list = new ArrayList<>();
        String sql = "select sno,dateplace,title,subheading,content,folderpath,filename,filepath,enteredby,DATE_FORMAT(date(enteredon), '%M %d %Y'),filesize from master_khabarjarahatke order by sno desc ";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News e = new News();
                e.setSno(rs.getInt(1));
                e.setDatePlace(rs.getString(2));
                e.setTitle(rs.getString(3));
                e.setSubheading(rs.getString(4));
                e.setContent(rs.getString(5));
                e.setFolderPath(rs.getString(6));
                e.setReporterImageName(rs.getString(7));
                e.setReporterImagePath(rs.getString(8));

                e.setEnteredBy(rs.getString(9));
                e.setEnteredOn(rs.getString(10));
                list.add(e);
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }

        return list;

    }

    public boolean AddNewKhabar(MultipartFile rimage, MultipartFile imagefirst, String rname, String rdesignation, String dateplace, String title, String Subheading, String imagefirstcaption, String content, String username, int msno, String menulists, String submenulists, String aligement, String youtubelink, String tag) {

        Connection con = null;
        PreparedStatement ps = null;
        int rows = 0;
        boolean result = false;

        String random = RandomCaptcha.fastestRandomStringWithMixedCase(15);
        String currentdate = String.valueOf(java.time.LocalDate.now());
        String rimagefilename = "", rimagefilepath = "", image1name = "", image1path = "";
        long rimagesize = 0, image1size = 0;
        String relativeWebPath = "/resources/Dynamic_FileAttachment/Khabar/";
        String absoluteFilePath = context.getRealPath("") + File.separator + relativeWebPath;

        String savePath = absoluteFilePath + File.separator + currentdate;
        System.err.println(savePath);
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        if (!rimage.isEmpty()) {
            try {
                byte[] bytes = rimage.getBytes();
                String basename = FilenameUtils.getBaseName(rimage.getOriginalFilename());
                String extension = FilenameUtils.getExtension(rimage.getOriginalFilename());
                rimagefilename = "rimage" + random + "." + extension;
                rimagesize = rimage.getSize();
                rimagefilepath = savePath + File.separator + rimagefilename;
                File serverFile = new File(savePath + File.separator + rimagefilename);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.flush();
                stream.close();
            } catch (Exception e) {
                rimagefilename = "";
                rimagefilepath = "";
                rimagesize = 0;
            }
        }
        if (!imagefirst.isEmpty()) {
            try {
                byte[] bytes = imagefirst.getBytes();
                String basename = FilenameUtils.getBaseName(imagefirst.getOriginalFilename());
                String extension = FilenameUtils.getExtension(imagefirst.getOriginalFilename());
                image1name = "imagefirst" + random + "." + extension;
                image1size = rimage.getSize();
                image1path = savePath + File.separator + image1name;
                File serverFile = new File(savePath + File.separator + image1name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.flush();
                stream.close();
            } catch (Exception e) {
                image1name = "";
                image1path = "";
                image1size = 0;
            }
        }
        try {

            con = Utils.ConnectionUtils.getConnection();
            ps = con.prepareStatement("insert into master_khabar (rname,rdesignation,dateplace,title,subheading,content,folderpath,imagefirstname,imagefirstpath,imagefirstcaption,rimageName,rimagePath,enteredby,enteredon,rimagesize,image1size,sno,youtubevideolink,tags) values(?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,?,?,?,?)");

//            ps = con.prepareStatement("insert into master_khabar (reportername,reporterdesignation,dateplace,title,subheading,description,folderpath,imagefirstname,imagefirstpath,imagefirstcaption,reporterimageName,reporterImagePath,enteredby,rimagesize,image1size,enteredon,sno) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?)");
            ps.setString(1, rname);
            ps.setString(2, rdesignation);
            ps.setString(3, dateplace);
            ps.setString(4, title);
            ps.setString(5, Subheading);
            ps.setString(6, content);
            ps.setString(7, relativeWebPath + File.separator + currentdate);
            ps.setString(8, image1name);
            ps.setString(9, image1path);
            ps.setString(10, imagefirstcaption);
            ps.setString(11, rimagefilename);
            ps.setString(12, rimagefilepath);
            ps.setString(13, username);

            ps.setLong(14, rimagesize);
            ps.setLong(15, image1size);
            ps.setInt(16, msno);
                        ps.setString(17, youtubelink);
                        ps.setString(18, tag);


            rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
                int menusno = 0, submenusno = 0;
                try {
                    menusno = Integer.parseInt(menulists);
                } catch (Exception e) {
                    menusno = 0;
                }
                
                try {
                    submenusno = Integer.parseInt(submenulists);
                } catch (Exception e) {
                    submenusno = 0;
                }

                int stst = saveKhabarCategoryType(msno, menusno, submenusno, aligement);

            }
        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e.toString());
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
        return result;
    }

    public boolean UpdateNewKhabar(String rname, String rdesignation, String dateplace, String title, String Subheading, String imagefirstcaption, String content, String username, int sno, String youtubevideo,String tags) {

        Connection con = null;
        PreparedStatement ps = null;
        int rows = 0;
        boolean result = false;
        try {

            con = Utils.ConnectionUtils.getConnection();
            ps = con.prepareStatement("update master_khabar set rname=?,rdesignation=?,dateplace=?,title=?,subheading=?,content=?,imagefirstcaption=?,youtubevideolink=?,tags=? where sno=?");
            ps.setString(1, rname);
            ps.setString(2, rdesignation);
            ps.setString(3, dateplace);
            ps.setString(4, title);
            ps.setString(5, Subheading);
            ps.setString(6, content);
            ps.setString(7, imagefirstcaption);
            ps.setString(8, youtubevideo);
            ps.setString(9, tags);
            ps.setInt(10, sno);

            rows = ps.executeUpdate();
            if (rows > 0) {
                result = true;
            }
        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e.toString());
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
        return result;
    }

    public List<News> getKhabarByPage() {
        //   String menuquery=menu.equalsIgnoreCase("")?"":" and menusno='"+menu+"'";
        String sql = "SELECT sno,rname,rdesignation,dateplace,title,subheading,content,folderpath,rimageName,rimagePath,imagefirstname,imagefirstpath,imagefirstcaption,enteredby,date_format(date(enteredon),'%M %d , %Y'),youtubevideolink,tags FROM news9live.master_khabar order by sno desc ";
        return template.query(sql, new RowMapper<News>() {
            public News mapRow(ResultSet rs, int row) throws SQLException {
                News e = new News();
                e.setSno(rs.getInt(1));
                e.setrName(rs.getString(2));
                e.setrDesignation(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setTitle(rs.getString(5));
                e.setSubheading(rs.getString(6));
                e.setContent(rs.getString(7));
                e.setFolderPath(rs.getString(8));
                e.setReporterImageName(rs.getString(9));
                e.setReporterImagePath(rs.getString(10));
                e.setImagefirstName(rs.getString(11));
                e.setImagefirstpath(rs.getString(12));
//                e.setImagesecondName(rs.getString(13));
//                e.setImagesecondPath(rs.getString(14));
//                e.setImagethirdName(rs.getString(15));
//                e.setImagethirdPath(rs.getString(16));
                e.setImagefirstCaption(rs.getString(13));
//                e.setImagesecondCaption(rs.getString(18));
//                e.setImagethirdCaption(rs.getString(19));
                e.setEnteredBy(rs.getString(14));
                e.setEnteredOn(rs.getString(15));
                e.setYoutubeVideoLink(rs.getString(16));
                e.setTags(rs.getString(17));

                return e;
            }
        });
    }

    public News getKhabarById(int id) {
        String sql = "select * from master_khabar where sno=?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<News>(News.class));
    }

    public static News getKhabarById1(int id) {
        News e = new News();
        String sql = "SELECT sno,rname,rdesignation,dateplace,title,subheading,content,folderpath,rimageName,rimagePath,imagefirstname,imagefirstpath,imagefirstcaption,enteredby,date_format(date(enteredon),'%M %d, %Y'),youtubevideolink,tags,updatedby FROM news9live.master_khabar where sno=?";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                e.setSno(rs.getInt(1));
                e.setrName(rs.getString(2));
                e.setrDesignation(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setTitle(rs.getString(5));
                e.setSubheading(rs.getString(6));
                e.setContent(rs.getString(7));
                e.setFolderPath(rs.getString(8));
                e.setReporterImageName(rs.getString(9));
                e.setReporterImagePath(rs.getString(10));
                e.setImagefirstName(rs.getString(11));
                e.setImagefirstpath(rs.getString(12));
                e.setImagefirstCaption(rs.getString(13));

                e.setEnteredBy(rs.getString(14));
                e.setEnteredOn(rs.getString(15));
                e.setYoutubeVideoLink(rs.getString(16));
                e.setTags(rs.getString(17));
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e1) {
            System.out.println("POJO.UserDetail.getUsersList()" + e1);
        }

        return e;

    }

    public static News getKhabarByMenu(int id) {
        News e = new News();
        String sql = "SELECT sno,rname,rdesignation,dateplace,title,subheading,content,folderpath,rimageName,rimagePath,imagefirstname,imagefirstpath,imagefirstcaption,enteredby,date_format(date(enteredon),'%M %d, %Y'),updatedby FROM news9live.master_khabar where sno=?";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                e.setSno(rs.getInt(1));
                e.setrName(rs.getString(2));
                e.setrDesignation(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setTitle(rs.getString(5));
                e.setSubheading(rs.getString(6));
                e.setContent(rs.getString(7));
                e.setFolderPath(rs.getString(8));
                e.setReporterImageName(rs.getString(9));
                e.setReporterImagePath(rs.getString(10));
                e.setImagefirstName(rs.getString(11));
                e.setImagefirstpath(rs.getString(12));
                e.setImagefirstCaption(rs.getString(13));

                e.setEnteredBy(rs.getString(14));
                e.setEnteredOn(rs.getString(15));
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e1) {
            System.out.println("POJO.UserDetail.getUsersList()" + e1);
        }

        return e;

    }

    public News getKhabarCategoryById(int id) {
        String sql = "select * from khabar_publish where khabarsno=?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<News>(News.class));
    }

    public List<News> viewKhabarByPage(String aligment, int menusno, int submenusno, int khabarsno,int limit) {
        List<News> list = new ArrayList<>();
        String aligmentquery = aligment.equalsIgnoreCase("") ? "" : " and khabar_publish.aligement='" + aligment + "'";
        String menusnoquery = menusno > 0 ? " and khabar_publish.menusno='" + menusno + "'" : "";
        String submenusnoquery = submenusno > 0 ? " and khabar_publish.submenu='" + submenusno + "'" : "";
        String khabarsnoquery = khabarsno > 0 ? " and khabar_publish.khabarsno='" + khabarsno + "'" : "";
        String khabarLimitquery = limit > 0 ? " limit " + limit + "" : "";

        String sql = "select master_khabar.sno,master_khabar.rname,master_khabar.rdesignation,master_khabar.dateplace,master_khabar.title,master_khabar.subheading,master_khabar.content,master_khabar.folderpath,master_khabar.rimageName,master_khabar.rimagePath,master_khabar.imagefirstname,master_khabar.imagefirstpath,master_khabar.imagefirstcaption,master_khabar.enteredby,date_format(date(master_khabar.enteredon),'%M %d, %Y'),mastermenu.menuname,khabar_publish.menusno,khabar_publish.submenu,master_submenu.submenuname from master_khabar inner join khabar_publish on khabar_publish.khabarsno=master_khabar.sno left join mastermenu on mastermenu.sno=khabar_publish.menusno left join master_submenu on master_submenu.sno=khabar_publish.submenu where master_khabar.sno is not null ";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql + aligmentquery + menusnoquery + submenusnoquery + khabarsnoquery + "  order by master_khabar.sno desc "+khabarLimitquery+"");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News e = new News();
                e.setSno(rs.getInt(1));
                e.setrName(rs.getString(2));
                e.setrDesignation(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setTitle(rs.getString(5));
                e.setSubheading(rs.getString(6));
                e.setContent(rs.getString(7));
                e.setFolderPath(rs.getString(8));
                e.setReporterImageName(rs.getString(9));
                e.setReporterImagePath(rs.getString(10));
                e.setImagefirstName(rs.getString(11));
                e.setImagefirstpath(rs.getString(12));
//                e.setImagesecondPath(rs.getString(14));
//                e.setImagethirdName(rs.getString(15));
//                e.setImagethirdPath(rs.getString(16));
                e.setImagefirstCaption(rs.getString(13));
//                e.setImagesecondCaption(rs.getString(18));
//                e.setImagethirdCaption(rs.getString(19));
                e.setEnteredBy(rs.getString(14));
                e.setEnteredOn(rs.getString(15));
                e.setMenuName(rs.getString(16));
                e.setMenusno(rs.getInt(17));
                e.setSubmenu(rs.getInt(18));
                e.setSubMenuName(rs.getString(19));
                list.add(e);
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }

        return list;

    }
 public List<News> viewKhabarByMenuPublish(int menusno, int submenusno) {
        List<News> list = new ArrayList<>();
        String menusnoquery = menusno > 0 ? " and menupublish.menusno='" + menusno + "'" : "";
        String submenusnoquery = submenusno > 0 ? " and khabar_publish.submenu='" + submenusno + "'" : "";

        String sql = "select master_khabar.sno,master_khabar.rname,master_khabar.rdesignation,master_khabar.dateplace,master_khabar.title,master_khabar.subheading,master_khabar.content,master_khabar.folderpath,master_khabar.rimageName,master_khabar.rimagePath,master_khabar.imagefirstname,master_khabar.imagefirstpath,master_khabar.imagefirstcaption,master_khabar.enteredby,date_format(date(master_khabar.enteredon),'%M %d, %Y'),mastermenu.menuname,khabar_publish.menusno,khabar_publish.submenu,menupublish.submenus from master_khabar inner join khabar_publish on khabar_publish.khabarsno=master_khabar.sno inner join menupublish on menupublish.menusno=khabar_publish.menusno left join mastermenu on mastermenu.sno=khabar_publish.menusno where master_khabar.sno is not null ";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql  + menusnoquery + submenusnoquery  + "  order by menupublish.sno asc ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News e = new News();
                e.setSno(rs.getInt(1));
                e.setrName(rs.getString(2));
                e.setrDesignation(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setTitle(rs.getString(5));
                e.setSubheading(rs.getString(6));
                e.setContent(rs.getString(7));
                e.setFolderPath(rs.getString(8));
                e.setReporterImageName(rs.getString(9));
                e.setReporterImagePath(rs.getString(10));
                e.setImagefirstName(rs.getString(11));
                e.setImagefirstpath(rs.getString(12));
//                e.setImagesecondPath(rs.getString(14));
//                e.setImagethirdName(rs.getString(15));
//                e.setImagethirdPath(rs.getString(16));
                e.setImagefirstCaption(rs.getString(13));
//                e.setImagesecondCaption(rs.getString(18));
//                e.setImagethirdCaption(rs.getString(19));
                e.setEnteredBy(rs.getString(14));
                e.setEnteredOn(rs.getString(15));
                e.setMenuName(rs.getString(16));
                e.setMenusno(rs.getInt(17));
                e.setSubmenu(rs.getInt(18));
                e.setSubMenuName(rs.getString(19));
                list.add(e);
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }

        return list;

    }

    public List<News> viewKhabarByPage1(String aligment, int menusno, int submenusno, int khabarsno) {
        List<News> list = new ArrayList<>();
        String aligmentquery = aligment.equalsIgnoreCase("") ? "" : " and khabar_publish.aligement='" + aligment + "'";
        String menusnoquery = menusno > 0 ? " and khabar_publish.menusno='" + menusno + "' and khabar_publish.khabarsno!='" + khabarsno + "'" : "";
        String submenusnoquery = submenusno > 0 ? " and khabar_publish.submenu='" + submenusno + "'" : "";
//        String khabarsnoquery=khabarsno>0 ?" and khabar_publish.khabarsno='"+khabarsno+"'":"";

        String sql = "select master_khabar.sno,master_khabar.rname,master_khabar.rdesignation,master_khabar.dateplace,master_khabar.title,master_khabar.subheading,master_khabar.content,master_khabar.folderpath,master_khabar.rimageName,master_khabar.rimagePath,master_khabar.imagefirstname,master_khabar.imagefirstpath,master_khabar.imagefirstcaption,master_khabar.enteredby,date_format(date(master_khabar.enteredon),'%M %d, %Y'),mastermenu.menuname,khabar_publish.menusno,khabar_publish.submenu from master_khabar inner join khabar_publish on khabar_publish.khabarsno=master_khabar.sno left join mastermenu on mastermenu.sno=khabar_publish.menusno where master_khabar.sno is not null ";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql + aligmentquery + menusnoquery + submenusnoquery + "  order by master_khabar.sno desc ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News e = new News();
                e.setSno(rs.getInt(1));
                e.setrName(rs.getString(2));
                e.setrDesignation(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setTitle(rs.getString(5));
                e.setSubheading(rs.getString(6));
                e.setContent(rs.getString(7));
                e.setFolderPath(rs.getString(8));
                e.setReporterImageName(rs.getString(9));
                e.setReporterImagePath(rs.getString(10));
                e.setImagefirstName(rs.getString(11));
                e.setImagefirstpath(rs.getString(12));
//                e.setImagesecondPath(rs.getString(14));
//                e.setImagethirdName(rs.getString(15));
//                e.setImagethirdPath(rs.getString(16));
                e.setImagefirstCaption(rs.getString(13));
//                e.setImagesecondCaption(rs.getString(18));
//                e.setImagethirdCaption(rs.getString(19));
                e.setEnteredBy(rs.getString(14));
                e.setEnteredOn(rs.getString(15));
                e.setMenuName(rs.getString(16));
                e.setMenusno(rs.getInt(17));
                e.setSubmenu(rs.getInt(18));
                list.add(e);
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }

        return list;

    }

    public static int getMaxKhabarSno() {
        int ino = 0;
        try {

            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement("select max(sno) from master_khabar");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ino = rs.getInt(1);
            }
            con.close();
            ps.close();
            rs.close();
        } catch (Exception e) {
            System.err.println("Failed at getMaxKhabarSno() " + e.toString());
        }
        return ino + 1;
    }

    public int saveKhabarCategoryType(int khabarsno, int menusno, int submenusno, String aligement) {

        String sql = "insert into khabar_publish (khabarsno,menusno,submenu,aligement,enteredon) values('" + khabarsno + "','" + menusno + "','" + submenusno + "','" + aligement + "',NOW())";
        return template.update(sql);
    }

    public int deleteKhabarPublish(int id) {
        String sql = "delete from khabar_publish where khabarsno=" + id + "";
        return template.update(sql);
    }

    public int deleteKhabar(int id) {
        News khabar = getKhabarById(id);
        String rimgpath = khabar.getReporterImagePath();
        String imagefirst = khabar.getImagefirstpath();
        try {
            File file = new File(rimgpath);
            if (file.delete()) {
                System.out.println(file.getName() + " is deleted!");
            } else {
                System.out.println("Delete operation is failed.");
            }
        } catch (Exception e) {
            System.out.println("Failed to Delete image !!");
        }
        try {
            File file1 = new File(imagefirst);
            if (file1.delete()) {
                System.out.println(file1.getName() + " is deleted!");
            } else {
                System.out.println("Delete operation is failed.");
            }
        } catch (Exception e) {
            System.out.println("Failed to Delete image !!");
        }

        String sql = "delete from master_khabar where sno=" + id + "";
        return template.update(sql);
    }

    public int deletespecialVideo(int id) {
        String sql = "delete from special_video where sno=" + id + "";
        return template.update(sql);
    }

    public int savespecialVideolink(String videolink, String title, String dateplace, String username, String publish) {
        String sql = "insert into special_video (videolink,title,dateplace,enteredby,publish,enteredon) values('" + videolink + "','" + title + "','" + dateplace + "','" + username + "','" + publish + "',NOW())";
        return template.update(sql);
    }

    public int updatespecialVideolink(String videolink, String title, String dateplace, String username, String publish, int id) {

        String sql = "update special_video set videolink='" + videolink + "',title='" + title + "',dateplace='" + dateplace + "',publish='" + publish + "',updatedon=NOW(),enteredon=NOW() where sno='" + id + "'";
        return template.update(sql);
    }

    public List<News> getSpecialvideos() {
        List<News> list = new ArrayList<>();
        String sql = "select sno,videolink,title,dateplace,enteredby,publish,date_format(date(enteredon),'%M %d ,%Y') from special_video where sno is not  null ";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql + "  order by sno desc ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News e = new News();
                String status = rs.getString(6);
                e.setSno(rs.getInt(1));
                e.setVideoLink(rs.getString(2));
                e.setTitle(rs.getString(3));
                e.setDatePlace(rs.getString(4));

                e.setEnteredBy(rs.getString(5));
                e.setPublish(status.equalsIgnoreCase("Y") ? "YES" : "NO");
                e.setStatus(rs.getString(6));
                e.setEnteredOn(rs.getString(7));
                list.add(e);
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("POJO.UserDetail.getUsersList()" + e);
        }

        return list;

    }

    public static News getSpecialvideosDetail(int id) {
        News e = new News();
        String sql = "select sno,videolink,title,dateplace,enteredby,publish,date_format(date(enteredon),'%M %d ,%Y') from special_video where sno=?";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String status = rs.getString(6);
                e.setSno(rs.getInt(1));
                e.setVideoLink(rs.getString(2));
                e.setTitle(rs.getString(3));
                e.setDatePlace(rs.getString(4));

                e.setEnteredBy(rs.getString(5));
                e.setPublish(status.equalsIgnoreCase("Y") ? "YES" : "NO");
                e.setStatus(rs.getString(6));
                e.setEnteredOn(rs.getString(7));
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e1) {
            System.out.println("POJO.UserDetail.getUsersList()" + e1);
        }

        return e;

    }

    public static News getLastSpecialvideosPublish() {
        News e = new News();
        String sql = "select sno,videolink,title,dateplace,enteredby,publish,date_format(date(enteredon),'%M %d ,%Y') from special_video where publish='Y' order by enteredon desc";
        try {
            Connection con = Utils.ConnectionUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String status = rs.getString(6);
                e.setSno(rs.getInt(1));
                e.setVideoLink(rs.getString(2));
                e.setTitle(rs.getString(3));
                e.setDatePlace(rs.getString(4));
                e.setEnteredBy(rs.getString(5));
                e.setPublish(status.equalsIgnoreCase("Y") ? "YES" : "NO");
                e.setStatus(rs.getString(6));
                e.setEnteredOn(rs.getString(7));
            }
            con.close();
            rs.close();
            ps.close();
        } catch (Exception e1) {
            System.out.println("POJO.UserDetail.getUsersList()" + e1);
        }

        return e;

    }
 public int savePublishwholemenu(int menu, String submenu) {
        String sql = "insert into menupublish (menusno,submenus) values('" + menu + "','" + submenu + "')";
        return template.update(sql);
    }
//    
//    private static void getEmployees()
//{
//    final String uri = "http://localhost:8080/springrestexample/employees";
//     
//    RestTemplate restTemplate = new RestTemplate();
//     
//    HttpHeadersaders headers = new HttpHeaders();
//    headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
//    HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
//     
//    ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
//     
//    System.out.println(result);
//}
    public static void main(String[] args) {
//    NewsDao newsdao=new NewsDao();
//              List<News> nlist = newsdao.getKhabarjarahatke();

        System.err.println(getKhabarById1(2).getTitle());
    }
}
