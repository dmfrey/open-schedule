// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Venue;
import org.springframework.stereotype.Component;

privileged aspect VenueDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VenueDataOnDemand: @Component;
    
    private Random VenueDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Venue> VenueDataOnDemand.data;
    
    public Venue VenueDataOnDemand.getNewTransientVenue(int index) {
        org.openschedule.domain.Venue obj = new org.openschedule.domain.Venue();
        java.lang.String name = "name_" + index;
        if (name.length() > 255) {
            name  = name.substring(0, 255);
        }
        obj.setName(name);
        java.lang.String addressOne = "addressOne_" + index;
        if (addressOne.length() > 255) {
            addressOne  = addressOne.substring(0, 255);
        }
        obj.setAddressOne(addressOne);
        java.lang.String addressTwo = "addressTwo_" + index;
        if (addressTwo.length() > 255) {
            addressTwo  = addressTwo.substring(0, 255);
        }
        obj.setAddressTwo(addressTwo);
        java.lang.String city = "city_" + index;
        if (city.length() > 255) {
            city  = city.substring(0, 255);
        }
        obj.setCity(city);
        java.lang.String state = "_" + index;
        if (state.length() > 2) {
            state  = state.substring(0, 2);
        }
        obj.setState(state);
        java.lang.String zip = "zip_" + index;
        if (zip.length() > 10) {
            zip  = zip.substring(0, 10);
        }
        obj.setZip(zip);
        java.lang.String webSite = "webSite_" + index;
        if (webSite.length() > 255) {
            webSite  = webSite.substring(0, 255);
        }
        obj.setWebSite(webSite);
        java.lang.String email = "email_" + index;
        if (email.length() > 255) {
            email  = email.substring(0, 255);
        }
        obj.setEmail(email);
        java.lang.String phone = "phone_" + index;
        if (phone.length() > 255) {
            phone  = phone.substring(0, 255);
        }
        obj.setPhone(phone);
        return obj;
    }
    
    public Venue VenueDataOnDemand.getSpecificVenue(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Venue obj = data.get(index);
        return Venue.findVenue(obj.getId());
    }
    
    public Venue VenueDataOnDemand.getRandomVenue() {
        init();
        Venue obj = data.get(rnd.nextInt(data.size()));
        return Venue.findVenue(obj.getId());
    }
    
    public boolean VenueDataOnDemand.modifyVenue(Venue obj) {
        return false;
    }
    
    public void VenueDataOnDemand.init() {
        data = org.openschedule.domain.Venue.findVenueEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Venue' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Venue>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Venue obj = getNewTransientVenue(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
