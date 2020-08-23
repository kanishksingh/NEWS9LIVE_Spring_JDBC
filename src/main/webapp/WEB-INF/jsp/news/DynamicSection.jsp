<%-- 
    Document   : DynamicSection
    Created on : 17 Jul, 2020, 10:15:08 PM
    Author     : KANISHK
--%>

<%@page import="com.mycompany.news9live_spring_jdbc.Dao.NewsDao"%>
<%@page import="com.mycompany.news9live_spring_jdbc.Beans.News"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.news9live_spring_jdbc.Beans.Menu"%>
<%@page import="com.mycompany.news9live_spring_jdbc.Dao.MenuDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%int count1=0;

                            MenuDao dao=new MenuDao();
                        List<Menu> list = dao.getMenusPublished();
                        for(Menu e:list){                    
                        int menusno=e.getMenuSno();
                        String publissubmenus=e.getSubMenuName();
                       String[] submenus= publissubmenus.split(",");
                       int submenudef=Integer.parseInt(submenus[0]);
//                        String value="";        
//        Menu emp=mdao.getSubMenuById(menu);  
//value=emp.getSubMenuName();
int count=0;count1=count1+1;

                        %>
<div class="" id="MenuWiseSubmenuDatas">
                <div class="block-title-6">
                                <h3 class="panel-title h5 border-primary ">
                                    <span class="bg-primary text-white"><%=e.getMenuName()%></span>
                                </h3>
                                
                    <span class="pull-right">
                        <!-- Tabs -->
                        <ul class="nav panel-tabs bg-primary text-white ">
                            <%
                                NewsDao newsdaodef=new NewsDao();     
List<News> nnlistdef = newsdaodef.viewKhabarByPage("",menusno,submenudef,0,6);

if(!publissubmenus.equalsIgnoreCase("0")){
                                for (String str : submenus){
                                Menu submenname=dao.getSubMenuName1(Integer.parseInt(str));  
                                String active="";count=count+1;
                                if(count==1){active="active";}
                            %>
                            <li class="<%=active%>"><a href="#tab<%=count%>" data-toggle="tab" onclick="TabDataTable<%=menusno%>('<%=menusno%>','<%=Integer.parseInt(str)%>','<%=count%>')"><%=submenname.getSubMenuName()%></a></li>
                            <%}}%>
                        </ul>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="tab-content" id="TabContentData<%=count1%>">
                        
<!--                        Default Data Load-->
                        
                        
<div class="tab-pane active" id="tab<%=count%>">
    <div class="row" style="width: 100%">
        <!--post left start-->
        <!--end post left-->
            <!--post list-->
            <%for(News e1: nnlistdef){%>
        <div class="col-md-6">

            <article class="card card-full hover-a mb-4">
                <div class="row">
                    <!--thumbnail-->
                    <div class="col-4 col-md-4 pr-2 pr-md-0">
                        <div class="ratio_115-80 image-wrapper">
                            <a href="newsdetail/<%=e.getSno()%>/<%=menusno%>">
                                <img class="img-fluid lazy" style="    height: 73px;" src="${pageContext.request.contextPath}/<%=e1.getFolderPath()%>/<%=e1.getImagefirstName()%>" data-src="${pageContext.request.contextPath}/<%=e1.getFolderPath()%>/<%=e1.getImagefirstName()%>" alt="<%=e1.getImagefirstName()%>">
                            </a>
                        </div>
                    </div>
                    <!-- title & date -->
                    <div class="col-8 col-md-8">
                        <div class="card-body pt-0">
                            <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="newsdetail/<%=e1.getSno()%>/<%=menusno%>"><%=e1.getTitle()%></a>
                            </h3>
                            <div class="card-text small text-muted">
                                <time datetime="<%=e1.getEnteredOn()%>"><%=e1.getEnteredOn()%></time>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
            <!--post list-->
                    </div>

           <%}%>
         
     
        <!--end post right list-->
    </div>
           <div class="pull-right"><a href="CategorywiseNews/<%=menusno%>"><b>और देखो</b></a></div>

</div>
      
                    
                    
                    
                    </div>
                </div>
            </div>
      <br><br>                      
<script>

    function TabDataTable<%=menusno%>(menu,submenu,count){
        var url="${pageContext.request.contextPath}/Tabdata.jsp?men="+menu+"&submen="+submenu+"&count="+count+"";
         $.ajax({
        url: url,
        type: "POST",
        success: function (receipts) {           
            $("#TabContentData<%=count1%>").empty();
            $("#TabContentData<%=count1%>").append(receipts);
        }
    });
    }
</script>
<%}%>
