/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:  接触网区段成本计算 <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
public class TractionceCostImp extends CalculateCost{
    public TractionceCostImp(CostResource costResource) {
        super(costResource);
    }
    @Override
    public void cost() {
        costResource.setTractionceCost(cost(costResource.getTrainCeList()));
    }
}
