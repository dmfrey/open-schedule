// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.String;
import java.util.List;
import org.openschedule.domain.Room;

privileged aspect Venue_Roo_JavaBean {
    
    public String Venue.getName() {
        return this.name;
    }
    
    public void Venue.setName(String name) {
        this.name = name;
    }
    
    public String Venue.getAddressOne() {
        return this.addressOne;
    }
    
    public void Venue.setAddressOne(String addressOne) {
        this.addressOne = addressOne;
    }
    
    public String Venue.getAddressTwo() {
        return this.addressTwo;
    }
    
    public void Venue.setAddressTwo(String addressTwo) {
        this.addressTwo = addressTwo;
    }
    
    public String Venue.getCity() {
        return this.city;
    }
    
    public void Venue.setCity(String city) {
        this.city = city;
    }
    
    public String Venue.getState() {
        return this.state;
    }
    
    public void Venue.setState(String state) {
        this.state = state;
    }
    
    public String Venue.getZip() {
        return this.zip;
    }
    
    public void Venue.setZip(String zip) {
        this.zip = zip;
    }
    
    public String Venue.getWebSite() {
        return this.webSite;
    }
    
    public void Venue.setWebSite(String webSite) {
        this.webSite = webSite;
    }
    
    public String Venue.getEmail() {
        return this.email;
    }
    
    public void Venue.setEmail(String email) {
        this.email = email;
    }
    
    public String Venue.getPhone() {
        return this.phone;
    }
    
    public void Venue.setPhone(String phone) {
        this.phone = phone;
    }
    
    public List<Room> Venue.getRooms() {
        return this.rooms;
    }
    
    public void Venue.setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }
    
}
