// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.String;

privileged aspect Notification_Roo_ToString {
    
    public String Notification.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("StatusTitle: ").append(getStatusTitle()).append(", ");
        sb.append("StatusMessage: ").append(getStatusMessage()).append(", ");
        sb.append("Title: ").append(getTitle()).append(", ");
        sb.append("Message: ").append(getMessage()).append(", ");
        sb.append("Created: ").append(getCreated()).append(", ");
        sb.append("Duration: ").append(getDuration()).append(", ");
        sb.append("Active: ").append(getActive());
        return sb.toString();
    }
    
}
