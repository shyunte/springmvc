<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.mongodb.util.JSON" %>
<%@ page import="com.itembay.common.abs.CommonSqlDao" %>
<%@ page import="com.itembay.common.util.StringUtil" %>
<%
    int iEventCode = 1392;
    int iReturn = -9998;

    Map<String,Object> json = new HashMap<String,Object>();
    Map<String,Object> se = (Map<String, Object>) request.getAttribute("session");
    CommonSqlDao commonSql = (CommonSqlDao) request.getAttribute("commonSql");
    String vcMemberID = StringUtil.objectIsNullByString(se.get("MemberID"));

    try{
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("spName", "up_Event_202212DKSeason3_GetApplyStatus");
        param.put("param1", iEventCode);
        param.put("param2", vcMemberID);
        json = (Map<String, Object>) commonSql.selectOne("EventCommon.commonSp2", param);
    } catch(Exception e) {
        json.clear();
        json.put("iReturn", "-9999");
    } finally {
        out.print(JSON.serialize(json).toString());
    }
%>