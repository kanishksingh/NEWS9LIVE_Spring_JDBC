/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Controller;

import com.mycompany.news9live_spring_jdbc.Beans.Breaking;
import com.mycompany.news9live_spring_jdbc.Dao.BreakingDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author KANISHK
 */
@Controller
public class BreakingNewsController {

    @Autowired
    BreakingDao dao;//will inject dao from xml file  

    @RequestMapping("/breaking")
    public String gotoMenu(Model m) {
        List<Breaking> list = dao.getBreakingList();
        m.addAttribute("blist", list);
        return "breakingnews";
    }

    @RequestMapping(value = "/savebreaking", method = RequestMethod.POST)
    public ModelAndView saveBreaking(@RequestParam("content") String menu) {
        ModelAndView model = new ModelAndView("breakingnews");
        if (menu.equalsIgnoreCase("")) {
            String message = "Please Enter Breaking Content";
            model.addObject("msg", message);
        } else {
            int status = dao.saveBreaking(menu);
            if (status == 1) {
                String message = "Saved successfully";
                List<Breaking> list = dao.getBreakingList();
                model.addObject("blist", list);
                model.addObject("msg", message);
            } else {
                String message = "Sorry Something Is Wrong";
                model.addObject("msg", message);
            }
        }
        return model;//will redirect to viewemp request mapping  
    }

    @RequestMapping(value = "/deletebreaking/{id}", method = RequestMethod.GET)
    public String deleteMenu(@PathVariable int id) {
        int status = dao.deleteBreaking(id);
        if (status == 1) {

        } else {

        }
        return "redirect:/breaking";
    }

}
