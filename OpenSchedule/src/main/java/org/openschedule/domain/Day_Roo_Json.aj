// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import flexjson.JSONDeserializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.openschedule.domain.Day;

privileged aspect Day_Roo_Json {
    
    public static Day Day.fromJsonToDay(String json) {
        return new JSONDeserializer<Day>().use(null, Day.class).deserialize(json);
    }
    
    public static Collection<Day> Day.fromJsonArrayToDays(String json) {
        return new JSONDeserializer<List<Day>>().use(null, ArrayList.class).use("values", Day.class).deserialize(json);
    }
    
}