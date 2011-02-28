// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.Sponsor;
import org.springframework.stereotype.Component;

privileged aspect SponsorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SponsorDataOnDemand: @Component;
    
    private Random SponsorDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Sponsor> SponsorDataOnDemand.data;
    
    public Sponsor SponsorDataOnDemand.getNewTransientSponsor(int index) {
        org.openschedule.domain.Sponsor obj = new org.openschedule.domain.Sponsor();
        java.lang.String companyName = "companyName_" + index;
        if (companyName.length() > 255) {
            companyName  = companyName.substring(0, 255);
        }
        obj.setCompanyName(companyName);
        java.lang.String contactName = "contactName_" + index;
        if (contactName.length() > 255) {
            contactName  = contactName.substring(0, 255);
        }
        obj.setContactName(contactName);
        java.lang.String contactEmail = "contactEmail_" + index;
        if (contactEmail.length() > 255) {
            contactEmail  = contactEmail.substring(0, 255);
        }
        obj.setContactEmail(contactEmail);
        java.lang.String contactPhone = "contactPhone_" + index;
        if (contactPhone.length() > 255) {
            contactPhone  = contactPhone.substring(0, 255);
        }
        obj.setContactPhone(contactPhone);
        java.lang.String webSite = "webSite_" + index;
        if (webSite.length() > 255) {
            webSite  = webSite.substring(0, 255);
        }
        obj.setWebSite(webSite);
        return obj;
    }
    
    public Sponsor SponsorDataOnDemand.getSpecificSponsor(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Sponsor obj = data.get(index);
        return Sponsor.findSponsor(obj.getId());
    }
    
    public Sponsor SponsorDataOnDemand.getRandomSponsor() {
        init();
        Sponsor obj = data.get(rnd.nextInt(data.size()));
        return Sponsor.findSponsor(obj.getId());
    }
    
    public boolean SponsorDataOnDemand.modifySponsor(Sponsor obj) {
        return false;
    }
    
    public void SponsorDataOnDemand.init() {
        data = org.openschedule.domain.Sponsor.findSponsorEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Sponsor' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.Sponsor>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.Sponsor obj = getNewTransientSponsor(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}