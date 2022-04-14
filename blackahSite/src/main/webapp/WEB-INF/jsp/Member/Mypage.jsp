<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function Confirm(){
	var obj=document.confirm_form;	
	
	if(!obj.mbNM.value){
		alert("이름을 입력하세요.");
		obj.mbNM.focus();
		return false;
	}
	
	if(!obj.mbPhone.value){
		alert("전화번호를 입력하세요.");
		obj.mbPhone.focus();
		return false;
	}
	
	if(!obj.mbEmail.value){
		alert("이메일을 입력하세요.");
		obj.mbEmail.focus();
		return false;
	}
	
	var chkPhone = "";
	
	$.ajax({
        url: "phone_check.do",
        type: "POST",
        data: {
        	"mbPhone" : obj.mbPhone.value
        },
        async:false,
        success: function(data){
			chkPhone = data;
        },
        error: function(){
            
        }
    });
	
	if(chkPhone == "FIND"){
		alert("중복된 전화번호 입니다.");
		obj.mbPhone.focus();
		return;
	}
	
	var chkEmail = "";
	
	$.ajax({
        url: "email_check.do",
        type: "POST",
        data: {
        	"mbEmail" : obj.mbEmail.value
        },
        async:false,
        success: function(data){
			chkEmail = data;
        },
        error: function(){
            
        }
    });
	
	if(chkEmail == "FIND"){
		alert("중복된 이메일 입니다.");
		obj.mbEmail.focus();
		return;
	}

	obj.submit();			
}

$(document).ready(function(){
	
	$("#confirm_btn").click(function(){
		$(this).submit();
	});
	
	$("#mbAddress, #mbPost").click(function(){
		execDaumPostcode();
	});
	
	$("#mbPW").click(function(){
		window.open('/member/pwModify.do', '비밀번호 변경', 'width=600px,height=500px,scrollbars=yes');
	});
	
	
});

</script>

<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>마이페이지</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item active">마이페이지</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="about-box-main">
    <div class="container">
        <div class="row">
        	<div class="col-lg">
	        	<form class="needs-validation" name="confirm_form" id="confirm_form" method="post" action="/member/modify.do" onsubmit="Confirm(); return false;">
	        		<div class="checkout-address joinIp">
	                    <div class="row">
	                        <div class="col-md-6 mb-3">
	                            <label for="mbID">아이디</label>
	                            <input type="text" class="form-control idCheck" id="mbID" name="mbID" placeholder="" value="${memberInfo.mbID}" required readonly>
	                            <input type="hidden" id="mbIdx" name="mbIdx" value="${memberInfo.mbIdx}" >
	                        </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="mbPW"></label>
	                            <input type="button" class="form-control" id="mbPW" name="mbPW" placeholder="" value="비밀번호 변경" required>
	                        </div>
	                    </div>
	                    <div class="mb-3">
                            <label for="mbNM">이름</label>
                            <input type="text" class="form-control" id="mbNM" name="mbNM" placeholder="" value="${memberInfo.mbNM}" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="mbEmail">이메일</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="mbEmail" name="mbEmail" placeholder="" value="${memberInfo.mbEmail}" required>
	                        </div>
	                    </div>
	                    <div class="mb-3">
	                        <label for="mbPhone">전화번호</label>
	                        <input type="email" class="form-control phoneNumber" id="mbPhone" name="mbPhone" value="${memberInfo.mbPhone}" placeholder="">
	                    </div>
	                    <div class="mb-3">
	                        <label for="mbAddress">주소</label>
	                        <input type="text" class="form-control" id="mbAddress" name="mbAddress" value="${memberInfo.mbAddress}" placeholder="" required>
	                    </div>
	                    <div class="row">
	                        <div class="col-md-8 mb-3">
	                            <label for="mbAddress2">상세주소</label>
	                        	<input type="text" class="form-control" id="mbAddress2" name="mbAddress2" placeholder="" value="${memberInfo.mbAddress2}" required>
	                        </div>
	                        <div class="col-md-4 mb-3">
	                            <label for="mbPost">우편번호</label>
	                            <input type="text" class="form-control" id="mbPost" name="mbPost" placeholder="" value="${memberInfo.mbPost}" required>
	                        </div>
	                    </div>
	                        
	                    <div class="confirmArea">
	                        <button type="button"  id="confirm_btn" class="confirmBtn regItem">변경</button>
	                    </div>
	                </div>
	           </form>
	       </div>
        </div>
    </div>
</div>



