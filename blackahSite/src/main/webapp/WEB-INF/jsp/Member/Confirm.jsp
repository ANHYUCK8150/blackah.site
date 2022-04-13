<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

function Confirm(){
	var obj=document.confirm_form;	
	if(!obj.mbID.value){
		alert("아이디를 입력하세요.");
		obj.mbID.focus();
		return false;
	}

	if(obj.mbID.value.length<4){
		alert("아이디는 4자 이상입니다.");
		obj.mbID.focus();
		return false;
	}
	

	if(!obj.mbPW.value){
		alert("비밀번호를 입력하세요.");
		obj.mbPW.focus();
		return false;
	}
	
	if(obj.mbPW.value != obj.mbPWCK.value){
		alert("비밀번호와 비밀번호확인이 다릅니다.");
		obj.mbPWCK.focus();
		return false;
	}
	
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
	
	var chkID = "";
	
	$.ajax({
        url: "id_check.do",
        type: "POST",
        data: {
        	"mbID" : obj.mbID.value
        },
        async:false,
        success: function(data){
			console.log(data);
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
			console.log(data);
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

	obj.submit();			
}

$(document).ready(function(){
	
	$("#confirm_btn").click(function(){
		$(this).submit();
	});
	
	$("#mbID").keyup(function(){
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
	});
	
	$("#mbPhone").keyup(function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
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
        	<div class="col-xl-12 col-lg-12 col-sm-12 col-xs-12">
        	<form name="confirm_form" id="confirm_form" method="post" action="/member/reg.do" onsubmit="Confirm(); return false;">
	            <section class="join">
	                <div class="joinIp confirm">
	                    <dl>
	                        <dt>아이디</dt>
	                        <dd><label for="mbID"></label><input type="text" class="input_style valid" title="아이디를 입력하세요." value="" type="text" id="mbID" name="mbID" ></dd>
	                    </dl>
	                    <dl class="nextDl">
	                        <dt>비밀번호</dt>
	                        <dd><label for="mbPW"></label><input type="password" class="input_style" maxlength="25" title="비밀번호를 입력하세요." id="mbPW" name="mbPW" ></dd>
	                    </dl>
						<dl class="nextDl">
	                        <dt>비밀번호 확인</dt>
	                        <dd><label for="mbPWCK"></label><input type="password" class="input_style" maxlength="25" title="비밀번호를 입력하세요." id="mbPWCK" name="mbPWCK" ></dd>
	                    </dl>
	                    <dl class="nextDl">
	                        <dt>이름</dt>
	                        <dd><label for="mbNM"></label><input type="text" class="input_style" title="이름을 입력하세요." id="mbNM" name="mbNM" ></dd>
	                    </dl>
	                    <dl class="nextDl">
	                        <dt>전화번호</dt>
	                        <dd><label for="mbPhone"></label><input type="text" class="input_style" title="전화번호를 입력하세요." id="mbPhone" name="mbPhone" ></dd>
	                    </dl>
	                    <dl class="nextDl">
	                        <dt>이메일</dt>
	                        <dd><label for="mbEmail"></label><input type="text" class="input_style" title="이메일을 입력하세요." id="mbEmail" name="mbEmail" ></dd>
	                    </dl>
	                    <div class="confirmArea">
	                        <button type="button"  id="confirm_btn" class="confirmBtn regItem">등록</button>
	                    </div>
	                </div>
	            </section>
	           </form>
	       </div>
        </div>
    </div>
</div>



