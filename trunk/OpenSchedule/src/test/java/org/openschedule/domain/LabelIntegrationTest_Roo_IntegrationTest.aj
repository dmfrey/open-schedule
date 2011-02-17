// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.openschedule.domain.LabelDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LabelIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LabelIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LabelIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: LabelIntegrationTest: @Transactional;
    
    @Autowired
    private LabelDataOnDemand LabelIntegrationTest.dod;
    
    @Test
    public void LabelIntegrationTest.testCountLabels() {
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", dod.getRandomLabel());
        long count = org.openschedule.domain.Label.countLabels();
        org.junit.Assert.assertTrue("Counter for 'Label' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LabelIntegrationTest.testFindLabel() {
        org.openschedule.domain.Label obj = dod.getRandomLabel();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to provide an identifier", id);
        obj = org.openschedule.domain.Label.findLabel(id);
        org.junit.Assert.assertNotNull("Find method for 'Label' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Label' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LabelIntegrationTest.testFindAllLabels() {
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", dod.getRandomLabel());
        long count = org.openschedule.domain.Label.countLabels();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Label', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.openschedule.domain.Label> result = org.openschedule.domain.Label.findAllLabels();
        org.junit.Assert.assertNotNull("Find all method for 'Label' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Label' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LabelIntegrationTest.testFindLabelEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", dod.getRandomLabel());
        long count = org.openschedule.domain.Label.countLabels();
        if (count > 20) count = 20;
        java.util.List<org.openschedule.domain.Label> result = org.openschedule.domain.Label.findLabelEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Label' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Label' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LabelIntegrationTest.testFlush() {
        org.openschedule.domain.Label obj = dod.getRandomLabel();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to provide an identifier", id);
        obj = org.openschedule.domain.Label.findLabel(id);
        org.junit.Assert.assertNotNull("Find method for 'Label' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLabel(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Label' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LabelIntegrationTest.testMerge() {
        org.openschedule.domain.Label obj = dod.getRandomLabel();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to provide an identifier", id);
        obj = org.openschedule.domain.Label.findLabel(id);
        boolean modified =  dod.modifyLabel(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.openschedule.domain.Label merged = (org.openschedule.domain.Label) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Label' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LabelIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", dod.getRandomLabel());
        org.openschedule.domain.Label obj = dod.getNewTransientLabel(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Label' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Label' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LabelIntegrationTest.testRemove() {
        org.openschedule.domain.Label obj = dod.getRandomLabel();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Label' failed to provide an identifier", id);
        obj = org.openschedule.domain.Label.findLabel(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Label' with identifier '" + id + "'", org.openschedule.domain.Label.findLabel(id));
    }
    
}
