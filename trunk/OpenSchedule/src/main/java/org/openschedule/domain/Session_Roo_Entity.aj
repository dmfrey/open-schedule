// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import javax.persistence.Version;
import org.openschedule.domain.Session;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Session_Roo_Entity {
    
    declare @type: Session: @Entity;
    
    declare @type: Session: @Table(name = "session");
    
    @PersistenceContext
    transient EntityManager Session.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Session.id;
    
    @Version
    @Column(name = "version")
    private Integer Session.version;
    
    public Long Session.getId() {
        return this.id;
    }
    
    public void Session.setId(Long id) {
        this.id = id;
    }
    
    public Integer Session.getVersion() {
        return this.version;
    }
    
    public void Session.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Session.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Session.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Session attached = Session.findSession(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Session.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Session Session.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Session merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Session.entityManager() {
        EntityManager em = new Session().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Session.countSessions() {
        return entityManager().createQuery("select count(o) from Session o", Long.class).getSingleResult();
    }
    
    public static List<Session> Session.findAllSessions() {
        return entityManager().createQuery("select o from Session o", Session.class).getResultList();
    }
    
    public static Session Session.findSession(Long id) {
        if (id == null) return null;
        return entityManager().find(Session.class, id);
    }
    
    public static List<Session> Session.findSessionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Session o", Session.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
