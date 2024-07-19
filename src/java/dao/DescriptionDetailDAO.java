/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.DescriptionDetail;
import dto.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class DescriptionDetailDAO {
    public DescriptionDetail getAllDescriptionDetail(int id){
    DescriptionDetail d = null;
     Connection cn = null;
     try {
       cn = DBUtils.makeConnection();
         if (cn != null) {
             String sql = "Select d.DescriptionPageDetailID, dp.DescriptionPageID ,dp.DescriptionName , dp.ImageDescription , d.DescriptionNameDetail from dbo.DescriptionPageDetail d JOIN dbo.DescriptionPage dp\n" +
"         ON d.DescriptionPageID = dp.DescriptionPageID\n" +
"         Where dp.DescriptionPageID = ?";
             PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
              while (rs.next()) {            
                String descriptionName = rs.getNString("DescriptionName");
                String imageDescription = rs.getString("ImageDescription");
                String descriptionNameDetail = rs.getString("DescriptionNameDetail");
                 d = new DescriptionDetail(id, id, descriptionName, imageDescription, descriptionNameDetail);
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
    return d; 
}
}
