// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Authority;
import org.springframework.stereotype.Component;

privileged aspect AuthorityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AuthorityDataOnDemand: @Component;
    
    private Random AuthorityDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Authority> AuthorityDataOnDemand.data;
    
    public Authority AuthorityDataOnDemand.getNewTransientAuthority(int index) {
        org.openschedule.domain.Authority obj = new org.openschedule.domain.Authority();
        java.lang.String username = "username_" + index;
        if (username.length() > 255) {
            username  = username.substring(0, 255);
        }
        obj.setUsername(username);
        java.lang.String authority = "authority_" + index;
        if (authority.length() > 255) {
            authority  = authority.substring(0, 255);
        }
        obj.setAuthority(authority);
        return obj;
    }
    
    public Authority AuthorityDataOnDemand.getSpecificAuthority(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Authority obj = data.get(index);
        return Authority.findAuthority(obj.getId());
    }
    
    public Authority AuthorityDataOnDemand.getRandomAuthority() {
        init();
        Authority obj = data.get(rnd.nextInt(data.size()));
        return Authority.findAuthority(obj.getId());
    }
    
    public boolean AuthorityDataOnDemand.modifyAuthority(Authority obj) {
        return false;
    }
    
    public void AuthorityDataOnDemand.init() {
        data = org.openschedule.domain.Authority.findAuthorityEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Authority' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Authority>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Authority obj = getNewTransientAuthority(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
