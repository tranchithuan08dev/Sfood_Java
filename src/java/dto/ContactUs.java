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
public class ContactUs {
    private int feedBackID;
    private String fullName;
    private String email;
    private String phone;
    private String require;

    public ContactUs() {
    }

    public ContactUs(int feedBackID, String fullName, String email, String phone, String require) {
        this.feedBackID = feedBackID;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.require = require;
    }

    public int getFeedBackID() {
        return feedBackID;
    }

    public void setFeedBackID(int feedBackID) {
        this.feedBackID = feedBackID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRequire() {
        return require;
    }

    public void setRequire(String require) {
        this.require = require;
    }
     
    
}
