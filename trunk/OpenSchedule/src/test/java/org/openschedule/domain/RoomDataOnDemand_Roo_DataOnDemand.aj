// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Room;
import org.springframework.stereotype.Component;

privileged aspect RoomDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RoomDataOnDemand: @Component;
    
    private Random RoomDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Room> RoomDataOnDemand.data;
    
    public Room RoomDataOnDemand.getNewTransientRoom(int index) {
        org.openschedule.domain.Room obj = new org.openschedule.domain.Room();
        java.lang.String name = "name_" + index;
        if (name.length() > 255) {
            name  = name.substring(0, 255);
        }
        obj.setName(name);
        return obj;
    }
    
    public Room RoomDataOnDemand.getSpecificRoom(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Room obj = data.get(index);
        return Room.findRoom(obj.getId());
    }
    
    public Room RoomDataOnDemand.getRandomRoom() {
        init();
        Room obj = data.get(rnd.nextInt(data.size()));
        return Room.findRoom(obj.getId());
    }
    
    public boolean RoomDataOnDemand.modifyRoom(Room obj) {
        return false;
    }
    
    public void RoomDataOnDemand.init() {
        data = org.openschedule.domain.Room.findRoomEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Room' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Room>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Room obj = getNewTransientRoom(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
