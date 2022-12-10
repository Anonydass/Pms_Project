<%-- 
    Document   : user_setting
    Created on : 07-Dec-2022, 11:54:07 am
    Author     : GAVASKAR S
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@include file="header.jsp" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="pms.menusetting"%>
<h1 class="h3 mb-4 text-gray-800">User Setting</h1>
<div class="row">
<div class="col-lg-12"> 
<%
String menucode="";
String menuname="";
String id=request.getParameter("id").toString();
    if(request.getParameter("option").toString().contains("edit"))
        {
            menusetting iu_menusetting=new menusetting();
            ResultSet resultSet = null; 
            iu_menusetting.id=id;
            resultSet = iu_menusetting.retrivewithid_menusetting();
            int sno=0;
            while(resultSet.next())
            {
                menucode=resultSet.getString("menucode");
                menuname=resultSet.getString("menuname");
            }
        }
                   
    if(request.getParameter("option").toString().contains("add") || request.getParameter("option").toString().contains("edit"))
        {           
%>
<form action="menusetting.jsp?option=" method="post">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
            <td align="right">Menu Code:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="menucode" value="<%=menucode%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Menu Name:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="menuname" value="<%=menuname%>" required=""/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="id" value="<%=id%>"/>
                <input  type="submit" name="save" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</div>
<%                               
    }
    else if(request.getParameter("option").toString().contains("delete"))
        {
            menusetting delete_menusetting=new menusetting();
            delete_menusetting.id=request.getParameter("id");
            String delete_message= delete_menusetting.delete_menusetting();
            out.println("<script type = 'text/javascript'>");
            out.println("window.alert('Data Deleted sucessfully')");
            out.println("window.location = 'menusetting.jsp?option=view&id=0'");
            out.println("</script>");
        }
    else if(request.getParameter("option").toString().contains("view"))
        {
%>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
        <center>
            <a href="menusetting.jsp?option=add&id=0" >Add Menu </a>
        </center>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Menu Code</th>
                        <th>Menu Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
            menusetting menuview=new menusetting();
            ResultSet resultSet = null;
            resultSet = menuview.retriveall_menusetting();
            int sno=0;
            while(resultSet.next())
            {
                sno=sno+1;

%>
                        <tr>
                            <td><%=sno%></td>
                            <td><%=resultSet.getString("menucode") %></td>
                            <td><%=resultSet.getString("menuname") %></td>
                            <td><a href="menusetting.jsp?option=edit&id=<%=resultSet.getString("id")%>">Edit</a>|<a href="menusetting.jsp?option=delete&id=<%=resultSet.getString("id")%>">Delete</a></td>
                        </tr>
<%
            }

%>
                    </tbody>
            </table>
        </div>
    </div>
</div>
<%
        }
        else
            {
%>
<%
               menusetting create_menusetting=new menusetting();
                create_menusetting.menucode=request.getParameter("menucode");
               create_menusetting.menuname=request.getParameter("menuname");
                create_menusetting.id=request.getParameter("id");
                String create_message="";
                    if(create_menusetting.id.equals("0"))
                        {
                            create_message=create_menusetting.create_menusetting();
                        }
                    else
                        {
                            create_message=create_menusetting.update_menusetting();
                        }
                if(create_message.contains("1"))
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('Menu Details saved sucessfully')");
                        out.println("window.location = 'menusetting.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
                else
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('Menu Details not saved')");
                        out.println("window.location = 'mensetting.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
            }
                                %>
        </div>
<%@include file="footer.jsp" %>
    </body>
</html>
