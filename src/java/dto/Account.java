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
public class Account {
    private int UserId;
    private String Name;
    private String Password;
    private String Email;
    private String Phone;
    private String Address;
    private String Role;

    public Account() {
    }

    public Account(int UserId, String Name, String Password, String Email, String Phone, String Address, String Role) {
        this.UserId = UserId;
        this.Name = Name;
        this.Password = Password;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Role = Role;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

   
    
    
   
   
}
