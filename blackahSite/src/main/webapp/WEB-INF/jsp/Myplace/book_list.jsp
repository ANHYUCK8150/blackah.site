<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>나의공간</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
					<li class="breadcrumb-item active">독서</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="shop-box-inner">
        <div class="container">
            <div class="row" >
                <div class="col-lg" id="bookData">
	                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
	                    <div class="row">
	                        <c:forEach items="${bookList }" var="bookList">
						      <div class="col-lg-4 col-md-6 special-grid">
						          <div class="products-single fix" style="border: 1px solid #ccc;">
						              <div class="box-img-hover">
						                  <div class="type-lb">
						                  </div>
						                  <img src="${bookList.brImage }" class="img-fluid" alt="Image" style="height:180px;">
						                  <div class="mask-icon">
						                      <ul>
						                          <li><a href="/myplace/book_reg.do?brIdx=${bookList.brIdx }" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
						                      </ul>
						                      <a href="/myplace/book_reg.do?brIdx=${bookList.brIdx }" class="cart">VIEW</a>
						                  </div>
						              </div>
						              <div class="why-text">
						                  <h4 style="height: 50px;"><a href="/myplace/book_reg.do?brIdx=${bookList.brIdx }">${bookList.brSubject }</a></h4>
						                  <c:choose>
						                  	<c:when test="${bookList.brState == 'Y' }">
						                  		<h5>독서완료</h5>
						                  	</c:when>
						                  	<c:otherwise>
						                  		<h5 style="background:#ccc">독서중</h5>
						                  	</c:otherwise>
						                  </c:choose>
						                  
						              </div>
						          </div>
						      </div>
						      </c:forEach>
	                    </div>
	                </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-lg" style="float:right;">
            	<c:if test="${memberInfo.mbID == 'admin' }">
					<div class="regNewItem" id="deleteItem" >
						<a href="javascript:return false;">삭제</a>
					</div>
					<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
						<a href="/myplace/book_reg.do">등록</a>
					</div>
				</c:if>
				</div>
            </div>
        </div>
    </div>