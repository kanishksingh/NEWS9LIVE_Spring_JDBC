/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Controller;

import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import com.mycompany.news9live_spring_jdbc.Dao.MenuDao;
import java.util.List;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class MenuController {

    @Autowired
    MenuDao dao;//will inject dao from xml file  

    @RequestMapping("/newmenu")
    public String gotoMenu(Model m) {
        List<Menu> list = dao.getMenuList();
        m.addAttribute("menulist", list);
        return "NewMenu";
    }
    
    @RequestMapping(value = "/savemenu", method = RequestMethod.POST)
    public ModelAndView saveMenu(@ModelAttribute("menuform") Menu emp) {
        ModelAndView model = new ModelAndView("NewMenu");
        if (emp.getMenuName().equalsIgnoreCase("")) {
            String message = "Please Enter Menu Name";
            model.addObject("msg", message);

        } else {
            int status = dao.saveMenu(emp);
            if (status == 1) {
                String message = "Saved successfully";
                List<Menu> list = dao.getMenuList();
                model.addObject("menulist", list);
                model.addObject("msg", message);
            } else {
                String message = "Sorry Something Is Wrong";
                model.addObject("msg", message);
            }
        }
        return model;//will redirect to viewemp request mapping  
    }
   
    @RequestMapping(value = "/updatemenu", method = RequestMethod.POST)
    public ModelAndView updateMenu(@ModelAttribute("updatemenuform") Menu emp) {
        ModelAndView model = new ModelAndView("EditMenu");
        if (emp.getMenuName().equalsIgnoreCase("")) {
            String message = "Please Enter Menu Name";
            model.addObject("succmsg", message);

        } else {
            int status = dao.updateMenu(emp);
            if (status == 1) {
                String message = "Updated successfully";
                model.addObject("succmsg", message);
                 Menu emp2=dao.getMenuById(emp.getSno());  
        model.addObject("command",emp2);
            } else {
                String message = "Sorry Something Is Wrong";
                model.addObject("succmsg", message);
                Menu emp2=dao.getMenuById(emp.getSno());  
        model.addObject("command",emp2);
            }
        }
        return model;//will redirect to viewemp request mapping  
    }

   /* The @PathVariable puts URL data into variable.*/  
    @RequestMapping(value="/editmenu/{id}")  
    public String editmenu(@PathVariable int id, Model m){  
        Menu emp=dao.getMenuById(id);  
        m.addAttribute("command",emp);
        return "EditMenu";  
    } 
    
      /* The @PathVariable puts URL data into variable.*/  
   @RequestMapping(value="/deletemenu/{id}",method = RequestMethod.GET)  
    public String deleteMenu(@PathVariable int id){ 
        int status = dao.deleteMenu(id);
            if (status == 1) {
             
            } else {
               
               
            }
        return "redirect:/newmenu";  
    }
    
//submenu    Controller
     @RequestMapping("/newsubmenu")
    public String gotoSubMenu(Model m) {
          List<Menu> list1 = dao.getMenuList();
        m.addAttribute("menulists", list1);
        List<Menu> list = dao.getSubMenuList();
        m.addAttribute("submenulist", list);        
        return "NewSubMenu";
    }
    
    @RequestMapping(value = "/saveSubmenu", method = RequestMethod.POST)
    public ModelAndView saveSubMenu(@RequestParam("menulists") String menu, @RequestParam("submenuName") String sub) {
        ModelAndView model = new ModelAndView("NewSubMenu");
        if (menu.equalsIgnoreCase("") || menu.equalsIgnoreCase("0")) {
            String message = "Please Enter Menu Name";
            model.addObject("msg", message);

        } else  if (sub.equalsIgnoreCase("")) {
            String message = "Please Enter SubMenu Name";
            
            model.addObject("msg", message);

        } else {
            int status = dao.saveSubMenu(menu,sub);
            if (status == 1) {
                String message = "Saved successfully";
                 List<Menu> list1 = dao.getMenuList();
                model.addObject("menulists", list1);
                List<Menu> list = dao.getSubMenuList();
                model.addObject("submenulist", list);
                model.addObject("msg", message);
            } else {
                String message = "Sorry Something Is Wrong";
                model.addObject("msg", message);
            }
        }
        return model;//will redirect to viewemp request mapping  
    }
   
    @RequestMapping(value = "/updatesubmenu", method = RequestMethod.POST)
    public ModelAndView updateSubMenu(@RequestParam("menulists") String menu, @RequestParam("menuName") String sub,@RequestParam("sno") int sno,@RequestParam("hide_show") String hideshow) {
        ModelAndView model = new ModelAndView("EditSubMenu");
        if (menu.equalsIgnoreCase("") || menu.equalsIgnoreCase("0")) {
            String message = "Please Select Menu Name";
            model.addObject("succmsg", message);

        } else {
            int status = dao.updateSubMenu(menu,sub,sno,hideshow);
            if (status == 1) {
                String message = "Updated successfully";
                model.addObject("succmsg", message);
                 Menu emp2=dao.getSubMenuById(sno);  
        model.addObject("command",emp2);
           List<Menu> list1 = dao.getMenuList();
         model.addObject("menulists", list1);
            } else {
                String message = "Sorry Something Is Wrong";
                model.addObject("succmsg", message);
                   List<Menu> list1 = dao.getMenuList();
         model.addObject("menulists", list1);
                Menu emp2=dao.getSubMenuById(sno);  
        model.addObject("command",emp2);
            }
        }
        return model;//will redirect to viewemp request mapping  
    }

    @RequestMapping(value="/editsubmenu/{id}")  
    public String editSubmenu(@PathVariable int id, Model m){  
        Menu emp=dao.getSubMenuById(id);  
        m.addAttribute("command",emp);
         List<Menu> list1 = dao.getMenuList();
        m.addAttribute("menulists", list1);
        return "EditSubMenu";  
    } 
//    
//      /* The @PathVariable puts URL data into variable.*/  
   @RequestMapping(value="/deletesubmenu/{id}",method = RequestMethod.GET)  
    public String deleteSubMenu(@PathVariable int id){ 
        int status = dao.deleteSubMenu(id);
            if (status == 1) {
             
            } else {
               
               
            }
        return "redirect:/newsubmenu";  
    }
//    
}
