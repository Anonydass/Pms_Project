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
<%@page import="pms.usersetting"%>
<h1 class="h3 mb-4 text-gray-800">User Setting</h1>
<div class="row">
<div class="col-lg-12"> 
<%
String username="";
String password="";
String email="";
String mobileno="";
String id=request.getParameter("id").toString();
    if(request.getParameter("option").toString().contains("edit"))
        {
            usersetting iu_usersetting=new usersetting();
            ResultSet resultSet = null; 
            iu_usersetting.id=id;
            resultSet = iu_usersetting.retrivewithid_usersetting();
            int sno=0;
            while(resultSet.next())
            {
                username=resultSet.getString("username");
                password=resultSet.getString("password");
                email=resultSet.getString("email");
                mobileno=resultSet.getString("mobileno");
            }
        }
                   
    if(request.getParameter("option").toString().contains("add") || request.getParameter("option").toString().contains("edit"))
        {           
%>
<form action="usersetting.jsp?option=" method="post">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
            <td align="right">Name:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="username" value="<%=username%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Password:</td>
            <td>
                <input  class="form-control form-control-user" type="password" name="password" value="<%=password%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Email:</td>
            <td>
                <input  class="form-control form-control-user" type="email" name="email" value="<%=email%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Mobile No:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="mobileno" value="<%=mobileno%>" required=""/>
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
            usersetting delete_usersetting=new usersetting();
            delete_usersetting.id=request.getParameter("id");
            String delete_message= delete_usersetting.delete_usersetting();
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
            <a href="usersetting.jsp?option=add&id=0" >Add User Detail</a>
        </center>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>User Name</th>
                        <th>Password</th>
                        <th>E-Mail</th>
                        <th>Mobile No</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
            usersetting userview=new usersetting();
            ResultSet resultSet = null;
            resultSet = userview.retriveall_usersetting();
            int sno=0;
            while(resultSet.next())
            {
                sno=sno+1;

%>
                        <tr>
                            <td><%=sno%></td>
                            <td><%=resultSet.getString("username") %></td>
                            <td><%=resultSet.getString("password") %></td>
                            <td><%=resultSet.getString("email") %></td>
                            <td><%=resultSet.getString("mobileno") %></td>
                            <td><a href="usersetting.jsp?option=edit&id=<%=resultSet.getString("id")%>">Edit</a>|<a href="usersetting.jsp?option=delete&id=<%=resultSet.getString("id")%>">Delete</a></td>
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
                usersetting create_usersetting=new usersetting();
                create_usersetting.username=request.getParameter("username");
                create_usersetting.password=request.getParameter("password");
                create_usersetting.email=request.getParameter("email");
                create_usersetting.mobileno=request.getParameter("mobileno");
                create_usersetting.id=request.getParameter("id");
                String create_message="";
                    if(create_usersetting.id.equals("0"))
                        {
                            create_message=create_usersetting.create_usersetting();
                        }
                    else
                        {
                            create_message=create_usersetting.update_usersetting();
                        }
                if(create_message.contains("1"))
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('User Details saved sucessfully')");
                        out.println("window.location = 'usersetting.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
                else
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('User Details not saved')");
                        out.println("window.location = 'usersetting.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
            }
                                %>
        </div>
<%@include file="footer.jsp" %>
    </body>
</html>
