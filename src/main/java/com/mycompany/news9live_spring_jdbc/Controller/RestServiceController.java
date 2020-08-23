/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Controller;

import com.mycompany.news9live_spring_jdbc.Dao.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author KANISHK
 */
@RestController
public class RestServiceController {
      @Autowired
    MenuDao mdao;//will inject dao from xml file  
    
      @RequestMapping(value = "/NavbarMenu", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String getNavBar() {
		String filelistdata = null;
          try {
                      filelistdata = mdao.getNavMenu();
          } catch (Exception e) {
          }
        return filelistdata;
    }
}
