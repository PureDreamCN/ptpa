/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.model.TrainTicketprice;
import com.critc.ptpa.model.TrainVehicle;
import com.critc.ptpa.model.TrainVehicleSeat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   收入计算 <br/>
 *
 * @author 杨超凡 created on 2017/12/7
 */
@Service
public class CalculateIncomeService {
    @Autowired
    TrainVehicleSeatService trainVehicleSeatService;
    @Autowired
    TrainVehicleService trainVehicleService;
    @Autowired
    TrainTicketpriceService trainTicketpriceService;
    @Autowired
    CalculateServiceCost calculateServiceCost;
    @Autowired
    CalculateCostService calculateCostService;

    /**
     * what:  总定员数 <br/>
     *
     * @param trainId
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/11
     */
    public int seatCount(int trainId){
        int seatCount = 0;
        for (TrainVehicle trainVehicle : trainVehicleService.listAll(trainId)){
            for (TrainVehicleSeat trainVehicleSeat : trainVehicleSeatService.listAll(trainVehicle.getId())){
                seatCount +=trainVehicleSeat.getCapacity();
            }
        }
        return seatCount;
    }

    /**
     * what: 全程票价 <br/>
     *
     * @param trainId
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/11
     */
    public double totalticketprice(int trainId) {
        double price = 0d;
        List<TrainTicketprice> ticketpriceList = trainTicketpriceService.listAll(trainId);
        for (TrainVehicle trainVehicle : trainVehicleService.listAll(trainId)){
            for (TrainVehicleSeat trainVehicleSeat : trainVehicleSeatService.listAll(trainVehicle.getId())){
                for (TrainTicketprice ticket : ticketpriceList) {
                    if(trainVehicleSeat.getSeatTypeCode().equals(ticket.getSeatTypeCode())) {
                        price += trainVehicleSeat.getCapacity() * ticket.getPrice();
                    }
                }
            }
        }
        return price;
    }

    public double banlancepoit(int trainId) {
        double banlancepoit = 0d;
        banlancepoit = calculateCostService.constantCost(trainId)/(totalticketprice(trainId)-calculateServiceCost.getStationServicePrice(trainId)*seatCount(trainId)-calculateServiceCost.getTicketAgentfee(totalticketprice(trainId)))*100;
        return banlancepoit;
    }

}
