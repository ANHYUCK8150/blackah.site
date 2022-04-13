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
			
			CKEDITOR.replace( 'pbContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp' 
				, height:'600'
				, readOnly:true
			});
			
			$("#SubmitButton").click(function(){
				location.href="reg.do?pbIdx=" + $("#pbIdx").val();
			});
			
			$("#CancelButton").click(function(){
				location.href="list.do";
			});
			
			var CheckSkill = '<c:out value="${projectList.pbSkill }" />';
			var CheckWork = '<c:out value="${projectList.pbWork }" />';
			
			if(CheckSkill != "" && CheckWork != ""){
				var SkillArr = new Array();
				var WorkArr = new Array();
				
				SkillArr = CheckSkill.split(",");
				WorkArr = CheckWork.split(",");
				
				for(var i=0;i<SkillArr.length;i++){
					$("input[name=pbSkill_chk]").each(function(e){
						var item = $(this).val();
						
						if(item == SkillArr[i]){
							$(this).prop("checked",true);
						}
					});
				}
				
				for(var i=0;i<WorkArr.length;i++){
					$("input[name=pbWork_chk]").each(function(e){
						var item = $(this).val();
						
						if(item == WorkArr[i]){
							$(this).prop("checked",true);
						}
					});
				}
			}		
			
			
		});
	</script>
	<div class="ds_mall" style = " width:1200px; margin:0 auto; margin-bottom:30px;">
		<div class="ds_sub_area" style="width:1200px;">
			<div class="titleArea">
				<h2>프로젝트</h2>
				<span style="color:#999; float:left; height:32px; line-height:50px;"></span>
			</div>
		</div>
		
		<form id="regForm" enctype="multipart/form-data">
			<input type="hidden" id="pbIdx" name="pbIdx" value="${projectList.pbIdx }">
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
							<label>프로젝트명</label>
						</th>
						<td colspan="3">
							<label>${projectList.pbSubject }</label>
						</td>
					</tr>        
					<tr>
						<th scope="row" class="thead">
							<label>기술</label>
						</th>
						<td colspan="3">
							<ul class="checkBox floatBox">
								<c:forEach items="${skillList }" var="skillList">
									<li style="float:left; margin-right:20px;">
										<input type="checkbox" id="pbSkill_${skillList.sklIdx }" name="pbSkill_chk" value="${skillList.sklNM }" disabled style="cursor:default;">
										<label style="cursor:default;" for="pbSkill_${skillList.sklIdx }">${skillList.sklNM }</label>
									</li>
								</c:forEach>
							</ul>
							<input type="hidden" id="pbSkill" name="pbSkill" value="">
						</td>
					</tr>
					<tr>
						<th scope="row" class="thead">
							<label>업무</label>
						</th>
						<td colspan="3">
							<ul class="checkBox floatBox">
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_1" name="pbWork_chk" value="개발" disabled style="cursor:default;">
									<label style="cursor:default;" for="pbWork_1">개발</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_2" name="pbWork_chk" value="운영" disabled style="cursor:default;">
									<label style="cursor:default;" for="pbWork_2">운영</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_3" name="pbWork_chk" value="유지관리" disabled style="cursor:default;">
									<label style="cursor:default;" for="pbWork_3">유지관리</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_4" name="pbWork_chk" value="기획" disabled style="cursor:default;">
									<label style="cursor:default;" for="pbWork_4">기획</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_5" name="pbWork_chk" value="설계" disabled style="cursor:default;">
									<label style="cursor:default;" for="pbWork_5">설계</label>
								</li>
							</ul>
							<input type="hidden" id="pbWork" name="pbWork" value="">
						</td>               
					</tr>
					<tr>
						<th scope="row" class="thead">
							<label>시작일</label>
						</th>
						<td>
							<label>${projectList.pbStartDT }</label>
						</td>
						<th scope="row" class="thead">
							<label>종료일</label>
						</th>
						<td>
							<label>${projectList.pbEndDT }</label>
						</td>               
					</tr>
					<tr>
						<th>
							<label>이미지</label>
						</th>
						<td colspan="3">
							<img  class="uploadImagePreview" id="imageView" style="max-width: 650px;" src="${path}/${projectList.pbImage }">
						</td>
					</tr>
					<tr>
						<th>
							<label>내용</label>
						</th>
						<td colspan="3">
							<textarea id="pbContent" name="pbContent" rows="40">${projectList.pbContent }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="confirmArea">
			<c:if test="${memberInfo.mbID == 'admin'}">
				<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">수정</button>
			</c:if>
			<button type="button" class="cancelItem" id="CancelButton">목록으로</button>
		</div>
	</div>
</body>
</html>