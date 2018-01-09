/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainHumanResource;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * what:  车次人力配置Dao
 *
 * @author 杨超凡 created on 2017/11/29
 */
@Repository
public class TrainHumanResourceDao extends BaseDao<TrainHumanResource,TrainHumanResource>{

    /**
     * what: 车次人力配置新增
     *
     * @param trainHumanResource 车次人力配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainHumanResource trainHumanResource) {
        String sql = "insert into t_train_humanresource VALUES (seq_t_train_humanresource.nextval,:trainId,:humanResourceTypeCode,:humanResourceTypeName,:ljdm,:price,:rate)";
        return insert(sql,trainHumanResource);
    }

    /**
     * what: 车次人力配置删除
     *
     * @param id 车次人力配置id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(String id){
        String sql = "delete from t_train_humanresource where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 车次人力配置修改
     *
     * @param trainHumanResource 车次人力配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainHumanResource trainHumanResource){
        String sql = "update t_train_humanresource set TRAIN_ID=:trainId,HUMAN_RESOURCE_TYPE_CODE=:humanResourceTypeCode,RATE=:rate,HUMAN_RESOURCE_TYPE_NAME=:humanResourceTypeName,LJDM=:ljdm,PRICE=:price where id=:id";
        return update(sql,trainHumanResource);
    }

    /**
     * what: 车次人力配置列表
     *
     * @return 车次人力配置列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainHumanResource> lsitAll(Integer trainId){
        String sql = "select ID,TRAIN_ID,HUMAN_RESOURCE_TYPE_CODE,HUMAN_RESOURCE_TYPE_NAME,PRICE,RATE," +
                "(select b.NAME from t_dic_bureau b where b.LJDM=t.LJDM) ljdm" +
                " from t_train_humanresource t where TRAIN_ID=?";
        sql += " order by LJDM desc";
        return list(sql,trainId);
    }

    public List<TrainHumanResource> copy(Integer trainId){
        String sql = "select * from t_train_humanresource t where TRAIN_ID=?";
        sql += " order by LJDM desc";
        return list(sql,trainId);
    }

    public List<TrainHumanResource> getByLjdmAndHumanResourceTypeCode(String ljdm, String humanResourceTypeCode) {
        String sql = "select * from t_train_humanresource  where ljdm=? and human_resource_type_code=?";
        return list(sql, ljdm, humanResourceTypeCode);
    }

    public int deleteByTrainId(int trainId) {
        String sql = "delete from t_train_humanresource where train_id = ?";
        return delete(sql,trainId);
    }
}
