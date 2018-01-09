/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.model.Train;
import com.critc.ptpa.model.TrainVehicle;
import com.critc.ptpa.model.TrainVehicleSeat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * what:  计算变动服务成本 <br/>
 *
 * @author 杨超凡 created on 2017/12/8
 */
@Service
public class CalculateServiceCost {
    @Autowired
    TrainService trainService;
    @Autowired
    TrainVehicleSeatService trainVehicleSeatService;
    @Autowired
    TrainVehicleService trainVehicleService;

    /**
     * what:  售票成本 <br/>
     *
     * @param price
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/12
     */
    public double getTicketAgentfee(double price){
        return price*(0.01);
    }

    public  double getServicefee(Integer id,int count){
        //总席别数
        /*int seatCount = 0;
        for (TrainVehicle trainVehicle : trainVehicleService.listAll(id)){
            for (TrainVehicleSeat trainVehicleSeat : trainVehicleSeatService.listAll(trainVehicle.getId())){
                seatCount +=trainVehicleSeat.getCapacity();
            }
        }*/
        return count*trainService.getTrainById(id).getStationServicePrice();
    }

    public  double getStationServicePrice(Integer id){

        return trainService.getTrainById(id).getStationServicePrice();
    }
    /**
     * what:  车站旅客服务成本 <br/>
     *
     * @param id
     * @param count
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/12
     */
    public  double getStationService(Integer id,double count){
        return trainService.getTrainById(id).getStationServicePrice()*count;
    }

}
