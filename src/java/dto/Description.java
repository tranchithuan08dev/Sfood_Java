/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Admin
 */
public class Description {
    private int DescriptionId;
    private String DescriptionName;
    private String image;

    public Description() {
    }

    public Description(int DescriptionId, String DescriptionName, String image) {
        this.DescriptionId = DescriptionId;
        this.DescriptionName = DescriptionName;
        this.image = image;
    }

    public int getDescriptionId() {
        return DescriptionId;
    }

    public void setDescriptionId(int DescriptionId) {
        this.DescriptionId = DescriptionId;
    }

    public String getDescriptionName() {
        return DescriptionName;
    }

    public void setDescriptionName(String DescriptionName) {
        this.DescriptionName = DescriptionName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
