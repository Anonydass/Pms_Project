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
<%@page import="pms.prs_technical"%>
<h1 class="h3 mb-4 text-gray-800">User Setting</h1>
<div class="row">
<div class="col-lg-12"> 
<%
String usercode="";
String type="";
String description="";
String id=request.getParameter("id").toString();
    if(request.getParameter("option").toString().contains("edit"))
        {
            prs_technical iu_prs_technical=new prs_technical();
            ResultSet resultSet = null; 
            iu_prs_technical.id=id;
            resultSet = iu_prs_technical.retrivewithid_prs_technical();
            int sno=0;
            while(resultSet.next())
            {
                usercode=resultSet.getString("usercode");
                type=resultSet.getString("type");
                description=resultSet.getString("description");
            }
        }
                   
    if(request.getParameter("option").toString().contains("add") || request.getParameter("option").toString().contains("edit"))
        {           
%>
<form action="prs_technical.jsp?option=" method="post">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
            <td align="right">Usercode:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="usercode" value="<%=usercode%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Type:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="type" value="<%=type%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">Description:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="description" value="<%=description%>" required=""/>
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
            prs_technical delete_prs_technical=new prs_technical();
            delete_prs_technical.id=request.getParameter("id");
            String delete_message= delete_prs_technical.delete_prs_technical();
            out.println("<script type = 'text/javascript'>");
            out.println("window.alert('Data Deleted sucessfully')");
            out.println("window.location = 'prs_technical.jsp?option=view&id=0'");
            out.println("</script>");
        }
    else if(request.getParameter("option").toString().contains("view"))
        {
%>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
        <center>
            <a href="prs_technical.jsp?option=add&id=0" >Add User Detail</a>
        </center>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>Usercode</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
            prs_technical userview=new prs_technical();
            ResultSet resultSet = null;
            resultSet = userview.retriveall_prs_technical();
            int sno=0;
            while(resultSet.next())
            {
                sno=sno+1;

%>
                        <tr>
                            <td><%=sno%></td>
                            <td><%=resultSet.getString("usercode") %></td>
                            <td><%=resultSet.getString("type") %></td>
                            <td><%=resultSet.getString("description") %></td>
                            <td><a href="prs_technical.jsp?option=edit&id=<%=resultSet.getString("id")%>">Edit</a>|<a href="prs_technical.jsp?option=delete&id=<%=resultSet.getString("id")%>">Delete</a></td>
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
                prs_technical create_prs_technical=new prs_technical();
                create_prs_technical.usercode=request.getParameter("usercode");
                create_prs_technical.type=request.getParameter("type");
                create_prs_technical.description=request.getParameter("description");
                create_prs_technical.id=request.getParameter("id");
                String create_message="";
                    if(create_prs_technical.id.equals("0"))
                        {
                            create_message=create_prs_technical.create_prs_technical();
                        }
                    else
                        {
                            create_message=create_prs_technical.update_prs_technical();
                        }
                if(create_message.contains("1"))
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('User Details saved sucessfully')");
                        out.println("window.location = 'prs_technical.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
                else
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('User Details not saved')");
                        out.println("window.location = 'prs_technical.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
            }
                                %>
        </div>
<%@include file="footer.jsp" %>
    </body>
</html>
