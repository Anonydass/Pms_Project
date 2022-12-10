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
public class submenusetting extends dbclass {
public String id;
public String menucode;
public String submenuname;
public String url; 
public String create_submenusetting()
 {
    String query="INSERT INTO `submenusetting`(`menucode`, `submenuname`,`url`) VALUES ('"+ menucode +"','"+ submenuname +"','"+ url +"')";
    String message=super.tableinsertupdatedelete(query);
    return message;
 }
 public String update_submenusetting()
 {
    String query="UPDATE `submenusetting` SET `menucode`='"+ menucode +"',`submenuname`='"+ submenuname +"',`url`='"+ url +"' WHERE id='"+ id+"'";
    String message=super.tableinsertupdatedelete(query);
    return message;
 }
 public ResultSet retriveall_submenusetting()
{
    return super.getfromtable("select * from submenusetting");
}
 public ResultSet retrivewithid_submenusetting()
{
    return super.getfromtable("select * from submenusetting  WHERE id='"+ id +"'");
}
 public String delete_submenusetting()
 {
    String query="delete from submenusetting WHERE id='"+ id +"'";
    String message=super.tableinsertupdatedelete(query);
    return message;
 }
}
