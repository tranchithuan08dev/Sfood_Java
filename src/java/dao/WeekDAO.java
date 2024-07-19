/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class WeekDAO {

    public int InsertWeek(String name, String day, String description, String week, String type, HashMap<OrderItem, Integer> cart) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                String sql = "INSERT INTO WeeklyMenu (Name, DayName, Description, Week, Type) VALUES(?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, day);
                pst.setString(3,  description);
                pst.setString(4, week);
                pst.setString(5, type);
                result = pst.executeUpdate();

                if (result >= 1) {
                    sql = "SELECT TOP 1 PlanID FROM dbo.WeeklyMenu ORDER BY PlanID DESC";
                    pst = cn.prepareStatement(sql);
                    ResultSet table = pst.executeQuery();
                    if (table.next()) {
                        int planId = table.getInt("PlanID");
                        sql = "INSERT INTO dbo.WeeklyMenuItems (PlanID, ItemId) VALUES (?,?)";
                        pst = cn.prepareStatement(sql);
                        Set<OrderItem> entryset = cart.keySet();//geeksforgeeks
                        ArrayList<OrderItem> listOfKeys = new ArrayList<OrderItem>(entryset);
                        for (int i = 0; i < listOfKeys.size(); i++) {
                            pst.setInt(1, planId);
                            pst.setInt(2, listOfKeys.get(listOfKeys.size()-1).getItemId());
                            result = pst.executeUpdate();
                            break;
                        }
                       
                    }
                    cn.commit();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try {
                if (cn != null) {
                    cn.setAutoCommit(true);
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public int RemoveWeek(int itemId) {
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "SELECT TOP 1 w.PlanID FROM WeeklyMenuItems wi "
                        + "JOIN WeeklyMenu w ON wi.PlanID = w.PlanID "
                        + "JOIN OrderItem o ON wi.ItemId = o.ItemId "
                        + "WHERE o.ItemId = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, itemId);
                ResultSet table = pst.executeQuery();

                if (table.next()) {
                    int planId = table.getInt("PlanID");

                    sql = "DELETE FROM WeeklyMenuItems WHERE PlanID = ? AND ItemId = ?";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, planId);
                    pst.setInt(2, itemId);
                    result = pst.executeUpdate();

                    if (result >= 1) {
                        sql = "DELETE FROM WeeklyMenu WHERE PlanID = ?";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, planId);
                        result = pst.executeUpdate();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
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
