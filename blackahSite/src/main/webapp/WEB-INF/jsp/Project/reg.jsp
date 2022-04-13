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
			
			$.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
			
			$( "#pbStartDT" ).datepicker();
			$( "#pbEndDT" ).datepicker();
			
			CKEDITOR.replace( 'pbContent', { filebrowserImageUploadUrl: '../uploadIMG.jsp' });
			
			
			$("#btnImage").click(function(){
				$("#pbImage").trigger("click");
			});
			
			$("#pbImage").change(function(e){
				$("#pbImageNM").val($("#pbImage").val());
				readImage(e.target);
			});
			
			$("#SubmitButton").click(function(){
				var pbSubject = $("#pbSubject").val();
				var pbStartDT = $("#pbStartDT").val();
				var pbEndDT = $("#pbEndDT").val();
				
				if(pbSubject == "" || pbSubject == undefined){
					alert("프로젝트명을 입력하세요.");
					$("#pbSubject").focus();
					return;
				}

				var pbSkill = new Array(); // 배열 선언
				$('input:checkbox[name=pbSkill_chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
					pbSkill.push(this.value);
				});
							
				$("#pbSkill").val(pbSkill);
				
				if(pbSkill.length < 1){
					alert("기술을 하나 이상 선택하세요.");
					return;
				}
				
				var pbWork = new Array(); // 배열 선언
				$('input:checkbox[name=pbWork_chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
					pbWork.push(this.value);
				});
							
				$("#pbWork").val(pbWork);
				
				if(pbWork.length < 1){
					alert("업무를 하나 이상 선택하세요.");
					$("#pbWork").focus();
					return;
				}
				
				if(pbStartDT == "" || pbStartDT == undefined){
					alert("시작일을 입력하세요.");
					$("#pbStartDT").focus();
					return;
				}
				
				if(pbEndDT == "" || pbEndDT == undefined){
					alert("종료일을 입력하세요.");
					$("#pbEndDT").focus();
					return;
				}
	
				$("#regForm").attr("method","post").attr("action","modify.do").submit();
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
				<c:choose>
					<c:when test="${projectList.pbIdx != null}">
						<h2>프로젝트 수정</h2>
					</c:when>
					<c:otherwise>
						<h2>프로젝트 등록</h2>
					</c:otherwise>
				</c:choose>
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
							<label>프로젝트명</label><label class="th_input_css"><img src="${path}/resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<td colspan="3"><input name="pbSubject" id="pbSubject" value="${projectList.pbSubject }" style="width:85%; border:solid 1px #cecece;" ></td>
					</tr>        
					<tr>
						<th scope="row" class="thead">
							<label>기술</label><label class="th_input_css"><img src="${path}/resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<td colspan="3">
							<ul class="checkBox floatBox">
								<c:forEach items="${skillList }" var="skillList">
									<li style="float:left; margin-right:20px;">
										<input type="checkbox" id="pbSkill_${skillList.sklIdx }" name="pbSkill_chk" value="${skillList.sklNM }">
										<label for="pbSkill_${skillList.sklIdx }">${skillList.sklNM }</label>
									</li>
								</c:forEach>
							</ul>
							<input type="hidden" id="pbSkill" name="pbSkill" value="">
						</td>
					</tr>
					<tr>
						<th scope="row" class="thead">
							<label>업무</label><label class="th_input_css"><img src="${path}/resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<td colspan="3">
							<ul class="checkBox floatBox">
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_1" name="pbWork_chk" value="개발">
									<label for="pbWork_1">개발</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_2" name="pbWork_chk" value="운영">
									<label for="pbWork_2">운영</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_3" name="pbWork_chk" value="기획">
									<label for="pbWork_3">기획</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_4" name="pbWork_chk" value="설계">
									<label for="pbWork_4">설계</label>
								</li>
								<li style="float:left; margin-right:20px;">
									<input type="checkbox" id="pbWork_5" name="pbWork_chk" value="교육">
									<label for="pbWork_5">교육</label>
								</li>
							</ul>
							<input type="hidden" id="pbWork" name="pbWork" value="">
						</td>               
					</tr>
					<tr>
						<th scope="row" class="thead">
							<label>시작일</label><label class="th_input_css"><img src="${path}/resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<td><input name="pbStartDT" id="pbStartDT" value="${projectList.pbStartDT }" style="width:60%; border:solid 1px #cecece;" ></td>
						<th scope="row" class="thead">
							<label>종료일</label><label class="th_input_css"><img src="${path}/resources/images/icon_medium_blck1.png" alt="필수항목"></label>
						</th>
						<td><input name="pbEndDT" id="pbEndDT" value="${projectList.pbEndDT }" style="width:60%; border:solid 1px #cecece;" ></td>               
					</tr>
					<tr>
						<th>
							<label>내용</label>
						</th>
						<td colspan="3">
							<textarea id="pbContent" name="pbContent" rows="40">${projectList.pbContent }</textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label>대표이미지</label>
						</th>
						<td colspan="2"><input name="pbImageNM" id="pbImageNM" value="" style="width:90%; border:solid 1px #cecece;" readonly="readonly" aria-invalid="false"></td>
						<td>
							<button class="btnAddFile" id="btnImage" name="btnImage" type="button">파일첨부</button>
							<input accept=".jpg, .jpeg, .gif, .png" id="pbImage" name="pbImage" style="display: none;" type="file" value="">
							
						</td>
					</tr>
					<tr>
						<th>
							<label>이미지 미리보기</label>
						</th>
						<td colspan="3">
							<img  class="uploadImagePreview" id="imageView" style="max-width: 650px;" src="${path}/${projectList.pbImage }">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="confirmArea" style="margin-bottom:30px;">
			<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">
				<c:choose>
					<c:when test="${projectList.pbIdx != null}">
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
