// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.String;

privileged aspect Day_Roo_ToString {
    
    public String Day.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Date: ").append(getDate()).append(", ");
        sb.append("NumberOfSchedules: ").append(getNumberOfSchedules()).append(", ");
        sb.append("Schedules: ").append(getSchedules() == null ? "null" : getSchedules().size());
        return sb.toString();
    }
    
}
