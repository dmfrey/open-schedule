// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import java.util.List;
import java.util.Random;
import org.openschedule.domain.BlockComment;
import org.springframework.stereotype.Component;

privileged aspect BlockCommentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BlockCommentDataOnDemand: @Component;
    
    private Random BlockCommentDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<BlockComment> BlockCommentDataOnDemand.data;
    
    public BlockComment BlockCommentDataOnDemand.getNewTransientBlockComment(int index) {
        org.openschedule.domain.BlockComment obj = new org.openschedule.domain.BlockComment();
        obj.setName(null);
        obj.setEmail(null);
        java.lang.String comment = "comment_" + index;
        if (comment.length() > 1024) {
            comment  = comment.substring(0, 1024);
        }
        obj.setComment(comment);
        return obj;
    }
    
    public BlockComment BlockCommentDataOnDemand.getSpecificBlockComment(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        BlockComment obj = data.get(index);
        return BlockComment.findBlockComment(obj.getId());
    }
    
    public BlockComment BlockCommentDataOnDemand.getRandomBlockComment() {
        init();
        BlockComment obj = data.get(rnd.nextInt(data.size()));
        return BlockComment.findBlockComment(obj.getId());
    }
    
    public boolean BlockCommentDataOnDemand.modifyBlockComment(BlockComment obj) {
        return false;
    }
    
    public void BlockCommentDataOnDemand.init() {
        data = org.openschedule.domain.BlockComment.findBlockCommentEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'BlockComment' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.openschedule.domain.BlockComment>();
        for (int i = 0; i < 10; i++) {
            org.openschedule.domain.BlockComment obj = getNewTransientBlockComment(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
