<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.itembay.common.util.StringUtil"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.mongodb.util.JSON" %>
<%@ page import="com.itembay.common.abs.CommonSqlDao" %>
<%
	int iEventCode = 1392;
	int iReturn = -9998;

	Map<String,Object> resultMap = new HashMap<String,Object>();
	Map<String,Object> se = (Map<String, Object>) request.getAttribute("session");

	CommonSqlDao commonSql = (CommonSqlDao) request.getAttribute("commonSql");
	String vcMemberID = StringUtil.objectIsNullByString(se.get("MemberID"));

	try{
		if(!"".equals(vcMemberID)){
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("spName", "up_Event_202212DKSeason3_SetGiftPackage");
			param.put("param1", iEventCode);
			param.put("param2", vcMemberID);
			param.put("param3", 1);                          // platformType 1:Web, 2:Mobile
			commonSql.insert("EventCommon.commonIncSp3", param);
			iReturn = Integer.parseInt(param.get("iReturn").toString());
		}

		resultMap.put("iReturn", iReturn);
	} catch(Exception e) {
		resultMap.clear();
		resultMap.put("iReturn", "-9999");
	} finally {
		out.print(JSON.serialize(resultMap).toString());
	}
%>