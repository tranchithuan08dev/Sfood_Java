/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select UserId ,Name , Email, PasswordHash, Phone, Address, Role   from dbo.Users ";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("UserId");
                        String name = rs.getString("Name");
                        String email = rs.getString("Email");
                        String password = rs.getString("PasswordHash");
                        String phone = rs.getString("Phone");
                        String address = rs.getString("Address");
                        String role = rs.getString("Role");
                        Account acc = new Account(id, name, password, email, phone, address, role);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public Account getAccount(String email, String password, String role) {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select UserId ,Name , Email, PasswordHash, Phone, Address, Role  from dbo.Users \n"
                        + "Where Email = ? And PasswordHash = ? And Role =? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                pst.setString(3, role);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("UserId");
                    String name = rs.getString("Name");
                    String phone = rs.getString("Phone");
                    String address = rs.getString("Address");
                    acc = new Account(id, name, password, email, phone, address, role);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return acc;
    }

    public Account getUser(String email) {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = " Select UserId , Name,Email,PasswordHash,Phone,Address,Role\n"
                        + "  from dbo.Users\n"
                        + " Where Email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String userId = rs.getString("UserId");
                    String name = rs.getString("Name");
                    String password = rs.getString("PasswordHash");
                    String phone = rs.getString("Phone");
                    String address = rs.getString("Address");
                    String role = rs.getString("Role");
                    acc = new Account(Integer.parseInt(userId), name, password, email, phone, address, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return acc;
    }

    public int insertUser(String fullname, String email, String password, String phone, String address, String role) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Insert into dbo.Users(Name,Email,PasswordHash,Phone,Address,Role) values (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setNString(1, fullname);
                pst.setString(2, email);
                pst.setString(3, password);
                pst.setString(4, phone);
                pst.setNString(5, address);
                pst.setString(6, role);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;

    }

    public int RemoveUser(int userId) {
    int result = 0;
    Connection cn = null;
    try {
        cn = DBUtils.makeConnection();
        if (cn != null) {
        
            String sql = "DELETE FROM OrderDetail\n"
                       + "WHERE OrderId IN (SELECT OrderId FROM Orders WHERE UserId = ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, userId);
            result += pst.executeUpdate();
            pst.close(); 
            
          
            String sql1 = "DELETE FROM Orders\n"
                        + "WHERE UserId = ?";
            PreparedStatement pst1 = cn.prepareStatement(sql1);
            pst1.setInt(1, userId);
            result += pst1.executeUpdate();
            pst1.close(); 
            
      
            String sql2 = "DELETE FROM Users\n"
                        + "WHERE UserId = ?";
            PreparedStatement pst2 = cn.prepareStatement(sql2);
            pst2.setInt(1, userId);
            result += pst2.executeUpdate();
            pst2.close(); 
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (cn != null) {
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return result;
}



}
