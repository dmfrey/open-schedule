// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.openschedule.domain.NotificationDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect NotificationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: NotificationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: NotificationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: NotificationIntegrationTest: @Transactional;
    
    @Autowired
    private NotificationDataOnDemand NotificationIntegrationTest.dod;
    
    @Test
    public void NotificationIntegrationTest.testCountNotifications() {
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", dod.getRandomNotification());
        long count = org.openschedule.domain.Notification.countNotifications();
        org.junit.Assert.assertTrue("Counter for 'Notification' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void NotificationIntegrationTest.testFindNotification() {
        org.openschedule.domain.Notification obj = dod.getRandomNotification();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to provide an identifier", id);
        obj = org.openschedule.domain.Notification.findNotification(id);
        org.junit.Assert.assertNotNull("Find method for 'Notification' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Notification' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void NotificationIntegrationTest.testFindAllNotifications() {
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", dod.getRandomNotification());
        long count = org.openschedule.domain.Notification.countNotifications();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Notification', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.openschedule.domain.Notification> result = org.openschedule.domain.Notification.findAllNotifications();
        org.junit.Assert.assertNotNull("Find all method for 'Notification' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Notification' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void NotificationIntegrationTest.testFindNotificationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", dod.getRandomNotification());
        long count = org.openschedule.domain.Notification.countNotifications();
        if (count > 20) count = 20;
        java.util.List<org.openschedule.domain.Notification> result = org.openschedule.domain.Notification.findNotificationEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Notification' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Notification' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void NotificationIntegrationTest.testFlush() {
        org.openschedule.domain.Notification obj = dod.getRandomNotification();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to provide an identifier", id);
        obj = org.openschedule.domain.Notification.findNotification(id);
        org.junit.Assert.assertNotNull("Find method for 'Notification' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyNotification(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Notification' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void NotificationIntegrationTest.testMerge() {
        org.openschedule.domain.Notification obj = dod.getRandomNotification();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to provide an identifier", id);
        obj = org.openschedule.domain.Notification.findNotification(id);
        boolean modified =  dod.modifyNotification(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.openschedule.domain.Notification merged = (org.openschedule.domain.Notification) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Notification' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void NotificationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", dod.getRandomNotification());
        org.openschedule.domain.Notification obj = dod.getNewTransientNotification(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Notification' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Notification' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void NotificationIntegrationTest.testRemove() {
        org.openschedule.domain.Notification obj = dod.getRandomNotification();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Notification' failed to provide an identifier", id);
        obj = org.openschedule.domain.Notification.findNotification(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Notification' with identifier '" + id + "'", org.openschedule.domain.Notification.findNotification(id));
    }
    
}
