<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<script type="text/javascript">
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("imageView")
		            previewImage.src = e.target.result
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
	
		$(document).ready(function(){
			
			CKEDITOR.replace( 'brContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp' });
			
			
			$("#btnImage").click(function(){
				$("#brImage").trigger("click");
			});
			
			$("#brImage").change(function(e){
				$("#brImageNM").val($("#brImage").val());
				readImage(e.target);
			});
			
			$("#SubmitButton").click(function(){
				var brSubject = $("#brSubject").val();
				
				if(brSubject == "" || brSubject == undefined){
					alert("도서명을 입력하세요.");
					$("#brSubject").focus();
					return;
				}

				var brState = "N";
				if($("#brState_1").is(":checked")){
					brState = "Y";
				}
							
				$("#brState").val(brState);
				
				$("#regForm").attr("method","post").attr("action","book_modify.do").submit();
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
	                    <c:choose>
							<c:when test="${bookList.brIdx != null}">
								 <li class="breadcrumb-item active">독서 수정</li>
							</c:when>
							<c:otherwise>
								 <li class="breadcrumb-item active">독서 등록</li>
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
										<label>도서명</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
									</th>
									<td colspan="3"><input name="brSubject" id="brSubject" value="${bookList.brSubject }" style="width:85%; border:solid 1px #cecece;" ></td>
								</tr>        
								<tr>
									<th scope="row" class="thead">
										<label>상태</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
									</th>
									<td colspan="3">
										<ul class="checkBox floatBox">
											<li style="float:left; margin-right:20px;">
												<input type="checkbox" id="brState_1" name="brState_chk" value="완료">
												<label for="brState_1">독서완료</label>
											</li>
										</ul>
										<input type="hidden" id="brState" name="brState" value="">
									</td>               
								</tr>
								<tr>
									<th>
										<label>내용</label>
									</th>
									<td colspan="3">
										<textarea id="brContent" name="brContent" rows="40">${bookList.brContent }</textarea>
									</td>
								</tr>
								<tr>
									<th>
										<label>대표이미지</label>
									</th>
									<td colspan="2"><input name="brImageNM" id="brImageNM" value="" style="width:90%; border:solid 1px #cecece;" readonly="readonly" aria-invalid="false"></td>
									<td>
										<button class="btnAddFile" id="btnImage" name="btnImage" type="button">파일첨부</button>
										<input accept=".jpg, .jpeg, .gif, .png" id="brImage" name="brImage" style="display: none;" type="file" value="">
										
									</td>
								</tr>
								<tr>
									<th>
										<label>이미지 미리보기</label>
									</th>
									<td colspan="3">
										<img  class="uploadImagePreview" id="imageView" style="max-width: 650px;" src="${path}/${bookList.brImage }">
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
								<c:when test="${bookList.brIdx != null}">
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
	