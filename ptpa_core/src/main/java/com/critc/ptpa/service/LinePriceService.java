/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.LinePriceDao;
import com.critc.ptpa.model.LinePrice;
import com.critc.ptpa.vo.LinePriceSearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:    线路清算单价Service
 *
 * @author 马丽静 created on 2017/11/24
 */
@Service
public class LinePriceService {
    @Autowired
    LinePriceDao linePriceDao;

    /**
     * what:   线路清算单价查询方法
     *
     * @param linePriceSearchVo 查询条件
     * @return 线路清算单价列表
     * @author 马丽静 created on 2017/11/24
     */
    public List<LinePrice> list(LinePriceSearchVo linePriceSearchVo) {
        List<LinePrice> list = linePriceDao.list(linePriceSearchVo);
        return list;
    }

    /**
     * what:    根据id查询单条lineprice数据
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/4
     */
    public LinePrice get(Integer id) {
        LinePrice lp = linePriceDao.get(id);
        return lp;
    }

    /**
     * what:   清算单价列表总数
     *
     * @param linePriceSearchVo 查询条件
     * @return 总数
     * @author 马丽静 created on 2017/11/24
     */
    public int count(LinePriceSearchVo linePriceSearchVo) {
        return linePriceDao.count(linePriceSearchVo);
    }

    /**
     * what:   线路清算单价查询方法
     *
     * @param linePriceSearchVo 查询条件
     * @return 线路清算单价列表
     * @author 马丽静 created on 2017/11/24
     */
    public List<LinePrice> linePriceByParams(LinePriceSearchVo linePriceSearchVo) {
        List<LinePrice> list = linePriceDao.list(linePriceSearchVo);
        return list;
    }

    /**
     * what:    修改线路单价
     *
     * @param linePrice 修改实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int update(LinePrice linePrice) {
        int flag=0;
        if(linePrice.getId()==0){
            flag =  linePriceDao.add(linePrice);
        }else{
          flag =  linePriceDao.update(linePrice);
        }
        return  flag;
    }
    /**
     * what:    删除线路单价
     *
     * @param
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int delete( int id) {
        return linePriceDao.delete(id);
    }

}

