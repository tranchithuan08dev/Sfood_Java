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
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderItemDAO {

    public ArrayList<OrderItem> getAllItem() {
        ArrayList<OrderItem> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select ItemId,ItemName,Price,Image,Type from OrderItem";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int itemId = rs.getInt("ItemId");
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");

                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    OrderItem item = new OrderItem(itemId, itemName, price, image, type);
                    list.add(item);
                }
            }
        } catch (Exception e) {
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

    public ArrayList<OrderItem> getAllItemDrink() {
        ArrayList<OrderItem> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select ItemId,ItemName,Price,Image ,Type from OrderItem Where Type ='Drink'";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int itemId = rs.getInt("ItemId");
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");
                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    OrderItem item = new OrderItem(itemId, itemName, price, image, type);
                    list.add(item);
                }
            }
        } catch (Exception e) {
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

    public ArrayList<OrderItem> getAllItemFood() {
        ArrayList<OrderItem> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select ItemId,ItemName,Price,Image ,Type from OrderItem Where Type ='Food'";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int itemId = rs.getInt("ItemId");
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");

                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    OrderItem item = new OrderItem(itemId, itemName, price, image, type);
                    list.add(item);
                }
            }
        } catch (Exception e) {
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

    // tìm kiếm 

    public ArrayList<OrderItem> getItems(String findItem) {
        ArrayList<OrderItem> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT ItemId, ItemName, Price, Image, Type FROM OrderItem WHERE ItemName LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setNString(1, "%" + findItem + "%");
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int itemId = rs.getInt("ItemId");
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");
                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    OrderItem item = new OrderItem(itemId, itemName, price, image, type);
                    list.add(item);
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

    public OrderItem getItem(int itemId) {
        OrderItem item = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT ItemId, ItemName, Price, Image, Type FROM OrderItem WHERE ItemId = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, itemId);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");
                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    item = new OrderItem(itemId, itemName, price, image, type);
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

        return item;

    }

    public int DeleteOrderItem(int ItemId) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql1 = "DELETE FROM OrderDetail WHERE ItemId = ?";
                PreparedStatement pst1 = cn.prepareStatement(sql1);
                pst1.setInt(1, ItemId);
                result += pst1.executeUpdate();

                String sql2 = "DELETE FROM Recipe WHERE ItemId = ?";
                PreparedStatement pst2 = cn.prepareStatement(sql2);
                pst2.setInt(1, ItemId);
                result += pst2.executeUpdate();

                String sql3 = "DELETE FROM WeeklyMenuItems WHERE ItemId = ?";
                PreparedStatement pst3 = cn.prepareStatement(sql3);
                pst3.setInt(1, ItemId);
                result += pst3.executeUpdate();

                String sql4 = "DELETE FROM OrderItem WHERE ItemId = ?";
                PreparedStatement pst4 = cn.prepareStatement(sql4);
                pst4.setInt(1, ItemId);
                result += pst4.executeUpdate();
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

  
    
    public int UpdateOrderItem(int ItemId, float price) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE OrderItem SET  Price = ? WHERE Itemid = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setFloat(1, price);
                pst.setInt(2, ItemId);

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
 
    
   public int InsertItem(String itemName, String image, float price, String type, String recipeName, String ingredients) {
    int rs = 0;
    Connection cn = null;
    PreparedStatement pst = null;
    ResultSet rsTable = null;
    
    try {
        cn = DBUtils.makeConnection();
        cn.setAutoCommit(false);
        
        if (cn != null) {
            String sql = "INSERT INTO OrderItem(ItemName,   pst = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);Image, Price, Type) VALUES(?, ?, ?, ?)";
          
            pst.setString(1, itemName);
            pst.setString(2, image);
            pst.setFloat(3, price);
            pst.setString(4, type);
            
            rs = pst.executeUpdate();
            
            if (rs >= 1) {
                rsTable = pst.getGeneratedKeys();
                if (rsTable != null && rsTable.next()) {
                    int itemId = rsTable.getInt(1);
                    
                    sql = "INSERT INTO Recipe(ItemId, Name, Ingredients) VALUES (?, ?, ?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, itemId);
                    pst.setString(2, recipeName);
                    pst.setString(3, ingredients);
                    
                    rs = pst.executeUpdate();
                }
            }
            
            cn.commit();
        }
    } catch (Exception e) {
        try {
            if (cn != null) {
                cn.rollback(); 
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
    } finally {
        try {
            if (rsTable != null) {
                rsTable.close();
            }
            if (pst != null) {
                pst.close();
            }
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
   public ArrayList<OrderItem> SortedByPriceDesc() {
        ArrayList<OrderItem> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT ItemId, ItemName, Price, Image, Type FROM OrderItem ORDER BY Price DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int itemId = rs.getInt("ItemId");
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");
                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    OrderItem item = new OrderItem(itemId, itemName, price, image, type);
                    list.add(item);
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
   
   public ArrayList<OrderItem> SortedByPriceAsc() {
        ArrayList<OrderItem> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT ItemId, ItemName, Price, Image, Type FROM OrderItem ORDER BY Price ASC";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int itemId = rs.getInt("ItemId");
                    String itemName = rs.getNString("ItemName");
                    float price = rs.getFloat("Price");
                    String image = rs.getString("Image");
                    String type = rs.getString("Type");
                    OrderItem item = new OrderItem(itemId, itemName, price, image, type);
                    list.add(item);
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
