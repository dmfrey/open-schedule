// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.openschedule.domain.EventCommentDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EventCommentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: EventCommentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: EventCommentIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: EventCommentIntegrationTest: @Transactional;
    
    @Autowired
    private EventCommentDataOnDemand EventCommentIntegrationTest.dod;
    
    @Test
    public void EventCommentIntegrationTest.testCountEventComments() {
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", dod.getRandomEventComment());
        long count = org.openschedule.domain.EventComment.countEventComments();
        org.junit.Assert.assertTrue("Counter for 'EventComment' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void EventCommentIntegrationTest.testFindEventComment() {
        org.openschedule.domain.EventComment obj = dod.getRandomEventComment();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to provide an identifier", id);
        obj = org.openschedule.domain.EventComment.findEventComment(id);
        org.junit.Assert.assertNotNull("Find method for 'EventComment' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'EventComment' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void EventCommentIntegrationTest.testFindAllEventComments() {
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", dod.getRandomEventComment());
        long count = org.openschedule.domain.EventComment.countEventComments();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'EventComment', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.openschedule.domain.EventComment> result = org.openschedule.domain.EventComment.findAllEventComments();
        org.junit.Assert.assertNotNull("Find all method for 'EventComment' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'EventComment' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void EventCommentIntegrationTest.testFindEventCommentEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", dod.getRandomEventComment());
        long count = org.openschedule.domain.EventComment.countEventComments();
        if (count > 20) count = 20;
        java.util.List<org.openschedule.domain.EventComment> result = org.openschedule.domain.EventComment.findEventCommentEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'EventComment' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'EventComment' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void EventCommentIntegrationTest.testFlush() {
        org.openschedule.domain.EventComment obj = dod.getRandomEventComment();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to provide an identifier", id);
        obj = org.openschedule.domain.EventComment.findEventComment(id);
        org.junit.Assert.assertNotNull("Find method for 'EventComment' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyEventComment(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'EventComment' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EventCommentIntegrationTest.testMerge() {
        org.openschedule.domain.EventComment obj = dod.getRandomEventComment();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to provide an identifier", id);
        obj = org.openschedule.domain.EventComment.findEventComment(id);
        boolean modified =  dod.modifyEventComment(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.openschedule.domain.EventComment merged = (org.openschedule.domain.EventComment) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'EventComment' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EventCommentIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", dod.getRandomEventComment());
        org.openschedule.domain.EventComment obj = dod.getNewTransientEventComment(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'EventComment' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'EventComment' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void EventCommentIntegrationTest.testRemove() {
        org.openschedule.domain.EventComment obj = dod.getRandomEventComment();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'EventComment' failed to provide an identifier", id);
        obj = org.openschedule.domain.EventComment.findEventComment(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'EventComment' with identifier '" + id + "'", org.openschedule.domain.EventComment.findEventComment(id));
    }
    
}