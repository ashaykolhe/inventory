package com.erp.dao;

import java.util.List;

import com.erp.dao.BaseDao;
import com.erp.pojo.Section;
import com.wideplay.warp.persist.Transactional;

/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 14, 2012
 * Time: 12:42:04 PM
 * To change this template use File | Settings | File Templates.
 */
public class SectionDao extends BaseDao<Section,Long>{
    public SectionDao() {
        super(Section.class);
    }

    @Transactional
    public List getSection(){
        return sessionProvider.get().createQuery("from Section where deleted='0'").list();
    }@Transactional
    public List getSectionNameList(){
        return sessionProvider.get().createQuery("select name from Section where deleted='0'").list();
    }

    @Transactional
    public boolean SaveSection(Section section)

    {
        try {
            if(section!=null){
                sessionProvider.get().save(section);
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }
    @Transactional
    public void delete(Section section){
        try{
            section.setDeleted(1);
            sessionProvider.get().update(section);
        }catch (Exception e){
            e.printStackTrace();

        }
    }

    public Section findById(Long id){
        return (Section)sessionProvider.get().createQuery("from Section where id='"+id+"'").uniqueResult();
    }
    @Transactional
    public void update(Section section){
        try{
            sessionProvider.get().update(section);
        }catch (Exception e){
            e.printStackTrace();

        }
    }
}
