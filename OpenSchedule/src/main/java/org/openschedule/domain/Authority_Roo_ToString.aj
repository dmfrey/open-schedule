// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.String;

privileged aspect Authority_Roo_ToString {
    
    public String Authority.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Username: ").append(getUsername()).append(", ");
        sb.append("Authority: ").append(getAuthority());
        return sb.toString();
    }
    
}
