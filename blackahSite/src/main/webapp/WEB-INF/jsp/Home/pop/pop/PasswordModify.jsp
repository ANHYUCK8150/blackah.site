<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${path}/css/style.css" rel="stylesheet"/>
<link href="${path}/css/responsive.css" rel="stylesheet"/>
<link href="${path}/css/custom.css" rel="stylesheet"/>

<script src="${path}/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

function modify(){
	var obj=document.modify_form;	
	
	if(!obj.mbPW.value){
		alert("비밀번호를 입력하세요.");
		obj.mbPW.focus();
		return false;
	}
	
	if(obj.modifyPW.value.length < 4){
		alert("변경 비밀번호는 4자리 이상 입력하세요.");
		obj.modifyPW.focus();
		return false;
	}
	
	if(obj.modifyPW.value != obj.modifyPWchk.value){
		alert("변경 비밀번호와 변경 비밀번호확인이 다릅니다.");
		obj.modifyPWchk.focus();
		return false;
	}

	obj.submit();			
}

$(document).ready(function(){
	
	$("#modify_btn").click(function(){
		
		$(this).submit();
		
	});
	
});

</script>

<div class="about-box-main">
    <div class="container">
        <div class="row">
        	<div class="col-lg">
        	<form name="modify_form" id="modify_form" method="post" action="/member/modify_pw.do" onsubmit="modify(); return false;">
        		<div class="checkout-address joinIp login">
                    <div class="mb-3">
                        <label for="mbPW">기존 비밀번호</label>
                        <input type="password" class="form-control idCheck" id="mbPW" name="mbPW" placeholder="" required>
                    </div>
                    <div class="mb-3">
                        <label for="modifyPW">변경 비밀번호</label>
                        <input type="password" class="form-control" id="modifyPW" name="modifyPW" placeholder="">
                    </div>
                    <div class="mb-3">
                        <label for="modifyPWchk">변경 비밀번호 확인</label>
                        <input type="password" class="form-control" id="modifyPWchk" name="modifyPWchk" placeholder="">
                    </div>
                        
                    <div class="confirmArea">
	                    <button type="button"  id="modify_btn" class="loginBtn regItem">변경</button>
	                </div>
                  </div>
	           </form>
	       </div>
        </div>
    </div>
</div>