<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <div class="right-product-box">
                   <div class="product-item-filter row">
                       <div class="col-12 col-sm-8 text-center text-sm-left">
                           <div class="toolbar-sorter-right">
                               <span>총 : ${TotaldevelopList }</span>
                            <p>
                            	<span> 페이지번호 : <strong>1</strong>/${paging.lastPage }</span>
                            </p>
                           </div>
                       </div>
                   </div>
                   
                   <div class="product-categorie-box">
                       <div class="tab-content">
                           <div role="tabpanel" class="tab-pane fade show active" id="list-view">
                               <div class="list-view-box">
                                   <div class="row">
                                       <table class="table" style="border-collapse: collapse;">
							<colgroup>
								<col style="width: 40px;">
								<col style="width: 80px;">
								<col style="width: auto;">
								<col style="width: 132px;">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>순번</th>
									<th>글제목</th>
									<th>테크</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${developList }" var="developList">
									<tr>
										<td>
											<c:if test="${memberInfo.mbID == 'admin' }">
												<input type="checkbox" id="DevelopChkBox_${developList.diIdx }" name="DevelopChkBox" value = "${developList.diIdx }">
												<label for="DevelopChkBox_${developList.diIdx }">&nbsp;</label>
											</c:if>
										</td>
										<td>${developList.dno }</td>
										<td style="text-align:left;"><a href="/myplace/develop_reg.do?diIdx=${developList.diIdx }" >${developList.diSubject }</a></td>
										<td>${developList.diTech }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
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