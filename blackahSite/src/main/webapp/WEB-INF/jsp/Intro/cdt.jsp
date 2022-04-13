<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.info .tab_wrap {border:1px solid #2d343e;overflow:hidden;margin-bottom:30px;}
.info .tab_wrap li {cursor:pointer; float:left; width:25%; text-align:center; line-height:58px; height:58px; font-size:17px; color:#2d343e;}
.info .tab_wrap li.active {font-weight:bold; color:#fff; background:#2d343e;}
</style>

	<div class="all-title-box">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <h2>소개하기</h2>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
	                    <li class="breadcrumb-item active">코딩테스트</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="about-box-main">
	    <div class="container">
	        <div class="row">
	        	<div class="col-lg-12">
					<div class="section info">
						<ul class="tab_wrap">
							<li class="tab01 active">기록</li>
							<li class="tab02 ">가장 큰 수</li>
							<li class="tab03 ">전광판</li>
							<li class="tab04 ">소수찾기</li>
						</ul>
					</div>
					
					<div class="tab_con01">
						<div style="text-align:center;margin-top:50px;">
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 해시
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								HashSet은 공통값을 갖을 수 없다. 이를 이용하여 중복을 값을 제거한다. <br/>
								HashMap은 공통의 키 값을 갖을 수 없다. 이를 이용하여 중복 값일 경우 카운트를 추가하는 방식으로 해결 한다. getOrDefault<br/>
							</p>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 스텍/큐
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								Queue 선언은 LinkedList <br/>
								Queue poll -> 첫번째 값 제거하고 반환. remove -> 첫번째 값 제거.<br/>
								Queue add, offer queue에 값 추가.<br/>
								PriorityQueue 우선순위 큐. 2,1,3 순서로 add 후 peek시 1값 반환<br/>
							</p>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 정렬
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								Arrays.copyOfRange(배열,시작인덱스,끝인덱스) : 매개변수의 배열의 시작인덱스 부터 끝 인덱스의 배열값 반환
								
							</p>
							
						</div>
					</div>
					
					<div class="tab_con02">
						<div style="text-align:center;margin-top:50px;">
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 문제설명
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								0 또는 양의 정수가 주어졌을 때, 정수를 이어 붙여 만들 수 있는 가장 큰 수를 알아내 주세요.<br/>
								예를 들어, 주어진 정수가 [6, 10, 2]라면 [6102, 6210, 1062, 1026, 2610, 2106]를 만들 수 있고, 이중 가장 큰 수는 6210입니다.<br/>
								0 또는 양의 정수가 담긴 배열 numbers가 매개변수로 주어질 때, 순서를 재배치하여 만들 수 있는 가장 큰 수를 문자열로 바꾸어 return 하도록 solution 함수를 작성해주세요.<br/>
							</p>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 입출력예
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								<table class="rq_table" style="margin:20px;">
									<colgroup>
										<col style="width:25%;">
										<col style="width:25%;">
										<col style="width:25%;">
										<col style="width:25%;">
									</colgroup>
										
									<tbody>
										<tr>
											<th style="text-align:center">numbers</th>
											<th style="text-align:center">return</th>
											<th style="text-align:center">확인</th>
											<th style="text-align:center">결과</th>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="number_01" value="[6, 10, 2]" readonly /></td>
											<td style="text-align:center">"6210"</td>
											<td style="text-align:center"><input type="button" id="submit_01" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result_01"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="number_02" value="[3, 30, 34, 5, 9]" readonly /></td>
											<td style="text-align:center">"9534330"</td>
											<td style="text-align:center"><input type="button" id="submit_02" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result_02"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="number_03" value="" /></td>
											<td style="text-align:center">값 입력 바람</td>
											<td style="text-align:center"><input type="button" id="submit_03" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result_03"></span></td>
										</tr>
									</tbody>
								</table>
							</p>
							
						</div>
					</div>
					
					<div class="tab_con03">
						<div style="text-align:center;margin-top:50px;">
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 문제설명
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								text = 문자, second = 전광판 시간(초)<br/>
								공백은 '_'로 표시바람.<br/>
								ex)"hellow world!!"라는 문자를 전광판에 표시하려고 한다.<br/>
								만약에 01초가 지났다면 전광판에는 _____________h<br/>
								만약에 06초가 지났다면 전광판에는 ________hellow<br/>
								만약에 14초가 지났다면 전광판에는 hellow_world!!<br/>
								만약에 20초가 지났다면 전광판에는 _world!!______<br/>
							</p>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 입출력예
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								<table class="rq_table" style="margin:20px;">
									<colgroup>
										<col style="width:25%;">
										<col style="width:10%;">
										<col style="width:25%;">
										<col style="width:15%;">
										<col style="width:25%;">
									</colgroup>
										
									<tbody>
										<tr>
											<th style="text-align:center">text</th>
											<th style="text-align:center">second</th>
											<th style="text-align:center">return</th>
											<th style="text-align:center">확인</th>
											<th style="text-align:center">결과</th>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="string_01" value="hellow world!!" readonly /></td>
											<td style="text-align:center"><input type="text" id="second_01" value="1" readonly /></td>
											<td style="text-align:center">"_____________h"</td>
											<td style="text-align:center"><input type="button" id="submit_01" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result2_01"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="string_02" value="hellow world!!" readonly /></td>
											<td style="text-align:center"><input type="text" id="second_02" value="6" readonly /></td>
											<td style="text-align:center">"________hellow"</td>
											<td style="text-align:center"><input type="button" id="submit_02" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result2_02"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="string_03" value="hellow world!!" readonly /></td>
											<td style="text-align:center"><input type="text" id="second_03" value="14" readonly /></td>
											<td style="text-align:center">"hellow_world"</td>
											<td style="text-align:center"><input type="button" id="submit_03" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result2_03"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="string_04" value="hellow world!!" readonly /></td>
											<td style="text-align:center"><input type="text" id="second_04" value="20" readonly /></td>
											<td style="text-align:center">"_world!!______"</td>
											<td style="text-align:center"><input type="button" id="submit_04" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result2_04"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="string_05" value="" /></td>
											<td style="text-align:center"><input type="text" id="second_05" value="" /></td>
											<td style="text-align:center">값 입력바람</td>
											<td style="text-align:center"><input type="button" id="submit_05" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result2_05"></span></td>
										</tr>
									</tbody>
								</table>
							</p>
							
						</div>
					</div>
					
					<div class="tab_con04">
						<div style="text-align:center;margin-top:50px;">
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 문제설명
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.<br/>
								각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.<br/>
							</p>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 입출력예
							</h4>
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								<table class="rq_table" style="margin:20px;">
									<colgroup>
										<col style="width:25%;">
										<col style="width:25%;">
										<col style="width:25%;">
										<col style="width:25%;">
									</colgroup>
										
									<tbody>
										<tr>
											<th style="text-align:center">numbers</th>
											<th style="text-align:center">return</th>
											<th style="text-align:center">확인</th>
											<th style="text-align:center">결과</th>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="number3_01" value="17" readonly /></td>
											<td style="text-align:center">3</td>
											<td style="text-align:center"><input type="button" id="submit_01" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result3_01"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="number3_02" value="011" readonly /></td>
											<td style="text-align:center">2</td>
											<td style="text-align:center"><input type="button" id="submit_02" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result3_02"></span></td>
										</tr>
										<tr  style="height:42px;">
											<td style="text-align:center"><input type="text" id="number3_03" value="" /></td>
											<td style="text-align:center">값 입력 바람</td>
											<td style="text-align:center"><input type="button" id="submit_03" name="submit" value="결과보기" style="cursor: pointer;"/></td>
											<td><span id="result3_03"></span></td>
										</tr>
									</tbody>
								</table>
							</p>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		$(".tab01").click(function(){
			$(".tab_wrap li").removeClass("active");
			$(this).addClass("active");
			$(".tab_con04").hide();
			$(".tab_con03").hide();
			$(".tab_con02").hide();
			$(".tab_con01").show();
		});
		$(".tab02").click(function(){
			$(".tab_wrap li").removeClass("active");
			$(this).addClass("active");
			$(".tab_con01").hide();
			$(".tab_con02").show();
			$(".tab_con03").hide();
			$(".tab_con04").hide();
		});
		$(".tab03").click(function(){
			$(".tab_wrap li").removeClass("active");
			$(this).addClass("active");
			$(".tab_con01").hide();
			$(".tab_con02").hide();
			$(".tab_con03").show();
			$(".tab_con04").hide();
		});
		$(".tab04").click(function(){
			$(".tab_wrap li").removeClass("active");
			$(this).addClass("active");
			$(".tab_con01").hide();
			$(".tab_con02").hide();
			$(".tab_con03").hide();
			$(".tab_con04").show();
		});
		
		$(".tab_con04").hide();
		$(".tab_con03").hide();
		$(".tab_con02").hide();
		$(".tab_con01").show();
		
		$("#number_03").keyup(function(){
			//$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$(".tab_con02 input[name=submit]").click(function(){
			var id = $(this).attr("id").split('_');
			
			var numbers = $("#number_"+id[1]).val().replace("[","").replace("]","");
			
			if(numbers.trim().length == 0){
				alert("값을 입력해주세요, \n구분은 , 로 합니다.");
				return;
			}
			var numberArr = numbers.split(",");
			
			var number = new Array();
			
			for(var i=0;i<numberArr.length;i++){
				number.push(numberArr[i].trim());
			}
			
			var result = "";
			$.ajax({
	            url: "solution.do",
	            type: "POST",
	            data: {
	            	"solutionMode" : "MaxNum"
	            	,"number" : number
	            },
	            success: function(data){
	            	$("#result_" + id[1]).text(data);
	            },
	            error: function(){
	                
	            }
	        });
			
		});
		
		$(".tab_con03 input[name=submit]").click(function(){
			var id = $(this).attr("id").split('_');
			
			var second = $("#second_"+id[1]).val();
			var text = $("#string_"+id[1]).val();
			
			if(second.trim().length == 0 || text.trim().length == 0){
				alert("값을 입력해주세요");
				return;
			}
			
			var result = "";
			$.ajax({
	            url: "solution.do",
	            type: "POST",
	            ascyn:false,
	            data: {
	            	"solutionMode" : "SignForm"
	            	,"second" : second
	            	,"text" : text
	            },
	            success: function(data){
	            	$("#result2_" + id[1]).text(data);
	            },
	            error: function(){
	                
	            }
	        });
		});
		
		$(".tab_con04 input[name=submit]").click(function(){
			var id = $(this).attr("id").split('_');
			
			var numbers = $("#number3_"+id[1]).val();
			
			if(numbers.trim().length == 0){
				alert("값을 입력해주세요");
				return;
			}
			
			var result = "";
			$.ajax({
	            url: "solution.do",
	            type: "POST",
	            data: {
	            	"solutionMode" : "decimal"
	            	,"decimal" : numbers
	            },
	            success: function(data){
	            	$("#result3_" + id[1]).text(data);
	            },
	            error: function(){
	                
	            }
	        });
		});
		

	</script>
</div>