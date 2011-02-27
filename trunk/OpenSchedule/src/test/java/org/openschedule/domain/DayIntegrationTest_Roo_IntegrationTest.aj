// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.openschedule.domain.DayDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DayIntegrationTest_Roo_IntegrationTest {
    
    declare @type: DayIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: DayIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: DayIntegrationTest: @Transactional;
    
    @Autowired
    private DayDataOnDemand DayIntegrationTest.dod;
    
    @Test
    public void DayIntegrationTest.testCountDays() {
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", dod.getRandomDay());
        long count = org.openschedule.domain.Day.countDays();
        org.junit.Assert.assertTrue("Counter for 'Day' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void DayIntegrationTest.testFindDay() {
        org.openschedule.domain.Day obj = dod.getRandomDay();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to provide an identifier", id);
        obj = org.openschedule.domain.Day.findDay(id);
        org.junit.Assert.assertNotNull("Find method for 'Day' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Day' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void DayIntegrationTest.testFindAllDays() {
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", dod.getRandomDay());
        long count = org.openschedule.domain.Day.countDays();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Day', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.openschedule.domain.Day> result = org.openschedule.domain.Day.findAllDays();
        org.junit.Assert.assertNotNull("Find all method for 'Day' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Day' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void DayIntegrationTest.testFindDayEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", dod.getRandomDay());
        long count = org.openschedule.domain.Day.countDays();
        if (count > 20) count = 20;
        java.util.List<org.openschedule.domain.Day> result = org.openschedule.domain.Day.findDayEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Day' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Day' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void DayIntegrationTest.testFlush() {
        org.openschedule.domain.Day obj = dod.getRandomDay();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to provide an identifier", id);
        obj = org.openschedule.domain.Day.findDay(id);
        org.junit.Assert.assertNotNull("Find method for 'Day' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyDay(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Day' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void DayIntegrationTest.testMerge() {
        org.openschedule.domain.Day obj = dod.getRandomDay();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to provide an identifier", id);
        obj = org.openschedule.domain.Day.findDay(id);
        boolean modified =  dod.modifyDay(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.openschedule.domain.Day merged = (org.openschedule.domain.Day) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Day' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void DayIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", dod.getRandomDay());
        org.openschedule.domain.Day obj = dod.getNewTransientDay(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Day' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Day' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void DayIntegrationTest.testRemove() {
        org.openschedule.domain.Day obj = dod.getRandomDay();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Day' failed to provide an identifier", id);
        obj = org.openschedule.domain.Day.findDay(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Day' with identifier '" + id + "'", org.openschedule.domain.Day.findDay(id));
    }
    
}