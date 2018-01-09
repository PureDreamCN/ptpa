/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Book;
import com.critc.ptpa.vo.BookSearchVO;
import com.critc.util.page.PageUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  客户账本dao
 *
 * @author 郭飞 created on 2017/12/8
 */
@Repository
public class BookDao extends BaseDao<Book, BookSearchVO> {

    /**
     * what:   添加开行规律的方法
     *
     * @param book
     * @return
     * @author 马丽静 created on 2017/12/8
     */
    public int addRule(Book book) {
        String sql = "insert into t_book(id,train_id, start_date) values(seq_t_book.nextval, :trainId,:startDate)";
        return insert(sql, book);
    }

    /**
     * what:    查询客车列表的方法
     *
     * @param bookSearchVO 查询条件
     * @return
     * @author 马丽静 created on 2017/12/8
     */
    public List<Book> list(BookSearchVO bookSearchVO) {
        String sql = "select  t2.cc,t2.name,t1.id,t1.train_id," +
                "t1.start_date," +
                "t1.pt_ticke_incoming,t1.pt_person_count,t1.dr_ticke_incoming,t1.dr_person_count,t1.pt_ticket_service_cost," +
                "t1.pt_station_service_cost,t1.dr_ticket_service_cost,t1.dr_station_service_cost  from t_book  t1,t_train t2 " +
                " where 1=1 and t1.train_id=t2.id";
        sql += createSearchSql(bookSearchVO);
        sql += " order by start_date desc ";
        sql = PageUtil.createOraclePageSQL(sql, bookSearchVO.getPageIndex());
        return list(sql, bookSearchVO);
    }

    /**
     * what:  查询总数
     *
     * @param bookSearchVO
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public int count(BookSearchVO bookSearchVO) {
        String sql = "select count(*) from t_book t,t_train t2 where 1=1 and t.train_id=t2.id ";
        sql += createSearchSql(bookSearchVO);
        return count(sql, bookSearchVO);
    }

    /**
     * what:  创建查询条件
     *
     * @param bookSearchVO
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    private String createSearchSql(BookSearchVO bookSearchVO) {
        String sql = "";
        if (bookSearchVO.getTrainId() != null&&bookSearchVO.getTrainId() != 0) {
            sql += " and train_id=:trainId";
        }
        if (bookSearchVO.getStartDate() != null) {
            sql += " and start_date > =to_date(:startDate,'yyyy-MM-dd')";
        }
        if (bookSearchVO.getEndDate() != null) {
            sql += " and start_date <= to_date(:endDate,'yyyy-MM-dd')";
        }
        if (bookSearchVO.getCc()!=null) {
            sql += " and t2.cc = :cc ";
        }
        return sql;
    }

    /**
     * 获取单个账本信息
     * @param id 主键
     * @return Book
     * @author 郭飞 created on 2017/12/11
     */
    public Book getBookById(int id){
        String sql =  "select (select cc from t_train t2 where  t1.train_id=t2.id) cc,t1.id,t1.train_id,t1.start_date," +
                "decode(null,t1.pt_ticke_incoming,0,t1.pt_ticke_incoming) pt_ticke_incoming ," +
                "decode(null,t1.pt_person_count,0,t1.pt_person_count) pt_person_count ," +
                "decode(null,t1.dr_ticke_incoming,0,t1.dr_ticke_incoming) dr_ticke_incoming  ," +
                "decode(null,t1.dr_person_count,0,t1.dr_person_count) dr_person_count ," +
                "decode(null,t1.pt_ticket_service_cost,0,t1.pt_ticket_service_cost) pt_ticket_service_cost ," +
                "decode(null,t1.pt_station_service_cost,0,t1.pt_station_service_cost) pt_station_service_cost ," +
                "decode(null,t1.dr_ticket_service_cost,0,t1.dr_ticket_service_cost) dr_ticket_service_cost ," +
                "decode(null,t1.dr_station_service_cost,0,t1.dr_station_service_cost) dr_station_service_cost   from t_book  t1 " +
                " where 1=1  and t1.id=?";
        return get(sql, id);
    }

    /**
     * 更新账本
     * @param book book
     * @return int
     * @author 郭飞 created on 2017/12/11
     */
    public int update(Book book){
       String sql = "update t_book set pt_ticke_incoming =:ptTickeIncoming , pt_person_count=:ptPersonCount ,dr_ticke_incoming =:drTickeIncoming ,dr_person_count=:drPersonCount," +
               "pt_ticket_service_cost=:ptTicketServiceCost,pt_station_service_cost=:ptStationServiceCost,dr_ticket_service_cost=:drTicketServiceCost,dr_station_service_cost=:drStationServiceCost where id=:id";
        return update(sql, book);
    }

    /**
     * what:    删除
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/12
     */
    public int delete(int id) {
        String sql = "delete from t_book where id=?";
        return delete(sql, id);
    }
}
