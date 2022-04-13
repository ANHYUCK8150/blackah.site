<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="main-top">
     <div class="container-fluid">
         <div class="row">
             <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="float: none; margin: 0 auto; text-align: center;">
				<div class="text-slid-box">
                    <div id="offer-box" class="carouselTicker">
                        <ul class="offer-box">
                            <li>
                                홈페이지에 방문해주셔서 감사합니다.
                            </li>
                            <li>
                                저를 소개하는 홈페이지 입니다.
                            </li>
                            <li>
                                제가 수행했던 프로젝트를 확인 할 수 있습니다.
                            </li>
                            <li>
                                궁금하신 사항은 게시판의 질의응답 및 이메일, 문자 남겨 주시면 감사합니다.
                            </li>
                            <li>
                                API활용은 공공데이터 포털의 데이터를 활용한 사항입니다.
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
         </div>
     </div>
 </div>

<header class="main-header">
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
                <a class="navbar-brand" href="/"><img src="/images/AH.png" class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                	<li class="dropdown">
                		<a href="../intro/introduce.do" class="nav-link dropdown-toggle" data-toggle="dropdown">소개하기</a>
                		<ul class="dropdown-menu">
                			<li ><a href="../intro/introduce.do" >인사말</a></li>
			                <li ><a href="../intro/resume.do" >이력서</a></li>
			                <li ><a href="../intro/cdt.do?" >코딩테스트</a></li>
                		</ul>
                	</li>
                    <li class="nav-item" id="menu_about"><a class="nav-link" href="../project/list.do">프로젝트</a></li>
                    <li class="dropdown">
                		<a href="../board/board.do?op=notice" class="nav-link dropdown-toggle" data-toggle="dropdown">게시글</a>
                		<ul class="dropdown-menu">
                			<li >
			                	<a href="../board/board.do?op=notice" >공지사항</a>
			                </li>
			                <li >
			                	<a href="../board/board.do?op=qna" >QnA</a>
			                </li>
                		</ul>
                	</li>
                	<li class="dropdown">
                		<a href="../api/fruit.do" class="nav-link dropdown-toggle" data-toggle="dropdown">API활용</a>
                		<ul class="dropdown-menu">
                			<li >
			                	<a href="../api/fruit.do" >경락가격정보서비스</a>
			                </li>
                		</ul>
                	</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                	<c:choose>
		        		<c:when test="${memberInfo.mbIdx != null}">
		        			<li><div style="padding: 30px 0; margin-right:7px;">${memberInfo.mbNM } &nbsp; [${memberInfo.mbID }]</div></li>
							<li><a href="/Logout.do"><i class="fa fa-sign-out-alt"></i></a></li>
		        		</c:when>
		        		<c:otherwise>
		        			<li><a href="../member/login.do"><i class="fa fa-sign-in-alt"></i></a></li>
							<li><a href="../member/confirm.do"><i class="fa fa-user"></i></a></li>
		        		</c:otherwise>
		        	</c:choose>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
        </div>
    </nav>
    <!-- End Navigation -->
</header>
