/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.CePriceDao;
import com.critc.ptpa.model.CePrice;
import com.critc.ptpa.vo.CePriceSearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   接触网和电费单价Service
 *
 * @author 马丽静 created on 2017/11/28
 */
@Service
public class CePriceService {
    @Autowired
    CePriceDao cePriceDao;
    /**
     * what:  接触网和电费清算单价查询方法
     *
     * @param cePriceeSearchVo 查询条件
     * @return 接触网和电费清算单价列表
     * @author 马丽静 created on 2017/11/28
     */
    public List<CePrice> list(CePriceSearchVo cePriceeSearchVo) {
        List<CePrice> list = cePriceDao.list(cePriceeSearchVo);
        return list;
    }
    /**
     * what:   根据id查询单条ceprice数据
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/4
     */
    public CePrice get(Integer id) {
       CePrice ce= cePriceDao.get(id);
        return ce;
    }

    /**
     * what:   清算单价列表总数
     *
     * @param cePriceSearchVo 查询条件
     * @return 总数
     * @author 马丽静 created on 2017/11/28
     */
    public int count(CePriceSearchVo cePriceSearchVo) {
        return cePriceDao.count(cePriceSearchVo);
    }
    /**
     * what:    新增接触网和电费单价
     *
     * @param cePrice 新增实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int add(CePrice cePrice) {
        int flag = 0;
        flag = cePriceDao.add(cePrice);
        return flag;
    }
    /**
     * what:    修改接触网和电费单价
     *
     * @param cePrice 修改实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int update(CePrice cePrice) {
        int flag=0;
        if(cePrice.getId()==0){
            flag =  cePriceDao.add(cePrice);
        }else{
            flag =  cePriceDao.update(cePrice);
        }
        return flag;
    }
    /**
     * what:    删除接触网和电费单价
     *
     * @param
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int delete( int id) {
        return cePriceDao.delete(id);
    }

}
