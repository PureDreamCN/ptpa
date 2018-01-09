/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Bureau;
import com.critc.util.model.ComboboxVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:    路局dao
 *
 * @author 郭飞 created on 2017/11/24
 */
@Repository
public class BureauDao  extends BaseDao<Bureau, Bureau> {

    /**
     * 获取所有路局信息
     * @return List
     * @author 郭飞 created on 2017/11/24
     */
    public  List<Bureau> list() {
        String sql = "select ljdm, name, short_name, code from t_dic_bureau";
        return list(sql);
    }

    /**
     * 新增路局信息
     * @param bureau 路局实体类
     * @return int
     * @author 郭飞 created on 2017/11/29
     */
    public int add(Bureau bureau) {
        String sql = "insert into t_dic_bureau(ljdm, name, short_name, code) values(:ljdm, :name, :shortName, :code)";
        return insert(sql, bureau);
    }

    /**
     * 修改路局
     * @param bureau 路局实体
     * @param ljdm 路局代码
     * @return int
     * @author 郭飞 created on 2017/11/29
     */
    public int update(Bureau bureau, String ljdm){
        String sql = "update t_dic_bureau set  ljdm = ?, name = ?, short_name=?, code = ? where ljdm =?";

        return update(sql, bureau.getLjdm(),bureau.getName(),bureau.getShortName(),bureau.getCode(),ljdm);
    }
    /**
     * 删除路局信息
     * @param ljdm 路局代码
     * @return int
     * @author 郭飞 created on 2017/11/29
     */
    public int delete(String ljdm){
        String sql = "delete from t_dic_bureau where ljdm =?";
        return delete(sql, ljdm);
    }
    /**
     * 获取单个路局信息
     * @param ljdm ljdm
     * @return Bureau
     * @author 郭飞 created on 2017/11/29
     */
    public Bureau getBureau(String ljdm){
        String sql = "select ljdm, name, short_name, code from t_dic_bureau where ljdm=?";
        return get(sql, ljdm);
    }

    /**
     * 生成路局下拉框-简称
     * @return List
     * @author 郭飞 created on 2017/11/27
     */
    public List<ComboboxVO> listbureauComboToShortName(){
        String sql = "select ljdm as value ,short_name as  content from  t_dic_bureau";
        return listCombobox(sql);
    }
    /**
     * 生成路局下拉框-全称
     * @return List
     * @author 郭飞 created on 2017/11/27
     */
    public List<ComboboxVO> listbureauComboToName(){
        String sql = "select ljdm as value ,name as  content from  t_dic_bureau";
        return listCombobox(sql);
    }

    /**
     * 通过路局代码获得名称
     * @param ljdm
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getNameByLjdm(String ljdm){
       String sql = "select name from t_dic_bureau where ljdm = ?";
       return jdbcTemplate.queryForObject(sql, new Object[]{ljdm} ,String.class);
    }

    /**
     * 通过名称获得路局代码
     * @param name
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getLjdmByName(String name){
        String sql = "select ljdm from t_dic_bureau where name = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{name} ,String.class);
    }

}
