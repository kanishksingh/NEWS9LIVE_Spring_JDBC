/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Beans;

/**
 *
 * @author KANISHK
 */
public class Breaking {
    private int sno;
    private String bnews;

    public String getBnews() {
        return bnews;
    }

    public void setBnews(String bnews) {
        this.bnews = bnews;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }
    
    
}
