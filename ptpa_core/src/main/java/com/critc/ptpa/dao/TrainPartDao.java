/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainPart;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what: 备品配置Dao
 *
 * @author 杨超凡 created on 2017/12/4
 */
@Repository
public class TrainPartDao extends BaseDao<TrainPart,TrainPart> {
    /**
     * what: 备品配置新增
     *
     * @param trainPart 备品配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int add(TrainPart trainPart) {
        String sql = "insert into t_train_part VALUES (seq_t_train_part.nextval,:trainId,:ljdm,:lxCode,:lxName,:czCode,:czName,:price)";
        return insert(sql,trainPart);
    }

    /**
     * what: 备品配置删除
     *
     * @param id 备品配置id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int delete(Integer id){
        String sql = "delete from t_train_part where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 备品配置修改
     *
     * @param trainPart 备品配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int update(TrainPart trainPart){
        String sql = "update t_train_part set TRAIN_ID=:trainId,LJDM=:ljdm,PRICE=:price,LX_CODE=:lxCode,LX_NAME=:lxName,CZ_CODE=:czCode,CZ_NAME=:czName where id=:id";
        return update(sql,trainPart);
    }

    /**
     * what: 车次备品配置列表
     *
     * @return 备品配置列表信息
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public List<TrainPart> listAll(Integer trainId){
        String sql = "select ID,TRAIN_ID,LX_CODE,LX_NAME,CZ_CODE,CZ_NAME,PRICE," +
                "(select b.NAME from t_dic_bureau b where b.LJDM=t.LJDM) ljdm" +
                " from t_train_part t where TRAIN_ID=?";
        sql += " order by id desc";
        return list(sql,trainId);
    }

    public int deleteByTrainId(int trainId) {
        String sql = "delete from t_train_part where train_id = ?";
        return delete(sql,trainId);
    }
}
