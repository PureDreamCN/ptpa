/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainTicketprice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  席别维护Dao <br/>
 *
 * @author 杨超凡 created on 2017/12/7
 */
@Repository
public class TrainTicketpriceDao extends BaseDao<TrainTicketprice,TrainTicketprice>{

    /**
     * what: 席别维护新增
     *
     * @param trainTicketprice 席别维护model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainTicketprice trainTicketprice) {
        String sql = "insert into t_train_ticketprice VALUES (seq_t_train_ticketprice.nextval,:trainId,:seatTypeCode,:seatTypeName,:price,:orderIndex)";
        return insert(sql,trainTicketprice);
    }

    /**
     * what: 席别维护删除
     *
     * @param id 席别维护id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(Integer id){
        String sql = "delete from t_train_ticketprice where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 席别维护修改
     *
     * @param trainTicketprice 席别维护model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainTicketprice trainTicketprice){
        String sql = "update t_train_ticketprice set TRAIN_ID=:trainId,SEAT_TYPE_CODE=:seatTypeCode,SEAT_TYPE_NAME=:seatTypeName,PRICE=:price,ORDER_INDEX=:orderIndex where id=:id";
        return update(sql,trainTicketprice);
    }

    /**
     * what: 席别维护列表
     *
     * @return 席别维护列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainTicketprice> listAll(Integer trainId){
        String sql = "select * from t_train_ticketprice t where train_id=?";
        sql += " order by order_index asc";
        return list(sql,trainId);
    }

    public int deleteByTrainId(int trainId) {
        String sql = "delete from t_train_ticketprice where train_id = ?";
        return delete(sql,trainId);
    }
}
