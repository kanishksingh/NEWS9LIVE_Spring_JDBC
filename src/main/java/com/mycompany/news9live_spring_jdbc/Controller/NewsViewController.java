/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.news9live_spring_jdbc.Controller;

import com.mycompany.news9live_spring_jdbc.Beans.Breaking;
import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import com.mycompany.news9live_spring_jdbc.Beans.News;
import static com.mycompany.news9live_spring_jdbc.Controller.NewsController.APPLICATION_JSON_UTF8_VALUE;
import com.mycompany.news9live_spring_jdbc.Dao.BreakingDao;
import com.mycompany.news9live_spring_jdbc.Dao.NewsDao;
import com.mycompany.news9live_spring_jdbc.Dao.NewsViewDao;
import java.io.IOException;
import java.util.List;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author KANISHK
 */
@Controller
public class NewsViewController {

    @Autowired
    BreakingDao dao;//will inject dao from xml file  

    @Autowired
    NewsViewDao ndao;//will inject dao from xml file  
     @Autowired
    NewsDao newsdao;//will inject dao from xml file  

    @RequestMapping("/")
    public String ViewNews(Model m) {
        m.addAttribute("msg", "Welcome to News9Live");
        List<Breaking> list = dao.getBreakingList();
        m.addAttribute("blist", list);
          List<News> nlist = newsdao.viewKhabarByPage("TS",0,0,0,5);
        m.addAttribute("sliderkhabar", nlist);
         List<News> nnlist = newsdao.viewKhabarByPage("TR",0,0,0,4);
        m.addAttribute("rightkhabar", nnlist);
         List<News> special = newsdao.getSpecialvideos();
        m.addAttribute("specialvideo", special);
        List<News> kjlist = newsdao.getKhabarjarahatke();
        m.addAttribute("khararhatke", kjlist);

        return "newshome";
    }
     @RequestMapping("/newsdetail/{id}/{msno}")
    public String newsDetail(@PathVariable int id,@PathVariable int msno, Model m) {
        News khabar = newsdao.getKhabarById1(id);
        m.addAttribute("khabardetail", khabar);
        m.addAttribute("menusno", msno);
        m.addAttribute("khabarsno", id);

        m.addAttribute("news", "Detail News");

        return "detailnews";
    }
    
       @RequestMapping(value = "/relatednews/{msno}/{ksno}", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    List<News> relatednewsDetail(@PathVariable int msno,@PathVariable int ksno, Model m) {
        List<News> khabarlist = newsdao.viewKhabarByPage1("",msno,0,ksno);
        return khabarlist;
    }
    
      @RequestMapping(value = "/newsvideo", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    String newsspecialvideo(Model m) throws IOException, JSONException {
        News khabar = newsdao.getLastSpecialvideosPublish();
        ObjectMapper userinfo = new ObjectMapper();
			String newsvideo = userinfo.writeValueAsString(khabar);
                        return newsvideo;
    }
    
    
}
