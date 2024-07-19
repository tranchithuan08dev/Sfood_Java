/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Description;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class DescriptionDAO {
    public ArrayList<Description> GetAllDescription(){
         ArrayList<Description> list = new ArrayList<>();
         Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql ="Select DescriptionPageID,DescriptionName,ImageDescription from dbo.DescriptionPage";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) { 
                    int DescriptionPageID = rs.getInt("DescriptionPageID");
                    String DescriptionName = rs.getString("DescriptionName");
                    String ImageDescription = rs.getString("ImageDescription");
                    Description d = new Description(DescriptionPageID, DescriptionName, ImageDescription);
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
