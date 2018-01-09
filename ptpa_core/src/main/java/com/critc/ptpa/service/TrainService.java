/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainDao;
import com.critc.ptpa.model.Train;
import com.critc.ptpa.model.TrainVehicle;
import com.critc.ptpa.vo.TrainSearchVO;
import com.critc.sys.dao.SysDicDao;
import com.critc.sys.model.SysDic;
import com.critc.util.session.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * what: 客车详情Service
 *
 * @author 杨超凡 created on 2017/11/24
 */
@Service
public class TrainService {
    /**
     * 客车详情dao
     */
    @Autowired
    TrainDao trainDao;
    /**
     * 字典
     */
    @Autowired
    SysDicDao sysDicDao;
    @Autowired
    TrainCeService trainCeService;
    @Autowired
    TrainTractionService trainTractionService;
    @Autowired
    TrainLineService trainLineService;
    @Autowired
    TrainPartService trainPartService;
    @Autowired
    TrainHumanResourceService trainHumanResourceService;
    @Autowired
    TrainServiceService trainServiceService;
    @Autowired
    TrainTicketpriceService trainTicketpriceService;
    @Autowired
    TrainVehicleService trainVehicleService;
    @Autowired
    TrainVehicleSeatService trainVehicleSeatService;

    /**
     * what:  数据条数查询
     *
     * @param trainSearchVO 客车详情VO
     *
     * @return 数据条数
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public int count(TrainSearchVO trainSearchVO){
        return trainDao.count(trainSearchVO);
    }

    /**
     * what:  车次详情数据列表
     *
     * @param trainSearchVO
     *
     * @return list
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public List<Train> list(TrainSearchVO trainSearchVO) {
        return trainDao.list(trainSearchVO);
    }
    /**
     * what:  车次详情数据列表
     *
     * @return list
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public List<Train> listAll() {
        return trainDao.listAll();
    }

    public List<Train> listAllCc() {
        return trainDao.listAllCc();
    }

    public Train getTrainById(Integer id) {
        return trainDao.getTrainById(id);
    }

    public Train getTrainByCc(String cc) {
        return trainDao.getTrainByCc(cc);
    }

    public int add(Train train, HttpServletRequest request) {
        UserSession userSession=(UserSession)request.getSession().getAttribute("userSession");
        if(userSession == null) {
            return 0;
        }else {
            //创建人
            train.setCreatedBy(userSession.getUsername());
            //最后修改人
            train.setLastModifiedBy(userSession.getUsername());
            //列车等级名称
            train.setTrainLevelName(sysDicDao.getByCodeAndCategory("TRAIN_LEVEL",train.getTrainLevelCode()).get(0).getName());
            //列车类型名称
            train.setTrainTypeName(sysDicDao.getByCodeAndCategory("TRAIN_TYPE",train.getTrainTypeCode()).get(0).getName());
            //客车编组类型名称
            train.setTrainMarshallingTypeName(sysDicDao.getByCodeAndCategory("TRAIN_MARSHALLING_TYPE",train.getTrainMarshallingTypeCode()).get(0).getName());
            return trainDao.add(train);
        }
    }

    public int add(Train train) {
            //列车等级名称
//            train.setTrainLevelName(sysDicDao.getByCodeAndCategory("TRAIN_LEVEL",train.getTrainLevelCode()).get(0).getName());
            //列车类型名称
            train.setTrainTypeName(sysDicDao.getByCodeAndCategory("TRAIN_TYPE",train.getTrainTypeCode()).get(0).getName());
            //客车编组类型名称
//            train.setTrainMarshallingTypeName(sysDicDao.getByCodeAndCategory("TRAIN_MARSHALLING_TYPE",train.getTrainMarshallingTypeCode()).get(0).getName());
            return trainDao.mutiAdd(train);
    }
    public int copyTrain(Train train){
        return trainDao.copyTrain(train);
    }
    public int update(Train train, HttpServletRequest request) {
        UserSession userSession=(UserSession)request.getSession().getAttribute("userSession");
        if(userSession == null) {
            return 0;
        }else {
            train.setLastModifiedBy(userSession.getUsername());
            //列车等级名称
            train.setTrainLevelName(sysDicDao.getByCodeAndCategory("TRAIN_LEVEL",train.getTrainLevelCode()).get(0).getName());
            //列车类型名称
            train.setTrainTypeName(sysDicDao.getByCodeAndCategory("TRAIN_TYPE",train.getTrainTypeCode()).get(0).getName());
            //客车编组类型名称
            train.setTrainMarshallingTypeName(sysDicDao.getByCodeAndCategory("TRAIN_MARSHALLING_TYPE",train.getTrainMarshallingTypeCode()).get(0).getName());
            return trainDao.update(train);
        }
    }

    public int updatePartPrice(Train train){
        return trainDao.updatePartPrice(train);
    }

    public int updateStationservice(Train train){
        return trainDao.updateStationservice(train);
    }

    public int updateStation(Train train){
        return trainDao.updateStation(train);
    }

    public int delete(int trainId) {
        trainCeService.deleteBytrainId(trainId);
        trainTractionService.deleteByTrainId(trainId);
        trainLineService.deleteByTrainId(trainId);
        trainHumanResourceService.deleteByTrainId(trainId);
        trainServiceService.deleteByTrainId(trainId);
        trainTicketpriceService.deleteByTrainId(trainId);
        for (TrainVehicle trainVehicle : trainVehicleService.listAll(trainId)) {
            trainVehicleSeatService.delete(trainVehicle.getId());
        }
        trainVehicleService.deleteByTrainId(trainId);
        return trainDao.delete(trainId);
    }

    public void updateMarshallingType(Train train) {
        trainDao.updateMarshallingType(train);
    }

    public void updateCost(Train train) {
        trainDao.updateCost(train);
    }
}
