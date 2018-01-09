/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/**
 * what:  成本计算基类
 *
 * @author 杨超凡 created on 2017/12/5
 */
public abstract class CalculateCost {
    CostResource costResource;

    public abstract void cost();
    public CalculateCost(CostResource costResource){
        this.costResource = costResource;
    }
    protected  <T> Double cost(List<T> list){
        Double cost = 0d;
        for(T data : list){
            Class clazz = data.getClass();
            try {
                Method method = clazz.getDeclaredMethod("cost");
                cost += (Double)method.invoke(data);
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return cost;
    }

}
