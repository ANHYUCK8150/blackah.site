<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	
	<div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="/images/Main1.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>안녕하세요.</strong></h1>
                            <p class="m-b-40">개발자 안혁입니다.</p>
                            <p><a class="btn hvr-hover" href="../intro/introduce.do">인사말 보기</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/images/Main2.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>프로젝트</strong></h1>
                            <p class="m-b-40">프로젝트를 소개합니다.</p>
                            <p><a class="btn hvr-hover" href="../project/list.do">프로젝트 보기</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/images/Main3.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>API 활용</strong></h1>
                            <p class="m-b-40">경락가격정보서비스, 도서검색</p>
                            <p><a class="btn hvr-hover" href="../api/fruit.do">API 활용 보기</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>수행 프로젝트</h1>
                        <p>프로젝트 목록 입니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*">All</button>
                            <button data-filter=".Spring">Spring</button>
                            <button data-filter=".PHP">PHP</button>
                            <button data-filter=".CS">C#</button>
                            <button data-filter=".DB">DB</button>
                            <button data-filter=".기타">기타</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row special-list">
                <c:forEach items="${projectList }" var="projectList">
                <div class="col-lg-3 col-md-6 special-grid ${projectList.pbListClass }">
                    <div class="products-single fix" style="border: 1px solid #ccc;">
                        <div class="box-img-hover">
                            <div class="type-lb">
                            </div>
                            <img src="${path}/${projectList.pbImage }" class="img-fluid" alt="Image" style="height:200px;">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="/project/reg.do?pbIdx=${projectList.pbIdx }" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                </ul>
                                <a href="/project/reg.do?pbIdx=${projectList.pbIdx }" class="cart" href="#">VIEW</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4 style="height: 70px;">${projectList.pbSubject }</h4>
                            <h3>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</h3>
                            <h5>${projectList.pbSkill }</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <div class="latest-blog">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>공지사항</h1>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach items="${BoradList }" var="BoradList">
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>${BoradList.qbSubject }</h3>
                                <p>${BoradList.qbContent }</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="/board/view.do?op=${title }&qbIdx=${BoradList.qbIdx }"><i class="fas fa-eye"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    