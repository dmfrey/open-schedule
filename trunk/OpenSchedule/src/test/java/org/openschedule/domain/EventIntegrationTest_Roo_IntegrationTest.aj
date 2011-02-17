// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.openschedule.domain.EventDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EventIntegrationTest_Roo_IntegrationTest {
    
    declare @type: EventIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: EventIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: EventIntegrationTest: @Transactional;
    
    @Autowired
    private EventDataOnDemand EventIntegrationTest.dod;
    
    @Test
    public void EventIntegrationTest.testCountEvents() {
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", dod.getRandomEvent());
        long count = org.openschedule.domain.Event.countEvents();
        org.junit.Assert.assertTrue("Counter for 'Event' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void EventIntegrationTest.testFindEvent() {
        org.openschedule.domain.Event obj = dod.getRandomEvent();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to provide an identifier", id);
        obj = org.openschedule.domain.Event.findEvent(id);
        org.junit.Assert.assertNotNull("Find method for 'Event' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Event' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void EventIntegrationTest.testFindAllEvents() {
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", dod.getRandomEvent());
        long count = org.openschedule.domain.Event.countEvents();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Event', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.openschedule.domain.Event> result = org.openschedule.domain.Event.findAllEvents();
        org.junit.Assert.assertNotNull("Find all method for 'Event' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Event' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void EventIntegrationTest.testFindEventEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", dod.getRandomEvent());
        long count = org.openschedule.domain.Event.countEvents();
        if (count > 20) count = 20;
        java.util.List<org.openschedule.domain.Event> result = org.openschedule.domain.Event.findEventEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Event' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Event' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void EventIntegrationTest.testFlush() {
        org.openschedule.domain.Event obj = dod.getRandomEvent();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to provide an identifier", id);
        obj = org.openschedule.domain.Event.findEvent(id);
        org.junit.Assert.assertNotNull("Find method for 'Event' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyEvent(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Event' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EventIntegrationTest.testMerge() {
        org.openschedule.domain.Event obj = dod.getRandomEvent();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to provide an identifier", id);
        obj = org.openschedule.domain.Event.findEvent(id);
        boolean modified =  dod.modifyEvent(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.openschedule.domain.Event merged = (org.openschedule.domain.Event) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Event' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EventIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", dod.getRandomEvent());
        org.openschedule.domain.Event obj = dod.getNewTransientEvent(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Event' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Event' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void EventIntegrationTest.testRemove() {
        org.openschedule.domain.Event obj = dod.getRandomEvent();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Event' failed to provide an identifier", id);
        obj = org.openschedule.domain.Event.findEvent(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Event' with identifier '" + id + "'", org.openschedule.domain.Event.findEvent(id));
    }
    
}
