/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Recipe;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class RecipeDAO {
    
     public Recipe getRecipe(int itemId) {
       Recipe recipeItem = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT   r.RecipeID, r.ItemId, r.Name, r.Ingredients, i.Price, i.Image\n" +
"FROM  dbo.Recipe r JOIN  dbo.OrderItem i\n" +
"ON  r.ItemId = i.ItemId\n" +
"Where r.ItemId = ?";
               PreparedStatement pst = cn.prepareStatement(sql);
               pst.setInt(1, itemId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int recipeId = rs.getInt("RecipeID");
                        int ItemId = rs.getInt("ItemId");
                        String name = rs.getNString("Name");
                        String ingredients = rs.getNString("Ingredients");
                        float price = rs.getFloat("Price");
                        String image = rs.getString("Image");
                        recipeItem = new Recipe(recipeId, itemId, name, ingredients, price, ItemId, image);
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
        return recipeItem;
    }
    
}
