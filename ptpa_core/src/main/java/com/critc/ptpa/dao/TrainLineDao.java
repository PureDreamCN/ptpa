/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Train;
import com.critc.ptpa.model.TrainHumanResource;
import com.critc.ptpa.model.TrainLine;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  车次线路区段Dao
 *
 * @author 杨超凡 created on 2017/11/29
 */
@Repository
public class TrainLineDao extends BaseDao<TrainLine,TrainLine>{

    /**
     * what: 车次线路区段新增
     *
     * @param trainLine 车次线路区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainLine trainLine) {
        String sql = "insert into t_train_line VALUES (seq_t_train_line.nextval,:trainId,:xldm,:xldmName,:beginCzdm,:beginCzdmName,:endCzdm,:endCzdmName,:mileage,:linePriceLevelCode,:linePriceLevelName,:trainTypeCode,:trainTypeName,:trainMarshallingTypeCode,:trainMarshallingTypeName,:lineBusyLevelCode,:lineBusyLevelName,:beforeDawn,:beforeDawnRate,:price,:orderIndex)";
        return insert(sql,trainLine);
    }

    /**
     * what: 车次线路区段删除
     *
     * @param id 车次线路区段id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(Integer id){
        String sql = "delete from t_train_line where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 车次线路区段修改
     *
     * @param trainLine 车次线路区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainLine trainLine,String param){
        String sql="";
        //基本信息修改
        if (param.equals("baseinfo")){
            sql = "update t_train_line set TRAIN_ID=:trainId,BEGIN_CZDM=:beginCzdm,BEGIN_CZDM_NAME=:beginCzdmName,END_CZDM=:endCzdm,END_CZDM_NAME=:endCzdmName,MILEAGE=:mileage,TRAIN_TYPE_CODE=:trainTypeCode,TRAIN_TYPE_NAME=:trainTypeName,TRAIN_MARSHALLING_TYPE_CODE=:trainMarshallingTypeCode,TRAIN_MARSHALLING_TYPE_NAME=:trainMarshallingTypeName,BEFORE_DAWN=:beforeDawn,ORDER_INDEX=:orderIndex where ID=:id";
        }
        //线路修改
        if (param.equals("xldm")){
            sql = "update t_train_line set XLDM=:xldm,XLDM_NAME=:xldmName where ID=:id";
        }
        //清算数据修改
        if (param.equals("price")){
            sql = "update t_train_line set TRAIN_MARSHALLING_TYPE_CODE=:trainMarshallingTypeCode,TRAIN_MARSHALLING_TYPE_NAME=:trainMarshallingTypeName,TRAIN_TYPE_CODE=:trainTypeCode,TRAIN_TYPE_NAME=:trainTypeName,LINE_PRICE_LEVEL_CODE=:linePriceLevelCode,LINE_PRICE_LEVEL_NAME=:linePriceLevelName,LINE_BUSY_LEVEL_CODE=:lineBusyLevelCode,LINE_BUSY_LEVEL_NAME=:lineBusyLevelName,BEFORE_DAWN_RATE=:beforeDawnRate,PRICE=:price where ID=:id";
        }
        return update(sql,trainLine);
    }

    /**
     * what: 车次线路区段列表
     *
     * @return 车次线路区段列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainLine> listAll(Integer trainId){
        String sql = "select * from t_train_line where train_id = ?";
        sql += " order by ORDER_INDEX asc";
        return list(sql,trainId);
    }

    public int deleteByTrainId(int trainId) {
        String sql = "delete from t_train_line where train_id = ?";
        return delete(sql,trainId);
    }

    public List<TrainLine> getRowid(int trainId){
        String sql = "select t.*, rownum from t_train_line t where t.train_id=?";
        return list(sql,trainId);
    }

    public void updateOrderIndex(TrainLine trainLine) {
        String sql = "update t_train_line set ORDER_INDEX=:orderIndex where ID=:id";
        update(sql,trainLine);
    }
}
