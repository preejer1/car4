<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="/common/attribute.jsp"></jsp:include>
<style>
.navDropdown-menu {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 1000;
  display: none;
  float: left;
  min-width: 160px;
  padding: 5px 0;
  margin: 2px 0 0;
  font-size: 14px;
  text-align: left;
  list-style: none;
  background-color: #222;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  border: 1px solid #ccc;
  border: 1px solid rgba(0,0,0,.15);
  border-radius: 4px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
}
</style>
<script>
function openMsgList(){
	
		window.open("listMessage.do", "value", "top=250,left=600,width=500,height=300");
		document.msgList.target = "value"; //새창에서 지정한 value옵션으로 타겟을 지정
		document.msgList.action = "listMessage.do";
		document.msgList.submit();
		
}
</script>

<script>
$(document).ready(function() {
   $(".dropdown").hover(function() {
      $('.dropdown-menu', this).stop(true, true).slideDown("fast");
      $(this).toggleClass('open');
   }, function() {
      $('.dropdown-menu', this).stop(true, true).slideUp("fast");
      $(this).toggleClass('open');
   });
   
});

$("[data-toggle=tooltip]").tooltip();
</script>
<div class="container-fulid">
<div class="row">
<nav class="navbar navbar-default navbar-fixed-top navbar-shrink">
        <div class="container-fluid" style="margin-left: 48px">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="../index.do">Car4</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                							<form name="msgList">
                
                <ul class="nav navbar-nav navbar-right">
                	<li><a href="../getUserInfo.do">Sell</a></li>
               		<li><a href="../buy/buy.jsp">Buy</a></li>
               		<li><a href="../listAuction.do">Auction</a></li>
                    <li>
                        <a></a>
                    </li>
                    <li>
                        <a></a>
                    </li>
                    <li>
                    
				    <c:if test="${!empty sessionScope.user && (user.role) eq 'user' }">
					<li>
						<a href="#none" onclick="openMsgList()">
							<span class="glyphicon glyphicon-envelope"></span>
						</a>
					</li>
					<li>
						<a  href="../auction/mypage.jsp" > ${user.userName} 님 접속중</a>
					</li>
					</c:if>
					<li class="dropdown">
	                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page<span class="caret"></span></a>
	                    <ul class="dropdown-menu navDropdown-menu" role="menu" style="display: none;">
	                      <li><a href="../user/getUser.jsp">회원정보 수정</a></li>
	                      <li><a href="../listUserBuy.do">구매리스트</a></li>
	                      <li><a href="../listUserSell.do">판매리스트</a></li>
	                    </ul>
	                    							</form>
	                    
	                </li>	
			    <c:if test="${!empty sessionScope.user && (user.role) eq 'user' }">
					<li><a style="cursor: pointer;" href="../logout.do"><span class="glyphicon glyphicon-off" ></span> Logout</a></li>
				</c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</div>
</div>
  