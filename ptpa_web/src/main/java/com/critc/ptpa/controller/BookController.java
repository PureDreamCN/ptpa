/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.Book;
import com.critc.ptpa.model.Train;
import com.critc.ptpa.service.BookService;
import com.critc.ptpa.service.CalculateServiceCost;
import com.critc.ptpa.service.TrainService;
import com.critc.ptpa.vo.BookSearchVO;
import com.critc.util.code.GlobalCode;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * what:    客户账本controller
 *
 * @author 郭飞 created on 2017/12/8
 */
@Controller
@RequestMapping("/book")
public class BookController {

    /**
     * 客户账本service
     */
    @Autowired
    private BookService bookService;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;
    /**
     * 客车详情Service
     */

    @Autowired
    private TrainService trainService;

    /**
     * 计算变动服务成本
     */
    @Autowired
    private CalculateServiceCost calculateServiceCost;

    /**
     * 首页
     *
     * @param request  request
     * @param response response
     * @return ModelAndView
     * @author 马丽静 created on 2017/12/8
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, BookSearchVO bookSearchVO) {
        ModelAndView mv = new ModelAndView();
        int recordCount = bookService.count(bookSearchVO);// 获取查询总数
        String url = createUrl(bookSearchVO);
        PageNavigate pageNavigate = new PageNavigate(url, bookSearchVO.getPageIndex(), recordCount);// 定义分页对象
        List<Book> list = bookService.list(bookSearchVO);
        List<Train> listTrain = trainService.listAllCc();
        mv.addObject("list", list);
        mv.addObject("listTrain", listTrain);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("backUrl", StringUtil.encodeUrl(url));
        mv.setViewName("book/index");
        return mv;
    }

    /**
     * what: 创建返回url
     *
     * @param bookSearchVO 查询条件
     * @return
     * @author 马丽静 created on 2017/11/29
     */
    private String createUrl(BookSearchVO bookSearchVO) {
        String url = pubConfig.getDynamicServer() + "/book/index.htm?";
        if (bookSearchVO.getTrainId() != null && bookSearchVO.getTrainId() != 0) {
            url += "trainId=" + bookSearchVO.getTrainId();
        }
        if (StringUtil.isNotNullOrEmpty(bookSearchVO.getStartDate())) {
            url += "&startDate" + bookSearchVO.getStartDate();
        }
        if (StringUtil.isNotNullOrEmpty(bookSearchVO.getEndDate())) {
            url += "&endDate" + bookSearchVO.getEndDate();
        }

        return url;
    }


    /**
     * 跳转至新增客车账本
     *
     * @param request  request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/12/8
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("book/add");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    /**
     * 车次详情自动补全
     *
     * @param request  request
     * @param response response
     * @author 郭飞 created on 2017/12/8
     */
    @RequestMapping("/getAutoComplteTrainList")
    public void getAutoComplteTrainList(HttpServletRequest request, HttpServletResponse response) {
        List<Train> list = trainService.listAllCc();
        WebUtil.out(response, JsonUtil.toStr(list));
    }

    /**
     * what:    添加开行规律的保存方法
     *
     * @param request
     * @param response
     * @param trainId      车次id
     * @param startDate    开始日期
     * @param endDate      结束日期
     * @param intervalDays 间隔天数
     * @return
     * @author 马丽静 created on 2017/12/8
     */
    @RequestMapping("/addRule")
    public void addRule(HttpServletRequest request, HttpServletResponse response, int trainId, String startDate,
                        String endDate, int intervalDays) throws ParseException {
        List<Book> books = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date thistime = sdf.parse(startDate);
        Date end = sdf.parse(endDate);
        /**
         * 开行第一天加入列表
         */
        Book firstbook = new Book();
        firstbook.setTrainId(trainId);
        firstbook.setStartDate(thistime);
        books.add(firstbook);
        /**
         * 后续开行的日期加入列表
         */
        while (end.getTime() - thistime.getTime() >= 1000 * 3600 * 24 * intervalDays) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(thistime);
            calendar.add(Calendar.DAY_OF_MONTH, +intervalDays);
            thistime = calendar.getTime();
            Book book = new Book();
            book.setTrainId(trainId);
            book.setStartDate(thistime);
            books.add(book);
        }
        /**
         * 保存列表
         */
        int flag = bookService.addRuleList(books);
        if (flag == 0) {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=" + GlobalCode
                    .OPERA_FAILURE));
        } else {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "/success.htm?resultCode=" + GlobalCode
                    .SAVE_SUCCESS));
        }
    }

    /**
     * what:   删除数据
     *
     * @param request
     * @param response
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/12
     */
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
        int flag = bookService.delete(id);
        if (flag == 0)
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        else
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
    }

    /**
     * 跳转到修改页面
     *
     * @param request  request
     * @param response response
     * @param id       id
     * @return ModelAndView
     * @author 郭飞 created on 2017/12/11
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("book", bookService.getBookById(id));
        mv.setViewName("book/update");
        BackUrlUtil.setBackUrl(mv, request);

        return mv;
    }

    /**
     * 计算售票服务成本
     *
     * @param request  request
     * @param response response
     * @param price    票价收入
     * @author 郭飞 created on 2017/12/11
     */
    @RequestMapping("/calculateTicketAgentfee")
    public void calculateTicketAgentfee(HttpServletRequest request, HttpServletResponse response, double price) {
        WebUtil.out(response, String.valueOf(calculateServiceCost.getTicketAgentfee(price)));
    }

    /**
     * 计算车站服务成本
     *
     * @param request  request
     * @param response response
     * @param id       车次id
     * @param count    发送人数
     * @author 郭飞 created on 2017/12/11
     */
    @RequestMapping("/calculateStationService")
    public void calculateStationService(HttpServletRequest request, HttpServletResponse response, Integer id, int count) {
        WebUtil.out(response, String.valueOf(calculateServiceCost.getStationService(id, count)));
    }

    /**
     * 修改账本
     *
     * @param request  request
     * @param response response
     * @param book     book
     * @return String
     * @author 郭飞 created on 2017/12/11
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, Book book) {
        int flag = bookService.update(book);
        if (flag == 0) {
            // 修改失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            //修改成功
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }

}
