// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.openschedule.domain.Notification;

privileged aspect Notification_Roo_Json {
    
    public String Notification.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Notification Notification.fromJsonToNotification(String json) {
        return new JSONDeserializer<Notification>().use(null, Notification.class).deserialize(json);
    }
    
    public static String Notification.toJsonArray(Collection<Notification> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Notification> Notification.fromJsonArrayToNotifications(String json) {
        return new JSONDeserializer<List<Notification>>().use(null, ArrayList.class).use("values", Notification.class).deserialize(json);
    }
    
}
