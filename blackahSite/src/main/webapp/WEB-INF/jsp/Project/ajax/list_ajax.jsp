<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>총 : ${TotalProjectList }</span>
	                                <p>
	                                	<span> 페이지번호 : <strong>1</strong>/${paging.lastPage }</span>
	                                </p>
                                </div>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                	<c:choose>
                                		<c:when test="${listType == 'list1' }">
                                			<li>
		                                        <a id="listType1" class="nav-link active" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
		                                    </li>
		                                    <li>
		                                        <a class="nav-link" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
		                                    </li>
                                		</c:when>
                                		<c:otherwise>
                                			<li>
		                                        <a id="listType1" class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
		                                    </li>
		                                    <li>
		                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
		                                    </li>
                                		</c:otherwise>
                                	</c:choose>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="product-categorie-box">
                            <div class="tab-content">
                            	<c:choose>
                                		<c:when test="${listType == 'list1' }">
                                			<div role="tabpanel" class="tab-pane fade" id="grid-view">
                                		</c:when>
                                		<c:otherwise>
                                			<div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                		</c:otherwise>
                                </c:choose>
                                    <div class="row">
                                        <c:forEach items="${projectList }" var="projectList">
						                <div class="col-lg-4 col-md-6 special-grid">
						                    <div class="products-single fix" style="border: 1px solid #ccc;">
						                        <div class="box-img-hover">
						                            <div class="type-lb">
						                            </div>
						                            <img src="${path}/${projectList.pbImage }" class="img-fluid" alt="Image" style="height:180px;">
						                            <div class="mask-icon">
						                                <ul>
						                                    <li><a href="/project/reg.do?pbIdx=${projectList.pbIdx }" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
						                                </ul>
						                                <a href="/project/reg.do?pbIdx=${projectList.pbIdx }" class="cart">VIEW</a>
						                            </div>
						                        </div>
						                        <div class="why-text">
						                            <h4 style="height: 70px;"><a href="/project/reg.do?pbIdx=${projectList.pbIdx }">${projectList.pbSubject }</a></h4>
						                            <h3>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</h3>
						                            <h5>${projectList.pbSkill }</h5>
						                        </div>
						                    </div>
						                </div>
						                </c:forEach>
                                    </div>
                                </div>
                                <c:choose>
                                		<c:when test="${listType == 'list1' }">
                                			<div role="tabpanel" class="tab-pane fade show active" id="list-view">
                                		</c:when>
                                		<c:otherwise>
                                			<div role="tabpanel" class="tab-pane fade" id="list-view">
                                		</c:otherwise>
                                </c:choose>
                                    <div class="list-view-box">
                                        <div class="row">
                                            <table class="table" style="border-collapse: collapse;">
												<colgroup>
													<col style="width: 40px;">
													<col style="width: 80px;">
													<col style="width: auto;">
													<col style="width: 132px;">
													<col style="width: 163px;">
												</colgroup>
												<thead>
													<tr>
														<th></th>
														<th>순번</th>
														<th>프로젝트명</th>
														<th>기술</th>
														<th>기간</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${projectList }" var="projectList">
														<tr>
															<td>
																<c:if test="${memberInfo.mbID == 'admin' }">
																	<input type="checkbox" id="projectChkBox_${projectList.pbIdx }" name="projectChkBox" value = "${projectList.pbIdx }">
																	<label for="projectChkBox_${projectList.pbIdx }">&nbsp;</label>
																</c:if>
															</td>
															<td>${projectList.pno }</td>
															<td style="text-align:left;"><a href="/project/reg.do?pbIdx=${projectList.pbIdx }" >${projectList.pbSubject }</a></td>
															<td>${projectList.pbSkill }</td>
															<td>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</td>
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

</body>