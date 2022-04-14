<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script type="text/javascript">

function login(){
	var obj=document.login_form;	
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

	if(!obj.mbPW.value){
		alert("비밀번호를 입력하세요.");
		obj.mbPW.focus();
		return false;
	}

	obj.submit();			
}

$(document).ready(function(){
	
	$("#login_btn").click(function(){
		
		$(this).submit();
		
	});
	
	$("#mbID, #mbPW").keyup(function(key){
		if(key.keyCode==13) {
			$("#login_btn").trigger("click");
		}
	});
	
});

</script>


<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>로그인</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item active">로그인</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="about-box-main">
    <div class="container">
        <div class="row">
        	<div class="col-lg">
        	<form name="login_form" id="login_form" method="post" action="/Login_OK.do" onsubmit="login(); return false;">
        		<div class="checkout-address joinIp login">
                    <div class="mb-3">
                        <label for="mbID">아이디</label>
                        <div class="input-group">
                            <input type="text" class="form-control idCheck" id="mbID" name="mbID" placeholder="" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="mbPW">비밀번호</label>
                        <input type="password" class="form-control" id="mbPW" name="mbPW" placeholder="">
                    </div>
                        
                    <div class="confirmArea">
	                    <button type="button"  id="login_btn" class="loginBtn regItem">로그인</button>
	                </div>
	                <div class="loginOption">
	                    <ul>
	                        <li><a href="javascript:return false;">아이디찾기</a></li>
	                        <li><a href="javascript:return false;">비밀번호찾기</a></li>
	                        <li><a href="/member/confirm.do">회원가입</a></li>
	                    </ul>
	                </div>
                  </div>
	           </form>
	       </div>
        </div>
    </div>
</div>

