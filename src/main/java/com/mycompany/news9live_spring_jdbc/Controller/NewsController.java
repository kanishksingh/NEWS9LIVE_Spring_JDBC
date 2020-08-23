package com.mycompany.news9live_spring_jdbc.Controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mycompany.news9live_spring_jdbc.Beans.Menu;
import com.mycompany.news9live_spring_jdbc.Beans.News;
import com.mycompany.news9live_spring_jdbc.Dao.MenuDao;
import com.mycompany.news9live_spring_jdbc.Dao.NewsDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class NewsController {

    public static final String APPLICATION_JSON_UTF8_VALUE = "application/json;charset=UTF-8";
    @Autowired
    NewsDao dao;//will inject dao from xml file  

    @Autowired
    MenuDao mdao;//will inject dao from xml file  

    @RequestMapping("/AddKhabar")
    public String AddKhabar(Model m) {
        m.addAttribute("news", "Add New  Khabar");
        List<Menu> list1 = mdao.getMenuList();
        m.addAttribute("menulists", list1);
        List<Menu> list = mdao.getSubMenuList();
        m.addAttribute("submenulist", list);
        return "AddKhabar";
    }

    @RequestMapping("/newscategory")
    public String AddAssignCategory(Model m) {
        m.addAttribute("news", "Published Khabar List");
        List<Menu> list1 = mdao.getMenuList();
        m.addAttribute("menulists", list1);
        return "AssignCategory";
    }

    @RequestMapping("/AddSpecialVideos")
    public String AddSpecialVideos(Model m) {
        m.addAttribute("news", "Add Special Videos");
        return "addspecialvideo";
    }

    @RequestMapping("/khabarjarahatke")
    public String Addkhabarjarahatke(Model m) {
        m.addAttribute("news", "Add New Khabar Jara Hat Ke");
        return "khabarjarahatke";
    }
     @RequestMapping("/publishmenu")
    public String publishmenu(Model m) {
          List<Menu> list1 = mdao.getMenuList();
        m.addAttribute("menulists", list1);
        m.addAttribute("news", "Publish Whole menu Data ");
        return "PublishWholeMenu";
    }

        @RequestMapping(value = "/Savekhabarjrahutk", method = RequestMethod.POST)
    public @ResponseBody
    String singlekhabarjrahatke(@RequestParam("file") MultipartFile file, @RequestParam("title") String title, @RequestParam("dateplace") String dateplace,
            @RequestParam("subheading") String subheading, @RequestParam("content") String content,HttpSession session)  throws IOException {
        String value = "";
        boolean status = dao.AddNewKhabarjarahatke(file, dateplace, title, subheading, content, session.getAttribute("uname").toString());
        if (status == true) {
            value = "true";
            System.err.println("value=" + value);
        } else {
            value = "false";
        }
        return value;
    }
    @RequestMapping(value = "/AddKhabarDetail", method = RequestMethod.POST)
    public @ResponseBody
    String singleFileUpload(@RequestParam("rimage") MultipartFile rimage, @RequestParam("rname") String rname, @RequestParam("rdesignation") String rdesignation,
            @RequestParam("dateplace") String dateplace, @RequestParam("title") String title, @RequestParam("Subheading") String Subheading,
            @RequestParam("imagefirst") MultipartFile imagefirst, @RequestParam("menulists") String menulists, @RequestParam("submenulists") String submenulists,
            @RequestParam("aligement") String aligement, @RequestParam("imagefirstcaption") String imagefirstcaption, @RequestParam("content") String content,@RequestParam("youtube") String youtube,@RequestParam("tag") String tag,
            HttpSession session)
            throws IOException {
        String value = "";
        int msno = dao.getMaxKhabarSno();
        boolean status = dao.AddNewKhabar(rimage, imagefirst, rname, rdesignation, dateplace, title, Subheading, imagefirstcaption, content, session.getAttribute("uname").toString(), msno,menulists,submenulists,aligement,youtube,tag);
        if (status == true) {
            value = "true";
            System.err.println("value=" + value);
        } else {
            value = "false";
        }
        return value;
    }

         @RequestMapping(value = "/UpdateSpecialVideo", method = RequestMethod.POST)
    public @ResponseBody
    String Updatingspecialvideo(@RequestParam("videolink") String videolink, @RequestParam("title") String title, @RequestParam("dateplace") String dateplace,
            HttpSession session,@RequestParam("publish") String publish,@RequestParam("ssno") int id)
            throws IOException {
        String value = "";
        try {
            int status = dao.updatespecialVideolink(videolink, title, dateplace, session.getAttribute("uname").toString(),publish,id);

            if (status > 0) {
                value = "true";
                System.err.println("value=" + value);
            } else {
                value = "false";
            }
        } catch (Exception e) {

        }

        return value;
    }
    @RequestMapping(value = "/SaveSpecialVideo", method = RequestMethod.POST)
    public @ResponseBody
    String Savingspecialvideo(@RequestParam("videolink") String videolink, @RequestParam("title") String title, @RequestParam("dateplace") String dateplace,
            HttpSession session,@RequestParam("publish") String publish)
            throws IOException {
        String value = "";
        try {
            int status = dao.savespecialVideolink(videolink, title, dateplace, session.getAttribute("uname").toString(),publish);

            if (status > 0) {
                value = "true";
                System.err.println("value=" + value);
            } else {
                value = "false";
            }
        } catch (Exception e) {

        }

        return value;
    }

    @RequestMapping(value = "/khabarreport")
    public String khabarrepo(Model m) {
        List<News> list = dao.getKhabarByPage();
        m.addAttribute("khabarreportlist", list);
        return "ReportKhabar";
    }

    /* The @PathVariable puts URL data into variable.*/
    @RequestMapping(value = "/editkhabar/{id}")
    public String editkhabar(@PathVariable int id, Model m) {
        News khabar = dao.getKhabarById(id);
        m.addAttribute("command", khabar);
        News khabarpublish = dao.getKhabarCategoryById(khabar.getSno());
        m.addAttribute("khabarpublish", khabarpublish);
        List<Menu> list1 = mdao.getMenuList();
        m.addAttribute("menulists", list1);
        List<Menu> list = mdao.getSubMenuList();
        m.addAttribute("submenulist", list);
        m.addAttribute("news", "Update Khabar");

        return "EditKhabar";
    }
    /* The @PathVariable puts URL data into variable.*/
    @RequestMapping(value = "/detailSpecialVideo/{id}")
    public String detailSpecialVideo(@PathVariable int id, Model m) {
        News khabar = dao.getSpecialvideosDetail(id);
        m.addAttribute("command", khabar);
      
        m.addAttribute("news", "Update Special Video's Detail");

        return "Editspecialvideo";
    }
    

    @RequestMapping(value = "/updateKhabarDetail", method = RequestMethod.POST)
    public @ResponseBody
    String updatekhabardetail(@RequestParam("rname") String rname, @RequestParam("rdesignation") String rdesignation,
            @RequestParam("dateplace") String dateplace, @RequestParam("title") String title, @RequestParam("Subheading") String Subheading,
            @RequestParam("imagefirstcaption") String imagefirstcaption, @RequestParam("content") String content, @RequestParam("sno") int sno,
            @RequestParam("menulists") int menulists, @RequestParam("submenulists") int submenulists,
            @RequestParam("aligement") String aligement,@RequestParam("youtube") String youtube,@RequestParam("tag") String tag, HttpSession session)
            throws IOException {
        String value = "";
        boolean status = dao.UpdateNewKhabar(rname, rdesignation, dateplace, title, Subheading, imagefirstcaption, content, session.getAttribute("uname").toString(), sno,youtube,tag);
        if (status == true) {
            value = "true";
        } else {
            value = "false";
        }
//        System.err.println( "status:"+status);
        return value;
    }

    /* The @PathVariable puts URL data into variable.*/
    @RequestMapping(value = "/deletkhabar/{id}", method = RequestMethod.GET)
    public String deleteMenu(@PathVariable int id) {
        int status = dao.deleteKhabar(id);

        dao.deleteKhabarPublish(id);
        return "redirect:/khabarreport";
    }

    @RequestMapping(value = "/deletSpecialVideo/{id}", method = RequestMethod.GET)
    public String deleteSpecialVideo(@PathVariable int id) {

        int status = dao.deletespecialVideo(id);

        return "redirect:/AddSpecialVideos";
    }

    // Handling multiple files upload request
//    @PostMapping("/multipleFileUpload")
//    public String multipleFileUpload(@RequestParam("file") MultipartFile[] files,
//            Model model) throws IOException {
//
//        // Save file on system
//        for (MultipartFile file : files) {
//            if (!file.getOriginalFilename().isEmpty()) {
//                BufferedOutputStream outputStream = new BufferedOutputStream(
//                        new FileOutputStream(
//                                new File(saveDirectory, file.getOriginalFilename())));
//
//                outputStream.write(file.getBytes());
//                outputStream.flush();
//                outputStream.close();
//            } else {
//                model.addAttribute("msg", "Please select at least one file..");
//                return "fileUploadForm";
//            }
//        }
//        model.addAttribute("msg", "Multiple files uploaded successfully.");
//        return "fileUploadForm";
//    }
    //API Call
    @RequestMapping(value = "/categorykhabarreport", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    String categorykhabarrepo(@RequestParam("menu") int menu, @RequestParam("submenu") int submenu,@RequestParam("type") String type) throws JSONException {
        String value = "";
        try {
            menu=menu;
        } catch (Exception e) {menu=0;
        }
        try {
            submenu=submenu;
        } catch (Exception e) {submenu=0;
        }
        List<News> list = dao.viewKhabarByPage(type, menu, submenu, 0,0);
        Gson gson = new Gson();
        String folderdata = gson.toJson(list, new TypeToken<ArrayList<News>>() {
        }.getType());
        JSONArray folderdataArray = new JSONArray(folderdata);
        JSONObject combined = new JSONObject();
        combined.put("khabarlist", folderdataArray);
        value = combined.toString();
        return value;
    }
      @RequestMapping(value = "/publishMenukhabarreport", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    String categorykhabarrepo() throws JSONException {
        String value = "";
       
        List<News> list = dao.viewKhabarByMenuPublish( 0, 0);
        Gson gson = new Gson();
        String folderdata = gson.toJson(list, new TypeToken<ArrayList<News>>() {
        }.getType());
        JSONArray folderdataArray = new JSONArray(folderdata);
        JSONObject combined = new JSONObject();
        combined.put("khabarlist", folderdataArray);
        value = combined.toString();
        return value;
    }

    @RequestMapping(value = "/SpecialVideos", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    List<News> specialreport() throws JSONException {
        List<News> list = dao.getSpecialvideos();
        return list;
    }
    
       @RequestMapping(value = "/Menubysubmenu/{menu}", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    List<Menu> categorykhabarrepo(@PathVariable int menu) throws JSONException {
        List<Menu> list = mdao.getSubMenuByMenu(menu);
        return list;
    }
     @RequestMapping(value = "/Khabarjarahatkereport", method = RequestMethod.POST, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    List<News> Khabarjarahatkereport() throws JSONException {
        List<News> list = dao.getKhabarjarahatke();
        return list;
    }
      @RequestMapping(value = "/PublishWholeMenuWithspecificsubmenus/{menu}/{submenu}", method = RequestMethod.POST)
    public @ResponseBody
    String PublishMenutoNewsDashboard(@PathVariable int menu,@PathVariable String submenu) throws JSONException {
        String value="";
        int publishmenustatus=dao.savePublishwholemenu(menu,submenu);
        if(publishmenustatus==1){value="true";}else{value="false";}
        return value;
    }
    @RequestMapping(value = "/SubmenuName/{menu}", method = RequestMethod.GET, produces = APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    String SubmenuName(@PathVariable int menu) throws JSONException {
String value="";        
        Menu emp=mdao.getSubMenuById(menu);  
value=emp.getSubMenuName();

        return value;
    }
    
    
}
