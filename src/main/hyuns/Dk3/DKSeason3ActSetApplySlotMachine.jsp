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
			param.put("spName", "up_Event_202212DKSeason3_SetApplySlotMachine");
			param.put("param1", iEventCode);
			param.put("param2", vcMemberID);
			param.put("param3", 1);                          // platformType 1:Web, 2:Mobile
			commonSql.insert("EventCommon.commonIncSp3", param);
			iReturn = Integer.parseInt(param.get("iReturn").toString());
		}

		resultMap.put("iReturn", iReturn);
		/*
		-60001	플로린 코인 잔여 개수 확인
		-60002	이벤트 기간
		-60003	금일 참여 여부 확인
		-60004	플로인 코인 개수 차감 실패
		-60005	이벤트 참여 로그 INSERT 실패
		-60006	경품 개수 차감 실패
		-60007	파워존 24시간 지급 실패
		-60008	쿠폰 발급 로그 INSERT 실패
		-60009	쿠폰 카드 핀 UPDATE 실패
		-60010	쿠폰 발급 로그 INSERT 실패
		 1~6	경품 당첨 성공
		*/
	} catch(Exception e) {
		resultMap.clear();
		resultMap.put("iReturn", "-9999");
	} finally {
		out.print(JSON.serialize(resultMap).toString());
	}
%>