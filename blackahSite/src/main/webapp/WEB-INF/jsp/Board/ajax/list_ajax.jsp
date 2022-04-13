<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		            	 <div class="listDetailType01" >
		            	 	<div class="right-product-box">
				            	<div class="product-item-filter row"  style="border:none;">
				                     <div class="col-12 col-sm-12 text-sm-left">
				                         <div class="toolbar-sorter-right">
				                             <span>총 : ${ListCnt }</span>
				                          	<span> 페이지번호 : <strong>1</strong>/${paging.lastPage }</span>
				                         </div>
				                     </div>
				                 </div>
			                 </div>
							<table class="table">
								<colgroup>
									<col style="width: 100px;">
									<col style="width: 80px;">
									<col style="width: auto;">
									<col style="width: 160px;">
									<col style="width: 160px;">
								</colgroup>
								<thead>
									<tr>
										<th></th>
										<th>번호</th>
										<th>제목</th>
										<th>등록일</th>
										<th>작성자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${BoradList }" var="BoradList">
										<tr>
											<td>
												<c:choose>
													<c:when test="${BoradList.qbState == '완료'}">
														<span style="background:#2fcb12; padding: 7px 10px; color: white;">${BoradList.qbState }</span>
													</c:when>
													<c:when test="${BoradList.qbState == '대기'}">
														<span style="background:#ccc; padding: 7px 10px; color: white;">${BoradList.qbState }</span>
													</c:when>
													<c:otherwise>
														<span><span style="background:black; padding: 7px 10px; color: white;">공지</span></span>
													</c:otherwise>
												</c:choose>
											</td>
											<td>${BoradList.qbNo }</td>
											<td style="text-align:left;"><a href="/board/view.do?op=${title }&qbIdx=${BoradList.qbIdx }" >${BoradList.qbSubject }</a></td>
											<td>${BoradList.qbRegDT }</td>
											<td>${BoradList.qbOwner }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- end list 1 -->
						<div class="choiceBtn">
							<c:choose>
								<c:when test="${title == 'qna' }">
									<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
										<a href="/board/reg.do?op=${title}">등록</a>
									</div>
								</c:when>
								<c:when test="${memberInfo.mbID == 'admin' }">
									<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
										<a href="/board/reg.do?op=${title}">등록</a>
									</div>
								</c:when>
							</c:choose>
						</div>							
						<!-- start paging -->
						
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
