// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.Integer;
import java.util.List;
import org.openschedule.domain.Block;
import org.openschedule.domain.Day;
import org.openschedule.domain.Track;

privileged aspect Schedule_Roo_JavaBean {
    
    public Integer Schedule.getBlocksPerSchedule() {
        return this.blocksPerSchedule;
    }
    
    public void Schedule.setBlocksPerSchedule(Integer blocksPerSchedule) {
        this.blocksPerSchedule = blocksPerSchedule;
    }
    
    public Track Schedule.getTrack() {
        return this.track;
    }
    
    public void Schedule.setTrack(Track track) {
        this.track = track;
    }
    
    public Day Schedule.getDay() {
        return this.day;
    }
    
    public void Schedule.setDay(Day day) {
        this.day = day;
    }
    
    public List<Block> Schedule.getBlocks() {
        return this.blocks;
    }
    
    public void Schedule.setBlocks(List<Block> blocks) {
        this.blocks = blocks;
    }
    
}