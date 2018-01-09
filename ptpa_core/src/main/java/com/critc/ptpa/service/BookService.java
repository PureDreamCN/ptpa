/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.BookDao;
import com.critc.ptpa.model.Book;
import com.critc.ptpa.vo.BookSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:    客户账本service
 *
 * @author 郭飞 created on 2017/12/8
 */
@Service
public class BookService {

    /**
     * 客户账本dao
     */
    @Autowired
    private BookDao bookDao;

    /**
     * what:    批量添加开行规律service
     *
     * @param books
     * @return
     * @author 马丽静 created on 2017/12/8
     */
    public int addRuleList(List<Book> books) {
        int flag = 0;
        for (Book book : books) {
            flag += bookDao.addRule(book);
        }
        return flag;
    }

    /**
     * what:    查询客车账本列表的方法
     *
     * @param bookSearchVO
     * @return
     * @author 马丽静 created on 2017/12/8
     */
    public List<Book> list(BookSearchVO bookSearchVO) {
        return bookDao.list(bookSearchVO);
    }

    /**
     * what:   客车账本列表总数
     *
     * @param bookSearchVO 查询条件
     * @return 总数
     * @author 马丽静 created on 2017/11/28
     */

    public int count(BookSearchVO bookSearchVO) {
        return bookDao.count(bookSearchVO);
    }

    /**
     * what:    删除
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/12
     */
    public int delete(int id) {
        return bookDao.delete(id);
    }

    /**
     * 获取单个账本信息
     *
     * @param id 主键
     * @return Book
     * @author 郭飞 created on 2017/12/11
     */
    public Book getBookById(int id) {
        return bookDao.getBookById(id);
    }

    /**
     * 更新账本
     *
     * @param book book
     * @return int
     * @author 郭飞 created on 2017/12/11
     */
    public int update(Book book) {
        return bookDao.update(book);
    }
}
