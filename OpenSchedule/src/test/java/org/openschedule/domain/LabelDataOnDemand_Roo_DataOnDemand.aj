// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Label;
import org.springframework.stereotype.Component;

privileged aspect LabelDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LabelDataOnDemand: @Component;
    
    private Random LabelDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Label> LabelDataOnDemand.data;
    
    public Label LabelDataOnDemand.getNewTransientLabel(int index) {
        org.openschedule.domain.Label obj = new org.openschedule.domain.Label();
        java.lang.String name = "name_" + index;
        if (name.length() > 10) {
            name  = name.substring(0, 10);
        }
        obj.setName(name);
        return obj;
    }
    
    public Label LabelDataOnDemand.getSpecificLabel(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Label obj = data.get(index);
        return Label.findLabel(obj.getId());
    }
    
    public Label LabelDataOnDemand.getRandomLabel() {
        init();
        Label obj = data.get(rnd.nextInt(data.size()));
        return Label.findLabel(obj.getId());
    }
    
    public boolean LabelDataOnDemand.modifyLabel(Label obj) {
        return false;
    }
    
    public void LabelDataOnDemand.init() {
        data = org.openschedule.domain.Label.findLabelEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Label' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Label>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Label obj = getNewTransientLabel(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
