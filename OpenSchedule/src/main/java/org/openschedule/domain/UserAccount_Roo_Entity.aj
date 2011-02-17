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
import org.openschedule.domain.UserAccount;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserAccount_Roo_Entity {
    
    declare @type: UserAccount: @Entity;
    
    declare @type: UserAccount: @Table(name = "USER_ACCOUNT");
    
    @PersistenceContext
    transient EntityManager UserAccount.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long UserAccount.id;
    
    @Version
    @Column(name = "version")
    private Integer UserAccount.version;
    
    public Long UserAccount.getId() {
        return this.id;
    }
    
    public void UserAccount.setId(Long id) {
        this.id = id;
    }
    
    public Integer UserAccount.getVersion() {
        return this.version;
    }
    
    public void UserAccount.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserAccount.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserAccount.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserAccount attached = UserAccount.findUserAccount(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserAccount.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public UserAccount UserAccount.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserAccount merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager UserAccount.entityManager() {
        EntityManager em = new UserAccount().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserAccount.countUserAccounts() {
        return entityManager().createQuery("select count(o) from UserAccount o", Long.class).getSingleResult();
    }
    
    public static List<UserAccount> UserAccount.findAllUserAccounts() {
        return entityManager().createQuery("select o from UserAccount o", UserAccount.class).getResultList();
    }
    
    public static UserAccount UserAccount.findUserAccount(Long id) {
        if (id == null) return null;
        return entityManager().find(UserAccount.class, id);
    }
    
    public static List<UserAccount> UserAccount.findUserAccountEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserAccount o", UserAccount.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
