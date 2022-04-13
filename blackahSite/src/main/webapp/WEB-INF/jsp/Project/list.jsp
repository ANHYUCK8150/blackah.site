<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script>		
		function changePaging(page){
			var listType = "list2";
			if($("#listType1").hasClass("active") === true) {
				listType = "list1";
			}
			
			var selectSkill = new Array();
			
			if($("#ProjectSkill_All").is(":checked")){
				selectSkill.push("ALL");
			}else{
				$("input[name=ProjectSkill]:checked").each(function(){
					var chk = $(this).val();
					selectSkill.push(chk);
				});
			}
			
			var selectWork = new Array();
			selectWork.push("ALL");
			
			$.ajax({
	            url: "list_ajax.do",
	            type: "POST",
	            data: {
	            	"nowPage" : page
	            	,"listType" : listType
	            	,"searchSkill" : selectSkill
	            	,"searchWork" : selectWork
	            	,"searchText" : $("#searchText").val()
	            },
	            success: function(data){
	            	$('#projectData').empty();
	                $('#projectData').html(data);
	            },
	            error: function(){
	                
	            }
	        });
		}
		
		$(function(){
			$("#searchProjectList").click(function(){
				var listType = "list2";
				if($("#listType1").hasClass("active") === true) {
					listType = "list1";
				}
				
				var selectSkill = new Array();
				
				if($("#ProjectSkill_All").is(":checked")){
					selectSkill.push("ALL");
				}else{
					$("input[name=ProjectSkill]:checked").each(function(){
						var chk = $(this).val();
						selectSkill.push(chk);
					});
				}
				
				var selectWork = new Array();
				selectWork.push("ALL");
				
				$.ajax({
		            url: "list_ajax.do",
		            type: "POST",
		            data: {
		            	"nowPage" : "1"
		            	,"listType" : listType
		            	,"searchSkill" : selectSkill
		            	,"searchWork" : selectWork
		            	,"searchText" : $("#searchText").val()
		            },
		            success: function(data){
		            	$('#projectData').empty();
		                $('#projectData').html(data);
		            },
		            error: function(){
		                
		            }
		        });
				
				
			});
			
			$("#ProjectSkill_All").click(function() {
				if($("#ProjectSkill_All").is(":checked")) $("#ProjectSkill input[name=ProjectSkill]").prop("checked", true);
				else $("#ProjectSkill input[name=ProjectSkill]").prop("checked", false);
			});

			$("#ProjectSkill input[name=ProjectSkill]").click(function() {
				var total = $("#ProjectSkill input[name=ProjectSkill]").length;
				var checked = $("#ProjectSkill input[name=ProjectSkill]:checked").length;
				
				if(checked == 0){
					alert("하나이상 무조건 선택해야합니다.");
					$(this).prop("checked",true);
					return;
				}

				if(total != checked) $("#ProjectSkill_All").prop("checked", false);
				else $("#ProjectSkill_All").prop("checked", true); 
			});
			
			$("#ProjectWork_All").click(function() {
				if($("#ProjectWork_All").is(":checked")) $("#ProjectWork input[name=ProjectWork]").prop("checked", true);
				else $("#ProjectWork input[name=ProjectWork]").prop("checked", false);
			});

			$("#ProjectWork input[name=ProjectWork]").click(function() {
				var total = $("#ProjectWork input[name=ProjectWork]").length;
				var checked = $("#ProjectWork input[name=ProjectWork]:checked").length;
				
				if(checked == 0){
					alert("하나이상 무조건 선택해야합니다.");
					$(this).prop("checked",true);
					return;
				}

				if(total != checked) $("#ProjectWork_All").prop("checked", false);
				else $("#ProjectWork_All").prop("checked", true); 
			});
			
			//초기화 버튼
			$("#searchInit").click(function(){
				$("#ProjectSkill_All").prop("checked", true);
				$("#ProjectSkill input[name=ProjectSkill]").prop("checked", true);
				$("#ProjectWork_All").prop("checked", true);
				$("#ProjectWork input[name=ProjectWork]").prop("checked", true);
				$("#searchText").val("");
			});
			
			$("#deleteItem").off("click");
			$("#deleteItem").on("click",function(){
				var selectList = new Array();
				if($("#listType1").hasClass("on") === true) {
					$("input[name=projectChkBox]:checked").each(function(){
						var chk = $(this).val();
						selectList.push(chk);
					});
				}else{
					$("input[name=boxCheckBox]:checked").each(function(){
						var chk = $(this).val();
						selectList.push(chk);
					});
				}
				
				if(selectList.length < 1){
					alert("삭제할 게시글을 선택하세요.");
					return;
				}
				
				location.href="delete.do?checkList=" + selectList;
			});
			
			$("#searchInit").trigger("click");
			
		});		
		
	</script>
	
	
	<div class="all-title-box">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <h2>프로젝트</h2>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
	                    <li class="breadcrumb-item active">프로젝트</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="shop-box-inner">
        <div class="container">
            <div class="row" >
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right" id="projectData">
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
                                    <li>
                                        <a id="listType1" class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link active" href="#grid-view " data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
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
                                <div role="tabpanel" class="tab-pane fade" id="list-view">
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
                </div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>상세검색조건</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
								<ul id="ProjectSkill">
									<li>
										<input type="checkbox" id="ProjectSkill_All" name="ProjectSkill_All" value="ALL">
										<label for="ProjectSkill_All">전체</label>
									</li>
									<c:forEach items="${skillList }" var="skillList">
										<li>
											<input type="checkbox" id="ProjectSkill_${skillList.sklIdx }" name="ProjectSkill" value="${skillList.sklNM }">
											<label for="ProjectSkill_${skillList.sklIdx }">${skillList.sklNM }</label>
										</li>
									</c:forEach>
								</ul>
                            </div>
                        </div>
                        <div class="filter-price-left">
                            <div class="title-left">
                                <h3>프로젝트명</h3>
                            </div>
                            <div class="price-box-slider">
                                <ul id="ProjectNM">
									<li>
										<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력해주세요." style="width:100%; height:32px;">
									</li>
								</ul>
                            </div>
                            <div class="searchDetailBtnArea">
								<button class="btnInit" id="searchInit">
									<span>초기화</span>
								</button>
								<button class="btnApply" id="searchProjectList">
									<span>적용</span>
								</button>
							</div>
                        </div>
						<c:if test="${memberInfo.mbID == 'admin' }">
							<div class="regNewItem" id="deleteItem" >
								<a href="javascript:return false;">삭제</a>
							</div>
							<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
								<a href="/project/reg.do">등록</a>
							</div>
						</c:if>
                    </div>
                </div>
                					
            </div>
        </div>
    </div>
