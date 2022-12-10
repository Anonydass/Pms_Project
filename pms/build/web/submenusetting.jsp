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
<%@page import="pms.submenusetting"%>
<h1 class="h3 mb-4 text-gray-800">Sub Menu Setting</h1>
<div class="row">
<div class="col-lg-12"> 
<%
String menucode="";
String submenuname="";
String url="";
String id=request.getParameter("id").toString();
    if(request.getParameter("option").toString().contains("edit"))
        {
            submenusetting iu_submenusetting=new submenusetting();
            ResultSet resultSet = null; 
            iu_submenusetting.id=id;
            resultSet = iu_submenusetting.retrivewithid_submenusetting();
            int sno=0;
            while(resultSet.next())
            {
                menucode=resultSet.getString("menucode");
                submenuname=resultSet.getString("submenuname");
                url=resultSet.getString("url");
            }
        }
                   
    if(request.getParameter("option").toString().contains("add") || request.getParameter("option").toString().contains("edit"))
        {           
%>
<form action="submenusetting.jsp?option=" method="post">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
            <td align="right">Menu Code:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="menucode" value="<%=menucode%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Sub Menu Name:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="submenuname" value="<%=submenuname%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">URL:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="url" value="<%=url%>" required=""/>
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
            submenusetting delete_submenusetting=new submenusetting();
            delete_submenusetting.id=request.getParameter("id");
            String delete_message= delete_submenusetting.delete_submenusetting();
            out.println("<script type = 'text/javascript'>");
            out.println("window.alert('Data Deleted sucessfully')");
            out.println("window.location = 'usersetting.jsp?option=view&id=0'");
            out.println("</script>");
        }
    else if(request.getParameter("option").toString().contains("view"))
        {
%>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
        <center>
            <a href="submenusetting.jsp?option=add&id=0" >Add Sub Menu Detail</a>
        </center>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Menu Code</th>
                        <th>Menu Name</th>
                        <th>URL</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
           submenusetting submenusettingview=new submenusetting();
            ResultSet resultSet = null;
            resultSet = submenusettingview.retriveall_submenusetting();
            int sno=0;
            while(resultSet.next())
            {
                sno=sno+1;

%>
                        <tr>
                            <td><%=sno%></td>
                            <td><%=resultSet.getString("menucode") %></td>
                            <td><%=resultSet.getString("submenuname") %></td>
                            <td><%=resultSet.getString("url") %></td>
                            <td><a href="submenusetting.jsp?option=edit&id=<%=resultSet.getString("id")%>">Edit</a>|<a href="submenusetting.jsp?option=delete&id=<%=resultSet.getString("id")%>">Delete</a></td>
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
                submenusetting create_submenusetting=new submenusetting();
                create_submenusetting.menucode=request.getParameter("menucode");
                create_submenusetting.submenuname=request.getParameter("submenuname");
                create_submenusetting.url=request.getParameter("url");
                create_submenusetting.id=request.getParameter("id");
                String create_message="";
                    if(create_submenusetting.id.equals("0"))
                        {
                            create_message=create_submenusetting.create_submenusetting();
                        }
                    else
                        {
                            create_message=create_submenusetting.update_submenusetting();
                        }
                if(create_message.contains("1"))
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('Sub Menu Details saved sucessfully')");
                        out.println("window.location = 'submenusetting.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
                else
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('Sub Menu Details not saved')");
                        out.println("window.location = 'submenusetting.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
            }
                                %>
        </div>
<%@include file="footer.jsp" %>
    </body>
</html>
