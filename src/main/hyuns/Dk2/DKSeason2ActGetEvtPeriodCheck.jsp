<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.mongodb.util.JSON" %>
<%@ page import="com.itembay.common.abs.CommonSqlDao" %>
<%
	int iEventCode = 1383;
	int iReturn = -9998;

	Map<String,Object> resultMap = new HashMap<String,Object>();
	CommonSqlDao commonSql = (CommonSqlDao) request.getAttribute("commonSql");

	try{
		// 이벤트 기간 확인
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("spName", "up_Event_Common_GetEvtPeriodCheck");
		param.put("param1", iEventCode);

		commonSql.insert("EventCommon.commonIncSp1", param);
		iReturn = Integer.parseInt(param.get("iReturn").toString());

		resultMap.put("iReturn", iReturn);
	} catch(Exception e) {
		resultMap.clear();
		resultMap.put("iReturn", "-9999");
	} finally {
		out.print(JSON.serialize(resultMap).toString());
	}
%>