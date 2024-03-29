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
import org.openschedule.domain.Track;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Track_Roo_Entity {
    
    declare @type: Track: @Entity;
    
    declare @type: Track: @Table(name = "track");
    
    @PersistenceContext
    transient EntityManager Track.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Track.id;
    
    @Version
    @Column(name = "version")
    private Integer Track.version;
    
    public Long Track.getId() {
        return this.id;
    }
    
    public void Track.setId(Long id) {
        this.id = id;
    }
    
    public Integer Track.getVersion() {
        return this.version;
    }
    
    public void Track.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Track.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Track.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Track attached = Track.findTrack(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Track.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Track.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Track Track.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Track merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Track.entityManager() {
        EntityManager em = new Track().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Track.countTracks() {
        return entityManager().createQuery("select count(o) from Track o", Long.class).getSingleResult();
    }
    
    public static List<Track> Track.findAllTracks() {
        return entityManager().createQuery("select o from Track o", Track.class).getResultList();
    }
    
    public static Track Track.findTrack(Long id) {
        if (id == null) return null;
        return entityManager().find(Track.class, id);
    }
    
    public static List<Track> Track.findTrackEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Track o", Track.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
