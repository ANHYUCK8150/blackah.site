<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script>		
		function changePaging(page){
			var selectSkill = new Array();
			
			if($("#DevelopSkill_All").is(":checked")){
				selectSkill.push("ALL");
			}else{
				$("input[name=DevelopSkill]:checked").each(function(){
					var chk = $(this).val();
					selectSkill.push(chk);
				});
			}
			
			
			$.ajax({
	            url: "develop_list_ajax.do",
	            type: "POST",
	            data: {
	            	"nowPage" : page
	            	,"searchSkill" : selectSkill
	            	,"searchText" : $("#searchText").val()
	            },
	            success: function(data){
	            	$('#DevelopData').empty();
	                $('#DevelopData').html(data);
	            },
	            error: function(){
	                
	            }
	        });
		}
		
		$(function(){
			$("#searchdevelopList").click(function(){
				var selectSkill = new Array();
				
				if($("#DevelopSkill_All").is(":checked")){
					selectSkill.push("ALL");
				}else{
					$("input[name=DevelopSkill]:checked").each(function(){
						var chk = $(this).val();
						selectSkill.push(chk);
					});
				}
				
				$.ajax({
		            url: "develop_list_ajax.do",
		            type: "POST",
		            data: {
		            	"nowPage" : "1"
		            	,"searchSkill" : selectSkill
		            	,"searchText" : $("#searchText").val()
		            },
		            success: function(data){
		            	$('#DevelopData').empty();
		                $('#DevelopData').html(data);
		            },
		            error: function(){
		                
		            }
		        });
				
				
			});
			
			$("#DevelopSkill_All").click(function() {
				if($("#DevelopSkill_All").is(":checked")) $("#DevelopSkill input[name=DevelopSkill]").prop("checked", true);
				else $("#DevelopSkill input[name=DevelopSkill]").prop("checked", false);
			});

			$("#DevelopSkill input[name=DevelopSkill]").click(function() {
				var total = $("#DevelopSkill input[name=DevelopSkill]").length;
				var checked = $("#DevelopSkill input[name=DevelopSkill]:checked").length;
				
				if(checked == 0){
					alert("하나이상 무조건 선택해야합니다.");
					$(this).prop("checked",true);
					return;
				}

				if(total != checked) $("#DevelopSkill_All").prop("checked", false);
				else $("#DevelopSkill_All").prop("checked", true); 
			});
			
			$("#DevelopWork_All").click(function() {
				if($("#DevelopWork_All").is(":checked")) $("#DevelopWork input[name=DevelopWork]").prop("checked", true);
				else $("#DevelopWork input[name=DevelopWork]").prop("checked", false);
			});

			$("#DevelopWork input[name=DevelopWork]").click(function() {
				var total = $("#DevelopWork input[name=DevelopWork]").length;
				var checked = $("#DevelopWork input[name=DevelopWork]:checked").length;
				
				if(checked == 0){
					alert("하나이상 무조건 선택해야합니다.");
					$(this).prop("checked",true);
					return;
				}

				if(total != checked) $("#DevelopWork_All").prop("checked", false);
				else $("#DevelopWork_All").prop("checked", true); 
			});
			
			//초기화 버튼
			$("#searchInit").click(function(){
				$("#DevelopSkill_All").prop("checked", true);
				$("#DevelopSkill input[name=DevelopSkill]").prop("checked", true);
				$("#DevelopWork_All").prop("checked", true);
				$("#DevelopWork input[name=DevelopWork]").prop("checked", true);
				$("#searchText").val("");
			});
			
			$("#deleteItem").off("click");
			$("#deleteItem").on("click",function(){
				var selectList = new Array();
				if($("#listType1").hasClass("active") === true) {
					$("input[name=DevelopChkBox]:checked").each(function(){
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
	                <h2>나의공간</h2>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
	                    <li class="breadcrumb-item active">개발공간</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="shop-box-inner">
        <div class="container">
            <div class="row" >
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right" id="DevelopData">
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
                </div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>상세검색조건</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
								<ul id="DevelopSkill">
									<li>
										<input type="checkbox" id="DevelopSkill_All" name="DevelopSkill_All" value="ALL">
										<label for="DevelopSkill_All">전체</label>
									</li>
									<c:forEach items="${skillList }" var="skillList">
										<li>
											<input type="checkbox" id="DevelopSkill_${skillList.sklIdx }" name="DevelopSkill" value="${skillList.sklNM }">
											<label for="DevelopSkill_${skillList.sklIdx }">${skillList.sklNM }</label>
										</li>
									</c:forEach>
								</ul>
                            </div>
                        </div>
                        <div class="filter-price-left">
                            <div class="title-left">
                                <h3>글제목</h3>
                            </div>
                            <div class="price-box-slider">
                                <ul id="DevelopNM">
									<li>
										<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력해주세요." style="width:100%; height:32px;">
									</li>
								</ul>
                            </div>
                            <div class="searchDetailBtnArea">
								<button class="btnInit" id="searchInit">
									<span>초기화</span>
								</button>
								<button class="btnApply" id="searchdevelopList">
									<span>적용</span>
								</button>
							</div>
                        </div>
						<c:if test="${memberInfo.mbID == 'admin' }">
							<div class="regNewItem" id="deleteItem" >
								<a href="javascript:return false;">삭제</a>
							</div>
							<div class="regNewItem" id="regNewItem" style="margin-right:5px;">
								<a href="/myplace/develop_reg.do">등록</a>
							</div>
						</c:if>
                    </div>
                </div>
                					
            </div>
        </div>
    </div>
