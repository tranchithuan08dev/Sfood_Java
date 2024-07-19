/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    public ArrayList<OrderDetail> getAllOrderHistory(int userId, String week) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select od.DetailId, o.OrderDate,oi.ItemName,oi.Price,wm.DayName,wm.Week from dbo.Orders o JOIN dbo.OrderDetail od\n"
                        + "           ON o.OrderId = od.OrderId\n"
                        + "           JOIN dbo.OrderItem oi\n"
                        + "           ON od.ItemId = oi.ItemId\n"
                        + "           JOIN dbo.WeeklyMenuItems wmi\n"
                        + "           ON oi.ItemId = wmi.ItemId\n"
                        + "           JOIN dbo.WeeklyMenu wm \n"
                        + "           ON wm.PlanID = wmi.PlanID\n"
                        + "           where o.UserId = ? and wm.Week = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                pst.setString(2, week);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int detailId = rs.getInt("DetailId");
                    String date = rs.getString("OrderDate");
                    String itemName = rs.getString("ItemName");
                    float price = rs.getFloat("Price");
                    String day = rs.getString("DayName");
                    OrderDetail d = new OrderDetail(detailId, itemName, date, price, day, week);

                    list.add(d);
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
}
