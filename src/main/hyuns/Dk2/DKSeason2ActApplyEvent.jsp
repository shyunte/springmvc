<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.mongodb.util.JSON" %>
<%@ page import="com.itembay.common.abs.CommonSqlDao" %>
<%@ page import="com.itembay.common.util.StringUtil" %>
<%@ page import="java.net.URLDecoder" %>
<%
    int iEventCode = 1383;
    int iReturn = -9998;
    Map<String,Object> json = new HashMap<String,Object>();
    Map<String,Object> se = (Map<String, Object>) request.getAttribute("session");

    CommonSqlDao commonSql = (CommonSqlDao) request.getAttribute("commonSql");
    String vcMemberID = (String)se.get("MemberID");
    String vcMobileNumber = URLDecoder.decode(StringUtil.objectIsNullByString(request.getParameter("mobileNumber")), "UTF-8");

    // 휴대전화 번호 '-' 적용하여 저장을 위해 작업 수행
    if(vcMobileNumber.length() == 11) {
        vcMobileNumber = vcMobileNumber.substring(0, 3)+"-"+vcMobileNumber.substring(3, 7)+"-"+vcMobileNumber.substring(7, 11);
    } else {
        vcMobileNumber = vcMobileNumber.substring(0, 3)+"-"+vcMobileNumber.substring(3, 6)+"-"+vcMobileNumber.substring(6, 10);
    }

    try {
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("spName", "up_Event_202209DKSeason2_ApplyEvent");
        param.put("param1", iEventCode);
        param.put("param2", vcMemberID);
        param.put("param3", vcMobileNumber);
        param.put("param4", 1);                         // platformType (1:Web,2:Mobile)
        commonSql.insert("EventCommon.commonIncSp4", param);
        iReturn = Integer.parseInt(param.get("iReturn").toString().trim());

        json.put("iReturn", iReturn);
    } catch(Exception e) {
        json.clear();
        json.put("iReturn", StringUtil.isNumber(e.getMessage()) ? Integer.parseInt(e.getMessage()) : -9999);
    } finally {
        out.print(JSON.serialize(json).toString());
    }
%>