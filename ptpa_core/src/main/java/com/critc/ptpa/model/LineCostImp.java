/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:  线路区段成本计算
 *
 * @author 杨超凡 created on 2017/12/5
 */
public class LineCostImp extends CalculateCost {
    public LineCostImp(CostResource costResource) {
        super(costResource);
    }
    @Override
    public void cost() {
        costResource.setLineCost(cost(costResource.getTrainLineList()));
    }

}
