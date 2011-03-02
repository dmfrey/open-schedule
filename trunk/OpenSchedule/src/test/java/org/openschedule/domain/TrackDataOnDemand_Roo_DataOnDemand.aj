// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.RoomDataOnDemand;
import org.openschedule.domain.SponsorDataOnDemand;
import org.openschedule.domain.Track;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TrackDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TrackDataOnDemand: @Component;
    
    private Random TrackDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Track> TrackDataOnDemand.data;
    
    @Autowired
    private RoomDataOnDemand TrackDataOnDemand.roomDataOnDemand;
    
    @Autowired
    private SponsorDataOnDemand TrackDataOnDemand.sponsorDataOnDemand;
    
    public Track TrackDataOnDemand.getNewTransientTrack(int index) {
        org.openschedule.domain.Track obj = new org.openschedule.domain.Track();
        java.lang.String name = "name_" + index;
        if (name.length() > 255) {
            name  = name.substring(0, 255);
        }
        obj.setName(name);
        obj.setRoom(roomDataOnDemand.getRandomRoom());
        obj.setSponsor(sponsorDataOnDemand.getRandomSponsor());
        return obj;
    }
    
    public Track TrackDataOnDemand.getSpecificTrack(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Track obj = data.get(index);
        return Track.findTrack(obj.getId());
    }
    
    public Track TrackDataOnDemand.getRandomTrack() {
        init();
        Track obj = data.get(rnd.nextInt(data.size()));
        return Track.findTrack(obj.getId());
    }
    
    public boolean TrackDataOnDemand.modifyTrack(Track obj) {
        return false;
    }
    
    public void TrackDataOnDemand.init() {
        data = org.openschedule.domain.Track.findTrackEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Track' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Track>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Track obj = getNewTransientTrack(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
