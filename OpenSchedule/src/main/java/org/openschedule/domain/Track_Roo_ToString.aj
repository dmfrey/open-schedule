// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.String;

privileged aspect Track_Roo_ToString {
    
    public String Track.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Room: ").append(getRoom()).append(", ");
        sb.append("Sponsor: ").append(getSponsor());
        return sb.toString();
    }
    
}
