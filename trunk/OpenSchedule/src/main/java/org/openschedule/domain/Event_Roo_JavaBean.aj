// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import java.util.List;
import org.openschedule.domain.Day;
import org.openschedule.domain.EventComment;
import org.openschedule.domain.Label;
import org.openschedule.domain.Notification;
import org.openschedule.domain.Session;
import org.openschedule.domain.Speaker;
import org.openschedule.domain.Sponsor;
import org.openschedule.domain.Track;
import org.openschedule.domain.Venue;

privileged aspect Event_Roo_JavaBean {
    
    public String Event.getName() {
        return this.name;
    }
    
    public void Event.setName(String name) {
        this.name = name;
    }
    
    public String Event.getShortName() {
        return this.shortName;
    }
    
    public void Event.setShortName(String shortName) {
        this.shortName = shortName;
    }
    
    public Date Event.getPublishDate() {
        return this.publishDate;
    }
    
    public void Event.setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }
    
    public Date Event.getStartDate() {
        return this.startDate;
    }
    
    public void Event.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date Event.getEndDate() {
        return this.endDate;
    }
    
    public void Event.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public Integer Event.getNumberOfDays() {
        return this.numberOfDays;
    }
    
    public void Event.setNumberOfDays(Integer numberOfDays) {
        this.numberOfDays = numberOfDays;
    }
    
    public String Event.getUsername() {
        return this.username;
    }
    
    public void Event.setUsername(String username) {
        this.username = username;
    }
    
    public List<Notification> Event.getNotifications() {
        return this.notifications;
    }
    
    public void Event.setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }
    
    public java.util.List<Track> Event.getTracks() {
        return this.tracks;
    }
    
    public void Event.setTracks(java.util.List<Track> tracks) {
        this.tracks = tracks;
    }
    
    public java.util.List<Day> Event.getDays() {
        return this.days;
    }
    
    public void Event.setDays(java.util.List<Day> days) {
        this.days = days;
    }
    
    public java.util.List<Venue> Event.getVenues() {
        return this.venues;
    }
    
    public void Event.setVenues(java.util.List<Venue> venues) {
        this.venues = venues;
    }
    
    public java.util.List<Sponsor> Event.getSponsors() {
        return this.sponsors;
    }
    
    public void Event.setSponsors(java.util.List<Sponsor> sponsors) {
        this.sponsors = sponsors;
    }
    
    public java.util.List<Label> Event.getLabels() {
        return this.labels;
    }
    
    public void Event.setLabels(java.util.List<Label> labels) {
        this.labels = labels;
    }
    
    public java.util.List<Session> Event.getSessions() {
        return this.sessions;
    }
    
    public void Event.setSessions(java.util.List<Session> sessions) {
        this.sessions = sessions;
    }
    
    public java.util.List<Speaker> Event.getSpeakers() {
        return this.speakers;
    }
    
    public void Event.setSpeakers(java.util.List<Speaker> speakers) {
        this.speakers = speakers;
    }
    
    public java.util.List<EventComment> Event.getComments() {
        return this.comments;
    }
    
    public void Event.setComments(java.util.List<EventComment> comments) {
        this.comments = comments;
    }
    
}
