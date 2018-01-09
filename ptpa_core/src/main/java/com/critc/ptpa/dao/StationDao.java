/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Station;
import com.critc.ptpa.vo.StationSearchVO;
import com.critc.util.model.ComboboxVO;
import com.critc.util.page.PageUtil;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * what:   车站dao
 *
 * @author 郭飞 created on 2017/11/24
 */
@Repository
public class StationDao  extends BaseDao<Station, StationSearchVO> {

    /**
     * 获取所有 车站信息
     * @return List
     * @author 郭飞 created on 2017/11/24
     */
    public List<Station> list(StationSearchVO stationSearchVo){
         String sql = " select b.czdm, b.name,b.pinyin , t.name bureauName,b.ljdm from  t_dic_bureau  t,t_dic_station b where t.ljdm = b.ljdm ";
         sql+= createSearchSql(stationSearchVo);
         sql+= " order by b.pinyin ";
         sql = PageUtil.createOraclePageSQL(sql, stationSearchVo.getPageIndex(),stationSearchVo.getPageSize());

         return list(sql, stationSearchVo);
    }

    /**
     * 获取所有车站信息 为下拉框 提供数据
     * @return List
     * @author 郭飞 created on 2017/11/28
     */
    public List<Map<String, Object>> listStationCombo(){
        String sql = "select czdm value, name content  from t_dic_station";
        return jdbcTemplate.queryForList(sql);
    }
    /**
     * 车站总数
     * @return int
     * @author 郭飞 created on 2017/11/24
     */
    public  int count(StationSearchVO stationSearchVo) {
        String sql = " select count(*) from  t_dic_station b where 1=1 ";
        sql+= createSearchSql(stationSearchVo);

        return count(sql, stationSearchVo);
    }

    /**
     * 生成车站下拉框-全称
     * @return List
     * @author 杨超凡 created on 2017/11/27
     */
    public List<ComboboxVO> listStationComboToName(){
        String sql = "select czdm as value ,name as  content from  t_dic_bureau";
        return listCombobox(sql);
    }

    /**
     * 生成查询url
     * @param stationSearchVo 车站查询条件类
     * @return String
     */
    private String createSearchSql(StationSearchVO stationSearchVo) {

        String sql = "";
        System.out.print("Pinyin"+stationSearchVo.getPinyin());
        if (!stationSearchVo.getPinyin().equals("%null%")) {
            sql += " and b.pinyin like :pinyin";
        }
        if (!stationSearchVo.getName().equals("%null%")) {
            sql += " and b.name like :name";
        }
        if (!stationSearchVo.getLjdm().equals("%null%")) {
            sql += " and b.ljdm like :ljdm";
        }
        if (!stationSearchVo.getCzdm().equals("%null%")) {
            sql += " and b.czdm like :czdm";
        }

        return sql;
    }

    /**
     * 通过车站代码获得名称
     * @param czdm
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getNameByCzdm(String czdm){
        String sql = "select name from t_dic_station where czdm = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{czdm} ,String.class);
    }

    /**
     * 通过车站名称获得车站代码
     * @param name
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getCzdmByName(String name){
        String sql = "select czdm from t_dic_station where name = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{name} ,String.class);
    }


    /**
     * 修改车站
     * @param station station
     * @param czdm  czdm
     * @return int
     * @author 郭飞 created on 2017/12/19
     */
    public int update(Station station,  String czdm){
         String sql = "update t_dic_station set czdm=?,name=?,pinyin=?,ljdm=? where czdm=?";
         return update(sql, station.getCzdm(), station.getName(), station.getPinyin(), station.getLjdm(), czdm);
    }

    /**
     * 新增车站
     * @param station station
     * @return int
     */
    public int add(Station station){
         String sql = "insert into t_dic_station(czdm,name,pinyin,ljdm) values(:czdm,:name,:pinyin,:ljdm) ";
         return insert(sql, station);
    }

    /**
     * 删除车站
     * @param czdm czdm
     * @return int
     */
    public int delete(String czdm){
         String sql = "delete from t_dic_station where czdm=?";
         return delete(sql, czdm);
    }

}
