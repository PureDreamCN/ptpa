/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TractionPriceDao;
import com.critc.ptpa.model.TractionPrice;
import com.critc.ptpa.vo.TractionPriceSearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:    牵引单价Service
 *
 * @author 马丽静 created on 2017/11/28
 */
@Service
public class TractionPriceService {
    @Autowired
    TractionPriceDao tractionPriceDao;
    /**
     * what:   牵引清算单价查询方法
     *
     * @param tractionPriceeSearchVo 查询条件
     * @return 牵引清算单价列表
     * @author 马丽静 created on 2017/11/24
     */
    public List<TractionPrice> list(TractionPriceSearchVo tractionPriceeSearchVo) {
        List<TractionPrice> list = tractionPriceDao.list(tractionPriceeSearchVo);
        return list;
    }

    /**
     * what:   清算单价列表总数
     *
     * @param tractionPriceSearchVo 查询条件
     * @return 总数
     * @author 马丽静 created on 2017/11/24
     */
    public int count(TractionPriceSearchVo tractionPriceSearchVo) {
        return tractionPriceDao.count(tractionPriceSearchVo);
    }
    /**
     * what:    根据id查询单条tactionprice数据
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/4
     */
    public TractionPrice get(Integer id) {
        TractionPrice tp= tractionPriceDao.get(id);
        return tp;
    }
    /**
     * what:    新增牵引单价
     *
     * @param tractionPrice 新增实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int add(TractionPrice tractionPrice) {
        int flag = 0;
        flag = tractionPriceDao.add(tractionPrice);
        return flag;
    }
    /**
     * what:    修改牵引单价
     *
     * @param tractionPrice 修改实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int update(TractionPrice tractionPrice) {
        int flag=0;
        if(tractionPrice.getId()==0){
            flag =  tractionPriceDao.add(tractionPrice);
        }else{
            flag =  tractionPriceDao.update(tractionPrice);
        }
        return flag;
    }
    /**
     * what:    删除牵引单价
     *
     * @param
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int delete( int id) {
        return tractionPriceDao.delete(id);
    }
}
