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
public class DescriptionDetail {
    private int descriptionDetailId;
    private int descriptionId;
    private String descriptionName;
    private String image; 
    private String descriptionNameDetail;

    public DescriptionDetail() {
    }

    public DescriptionDetail(int descriptionDetailId, int descriptionId, String descriptionName, String image, String descriptionNameDetail) {
        this.descriptionDetailId = descriptionDetailId;
        this.descriptionId = descriptionId;
        this.descriptionName = descriptionName;
        this.image = image;
        this.descriptionNameDetail = descriptionNameDetail;
    }

    public int getDescriptionDetailId() {
        return descriptionDetailId;
    }

    public void setDescriptionDetailId(int descriptionDetailId) {
        this.descriptionDetailId = descriptionDetailId;
    }

    public int getDescriptionId() {
        return descriptionId;
    }

    public void setDescriptionId(int descriptionId) {
        this.descriptionId = descriptionId;
    }

    public String getDescriptionName() {
        return descriptionName;
    }

    public void setDescriptionName(String descriptionName) {
        this.descriptionName = descriptionName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescriptionNameDetail() {
        return descriptionNameDetail;
    }

    public void setDescriptionNameDetail(String descriptionNameDetail) {
        this.descriptionNameDetail = descriptionNameDetail;
    }

   
    
}
