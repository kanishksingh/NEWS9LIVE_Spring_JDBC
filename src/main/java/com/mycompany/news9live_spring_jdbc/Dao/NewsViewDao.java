/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Dao;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author KANISHK
 */
public class NewsViewDao {
     JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
}
