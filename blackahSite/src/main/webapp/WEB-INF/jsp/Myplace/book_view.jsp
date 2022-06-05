<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<script type="text/javascript">	
		$(document).ready(function(){
			
			CKEDITOR.replace( 'brContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp' 
				, height:'400'
				, readOnly:true
			});
			
			$("#SubmitButton").click(function(){
				location.href="book_reg.do?brIdx=" + $("#brIdx").val();
			});
			
			$("#CancelButton").click(function(){
				location.href="bookreport.do";
			});
			
			var CheckState = '<c:out value="${bookList.brState }" />';
			
			if(CheckState == "Y"){
				$("#brState_1").prop("checked",true);
			}	
			
			
		});
	</script>
	
	<div class="all-title-box">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <h2>독서</h2>
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
	        <div class="row">
	        	<div class="col-lg">
		        	<form id="regForm" enctype="multipart/form-data">
						<input type="hidden" id="brIdx" name="brIdx" value="${bookList.brIdx }">
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
										<label>도서명</label>
									</th>
									<td colspan="3">
										<label>${bookList.brSubject }</label>
									</td>
								</tr>        
								<tr>
									<th scope="row" class="thead">
										<label>상태</label><label class="th_input_css"></label>
									</th>
									<td colspan="3">
										<ul class="checkBox floatBox">
											<li style="float:left; margin-right:20px;">
												<input type="checkbox" id="brState_1" name="brState_chk" value="완료" style="cursor:default;" disabled>
												<label style="cursor:default;" for="brState_1">독서완료</label>
											</li>
										</ul>
										<input type="hidden" id="brState" name="brState" value="">
									</td>               
								</tr>
								<tr>
									<th>
										<label>이미지</label>
									</th>
									<td colspan="3">
										<img  class="uploadImagePreview" id="imageView" width="300" height="300" src="${bookList.brImage }">
									</td>
								</tr>
								<tr>
									<th>
										<label>내용</label>
									</th>
									<td colspan="3">
										<textarea id="brContent" name="brContent" rows="30">${bookList.brContent }</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
	        </div>
	        <div class="row">
	        	<div class="col-lg">
		        	<div class="confirmArea">
						<c:if test="${memberInfo.mbID == 'admin'}">
							<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">수정</button>
						</c:if>
						<button type="button" class="cancelItem" id="CancelButton">목록으로</button>
					</div>
				</div>
	        </div>
	    </div>
	</div>