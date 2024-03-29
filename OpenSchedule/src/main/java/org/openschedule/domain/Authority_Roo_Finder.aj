// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.String;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.openschedule.domain.Authority;

privileged aspect Authority_Roo_Finder {
    
    public static TypedQuery<Authority> Authority.findAuthoritysByUsername(String username) {
        if (username == null || username.length() == 0) throw new IllegalArgumentException("The username argument is required");
        EntityManager em = Authority.entityManager();
        TypedQuery<Authority> q = em.createQuery("SELECT Authority FROM Authority AS authority WHERE authority.username = :username", Authority.class);
        q.setParameter("username", username);
        return q;
    }
    
}
