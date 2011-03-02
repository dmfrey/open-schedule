// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.web;

import java.lang.String;
import org.openschedule.domain.BlockComment;
import org.openschedule.domain.Event;
import org.openschedule.domain.EventComment;
import org.openschedule.domain.UserAccount;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    Converter<BlockComment, String> ApplicationConversionServiceFactoryBean.getBlockCommentConverter() {
        return new Converter<BlockComment, String>() {
            public String convert(BlockComment blockcomment) {
                return new StringBuilder().append(blockcomment.getName()).append(" ").append(blockcomment.getEmail()).append(" ").append(blockcomment.getComment()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<Event, String> ApplicationConversionServiceFactoryBean.getEventConverter() {
        return new org.springframework.core.convert.converter.Converter<Event, String>() {
            public String convert(Event event) {
                return new StringBuilder().append(event.getName()).append(" ").append(event.getShortName()).append(" ").append(event.getPublishDate()).append(" ").append(event.getStartDate()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<EventComment, String> ApplicationConversionServiceFactoryBean.getEventCommentConverter() {
        return new org.springframework.core.convert.converter.Converter<EventComment, String>() {
            public String convert(EventComment eventcomment) {
                return new StringBuilder().append(eventcomment.getName()).append(" ").append(eventcomment.getEmail()).append(" ").append(eventcomment.getComment()).toString();
            }
        };
    }
    
    org.springframework.core.convert.converter.Converter<UserAccount, String> ApplicationConversionServiceFactoryBean.getUserAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<UserAccount, String>() {
            public String convert(UserAccount useraccount) {
                return new StringBuilder().append(useraccount.getUsername()).append(" ").append(useraccount.getPassword()).append(" ").append(useraccount.getName()).append(" ").append(useraccount.getEmail()).toString();
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getBlockCommentConverter());
        registry.addConverter(getEventConverter());
        registry.addConverter(getEventCommentConverter());
        registry.addConverter(getUserAccountConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
