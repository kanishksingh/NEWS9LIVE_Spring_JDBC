/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Controller;

import com.mycompany.news9live_spring_jdbc.Dao.AdvertisementDao;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author KANISHK
 */
@Controller
public class AdvertisementController {
    
       @Autowired
    AdvertisementDao dao;//will inject dao from xml file  

    @RequestMapping("/CreateAdvertisement")
    public String AddAdvertisement(Model a) {
        return "createnewAdvertisement";
    }
}
