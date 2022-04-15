<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.selectOption .searchSelect {width:117px; height:40px; padding:0px 0 0 9px; border-radius:0; font-weight:300; color:#666; font-size:14px;}
</style>

<script type="text/javascript">
	function changePaging(page){	
		$.ajax({
	        url: "list_book_ajax.do",
	        type: "POST",
	        data: {
	        	"nowPage" : page
	        	,"searchText" : $("#searchText").val()
	        	,"searchOption" : $("#pageCount").val()
	        },
	        success: function(data){
	        	$('#GridList').empty();
	            $('#GridList').html(data);
	        },
	        error: function(){
	            
	        }
	    });
	}
	
	$(document).ready(function(key){
		
		$("#searchText").keyup(function(key){
			if(key.keyCode==13) {
				$("#btnSearchTotal").trigger("click");
			}
		});
		
		$("#pageCount").on("change",function(){
			changePaging("1");
		});
		
	});
	
	
</script>

<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>API활용</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item active">도서검색</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="about-box-main">
    <div class="container">
        <div class="row">
        	<div class="col-lg">
        		<div class="search-product">
                       <input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력해주세요.">
                       <button id="btnSearchTotal" class="btnSearchTotal" onclick="changePaging(1);"> <i class="fa fa-search"></i> </button>
                </div>
        	</div>
        </div>
        <div class="row">
        	<div class="col-lg">
        		<div class="product-categorie-box">
                 	<div class="tab-content" id="GridList">
	            	 	<div class="right-product-box">
			            	<div class="product-item-filter row"  style="border:none;">
			                     <div class="col-lg text-sm-left">
			                         <div class="toolbar-sorter-right">
			                             <span>총 : ${total }</span>
			                          	<span> 페이지번호 : <strong>1</strong>/${paging.lastPage }</span>
			                         </div>
			                         <div class="selectOption" style="float:right;">
										<select class="searchSelect devSearchSelect" id="pageCount">
											<option value="10" selected>10개씩 보기</option>
											<option value="20">20개씩 보기</option>
											<option value="30">30개씩 보기</option>
										</select>
									</div>
			                     </div>
			                 </div>
		                 </div>
		        		<table class="table">
		        			<colgroup>
								<col style="width: auto;">
								<col style="width: auto;">
								<col style="width: auto;">
								<col style="width: auto;">
								<col style="width: auto;">
							</colgroup>
					        <c:forEach items="${bookList}" var ="b">
					        	<c:choose>
					        		<c:when test="${b == null }">
					        			<tr>
								            <th colspan="5" bgcolor="#ededed"></th>
								        </tr>
								        <tr>
								            <th colspan="5"> 조회되는 도서가 없습니다.</th>
								        </tr>
					        		</c:when>
					        		<c:otherwise>
								        <tr>
								            <th colspan="5" bgcolor="#ededed"></th>
								        </tr>
							            <tr>
							                <td rowspan="2"><img src="${b.image}"></td>
							                <td rowspan="2"><a href="${b.link }" target="__blank" style="color:black;">${b.title}</a></td>
							                <td>${b.author}</td>
							                <td colspan="2">${b.publisher }</td>
							            </tr>
							            <tr>
							                <td>${b.pubdate }</td>
							                <td>${b.price }</td>
							                <td>${b.discount }</td>
							            </tr>
							            <tr>
							                <td colspan="5">${b.description}</td>
							            </tr>
							            <tr>
							                <td colspan="5"></td>
							            </tr>
					        		</c:otherwise>
					        	</c:choose>
					        </c:forEach>
					    </table>
					    <div class="paging_wrap" style="margin-bottom:60px;">												
							<div id="pagination" class="paging">
								<a href = 'javascript:return false;' class="goFirst" alt="처음으로" onclick='changePaging(1)'></a> <!-- javascript:return false; -->
								<c:choose>
									<c:when test="${paging.startPage != 1 }">
										<a href="javascript:return false;" class="goPrev" title="이전페이지" onclick='changePaging(${paging.startPage - 1 })'></a>
									</c:when>
									<c:otherwise>
										<a href="javascript:return false;" class="goPrev" title="이전페이지" onclick='changePaging(${paging.startPage})'></a>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<a class="pageNum on"><span>${p }</span></a>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a class="pageNum" href="javascript:return false;" onclick='changePaging(${p})'><span>${p }</span></a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${paging.endPage != paging.lastPage}">
										<a class="goNext" title="다음페이지" href="javascript:return false;" onclick='changePaging(${paging.endPage+1 })'></a>
									</c:when>
									<c:otherwise>
										<a class="goNext" title="다음페이지" href="javascript:return false;" onclick='changePaging(${paging.endPage})'></a>
									</c:otherwise>
								</c:choose>
								<a class="goLast"   title="끝으로" href="javascript:return false;" onclick='changePaging(${paging.lastPage })'></a>
							</div>
						</div>
					</div>
				</div>
        	</div>
        </div>
    </div>
</div>