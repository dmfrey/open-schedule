// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Session;
import org.springframework.stereotype.Component;

privileged aspect SessionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SessionDataOnDemand: @Component;
    
    private Random SessionDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Session> SessionDataOnDemand.data;
    
    public Session SessionDataOnDemand.getNewTransientSession(int index) {
        org.openschedule.domain.Session obj = new org.openschedule.domain.Session();
        java.lang.String name = "name_" + index;
        if (name.length() > 255) {
            name  = name.substring(0, 255);
        }
        obj.setName(name);
        java.lang.String description = "description_" + index;
        if (description.length() > 2048) {
            description  = description.substring(0, 2048);
        }
        obj.setDescription(description);
        return obj;
    }
    
    public Session SessionDataOnDemand.getSpecificSession(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Session obj = data.get(index);
        return Session.findSession(obj.getId());
    }
    
    public Session SessionDataOnDemand.getRandomSession() {
        init();
        Session obj = data.get(rnd.nextInt(data.size()));
        return Session.findSession(obj.getId());
    }
    
    public boolean SessionDataOnDemand.modifySession(Session obj) {
        return false;
    }
    
    public void SessionDataOnDemand.init() {
        data = org.openschedule.domain.Session.findSessionEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Session' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Session>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Session obj = getNewTransientSession(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
