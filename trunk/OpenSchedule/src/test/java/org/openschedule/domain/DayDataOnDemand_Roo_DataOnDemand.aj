// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Day;
import org.springframework.stereotype.Component;

privileged aspect DayDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DayDataOnDemand: @Component;
    
    private Random DayDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Day> DayDataOnDemand.data;
    
    public Day DayDataOnDemand.getNewTransientDay(int index) {
        org.openschedule.domain.Day obj = new org.openschedule.domain.Day();
        obj.setDate(new java.util.GregorianCalendar(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR), java.util.Calendar.getInstance().get(java.util.Calendar.MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.DAY_OF_MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY), java.util.Calendar.getInstance().get(java.util.Calendar.MINUTE), java.util.Calendar.getInstance().get(java.util.Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime());
        obj.setNumberOfSchedules(null);
        return obj;
    }
    
    public Day DayDataOnDemand.getSpecificDay(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Day obj = data.get(index);
        return Day.findDay(obj.getId());
    }
    
    public Day DayDataOnDemand.getRandomDay() {
        init();
        Day obj = data.get(rnd.nextInt(data.size()));
        return Day.findDay(obj.getId());
    }
    
    public boolean DayDataOnDemand.modifyDay(Day obj) {
        return false;
    }
    
    public void DayDataOnDemand.init() {
        data = org.openschedule.domain.Day.findDayEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Day' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Day>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Day obj = getNewTransientDay(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}