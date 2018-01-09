/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainTicketpriceDao;
import com.critc.ptpa.model.TrainTicketprice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:  席别票价维护Service <br/>
 *
 * @author 杨超凡 created on 2017/12/7
 */
@Service
public class TrainTicketpriceService {
    @Autowired
    TrainTicketpriceDao trainTickwetpriceDao;
    /**
     * what: 席别维护列表
     *
     * @param trainTicketprice 席别维护model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/7
     */
    public int add(TrainTicketprice trainTicketprice) {
        return trainTickwetpriceDao.add(trainTicketprice);
    }
    /**
     * what: 席别维护列表
     *
     * @param trainTicketprice 席别维护model
     * @return int
     *
     * @author 杨超凡 created on 2017/12/7
     */
    public int update(TrainTicketprice trainTicketprice) {
        return trainTickwetpriceDao.update(trainTicketprice);
    }

    /**
     * what: 席别维护列表
     *
     * @param id 席别维护id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/7
     */
    public int delete(Integer id) {
        return trainTickwetpriceDao.delete(id);
    }

    /**
     * what: 席别维护列表
     *
     * @param trainId 车次id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/7
     */
    public int deleteByTrainId(int trainId) {
        return trainTickwetpriceDao.deleteByTrainId(trainId);
    }

    /**
     * what: 席别维护列表
     *
     * @param trainId 席别维护trainId
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/7
     */
    public List<TrainTicketprice> listAll(Integer trainId) {
        return trainTickwetpriceDao.listAll(trainId);
    }
    
}
