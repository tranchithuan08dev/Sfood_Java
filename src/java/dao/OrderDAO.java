/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import dto.Order;
import dto.OrderItem;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDAO {
 public int SaveOrder(int accId, HashMap<OrderItem, Integer> cart) {
    int rs = 0;
    Connection cn = null;
    try {
        float total = 0;
        for (OrderItem t : cart.keySet()) {
            total += cart.get(t) * t.getPrice();
        }

        cn = DBUtils.makeConnection();
        if (cn != null) {
            cn.setAutoCommit(false); 

            String sql = "INSERT INTO dbo.Orders(UserId, OrderDate, Status, Total) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, accId);
            pst.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            pst.setInt(3, 1);
            pst.setFloat(4, total);
            rs = pst.executeUpdate();

            if (rs >= 1) {
                sql = "SELECT TOP 1 OrderId FROM dbo.Orders ORDER BY OrderId DESC";
                pst = cn.prepareStatement(sql);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    int OrderId = table.getInt("OrderId");

                    for (OrderItem item : cart.keySet()) {
                        sql = "INSERT INTO dbo.OrderDetail(OrderId, ItemId, Quantity) VALUES (?, ?, ?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, OrderId);
                        pst.setInt(2, item.getItemId());
                        pst.setInt(3, cart.get(item));
                        pst.executeUpdate();
                    }
                }
            }

            cn.commit(); 
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
    return rs;
}

public ArrayList<Order> getAllOrders(int status){
        ArrayList<Order> list=new ArrayList<>();
        Connection cn=null;
        try {
       
            cn=DBUtils.makeConnection();
            if(cn!=null){
              
                String sql = "Select OrderId,UserId,OrderDate,Status,Total  from dbo.Orders Where Status = ? ";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setInt(1, status);
                ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int orderid=rs.getInt("OrderId");
                        Date date=rs.getDate("OrderDate");
                        int total=rs.getInt("Total");
                        int accid=rs.getInt("UserId");
                        Order d=new Order(orderid, accid, date, status, total);
                        list.add(d);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }
 
 
public int updateOrderStatus(int orderid, int newstatus){
        int rs=0;
        Connection cn=null;
        try {
          
            cn=DBUtils.makeConnection();
            if(cn!=null){
            
                String sql="update Orders set Status=? where OrderId=?";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setInt(1, newstatus);
                pst.setInt(2, orderid);
                rs=pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }


public ArrayList<Order> getSearchOrders(int dateMonth){
        ArrayList<Order> list=new ArrayList<>();
        Connection cn=null;
        try {
            cn=DBUtils.makeConnection();
            if(cn!=null){
                String sql = "Select OrderId,UserId,OrderDate,Status,Total from dbo.Orders Where MONTH(OrderDate) = ? ";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setInt(1, dateMonth);
                ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int orderid=rs.getInt("OrderId");
                        Date date=rs.getDate("OrderDate");
                        int status = rs.getInt("Status");
                        int total=rs.getInt("Total");
                        int accid=rs.getInt("UserId");
                        Order d=new Order(orderid, accid, date, status, total);
                        list.add(d);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }
 

}
