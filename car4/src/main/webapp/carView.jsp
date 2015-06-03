<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ page import="java.util.List"  %>


<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	//if(search.getSearchKeyword()==null) search.setSearchKeyword("");
%>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/info.css" rel="stylesheet">

<script type="text/javascript">
	
function fncGetProductList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}
</script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<style>
th {
    border: 1px solid black;
    border-collapse: collapse;
    background-color: white;
    vertical-align: middle;
}
td, tr {
    padding: 3px;
    vertical-align: middle;
}
</style>

<title>Insert title here</title>
</head>
<body>
<!--  1번 Table 시작  -->
<div class="container" id="#container-info">
		<div class="row">
			<div class="col-lg-12 toggle-header" align="center">구매상세정보</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<img src="${file.imgPath}" style="width: 100%;">
			</div>
			<div class="col-md-8">
			<button type="button" class="btn btn-success">차량정보</button>
			<br>
				<table class="table table-hover" style="text-align:center; height: 235px">
					
					
					
						<tr>
						<br>
							<td width="15%">차량종류</td>
							<td>${auction.model}</td> <!-- Action만 넣으삼 -->
						</tr>
						<tr>
							<td>제조사</td>
							<td></td> <!-- Action 값만 넣으삼 -->
						</tr>
						<tr>
							<td>모델명</td>
							<td></td> <!-- Action 값만 넣으삼 -->
						</tr>
						<tr>
							<td>주행거리</td>
							<td></td> <!-- Action 값만 넣으삼 -->
						</tr>
						<tr>
						
							<td>연식</td>
							<td></td> <!-- Action 값만 넣으삼 -->
						</tr>
				
				</table>
				<!-- <div id="list">차량종류</div>
				<div id="list">브랜드명</div>
				<div id="list">모델명</div>
				<div id="list">색상</div>
				<div id="list2">연식</div>
				 -->
			</div>
		</div>
	</div>
<!--  1번 Table 끝  -->

<hr/>

<div class="container">

<form name="detailForm" action="/carView.do" method="post">


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
<tr height="20px">
<td align="left"><button type="button" class="btn btn-primary">입찰현황</button></td>
		<td align="right" width="87%">
		
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<%--	<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>상품가격</option>--%>
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			</select>
			<%--<input 	type="text" name="searchKeyword" value="<%= searchKeyword %>"  class="ct_input_g" 
							style="width:200px; height:20px" >--%>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
						class="ct_input_g" style="width:200px; height:20px" >
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<a href="javascript:fncGetProductList('1');">검색</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%--
		<td colspan="11" >전체  <%= resultPage.getTotalCount() %> 건수,	현재 <%= resultPage.getCurrentPage() %> 페이지</td>--%>
		<td colspan="11" >
			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		</td>
	
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">등록일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>
			
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%--<% 	
		
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = list.get(i);
	%>
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
		<td align="left">
			<a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>&menu=manage"><%= vo.getProdName() %></a>
		</td>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getRegDate() %> </td>		
		<td></td>
		<td align="left"><%if(vo.getProTranCode()== null){ %>
		판매중
		<%}else if(vo.getProTranCode().trim().equals("1")){ %>
		구매완료 <a href="/updateTranCodeByProd.do?prodNo=<%=vo.getProdNo() %>&menu=manage&tran_status_code=<%=vo.getProTranCode()%>">배송하기</a>
		<%}else if(vo.getProTranCode().trim().equals("2")){ %>
		배송중
		<%}else if(vo.getProTranCode().trim().equals("3")){ %>
		배송완료
		<%} %>
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %>
	--%>
	<c:set var="i" value="0" />
	<c:forEach var="car" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">
			<a href="/getProduct.do?prodNo=${product.prodNo }&menu=manage">${car.model }</a></td>		
			<td></td>
			<td align="left"></td>
			<td></td>
			<td align="left">${ car.carYear }</td>		
			<td></td>
			<td align="left">
		
		</td>
		</tr>
		
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
		
	</c:forEach>	
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%--	<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %> --%>
			<%--<jsp:include page="../common/pageNavigator1.jsp"/>--%>
	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			◀ 이전
	</c:if>
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
			<a href="javascript:fncGetProductList('${ resultPage.currentPage-1}')">◀ 이전</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="javascript:fncGetProductList('${ i }');">${ i }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			이후 ▶
	</c:if>
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
			<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">이후 ▶</a>
	</c:if>
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div><!-- Container 끝 -->
<br><br>


</body>
</html>