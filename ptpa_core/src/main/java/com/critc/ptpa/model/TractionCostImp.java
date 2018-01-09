/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:  牵引区段成本计算 <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
public class TractionCostImp extends CalculateCost{
    public TractionCostImp(CostResource costResource) {
        super(costResource);
    }
    @Override
    public void cost() {
        costResource.setTractionCost(cost(costResource.getTrainTractionList()));
    }
}
