/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pms;
import java.sql.ResultSet;

/**
 *
 * @author GAVASKAR S
 */
public class menusetting extends dbclass {
public String id;
public String menucode;
public String menuname;
public String create_menusetting()
 {
    String query="INSERT INTO `menusetting`(`menucode`, `menuname`) VALUES ('"+ menucode +"','"+ menuname +"')";
    String message=super.tableinsertupdatedelete(query);
    return message;
 }
 public String update_menusetting()
 {
    String query="UPDATE `menusetting` SET `menucode`='"+ menucode +"',`menuname`='"+ menuname +"' WHERE id='"+ id+"'";
    String message=super.tableinsertupdatedelete(query);
    return message;
 }
 public ResultSet retriveall_menusetting()
{
    return super.getfromtable("select * from menusetting");
}
 public ResultSet retrivewithid_menusetting()
{
    return super.getfromtable("select * from menusetting  WHERE id='"+ id +"'");
}
 public String delete_menusetting()
 {
    String query="delete from menusetting WHERE id='"+ id +"'";
    String message=super.tableinsertupdatedelete(query);
    return message;
 }
}
