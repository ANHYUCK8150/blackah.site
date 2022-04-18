<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">	
		$(document).ready(function(){
			
			CKEDITOR.replace( 'diContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp' 
				, height:'600'
				, readOnly:true
			});
			
			$("#SubmitButton").click(function(){
				location.href="develop_reg.do?diIdx=" + $("#diIdx").val();
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
	                    <li class="breadcrumb-item active">개발공간</li>
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
										<label>글제목</label>
									</th>
									<td colspan="3">
										<label>${developList.diSubject }</label>
									</td>
								</tr>        
								<tr>
									<th scope="row" class="thead">
										<label>테크</label><label class="th_input_css"></label>
									</th>
									<td colspan="3">
										<ul class="checkBox floatBox">
											<c:forEach items="${skillList }" var="skillList">
												<li style="float:left; margin-right:20px;">
													<input type="checkbox" id="diTech_${skillList.sklIdx }" name="diTech_chk" value="${skillList.sklNM }" style="cursor:default;" disabled>
													<label style="cursor:default;" for="diTech_${skillList.sklIdx }">${skillList.sklNM }</label>
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
	
</body>
</html>