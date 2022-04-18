<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<script type="text/javascript">
		$(document).ready(function(){
			CKEDITOR.replace( 'diContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp' , height:'600' });
			
			$("#SubmitButton").click(function(){
				var diSubject = $("#diSubject").val();
				
				if(diSubject == "" || diSubject == undefined){
					alert("글제목을 입력하세요.");
					$("#diSubject").focus();
					return;
				}

				var diTech = new Array(); // 배열 선언
				$('input:checkbox[name=diTech_chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
					diTech.push(this.value);
				});
							
				$("#diTech").val(diTech);
				
				if(diTech.length < 1){
					alert("테크를 하나 이상 선택하세요.");
					return;
				}
				
				$("#regForm").attr("method","post").attr("action","develop_modify.do").submit();
			});
			
			$("#CancelButton").click(function(){
				location.href="develop.do";
			});
			
			var CheckTech = '<c:out value="${developList.diTech }" />';
			
			if(CheckTech != ""){
				var TechArr = new Array();
				
				TechArr = CheckTech.split(",");
				
				for(var i=0;i<TechArr.length;i++){
					$("input[name=diTech_chk]").each(function(e){
						var item = $(this).val();
						
						if(item == TechArr[i]){
							$(this).prop("checked",true);
						}
					});
				}
				
			}		
			
			
		});
	</script>
	
	<div class="all-title-box">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <h2>나의공간</h2>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
	                    <c:choose>
							<c:when test="${developList.diIdx != null}">
								 <li class="breadcrumb-item active">개발공간 수정</li>
							</c:when>
							<c:otherwise>
								 <li class="breadcrumb-item active">개발공간 등록</li>
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
						<input type="hidden" id="diIdx" name="diIdx" value="${developList.diIdx }">
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
										<label>글제목</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
									</th>
									<td colspan="3"><input name="diSubject" id="diSubject" value="${developList.diSubject }" style="width:85%; border:solid 1px #cecece;" ></td>
								</tr>        
								<tr>
									<th scope="row" class="thead">
										<label>테크</label><label class="th_input_css"><img src="${path}/images/icon_medium_blck1.png" alt="필수항목"></label>
									</th>
									<td colspan="3">
										<ul class="checkBox floatBox">
											<c:forEach items="${skillList }" var="skillList">
												<li style="float:left; margin-right:20px;">
													<input type="checkbox" id="diTech_${skillList.sklIdx }" name="diTech_chk" value="${skillList.sklNM }">
													<label for="diTech_${skillList.sklIdx }">${skillList.sklNM }</label>
												</li>
											</c:forEach>
										</ul>
										<input type="hidden" id="diTech" name="diTech" value="">
									</td>
								</tr>
								<tr>
									<th>
										<label>내용</label>
									</th>
									<td colspan="3">
										<textarea id="diContent" name="diContent" rows="40">${developList.diContent }</textarea>
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
								<c:when test="${developList.diIdx != null}">
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
	