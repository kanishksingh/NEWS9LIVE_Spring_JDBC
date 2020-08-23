/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Controller;

import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import com.mycompany.news9live_spring_jdbc.Beans.User;
import com.mycompany.news9live_spring_jdbc.Dao.UserDao;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author KANISHK
 */
@Controller
public class UserController {

    @Autowired
    UserDao udao;

    @RequestMapping("/newuser")
    public String AddUser(Model m, HttpSession session) {
        m.addAttribute("msg", "Create New  User");
        List<User> br1 = udao.getBranchUserWise(session.getAttribute("uname").toString());
        m.addAttribute("branchlist", br1);
        List<User> userslist = udao.getUsersList("", "", "U", "", "");
        m.addAttribute("usrslist", userslist);

        return "NewUser";
    }

    @RequestMapping(value = "/saveuser", method = RequestMethod.POST)
    public ModelAndView saveMenu(@RequestParam("name") String name, @RequestParam("mob") String mob, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("designation") String designation, @RequestParam("branch") String branch, HttpSession session) {
        ModelAndView model = new ModelAndView("NewUser");
        boolean result = udao.useralreadyExist(branch, username);
        model.addObject("msg", "Create New  User");

        if (result == true) {
            model.addObject("msg", "User Name Already Exist for this Branch !!!");

        } else {
            int status = udao.saveuser(name, mob, username, password, designation, branch);
            if (status == 1) {
                int savebranch = udao.saveuserbranch(username, branch);

                String message = "User Saved successfully and branch assigned also";
                List<User> br1 = udao.getBranchUserWise(session.getAttribute("uname").toString());
                model.addObject("branchlist", br1);
                model.addObject("msg", message);
            } else {
                String message = "Sorry Something Is Wrong";
                model.addObject("msg", message);
            }
        }
        return model;//will redirect to viewemp request mapping  
    }
}
