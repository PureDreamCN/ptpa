/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.controller;

import com.critc.ptpa.model.*;
import com.critc.ptpa.service.*;
import com.critc.ptpa.service.TrainService;
import com.critc.ptpa.vo.TrainSearchVO;
import com.critc.sys.service.SysDicService;
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
import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

/**
 * what:  客车车次详情
 *
 * @author 杨超凡 created on 2017/11/24
 */
@Controller
@RequestMapping("/train")
public class TrainController {
    /**
     * 客车详情Service
     */
    @Autowired
    private TrainService trainService;
    /**
     * 路局Service
     */
    @Autowired
    private BureauService bureauService;
    /**
     * 车站Service
     */
    @Autowired
    private StationService stationService;
    /**
     * 系统字典Service
     */
    @Autowired
    private SysDicService sysDicService;
    /**
     * 车次人力配置Service
     */
    @Autowired
    private TrainHumanResourceService trainHumanResourceService;
    /**
     * 人力清算单价Service
     */
    @Autowired
    private PriceHumanResourceService priceHumanResourceService;
    /**
     * 车次服务Service
     */
    @Autowired
    private TrainServiceService trainServiceService;
    /**
     * 车次服务清算Service
     */
    @Autowired
    private PriceServiceService priceServiceService;
    /**
     * 车次线路区段Service
     */
    @Autowired
    private TrainLineService trainLineService;
    /**
     * 清算线路区段Service
     */
    @Autowired
    private LinePriceService linePriceService;
    /**
     * 客运线路Service
     */
    @Autowired
    private RailwayService railwayService;
    /**
     * 车次牵引区段Service
     */
    @Autowired
    private TrainTractionService trainTractionService;
    /**
     * 清算牵引区段Service
     */
    @Autowired
    private TractionPriceService tractionPriceService;
    /**
     * 车次接触网Service
     */
    @Autowired
    private TrainCeService trainCeService;
    /**
     * 清算接触网Service
     */
    @Autowired
    private CePriceService cePriceService;
    /**
     * 车次备品Service
     */
    @Autowired
    private TrainPartService trainPartService;
    /**
     * 清算备品Service
     */
    @Autowired
    private PricePartService pricePartService;
    /**
     * 列车编组Service
     */
    @Autowired
    private TrainVehicleService trainVehicleService;
    /**
     * 车辆Service
     */
    @Autowired
    private VehicleService vehicleService;
    /**
     * 车辆维修Service
     */
    @Autowired
    private VehicleMaintainService vehicleMaintainService;
    /**
     * 席别Service
     */
    @Autowired
    private VehicleSeatService vehicleSeatService;
    /**
     * 车次车辆类型维修Service
     */
    @Autowired
    private TrainVehicleMaintainService trainVehicleMaintainService;
    /**
     * 车次编组车辆席位配置Service
     */
    @Autowired
    private TrainVehicleSeatService trainVehicleSeatService;
    /**
     * 席别票价维护Service
     */
    @Autowired
    private TrainTicketpriceService trainTicketpriceService;
    /**
     * 车站旅客服务Service
     */
    @Autowired
    private PriceStationServiceService priceStationServiceService;
    @Autowired
    private CalculateCostService calculateCostService;
    /**
     * what: 客车详情首页
     *
     * @param request request
     * @param trainSearchVO 车次详情VO
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/24
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, TrainSearchVO trainSearchVO) {
        ModelAndView mv = new ModelAndView();
        int recordCount = trainService.count(trainSearchVO);
        String url = createUrl(trainSearchVO);
        PageNavigate pageNavigate = new PageNavigate(url, trainSearchVO.getPageIndex(), recordCount);
        List<Train> list = trainService.list(trainSearchVO);
        mv.addObject("pageNavigate", pageNavigate);
        mv.addObject("list", list);
        mv.setViewName("/train/index");
        BackUrlUtil.createBackUrl(mv, request, url);
        return mv;
    }

    /**
     * what: 客车详情新增页
     *
     * @param request request
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/24
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        BackUrlUtil.setBackUrl(mv, request);
        mv.addObject("train", new Train());
        mv.addObject("listBureau", bureauService.listbureauComboToName());
        mv.addObject("listTrainLevel",sysDicService.getByCategory("TRAIN_LEVEL"));
        mv.addObject("listTrainType",sysDicService.getByCategory("TRAIN_TYPE"));
        mv.addObject("listTrainMarshallingType",sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));
        mv.setViewName("/train/add");
        return mv;
    }

    /**
     * what: 客车详情新增
     *
     * @param request request
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/24
     */
    @RequestMapping("/add")
    public String add(HttpServletRequest request,@Valid Train train) {
        String backUrl = request.getParameter("backUrl");
        Integer id=trainService.add(train,request);
        if(id > 0) {
            return "forward:/success.htm?backUrl=toUpdate.htm?id="+ id + "&resultCode=" + GlobalCode.SAVE_SUCCESS;
        }else {
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        }
    }

    /**
     * what: 车次详情更新
     *
     * @param request
     * @param train
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/28
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request,@Valid Train train) {
        if(trainService.update(train,request) > 0) {
            return "forward:/success.htm?backUrl=toUpdate.htm?id="+ train.getId() + "&resultCode=" + GlobalCode.SAVE_SUCCESS;
        }else {
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        }
    }

    /**
     * what:  车次详细信息删除
     *
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/24
     */
    @RequestMapping("/delete")
    public void delete(HttpServletResponse response, Train train) {
        if(trainService.delete(train.getId()) > 0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what:  跳转更新页面
     *
     * @param id 车次ID
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/28
     */
    @RequestMapping("/toUpdate")
    public ModelAndView add(Integer id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("listBureau", bureauService.listbureauComboToName());
        mv.addObject("listTrainLevel",sysDicService.getByCategory("TRAIN_LEVEL"));
        mv.addObject("listTrainType",sysDicService.getByCategory("TRAIN_TYPE"));
        mv.addObject("listTrainMarshallingType",sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));
//        mv.addObject("listHumanResourceType",sysDicService.getByCategory("HUMANRESOURCE_TYPE"));
//        List<TrainHumanResource> listHumanResource = trainHumanResourceService.listAll();
//        List<TrainLine> listTrainLine = trainLineService.listAll();
//        mv.addObject("listHumanResource", listHumanResource);
//        mv.addObject("listTrainLine", listTrainLine);
        mv.addObject("train",trainService.getTrainById(id));
        mv.setViewName("/train/baseinfo");
        return mv;
    }

    /**
     * what: 人力配置页跳转
     *
     * @param
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/humanresource")
    public ModelAndView humanresource(Integer id){
        ModelAndView mv = new ModelAndView();
        TrainHumanResource trainHumanResource = new TrainHumanResource();
        List<TrainHumanResource> listHumanResource = trainHumanResourceService.listAll(id);
        mv.addObject("listBureau", bureauService.listbureauComboToName());
        mv.addObject("listHumanResourceType",sysDicService.getByCategory("HUMANRESOURCE_TYPE"));
        mv.addObject("listHumanResource", listHumanResource);
        mv.addObject("humanResource", trainHumanResource);
        mv.addObject("id", id);
        mv.setViewName("/train/humanresource");
        return mv;
    }
    /**
     * what:  拼接返回链接
     *
     * @param trainSearchVO 车次详情VO
     *
     * @return url
     *
     * @author 杨超凡 created on 2017/11/24
     */
    private String createUrl(TrainSearchVO trainSearchVO){
        String url="index.htm?cc=";
        if(StringUtil.isNotNullOrEmpty(trainSearchVO.getCc()))
            url += trainSearchVO.getCc();
        return url;
    }

    /**
     *
     * what: 自动补全车次数据列表
     *
     * @param response response
     *
     * @author 杨超凡 created on 2017/11/24
     */
    @RequestMapping("/getCcList")
    public void getAutoComplteList(HttpServletResponse response) {
        List<Train> list= trainService.listAllCc();
        WebUtil.out(response, JsonUtil.toStr(trainService.listAllCc()));
    }

    /**
     * what:  车次详细信息
     *
     * @param trainSearchVO 车次详情VO
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/24
     */
    @RequestMapping("/showdetail")
    public ModelAndView showdetail(TrainSearchVO trainSearchVO){
        ModelAndView mv = new ModelAndView();
        try {
            updateCostData(trainSearchVO.getId());
        }catch (Exception e){
            System.out.println("信息维护不完整！");
            e.printStackTrace();
        }
        Train traindetail = trainService.getTrainById(trainSearchVO.getId());
        if(null != traindetail.getBeginCzdm()) {
            traindetail.setBeginCzdm(stationService.getNameByCzdm(traindetail.getBeginCzdm()));
        }
        if(null != traindetail.getBeginCzdm()) {
            traindetail.setEndCzdm(stationService.getNameByCzdm(traindetail.getEndCzdm()));
        }
        traindetail.setLjdm(bureauService.getNameByLjdm(traindetail.getLjdm()));
        //线路
        List<TrainLine> listTrainLine = trainLineService.listAll(trainSearchVO.getId());
        mv.addObject("listTrainLine", listTrainLine);
        //牵引
        List<TrainTraction> listTrainTraction = trainTractionService.listAll(trainSearchVO.getId());
        mv.addObject("listTrainTraction", listTrainTraction);
        //接触网
        List<TrainCe> listTrainCe = trainCeService.listAll(trainSearchVO.getId());
        mv.addObject("listTrainCe", listTrainCe);
        //列车编组
        List<TrainVehicle> listTrainVehicle = trainVehicleService.listAll(trainSearchVO.getId());
        mv.addObject("listTrainVehicle", listTrainVehicle);
        //人力
        List<TrainHumanResource> listHumanResource = trainHumanResourceService.listAll(trainSearchVO.getId());
        mv.addObject("listHumanResource", listHumanResource);
        //备品
//        List<TrainPart> listTrainPart = trainPartService.listAll(trainSearchVO.getId());
//        mv.addObject("listTrainPart", listTrainPart);
        //服务
        List<com.critc.ptpa.model.TrainService> listTrainService = trainServiceService.listAll(trainSearchVO.getId());
        mv.addObject("listTrainService", listTrainService);
        //席别票价
        List<TrainTicketprice> listTrainTicketprice = trainTicketpriceService.listAll(trainSearchVO.getId());
        mv.addObject("listTrainTicketprice", listTrainTicketprice);
        mv.addObject("train",traindetail);
        mv.setViewName("/train/showdetail");

        return mv;
    }

    /**
     * what:  人力配置信息新增
     *
     * @param trainHumanresource 人力配置信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/humanResourceAdd")
    public void humanResourceAdd(HttpServletResponse response,TrainHumanResource trainHumanresource){
        if(priceHumanResourceService.getByLjdmAndHumanResourceTypeCode(trainHumanresource.getLjdm(),trainHumanresource.getHumanResourceTypeCode()).size()>0){
            PriceHumanResource PriceHumanResource  = (PriceHumanResource)priceHumanResourceService.getByLjdmAndHumanResourceTypeCode(trainHumanresource.getLjdm(),trainHumanresource.getHumanResourceTypeCode()).get(0);
            trainHumanresource.setPrice(PriceHumanResource.getPrice());
            trainHumanresource.setRate(PriceHumanResource.getRate());
        }
        if (trainHumanResourceService.add(trainHumanresource)>0) {
//            updateCostData(trainHumanresource.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  人力配置信息修改
     *
     * @param trainHumanresource 人力配置信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/humanResourceUpdate")
    public void humanResourceUpdate(HttpServletResponse response,TrainHumanResource trainHumanresource){
        if(priceHumanResourceService.getByLjdmAndHumanResourceTypeCode(trainHumanresource.getLjdm(),trainHumanresource.getHumanResourceTypeCode()).size()>0){
            PriceHumanResource PriceHumanResource  = (PriceHumanResource)priceHumanResourceService.getByLjdmAndHumanResourceTypeCode(trainHumanresource.getLjdm(),trainHumanresource.getHumanResourceTypeCode()).get(0);
            trainHumanresource.setPrice(PriceHumanResource.getPrice());
            trainHumanresource.setRate(PriceHumanResource.getRate());
        }
        if (trainHumanResourceService.update(trainHumanresource)>0) {
//            updateCostData(trainHumanresource.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "修改成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "修改失败"));
        }
    }

    /**
     * what:  人力配置信息删除
     *
     * @param trainHumanresource 人力配置信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/humanResourceDelete")
    public void humanResourceDelete(HttpServletResponse response,TrainHumanResource trainHumanresource){
        if (trainHumanResourceService.delete(trainHumanresource)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what: 车次服务页跳转
     *
     * @param
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/trainservice")
    public ModelAndView trainservice(Integer id){
        ModelAndView mv = new ModelAndView();
        com.critc.ptpa.model.TrainService trainservice = new com.critc.ptpa.model.TrainService();
        List<com.critc.ptpa.model.TrainService> listTrainService = trainServiceService.listAll(id);
        mv.addObject("listBureau", bureauService.listbureauComboToName());
        mv.addObject("listServiceType",sysDicService.getByCategory("SERVICE_TYPE"));
        mv.addObject("listTrainService", listTrainService);
        mv.addObject("trainservice", trainservice);
        mv.addObject("id", id);
        mv.setViewName("/train/trainservice");
        return mv;
    }

    /**
     * what:  车次服务信息新增
     *
     * @param trainService 车次服务信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/trainserviceAdd")
    public void trainserviceAdd(HttpServletResponse response, com.critc.ptpa.model.TrainService trainService){
        if(priceServiceService.getByLjdmAndServiceCode(trainService.getLjdm(),trainService.getServiceCode()).size()>0) {
            trainService.setPrice(priceServiceService.getByLjdmAndServiceCode(trainService.getLjdm(), trainService.getServiceCode()).get(0).getPrice());
            trainService.setUnit(priceServiceService.getByLjdmAndServiceCode(trainService.getLjdm(), trainService.getServiceCode()).get(0).getUnit());
        }
        trainService.setServiceName(sysDicService.getByCategory("SERVICE_TYPE").stream().filter((sysDic -> sysDic.getCode().equals(trainService.getServiceCode()))).collect(Collectors.toList()).get(0).getName());
        if (trainServiceService.add(trainService)>0) {
//            updateCostData(trainService.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  车次服务信息修改
     *
     * @param trainService 车次服务信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/trainserviceUpdate")
    public void trainserviceUpdate(HttpServletResponse response, com.critc.ptpa.model.TrainService trainService){
        if(priceServiceService.getByLjdmAndServiceCode(trainService.getLjdm(),trainService.getServiceCode()).size()>0) {
            trainService.setPrice(priceServiceService.getByLjdmAndServiceCode(trainService.getLjdm(), trainService.getServiceCode()).get(0).getPrice());
            trainService.setUnit(priceServiceService.getByLjdmAndServiceCode(trainService.getLjdm(), trainService.getServiceCode()).get(0).getUnit());
        }
        trainService.setServiceName(sysDicService.getByCategory("SERVICE_TYPE").stream().filter((sysDic -> sysDic.getCode().equals(trainService.getServiceCode()))).collect(Collectors.toList()).get(0).getName());
        if (trainServiceService.update(trainService)>0) {
//            updateCostData(trainService.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "修改成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "修改失败"));
        }
    }

    /**
     * what:  车次服务信息删除
     *
     * @param trainService 车次服务信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/trainserviceDelete")
    public void trainserviceDelete(HttpServletResponse response, com.critc.ptpa.model.TrainService trainService){
        if (trainServiceService.delete(trainService)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what: 线路区段维护页跳转
     *
     * @param id 车次详情id
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/line")
    public ModelAndView line(Integer id){
        ModelAndView mv = new ModelAndView();
        TrainLine trainLine = new TrainLine();
        List<TrainLine> listTrainLine = trainLineService.listAll(id);
        mv.addObject("listBureau", bureauService.listbureauComboToName());
        //列车繁忙程度
        mv.addObject("listLineBusyLevel", sysDicService.getByCategory("LINE_BUSY_LEVEL"));
        //列车清算等级
        mv.addObject("listLinePriceLevel", sysDicService.getByCategory("LINE_PRICE_LEVEL"));
        mv.addObject("listTrainLine", listTrainLine);
        mv.addObject("listTrainType",sysDicService.getByCategory("TRAIN_TYPE"));
        mv.addObject("listTrainMarshallingType",sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));
        mv.addObject("trainLine", trainLine);
        mv.addObject("id", id);
        mv.setViewName("/train/line");
        return mv;
    }

    /**
     * what:    线路区段维护页跳转--选择清算之后
     *
     * @param trainId 车次id
     * @param lineId 线路区段id
     * @param dataId 数据或id
     * @param param 1.线路名称数据标志   郭飞提供
     *              2.线路清算数据标志   马丽静提供
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/linepricedate")
    public ModelAndView linepricedate(Integer trainId,Integer lineId,String dataId, Integer param){
        TrainLine trainLine = new TrainLine();
        ModelAndView mv = new ModelAndView();
        //线路修改
        if (param == 1) {
        TrainLine line = new TrainLine();
        line.setId(lineId);
        line.setXldm(dataId);
        line.setXldmName(railwayService.getNameByXldm(dataId));
        trainLineService.update(line,"xldm");
        }
        //清算等级信息修改
        if (param == 2) {
            TrainLine line = new TrainLine();
            LinePrice linePrice = linePriceService.get(Integer.parseInt(dataId));
            line.setId(lineId);
            line.setBeforeDawnRate(linePrice.getBeforeDawnRate());
            line.setLineBusyLevelCode(linePrice.getLineBusyLevelCode());
            line.setLineBusyLevelName(linePrice.getLineBusyLevelName());
            line.setLinePriceLevelCode(linePrice.getLinePriceLevelCode());
            line.setLinePriceLevelName(linePrice.getLinePriceLevelName());
            line.setPrice(linePrice.getPrice());
            line.setTrainMarshallingTypeCode(linePrice.getTrainMarshallingTypeCode());
            line.setTrainMarshallingTypeName(linePrice.getTrainMarshallingTypeName());
            line.setTrainTypeCode(linePrice.getTrainTypeCode());
            line.setTrainTypeName(linePrice.getTrainTypeName());
            trainLineService.update(line,"price");
        }
        List<TrainLine> listTrainLine = trainLineService.listAll(trainId);
        mv.addObject("listBureau", bureauService.listbureauComboToName());
        //列车繁忙程度
        mv.addObject("listLineBusyLevel", sysDicService.getByCategory("LINE_BUSY_LEVEL"));
        //列车清算等级
        mv.addObject("listLinePriceLevel", sysDicService.getByCategory("LINE_PRICE_LEVEL"));
        mv.addObject("listTrainLine", listTrainLine);
        mv.addObject("listTrainType",sysDicService.getByCategory("TRAIN_TYPE"));
        mv.addObject("listTrainMarshallingType",sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));
        mv.addObject("trainLine", trainLine);
        mv.addObject("id", trainId);
        mv.setViewName("/train/line");
//        updateCostData(trainId);
        return mv;
    }

    /**
     * what:  线路区段维护信息新增
     *
     * @param trainLine 线路区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/lineAdd")
    public void lineAdd(HttpServletResponse response, TrainLine trainLine){
        if (trainLineService.add(trainLine)>0) {
//            updateCostData(trainLine.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  线路区段维护信息修改
     *
     * @param trainLine 线路区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/lineUpdate")
    public void lineUpdate(HttpServletResponse response, TrainLine trainLine){
        if (trainLineService.update(trainLine,"baseinfo")>0) {
//            updateCostData(trainLine.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "修改成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "修改失败"));
        }
    }

    /**
     * what:  线路区段维护信息删除
     *
     * @param trainLine 线路区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/lineDelete")
    public void lineDelete(HttpServletResponse response, TrainLine trainLine){
        if (trainLineService.delete(trainLine)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what: 牵引区段维护页跳转
     *
     * @param id 车次详情id
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/traction")
    public ModelAndView traction(Integer id){
        ModelAndView mv = new ModelAndView();
        TrainTraction trainTraction = new TrainTraction();
        List<TrainTraction> listTrainTraction = trainTractionService.listAll(id);
        mv.addObject("listTrainTraction", listTrainTraction);
        //牵引类型
        mv.addObject("listTractionType",sysDicService.getByCategory("TRACTION_TYPE"));
        mv.addObject("trainTraction", trainTraction);
        mv.addObject("id", id);
        mv.setViewName("/train/traction");
        return mv;
    }

    /**
     * what:  牵引区段维护信息新增
     *
     * @param trainTraction 牵引区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/tractionAdd")
    public void tractionAdd(HttpServletResponse response, TrainTraction trainTraction){
        if (trainTractionService.add(trainTraction)>0) {
//            updateCostData(trainTraction.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  牵引区段维护信息修改
     *
     * @param trainTraction 牵引区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/tractionUpdate")
    public void tractionUpdate(HttpServletResponse response, TrainTraction trainTraction){
        if (trainTractionService.update(trainTraction,"baseinfo")>0) {
//            updateCostData(trainTraction.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "修改成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "修改失败"));
        }
    }

    /**
     * what:  牵引区段维护信息删除
     *
     * @param trainTraction 牵引区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/tractionDelete")
    public void tractionDelete(HttpServletResponse response, TrainTraction trainTraction){
        if (trainTractionService.delete(trainTraction)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what:    牵引区段维护页跳转--选择清算之后
     *
     * @param trainId 车次id
     * @param lineId 牵引区段id
     * @param dataId 数据或id
     * @param param 1.线路名称数据标志   郭飞提供
     *              2.线路清算数据标志   马丽静提供
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/tractionpricedate")
    public ModelAndView tractionpricedate(Integer trainId,Integer lineId,String dataId, Integer param){
        TrainTraction trainTraction = new TrainTraction();
        ModelAndView mv = new ModelAndView();
        //线路修改
        if (param == 1) {
            TrainTraction traction = new TrainTraction();
            traction.setId(lineId);
            traction.setXldm(dataId);
            traction.setXldmName(railwayService.getNameByXldm(dataId));
            trainTractionService.update(traction,"xldm");
        }
        //清算等级信息修改
        if (param == 2) {
            TrainTraction traction = new TrainTraction();
            TractionPrice tractionPrice = tractionPriceService.get(Integer.parseInt(dataId));
            traction.setId(lineId);
            traction.setLocomotivePrice(tractionPrice.getLocomotivePrice());
            traction.setLjdm(tractionPrice.getLjdm());
            traction.setCePrice(tractionPrice.getCePrice());
            trainTractionService.update(traction,"price");
        }
        List<TrainTraction> listTrainTraction = trainTractionService.listAll(trainId);
        mv.addObject("listTrainTraction", listTrainTraction);
        //牵引类型
        mv.addObject("listTractionType",sysDicService.getByCategory("TRACTION_TYPE"));
        mv.addObject("trainTraction", trainTraction);
        mv.addObject("id", trainId);
        mv.setViewName("/train/traction");
//        updateCostData(trainId);
        return mv;
    }

    /**
     * what: 接触网区段维护页跳转
     *
     * @param id 车次详情id
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/tractionce")
    public ModelAndView tractionce(Integer id){
        ModelAndView mv = new ModelAndView();
        TrainCe trainCe = new TrainCe();
        List<TrainCe> listTrainCe = trainCeService.listAll(id);
        mv.addObject("listTrainCe", listTrainCe);
        //牵引类型
        mv.addObject("listTractionType",sysDicService.getByCategory("TRACTION_TYPE"));
        mv.addObject("trainCe", trainCe);
        mv.addObject("id", id);
        mv.setViewName("/train/tractionCe");
        return mv;
    }

    /**
     * what:  接触网区段维护信息新增
     *
     * @param trainCe 接触网区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/tractionceAdd")
    public void tractionceAdd(HttpServletResponse response, TrainCe trainCe){
        if (trainCeService.add(trainCe)>0) {
//            updateCostData(trainCe.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  接触网区段维护信息修改
     *
     * @param trainCe 接触网区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/tractionceUpdate")
    public void tractionceUpdate(HttpServletResponse response, TrainCe trainCe){
        if (trainCeService.update(trainCe,"baseinfo")>0) {
//            updateCostData(trainCe.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "修改成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "修改失败"));
        }
    }

    /**
     * what:  接触网区段维护信息删除
     *
     * @param trainCe 接触网区段维护信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/tractionceDelete")
    public void tractionceDelete(HttpServletResponse response, TrainCe trainCe){
        if (trainCeService.delete(trainCe)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what:    接触网区段维护页跳转--选择清算之后
     *
     * @param trainId 车次id
     * @param lineId 接触网区段id
     * @param dataId 数据或id
     * @param param 1.线路名称数据标志   郭飞提供
     *              2.线路清算数据标志   马丽静提供
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/tractioncepricedate")
    public ModelAndView tractioncepricedate(Integer trainId,Integer lineId,String dataId, Integer param){
        TrainCe trainCe = new TrainCe();
        ModelAndView mv = new ModelAndView();
        //线路修改
        if (param == 1) {
            TrainCe ce = new TrainCe();
            ce.setId(lineId);
            ce.setXldm(dataId);
            ce.setXldmName(railwayService.getNameByXldm(dataId));
            trainCeService.update(ce,"xldm");
        }
        //清算等级信息修改
        if (param == 2) {
            TrainCe ce = new TrainCe();
            CePrice cePrice = cePriceService.get(Integer.parseInt(dataId));
            ce.setId(lineId);
            ce.setElectricityPrice(cePrice.getElectricityPrice());
            ce.setLjdm(cePrice.getLjdm());
            ce.setCatenaryPrice(cePrice.getCatenaryPrice());
            ce.setPseCode(cePrice.getPseCode());
            ce.setPseName(cePrice.getPseName());
            trainCeService.update(ce,"price");
        }
        List<TrainCe> listTrainCe = trainCeService.listAll(trainId);
        mv.addObject("listTrainCe", listTrainCe);
        mv.addObject("trainCe", trainCe);
        mv.addObject("id", trainId);
        mv.setViewName("/train/tractionCe");
//        updateCostData(trainId);
        return mv;
    }

    /**
     * what: 备品配置页跳转
     *
     * @param id 车次ID
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/part")
    public ModelAndView part(Integer id){
        ModelAndView mv = new ModelAndView();
        Train train = trainService.getTrainById(id);
//        TrainPart trainPart = new TrainPart();
//        List<TrainPart> listTrainPart = trainPartService.listAll(id);
//        mv.addObject("listBureau", bureauService.listbureauComboToName());
        //辆型
//        mv.addObject("listLX",sysDicService.getByCategory("LX"));
        //车种
//        mv.addObject("listCZ",sysDicService.getByCategory("CZ"));
        mv.addObject("partPrice", train.getPartPrice());
//        mv.addObject("listTrainPart", listTrainPart);
        mv.addObject("id", id);
        mv.setViewName("/train/part");
        return mv;
    }

    /**
     * what:  备品配置信息新增
     *
     * @param train 车次详情model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/partAdd")
    public void partAdd(HttpServletResponse response,Train train){
        if (trainService.updatePartPrice(train) > 0) {
//            updateCostData(train.getId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  备品配置信息修改
     *
     * @param trainPart 备品配置信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    /*@RequestMapping("/partUpdate")
    public void partUpdate(HttpServletResponse response,TrainPart trainPart){
        PricePart pricePart=pricePartService.getByLjdmAndLxAndCz(trainPart.getLjdm(),trainPart.getLxCode(),trainPart.getCzCode());
        if (pricePart!=null) {
            trainPart.setPrice(pricePart.getPrice());
            trainPart.setCzName(pricePart.getCzName());
            trainPart.setLxName(pricePart.getLxName());
        }else{
            trainPart.setPrice(0d);
        }
        if (trainPartService.update(trainPart)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }*/

    /**
     * what:  备品配置信息删除
     *
     * @param trainPart 备品配置信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    /*@RequestMapping("/partDelete")
    public void partDelete(HttpServletResponse response,TrainPart trainPart){
        if (trainPartService.delete(trainPart)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }*/

    /**
     * what: 列车编组配置页跳转
     *
     * @param id 车次ID
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/vehicle")
    public ModelAndView vehicle(Integer id){
            ModelAndView mv = new ModelAndView();
            trainVehicleService.listAll(id);
            TrainVehicle trainVehicle = new TrainVehicle();
            List<TrainVehicle> listTrainVehicle = trainVehicleService.listAll(id);
            mv.addObject("trainVehicle", trainVehicle);
            mv.addObject("listTrainVehicle", listTrainVehicle);
            mv.addObject("id", id);
            mv.setViewName("/train/vehicle");
            return mv;
    }

    /**
     * what:  列车编组信息新增
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/vehicleAdd")
    public ModelAndView vehicleAdd(Integer trainId, Integer vehicleId,Integer orderIndex){
        ModelAndView mv = new ModelAndView();
//        updateCostData(trainId);
//        trainVehicleService.delete(vehicleId);
//        trainVehicleSeatService.delete(vehicleId);
//        trainVehicleMaintainService.delete(vehicleId);
        return vehivleData(trainId,vehicleId,orderIndex);
        }

    /**
     * what:  列车编组信息修改
     *
     * @param vehicleId 列车编组信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/vehicleUpdate")
    public ModelAndView vehicleUpdate(Integer trainId,Integer vehicleId,Integer srcVehicleId,Integer orderIndex){
        trainVehicleService.delete(srcVehicleId);
        trainVehicleSeatService.delete(srcVehicleId);
//        trainVehicleMaintainService.delete(srcVehicleId);
        return vehivleData(trainId,vehicleId,orderIndex);
    }

    /**
     * what:  列车编组信息删除
     *
     * @param vehicleId 列车编组信息ID
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/vehicleDelete")
    public void vehicleDelete(HttpServletResponse response,Integer vehicleId){
        trainVehicleSeatService.delete(vehicleId);
//        trainVehicleMaintainService.delete(vehicleId);
        if (trainVehicleService.delete(vehicleId)>0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }
    /**
     * what:  列车编组信息数据处理
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public ModelAndView vehivleData(Integer trainId, Integer vehicleId,Integer orderIndex){
        Vehicle vehicle = vehicleService.getById(vehicleId);
        TrainVehicle trainVehicle =new TrainVehicle();
        //参数配置
        trainVehicle.setAverageKilometer(vehicle.getAverageKilometer());
        trainVehicle.setCxCode(vehicle.getCxCode());
        trainVehicle.setCxName(vehicle.getCxName());
        trainVehicle.setCzCode(vehicle.getCzCode());
        trainVehicle.setCzName(vehicle.getCzName());
        trainVehicle.setDeperciationPkRate(vehicle.getDeperciationPkRate());
        trainVehicle.setDeperciationPrice(vehicle.getDeperciationPrice());
        trainVehicle.setDeperciationRate(vehicle.getDeperciationRate());
        trainVehicle.setDeperciationResidualRate(vehicle.getDeperciationResidualRate());
        trainVehicle.setDepreciationPeriod(vehicle.getDepreciationPeriod());
        trainVehicle.setMaintainAdvancePrice(vehicle.getMaintainAdvancePrice());
        trainVehicle.setMaintainNormalPrice(vehicle.getMaintainNormalPrice());
//        trainVehicle.setMaintainPrice(vehicle.getMaintainPrice());
        trainVehicle.setPurchasePrice(vehicle.getPurchasePrice());
        trainVehicle.setLxCode(vehicle.getLxCode());
        trainVehicle.setLxName(vehicle.getLxName());
        trainVehicle.setOrderIndex(orderIndex);
        trainVehicle.setTrainId(trainId);
        int trainVehicleId = trainVehicleService.add(trainVehicle);
        //席别信息
        int orderIndex1 = 1;
        for(VehicleSeat vehicleSeat : vehicleSeatService.getByVehicleId(vehicleId)) {
            TrainVehicleSeat trainVehicleSeat = new TrainVehicleSeat();
            trainVehicleSeat.setCapacity(vehicleSeat.getCapacity());
            trainVehicleSeat.setOrderIndex(orderIndex1);
            trainVehicleSeat.setSeatTypeCode(vehicleSeat.getSeatTypeCode());
            trainVehicleSeat.setSeatTypeName(vehicleSeat.getSeatTypeName());
            trainVehicleSeat.setTrainVehicleId(trainVehicleId);
            trainVehicleSeatService.add(trainVehicleSeat);
        }
            orderIndex1++;
        //维修信息
        /*vehicleMaintainService.getByVehicleId(vehicleId).stream().forEach(n->{
            TrainVehicleMaintain trainVehicleMaintain = new TrainVehicleMaintain();
            trainVehicleMaintain.setCharge(n.getCharge());
            trainVehicleMaintain.setOrderIndex(n.getOrderIndex());
            trainVehicleMaintain.setPrice(n.getPrice());
            trainVehicleMaintain.setTrainVehicleId(n.getVehicleId());
            trainVehicleMaintain.setVehicleMaintainTypeCode(n.getVehicleMaintainTypeCode());
            trainVehicleMaintain.setVehicleMaintainTypeName(n.getVehicleMaintainTypeName());
            trainVehicleMaintainService.add(trainVehicleMaintain);
        });*/
        ModelAndView mv = new ModelAndView();
        trainVehicleService.listAll(trainId);
        List<TrainVehicle> listTrainVehicle = trainVehicleService.listAll(trainId);
        mv.addObject("listTrainVehicle", listTrainVehicle);
        mv.addObject("id", trainId);
        mv.setViewName("redirect:vehicle.htm");
//        updateCostData(trainId);
        return mv;
    }

    /**
     * what: 席别票价配置页跳转
     *
     * @param id 车次ID
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/ticketprice")
    public ModelAndView ticketprice(Integer id){
        ModelAndView mv = new ModelAndView();
        TrainTicketprice trainTicketprice = new TrainTicketprice();
        List<TrainTicketprice> listTrainTicketprice = trainTicketpriceService.listAll(id);
        mv.addObject("listTrainTicketprice", listTrainTicketprice);
        //席别类型
        mv.addObject("listSeatType",sysDicService.getByCategory("SEAT_TYPE"));
        mv.addObject("id", id);
        mv.addObject("trainTicketprice", trainTicketprice);
        mv.setViewName("/train/ticketprice");
        return mv;
    }

    /**
     * what:  席别票价信息新增
     *
     * @param trainTicketprice 席别票价信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/ticketpriceAdd")
    public void ticketpriceAdd(HttpServletResponse response,TrainTicketprice trainTicketprice){
        if (trainTicketpriceService.add(trainTicketprice) > 0) {
//            updateCostData(trainTicketprice.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "新增成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "新增失败"));
        }
    }

    /**
     * what:  席别票价信息修改
     *
     * @param trainTicketprice 席别票价信息model
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/ticketpriceUpdate")
    public void ticketpriceUpdate(HttpServletResponse response,TrainTicketprice trainTicketprice){
        if (trainTicketpriceService.update(trainTicketprice) > 0) {
//            updateCostData(trainTicketprice.getTrainId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "修改成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "修改失败"));
        }
    }

    /**
     * what:  席别票价信息删除
     *
     * @param id 席别票价信息id
     *
     * @return mv
     *
     * @author 杨超凡 created on 2017/12/4
     */
    @RequestMapping("/ticketpriceDelete")
    public void ticketpriceDelete(HttpServletResponse response,Integer id){
        if (trainTicketpriceService.delete(id) > 0) {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "删除成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "删除失败"));
        }
    }

    /**
     * what: 车站旅客服务页跳转
     *
     * @param id 车次ID
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/stationservice")
    public ModelAndView stationservice(Integer id){
        ModelAndView mv = new ModelAndView();
        List<PriceStationService> stationServiceList = priceStationServiceService.list();
        Train train = trainService.getTrainById(id);
        mv.addObject("id", id);
        mv.addObject("train", train);
        mv.addObject("stationServiceList", stationServiceList);
        mv.setViewName("/train/stationservice");
        return mv;
    }

    /**
     * what: 车站旅客服务页跳转
     *
     *
     * @return
     *
     * @author 杨超凡 created on 2017/11/29
     */
    @RequestMapping("/stationServiceAdd")
    public void stationServiceAdd(HttpServletResponse response,Train train){
        ModelAndView mv = new ModelAndView();
        train.setStationServicePrice(priceStationServiceService.getByStationServiceType(train.getStationServiceTypeCode()).getPrice());
        if(trainService.updateStationservice(train)>0){
//            updateCostData(train.getId());
            WebUtil.out(response, JsonUtil.createOperaStr(true, "维护成功"));
        }else {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "维护失败"));
        }
    }

    public void updateCostData(int trainId) {
        CostResource costResource = calculateCostService.constantCostObj(trainId);
        Train train = trainService.getTrainById(trainId);
        train.setCeCost(costResource.getTractionceCost());
        train.setDepreciationCost(costResource.getDeperciationCost());
        train.setLineCost(costResource.getLineCost());
        train.setPartCost(costResource.getPartCost());
        train.setServiceCost(costResource.getServiceCost());
        train.setTractionCost(costResource.getTractionCost());
        train.setHumanResourceCost(costResource.getHumanCost());
        train.setMaintainAdvanceCost(costResource.getMaintainAdvanceCost());
        train.setMaintainNormalCost(costResource.getMaintainNormalCost());
        trainService.updateCost(train);
    }
}
