<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			CKEDITOR.replace( 'qbContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp', height:400 });
			
			$("#SubmitButton").click(function(){
				var qbSubject = $("#qbSubject").val();
				var qbOwner = $("#qbOwner").val();
				var qbPW = $("#qbPW").val();
				var qbIdx = $("#qbIdx").val();
				
				if(qbSubject == "" || qbSubject == undefined){
					alert("글제목을 입력하세요.");
					$("#qbSubject").focus();
					return;
				}
				
				if(qbOwner == "" || qbOwner == undefined){
					alert("작성자를 입력하세요.");
					$("#qbOwner").focus();
					return;
				}
				
				if(qbPW == "" || qbPW == undefined){
					alert("비밀번호를 입력하세요.");
					$("#qbPW").focus();
					return;
				}
				
				if(qbIdx != ""){
					var result = "";
					$.ajax({
				        url: "board_PWchk.do",
				        type: "POST",
				        async:false,
				        data: {
				        	"qbIdx" : qbIdx
				        	,"qbPW" : qbPW
				        },
				        success: function(data){
				        	result = data;
				        },
				        error: function(){
				            
				        }
				    });
					
					if(result != "FIND"){
						alert("해당글의 비밀번호가 아닙니다.");
						$("#qbPW").focus();
						return;
					}
				}
	
				$("#regForm").attr("method","post").attr("action","modify.do?op=${title}&option=${reply}").submit();
			});
			
			$("#CancelButton").click(function(){
				location.href="board.do?op=${title}";
			});
			
			
		});
	</script>
	
	<div class="all-title-box">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <h2>게시글</h2>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
	                    <c:choose>
							<c:when test="${reply != null}">
								<li class="breadcrumb-item active">질문과 답변 답글</li>
							</c:when>
							<c:when test="${ParentList.qbIdx != null}">
								<li class="breadcrumb-item active">질문과 답변 수정</li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${title == 'notice' }">
										<li class="breadcrumb-item active">공지사항 등록</li>
									</c:when>
									<c:when test="${title == 'qna' }">
										<li class="breadcrumb-item active">질문과 답변 등록</li>
									</c:when>
								</c:choose> 
							</c:otherwise>
						</c:choose>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="shop-box-inner">
	    <div class="container">
	        <div class="row">
	        	<div class="col-lg">
	        		<form id="regForm" enctype="multipart/form-data">
						<input type="hidden" id="qbIdx" name="qbIdx" value="${ParentList.qbIdx }">
						<input type="hidden" id="qbNo" name="qbNo" value="${ParentList.qbNo }">
						<input type="hidden" id="qbID" name="qbID" value="${memberInfo.mbID }">
						<c:if test="${reply != null }">
							<input type="hidden" id="option" name="option" value="${reply }">
						</c:if>
						<table class="rq_table">
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="thead">
										<label>작성자</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
									</th>
									<c:choose>
										<c:when test="${ParentList.qbIdx != null }">
											<c:choose>
												<c:when test="${memberInfo.mbID == ParentList.qbID }">
													<td colspan="3"><input name="qbOwner" id="qbOwner" value="${ParentList.qbOwner }" style="width:94%; border:solid 1px #cecece;" readonly></td>
													<input type="hidden" id="qbPW" value="${memberInfo.mbID }" >
												</c:when>
												<c:otherwise>
													<td><input name="qbOwner" id="qbOwner" name="qbPW" value="${ParentList.qbOwner }" style="width:85%; border:solid 1px #cecece;" ></td>
													<th scope="row" class="thead">
														<label>비밀번호</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
													</th>
													<c:choose>
														<c:when test="${memberInfo.mbID == 'admin' }">
															<td><input type="password" id="qbPW" name="qbPW" value="${ParentList.qbPW }" style="width:85%; border:solid 1px #cecece;" ></td>
														</c:when>
														<c:otherwise>
															<td><input type="password" id="qbPW" name="qbPW" value="" style="width:85%; border:solid 1px #cecece;" ></td>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${memberInfo.mbID != null }">
													<td colspan="3"><input name="qbOwner" id="qbOwner" value="${memberInfo.mbNM }" style="width:94%; border:solid 1px #cecece;" readonly></td>
													<input type="hidden" id="qbPW" name="qbPW" value="${memberInfo.mbID }" >
												</c:when>
												<c:otherwise>
													<td><input name="qbOwner" id="qbOwner" name="qbPW" value="" style="width:85%; border:solid 1px #cecece;" ></td>
													<th scope="row" class="thead">
														<label>비밀번호</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
													</th>
													<td><input type="password" id="qbPW" name="qbPW" value="" style="width:85%; border:solid 1px #cecece;" ></td>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									
								</tr>
								<tr>
									<th scope="row" class="thead">
										<label>글제목</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
									</th>
									<td colspan="3"><input name="qbSubject" id="qbSubject" value="${ParentList.qbSubject }" style="width:94%; border:solid 1px #cecece;" ></td>
								</tr>
								<tr>
									<th>
										<label>내용</label>
									</th>
									<td colspan="3">
										<textarea id="qbContent" name="qbContent" rows="40">${ParentList.qbContent }</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
	        	</div>
	        </div>
	        <div class="row">
	        	<div class="col-lg">
	        		<div class="confirmArea" style="margin-bottom:30px;">
						<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">
							<c:choose>
								<c:when test="${ParentList.qbIdx != null}">
									수정
								</c:when>
								<c:otherwise>
									등록
								</c:otherwise>
							</c:choose>
						</button>
						<button type="button" class="cancelItem" id="CancelButton">목록으로</button>
					</div>
	        	</div>
	        </div>
	    </div>
    </div>
