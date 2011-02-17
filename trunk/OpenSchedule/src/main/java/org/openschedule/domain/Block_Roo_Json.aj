// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.domain;

import flexjson.JSONDeserializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.openschedule.domain.Block;

privileged aspect Block_Roo_Json {
    
    public static Block Block.fromJsonToBlock(String json) {
        return new JSONDeserializer<Block>().use(null, Block.class).deserialize(json);
    }
    
    public static Collection<Block> Block.fromJsonArrayToBlocks(String json) {
        return new JSONDeserializer<List<Block>>().use(null, ArrayList.class).use("values", Block.class).deserialize(json);
    }
    
}
