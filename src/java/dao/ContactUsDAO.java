/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ContactUs;
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
public class ContactUsDAO {

    public ArrayList<ContactUs> getAllFeed() {
        ArrayList<ContactUs> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [FeedBackID]\n"
                        + "      ,[FullName]\n"
                        + "      ,[Email]\n"
                        + "      ,[Phone]\n"
                        + "      ,[Require]\n"
                        + "  FROM [Sfood].[dbo].[FeedBack]";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {                    
                    int feedBachId = rs.getInt("FeedBackID");
                    String name = rs.getString("FullName");
                    String email = rs.getString("Email");
                    String phone = rs.getString("Phone");
                    String require = rs.getString("Require");
                    ContactUs acc = new ContactUs(feedBachId, name, email, phone, require);
                    list.add(acc);
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
            }
        }

        return list;

    }
    
    public int InsertFeed(String fullName, String email, String phone, String require){
        int rs = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql ="INSERT INTO FeedBack (FullName, Email, Phone, Require)\n" +
                   "VALUES(?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullName);
                pst.setString(2, email);
                pst.setString(3, phone);
                pst.setString(4, require);
                rs = pst.executeUpdate();      
                
            }
        } catch (Exception e) {
        }finally{
            try {
                if (cn != null ) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }

}
