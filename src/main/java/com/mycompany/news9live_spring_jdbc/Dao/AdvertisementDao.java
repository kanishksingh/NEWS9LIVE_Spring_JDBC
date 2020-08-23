/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Dao;

import com.mycompany.news9live_spring_jdbc.Beans.Breaking;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author KANISHK
 */
public class AdvertisementDao {
     JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
 public List<Breaking> getAdvertisementList() {
        return template.query("select * from master_breaking", new RowMapper<Breaking>() {
            public Breaking mapRow(ResultSet rs, int row) throws SQLException {
                Breaking e = new Breaking();
                e.setSno(rs.getInt(1));
                e.setBnews(rs.getString(2));
                return e;
            }
        });
    }

    public int saveAdvertisement(String news) {
        String sql = "insert into master_breaking (breaking) values('" + news + "')";
        return template.update(sql);
    }
public int deleteAdvertisement(int id){  
    String sql="delete from master_breaking where sno="+id+"";  
    return template.update(sql);  
} 
}
