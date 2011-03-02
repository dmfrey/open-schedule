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
import org.openschedule.domain.BlockComment;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BlockComment_Roo_Entity {
    
    declare @type: BlockComment: @Entity;
    
    declare @type: BlockComment: @Table(name = "block_comment");
    
    @PersistenceContext
    transient EntityManager BlockComment.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long BlockComment.id;
    
    @Version
    @Column(name = "version")
    private Integer BlockComment.version;
    
    public Long BlockComment.getId() {
        return this.id;
    }
    
    public void BlockComment.setId(Long id) {
        this.id = id;
    }
    
    public Integer BlockComment.getVersion() {
        return this.version;
    }
    
    public void BlockComment.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void BlockComment.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BlockComment.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BlockComment attached = BlockComment.findBlockComment(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BlockComment.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void BlockComment.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public BlockComment BlockComment.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BlockComment merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager BlockComment.entityManager() {
        EntityManager em = new BlockComment().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BlockComment.countBlockComments() {
        return entityManager().createQuery("select count(o) from BlockComment o", Long.class).getSingleResult();
    }
    
    public static List<BlockComment> BlockComment.findAllBlockComments() {
        return entityManager().createQuery("select o from BlockComment o", BlockComment.class).getResultList();
    }
    
    public static BlockComment BlockComment.findBlockComment(Long id) {
        if (id == null) return null;
        return entityManager().find(BlockComment.class, id);
    }
    
    public static List<BlockComment> BlockComment.findBlockCommentEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from BlockComment o", BlockComment.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
