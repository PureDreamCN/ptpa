/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainCe;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  车次接触网区段Dao
 *
 * @author 杨超凡 created on 2017/12/3
 */
@Repository
public class TrainCeDao extends BaseDao<TrainCe,TrainCe> {
    /**
     * what: 车次接触网区段新增
     *
     * @param trainCe 车次接触网区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainCe trainCe) {
        String sql = "insert into t_train_ce VALUES (seq_t_train_ce.nextval,:trainId,:xldm,:xldmName,:beginCzdm,:beginCzdmName,:endCzdm,:endCzdmName,:pseCode,:pseName,:ljdm,:mileage,:catenaryPrice,:electricityPrice,:orderIndex)";
        return insert(sql,trainCe);
    }

    /**
     * what: 车次接触网区段删除
     *
     * @param id 车次接触网区段id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(Integer id){
        String sql = "delete from t_train_ce where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 车次接触网区段修改
     *
     * @param trainCe 车次接触网区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainCe trainCe,String param){
        String sql="";
        //基本信息修改
        if (param.equals("baseinfo")){
            sql = "update t_train_ce set TRAIN_ID=:trainId,BEGIN_CZDM=:beginCzdm,BEGIN_CZDM_NAME=:beginCzdmName,END_CZDM=:endCzdm,END_CZDM_NAME=:endCzdmName,MILEAGE=:mileage,ORDER_INDEX=:orderIndex where ID=:id";
        }
        //线路修改
        if (param.equals("xldm")){
            sql = "update t_train_ce set XLDM=:xldm,XLDM_NAME=:xldmName where ID=:id";
        }
        //清算数据修改
        if (param.equals("price")){
            sql = "update t_train_ce set PSE_CODE=:pseCode,PSE_NAME=:pseName,CATENARY_PRICE=:catenaryPrice,ELECTRICITY_PRICE=:electricityPrice,LJDM=:ljdm where ID=:id";
        }
        return update(sql,trainCe);
    }

    /**
     * what: 车次接触网区段列表
     *
     * @return 车次接触网区段列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainCe> listAll(Integer trainId){
        String sql = "select * from t_train_ce where train_id = ?";
        sql += " order by ORDER_INDEX asc";
        return list(sql,trainId);
    }

    public int deleteBytrainId(int trainId) {
        String sql = "delete from t_train_ce where train_id = ?";
        return delete(sql,trainId);
    }
    public List<TrainCe> getRowid(int trainId) {
        String sql = "select t.*, rownum from t_train_ce t where t.train_id=?";
        return list(sql,trainId);
    }

    public void updateOrderIndex(TrainCe trainCe) {
        String sql = "update t_train_ce set ORDER_INDEX=:orderIndex where ID=:id";
        update(sql,trainCe);
    }
}
