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
public class OrderDetail {
   private int detailId;
   private String itemname;
   private String date;
   private float price;
   private String dayName;
   private String week;

    public OrderDetail() {
    }

    public OrderDetail(int detailId, String itemname, String date, float price, String dayName, String week) {
        this.detailId = detailId;
        this.itemname = itemname;
        this.date = date;
        this.price = price;
        this.dayName = dayName;
        this.week = week;
    }

    public int getDetailId() {
        return detailId;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDayName() {
        return dayName;
    }

    public void setDayName(String dayName) {
        this.dayName = dayName;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

   
}
