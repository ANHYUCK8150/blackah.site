<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function Confirm(){
	var obj=document.confirm_form;	
	if(!obj.mbID.value){
		alert("아이디를 입력하세요.");
		obj.mbID.focus();
		return false;
	}
	
	var regExp = /^[a-z]+[a-z0-9]{4,19}$/g;
 
	if(!regExp.test(obj.mbID.value)){
		alert("아이디는 5~20자 입력하세요.\n첫문자는 영문자로 시작해야합니다.");
		obj.mbID.value = "";
		obj.mbID.focus();
		return false;
	}
	
	if(!obj.mbNM.value){
		alert("이름을 입력하세요.");
		obj.mbNM.focus();
		return false;
	}

	if(!obj.mbPW.value){
		alert("비밀번호를 입력하세요.");
		obj.mbPW.focus();
		return false;
	}
	
	if(obj.mbPW.value.length < 4){
		alert("비밀번호는 4자리 이상 입력하세요.");
		obj.mbPW.focus();
		return false;
	}
	
	if(obj.mbPW.value != obj.mbPWchk.value){
		alert("비밀번호와 비밀번호확인이 다릅니다.");
		obj.mbPWCK.focus();
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
	
	var chkID = "";
	
	$.ajax({
        url: "id_check.do",
        type: "POST",
        data: {
        	"mbID" : obj.mbID.value
        },
        async:false,
        success: function(data){
			chkID = data;
        },
        error: function(){
            
        }
    });
	
	if(chkID == "FIND"){
		alert("중복된 아이디 입니다.");
		obj.mbID.focus();
		return;
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
	
	
});

</script>

<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>회원가입</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item active">회원가입</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="about-box-main">
    <div class="container">
        <div class="row">
        	<div class="col-lg">
	        	<form class="needs-validation" name="confirm_form" id="confirm_form" method="post" action="/member/reg.do" onsubmit="Confirm(); return false;">
	        		<div class="checkout-address joinIp">
	                    <div class="row">
	                        <div class="col-md-6 mb-3">
	                            <label for="mbID">아이디 *</label>
	                            <input type="text" class="form-control idCheck" id="mbID" name="mbID" placeholder="" value="" required>
	                        </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="mbNM">이름 *</label>
	                            <input type="text" class="form-control" id="mbNM" name="mbNM" placeholder="" value="" required>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-md-6 mb-3">
	                            <label for="mbPW">비밀번호 *</label>
	                            <input type="password" class="form-control" id="mbPW" name="mbPW" placeholder="" value="" required>
	                        </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="mbPWchk">비밀번호 확인 *</label>
	                            <input type="password" class="form-control" id="mbPWchk" placeholder="" value="" required>
	                        </div>
	                    </div>
	                    <div class="mb-3">
	                        <label for="mbEmail">이메일 *</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="mbEmail" name="mbEmail" placeholder="" required>
	                        </div>
	                    </div>
	                    <div class="mb-3">
	                        <label for="mbPhone">전화번호 *</label>
	                        <input type="email" class="form-control phoneNumber" id="mbPhone" name="mbPhone" placeholder="">
	                    </div>
	                    <div class="mb-3">
	                        <label for="mbAddress">주소</label>
	                        <input type="text" class="form-control" id="mbAddress" name="mbAddress" placeholder="" required>
	                    </div>
	                    <div class="row">
	                        <div class="col-md-8 mb-3">
	                            <label for="mbAddress2">상세주소</label>
	                        	<input type="text" class="form-control" id="mbAddress2" name="mbAddress2" placeholder="" required>
	                        </div>
	                        <div class="col-md-4 mb-3">
	                            <label for="mbPost">우편번호</label>
	                            <input type="text" class="form-control" id="mbPost" name="mbPost" placeholder="" required>
	                        </div>
	                    </div>
	                        
	                    <div class="confirmArea">
	                        <button type="button"  id="confirm_btn" class="confirmBtn regItem">가입</button>
	                    </div>
	                </div>
	           </form>
	       </div>
        </div>
    </div>
</div>



