<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#ContentArea {min-height:250px;}
	#ContentArea ul{list-style:outside !important; }
	#ContentArea ul li{margin:10px !important; }
	
	#ContentArea_Reply {min-height:70px;}
	#ContentArea_Reply ul{list-style:outside !important; }
	#ContentArea_Reply ul li{margin:10px !important; }
</style>
<script type="text/javascript">	
	$(document).ready(function(){
		
		$("#SubmitButton").click(function(){
			location.href="reg.do?op=${title}&qbIdx=" + $("#qbIdx").val();
		});
		
		$("#CancelButton").click(function(){
			location.href="board.do?op=${title}";
		});
		
		$("#ReplyButton").click(function(){
			location.href="reg.do?option=reply&op=${title}&qbIdx=" + $("#qbIdx").val();
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
						<c:when test="${title == 'notice' }">
							 <li class="breadcrumb-item active">공지사항</li>
						</c:when>
						<c:when test="${title == 'qna' }">
							 <li class="breadcrumb-item active">질문과답변</li>
						</c:when>
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
									<label>글 번호</label>
								</th>
								<td>
									<label>${ParentList.qbNo }</label>
								</td>
								<th scope="row" class="thead">
									<label>작성자</label>
								</th>
								<td>
									<label>${ParentList.qbOwner }</label>
								</td>
							</tr>
							<tr>
								<th scope="row" class="thead">
									<label>글 제목</label>
								</th>
								<td colspan="3">
									<label>${ParentList.qbSubject }</label>
								</td>
							</tr>        
							<tr>
								<th scope="row" class="thead">
									<label>내용</label>
								</th>
								<td colspan="3">
									<div id="ContentArea">${ParentList.qbContent }</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
        	</div>
        </div>
        <div class="row">
        	<div class="col-lg">
        		<c:if test="${!empty ChildList }">
					<div style="border-bottom:1px solid #ccc;margin:30px 0;"></div>
					<c:forEach items="${ChildList }" var="ChildList">
						<table class="rq_table" style="margin-bottom:5px;">
							<colgroup>
								<col style="width:15%;">
								<col style="width:85%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="thead">
										<label>답글</label>
									</th>
									<td>
										<div id="ContentArea_Reply">${ChildList.qbrContent }</div>
									</td>
								</tr>
							</tbody>
						</table>
					</c:forEach>
				</c:if>
				<div class="confirmArea" style="margin-bottom:30px;">
					<c:if test="${memberInfo.mbID == 'admin'}">
						<button type="button" class="replyItem btnEndProduct" id="ReplyButton" style="width:130px;">답글</button>
					</c:if>
					<c:if test="${title == 'qna'}">
						<button type="button" class="regItem btnEndProduct" id="SubmitButton" style="width:130px;">수정</button>
					</c:if>
					<c:choose>
						<c:when test="${title == ''}">
							<button type="button" class="cancelItem" onclick="window.history.back();">홈으로</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="cancelItem" id="CancelButton">목록으로</button>
						</c:otherwise>
					</c:choose>
				</div>
        	</div>
        </div>
    </div>
</div>
