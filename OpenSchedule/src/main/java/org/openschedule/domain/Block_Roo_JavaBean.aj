// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.Integer;
import java.util.Date;
import java.util.List;
import org.openschedule.domain.BlockComment;
import org.openschedule.domain.Label;
import org.openschedule.domain.Session;

privileged aspect Block_Roo_JavaBean {
    
    public Date Block.getDate() {
        return this.date;
    }
    
    public void Block.setDate(Date date) {
        this.date = date;
    }
    
    public Integer Block.getDuration() {
        return this.duration;
    }
    
    public void Block.setDuration(Integer duration) {
        this.duration = duration;
    }
    
    public Label Block.getLabel() {
        return this.label;
    }
    
    public void Block.setLabel(Label label) {
        this.label = label;
    }
    
    public Session Block.getSession() {
        return this.session;
    }
    
    public void Block.setSession(Session session) {
        this.session = session;
    }
    
    public List<BlockComment> Block.getComments() {
        return this.comments;
    }
    
    public void Block.setComments(List<BlockComment> comments) {
        this.comments = comments;
    }
    
}