<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.info .tab_wrap {border:1px solid #2d343e;overflow:hidden;margin-bottom:30px;}
.info .tab_wrap li {cursor:pointer; float:left; width:33.33%; text-align:center; line-height:58px; height:58px; font-size:17px; color:#2d343e;}
.info .tab_wrap li.active {font-weight:bold; color:#fff; background:#2d343e;}

</style>

<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>소개하기</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item active">이력서</li>
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
					<li class="tab01 active">인적사항</li>
					<li class="tab02 ">자기소개서</li>
					<li class="tab03 ">경력기술서</li>
				</ul>
			</div>
				<div id="printForm">
					<div class="tab_con01">
						<div style="text-align:center;margin-top:50px;">
			
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 기본정보
							</h4>
							<table class="rq_table" style="margin:20px;">
								<colgroup>
									<col style="width:20%;">
									<col style="width:15%;">
									<col style="width:25%;">
									<col style="width:15%;">
									<col style="width:25%;">
								</colgroup>
									
								<tbody>
									<tr>
										<td rowspan="6">
											<img src="${path}/resources/images/AnHyuck.jpg" width="160" height="240" />
										</td>
										<th rowspan="3">성  명</th>
										<td>안혁</td>
										<th>지원회사</th>
										<td>-</td>
									</tr>
									<tr>
										<td>安革</td>
										<th>지원분야</th>
										<td>웹개발</td>
									</tr>
									<tr>
										<td>AN HYUCK</td>
										<th>희망연봉</th>
										<td>4,200만원</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>1993년 03월 18일</td>
										<th>근무가능시기</th>
										<td>협의</td>
									</tr>
									<tr>
										<th rowspan="2">연락처</th>
										<td>010-7137-8150</td>
										<th>e-mail</th>
										<td>blackah@nate.com</td>
									</tr>
									<tr style="height:42px;">
										<td colspan="3">
											서울시 양천구 신정동 은행정로 13길 21
										</td>
									</tr>
								</tbody>
							</table>
			
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 학력
							</h4>
							<table class="qr_table" style="margin:20px;">
								<colgroup>
									<col style="width:15%;">
									<col style="width:15%;">
									<col style="width:15%;">
									<col style="width:15%;">
									<col style="width:15%;">
									<col style="width:12.5%;">
									<col style="width:12.5%;">
								</colgroup>
									
								<tbody>
									<tr>
										<th style="text-align:center">학교명</th>
										<th style="text-align:center">입학일자</th>
										<th style="text-align:center">졸업일자</th>
										<th style="text-align:center">학과/전공</th>
										<th style="text-align:center">졸업여부</th>
										<th style="text-align:center">소재지</th>
										<th style="text-align:center">학점</th>
									</tr>
									<tr style="height:42px;">
										<td style="text-align:center">상지대학교</td>
										<td style="text-align:center">2012-03-02</td>
										<td style="text-align:center">2019-02-15</td>
										<td style="text-align:center">컴퓨터공학과</td>
										<td style="text-align:center">졸업</td>
										<td style="text-align:center">원주시</td>
										<td style="text-align:center">3.4/4.5</td>
									</tr>
									<tr style="height:42px;">
										<td style="text-align:center">성수고등학교</td>
										<td style="text-align:center">2009-03-02</td>
										<td style="text-align:center">2012-02-15</td>
										<td style="text-align:center">이과</td>
										<td style="text-align:center">졸업</td>
										<td style="text-align:center">춘천시</td>
										<td style="text-align:center">-</td>
									</tr>
								</tbody>
							</table>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 경력
							</h4>
							<table class="qr_table" style="margin:20px;">
								<colgroup>
									<col style="width:20%;">
									<col style="width:25%;">
									<col style="width:10%;">
									<col style="width:15%;">
									<col style="width:15%;">
									<col style="width:15%;">
								</colgroup>
									
								<tbody>
									<tr>
										<th style="text-align:center">근무회사</th>
										<th style="text-align:center">근무기간</th>
										<th style="text-align:center">최종직급</th>
										<th style="text-align:center">담당업무</th>
										<th style="text-align:center">최종연봉</th>
										<th style="text-align:center">퇴직사유</th>
									</tr>
									<tr style="height:42px;">
										<td style="text-align:center">디엔비소프트</td>
										<td style="text-align:center">2020-04-13 ~ 2021-09-30</td>
										<td style="text-align:center">선임연구원</td>
										<td style="text-align:center">ERP 개발 및 운영</td>
										<td style="text-align:center">3,600만원</td>
										<td style="text-align:center">경영불안</td>
									</tr>
									<tr style="height:42px;">
										<td style="text-align:center">자이언트솔루션</td>
										<td style="text-align:center">2019-10-08 ~ 2020-03-20</td>
										<td style="text-align:center">사원</td>
										<td style="text-align:center">SI 프로젝트</td>
										<td style="text-align:center">2,600만원</td>
										<td style="text-align:center">경영악화</td>
									</tr>
								</tbody>
							</table>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 자격증
							</h4>
							<table class="qr_table" style="margin:20px;">
								<colgroup>
									<col style="width:25%;">
									<col style="width:25%;">
									<col style="width:25%;">
									<col style="width:25%;">
								</colgroup>
									
								<tbody>
									<tr>
										<th style="text-align:center">자격증</th>
										<th style="text-align:center">취득일</th>
										<th style="text-align:center">자격번호</th>
										<th style="text-align:center">발행기관</th>
									</tr>
									<tr  style="height:42px;">
										<td style="text-align:center">SQL개발자</td>
										<td style="text-align:center">2019-09-24</td>
										<td style="text-align:center">SQLD-0342125</td>
										<td style="text-align:center">한국데이터산업진흥원</td>
									</tr>
									<tr  style="height:42px;">
										<td style="text-align:center">컴퓨터활용능력 1급</td>
										<td style="text-align:center">2018-08-31</td>
										<td style="text-align:center">18-K9-055440</td>
										<td style="text-align:center">대한상공회의소</td>
									</tr>
									<tr  style="height:42px;">
										<td style="text-align:center">정보처리기사</td>
										<td style="text-align:center">2018-05-25</td>
										<td style="text-align:center">18201110303F</td>
										<td style="text-align:center">한국산업인력공단</td>
									</tr>
								</tbody>
							</table>
							
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 대외활동
							</h4>
							<table class="qr_table" style="margin:20px;">
								<colgroup>
									<col style="width:15%;">
									<col style="width:20%;">
									<col style="width:20%;">
									<col style="width:45%;">
								</colgroup>
									
								<tbody>
									<tr>
										<th style="text-align:center">활동구분</th>
										<th style="text-align:center">기관/장소</th>
										<th style="text-align:center">활동기간</th>
										<th style="text-align:center">활동내용</th>
									</tr>
									<tr  style="height:42px;">
										<td style="text-align:center">교육이수</td>
										<td style="text-align:center">한국전자통신연구원</td>
										<td style="text-align:center">2019-04 ~ 2019-09</td>
										<td>데이터 기반 양성 과정으로 주로 ORACLE DB QUERY를 배움</td>
									</tr>
									<tr  style="height:42px;">
										<td style="text-align:center">아르바이트</td>
										<td style="text-align:center">아성다이소</td>
										<td style="text-align:center">2017-08 ~ 2018-05</td>
										<td>캐셔업무 및 진열, 출장업무</td>
									</tr>
									<tr  style="height:42px;">
										<td style="text-align:center">사회활동</td>
										<td style="text-align:center">춘천마임축제</td>
										<td style="text-align:center">2016-10 ~ 2016-10</td>
										<td>홍보마케팅 부서로 홍보 및 행사기간 스태프 활동</td>
									</tr>
								</tbody>
							</table>
						</div>
						
					</div>
			
					
					<div class="tab_con02" style="display:none;">
						<div style="text-align:center;margin-top:50px;">
			
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								 “올챙이가 자라나 개구리로 성장하다.”
							</h4>
			
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								  &nbsp;&nbsp;컴퓨터공학을 전공하면서 프로그래밍언어, 자료구조, 알고리즘, 운영체제, 소프트웨어 공학, 데이터베이스 등, 그리고 정보처리기사를 공부하면서 기본 지식을 쌓아왔습니다. 그리고 실무에 들어가기 전 실무에 적합한 스킬과 경험이 필요하다고 판단하여 한국전자통신연구원에서 실시하는 데이터 기반 양성 과정을 수료하였습니다.<br/>
								  &nbsp;&nbsp;첫 회사에서는 JSP, Spring, Mybatis를 추가로 학습하는 시간을 주었고 그 시간을 통해 기본적인 개발 업무 능력을 키워내 갔습니다. 이후 투입된 프로젝트에서는 사용해보지 않았던 C#과 MSSQL을 사용하여 개발에 대한 업무를 이해하며 사용할 시간이 부족했고 추가로 업무 시간 외에 퇴근 후에도 소스를 파악하며 업무를 진행했습니다. 참, 귀중했던 시간이 되었습니다. JAVA만 다룰 줄 알았던 저는 이제 C#도 다룰 수 있게 되었습니다.<br/>
								  &nbsp;&nbsp;두 번째 회사에서는 PHP와 C#을 주로 사용하였고 JSP, Spring, Mybatis를 부가적으로 사용하였습니다. 앞서 키운 개발 역량 덕분에 업무 프로세스를 금방 파악하여 실무에 투입되었습니다. 적은 인원과 초급개발자로 구성된 팀원들과 같이 구르고 밤을 지새우며 첫 프로젝트를 성공적으로 마치는 결과물을 만들어내었습니다. 그 결과물은 팀이라는 애틋함과 솔루션을 업체에 적용하는 과정에서 느낀 뿌듯함 그리고 성취감을 제게 선사했으며 사소한 코드 에러가 현장에서 치명적으로 작용하는 것을 직접 보며 개발에 대한 책임감 또한 느끼게 되었습니다.<br/>
			
								  &nbsp;&nbsp;훗날 입사하게 될 회사에서는 업무 프로세스를 이른 시간에 습득하고 기업과 같이 성장하여 더 단단한 개발자로 일하고 싶습니다.
							</p>
			
							<div style="border-bottom:1px solid #ccc;margin:50px 0;"> </div>
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								“새로움, 도전정신, 원동력”
							</h4>
			
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								  &nbsp;&nbsp;저는 또래 친구들보다 늦게 컴퓨터를 접했습니다. 늘 집 안에 있는 전자제품들을 손수 고쳐 사용하셨던 아버지께서는 제가 아무리 컴퓨터를 갖고 싶다고 졸라도 절대 사주시지 않았습니다. 시간이 흘러다니던 학교에서 교육을 목적으로 저렴하게 컴퓨터를 제공해주었고, 아버지께서 교육을 목적으로 들여주셨습니다. 뒤늦게 생긴 컴퓨터여서 그런지 세상에서 제일 재밌었습니다. 학교가 끝나면 교육도 받고 친구들과 유행하는 게임도 즐겼습니다. 그러다 이상이 생겨 기사님을 불렀고, 부품을 가져와서 컴퓨터를 분해하고 조립하는 모습을 보며 하드웨어에 관한 관심이 생겼고 호기심에 컴퓨터를 분해해보고 다시 조립해보았습니다. 친구들 컴퓨터도 고쳐주며 중학교 때는 컴퓨터를 혼자서 조립하여 부품도 업그레이드하고 손쉽게 더 나은 성능으로 게임도 할 수 있었습니다. 부품들을 잃어버리거나 잘 못 배치하는 우여곡절도 겪어가며 점차 하드웨어뿐만 아니라 소프트웨어도 공부해보고 싶다는 목적이 생겼습니다.<br/>
			
								  15일간의 유럽 자유여행.<br/>
								  &nbsp;&nbsp;유럽으로 떠나기 전날까지 정보를 찾아보며 걱정 반, 설렘 반으로 떠난 저의 첫 해외여행은 도착 첫날부터 눈물을 쏙 빼게 하였습니다. 신나는 마음으로 도착한 로마 콜로세움 앞에서 외국인과 짧은 대화를 나누는 로망에 취해있던 저에게 스스럼없이 다가와 대화를 건네고 스윽 팔찌를 채워주며 돈을 요구하는 도둑놈을 만났고, 주변을 에워싸며 강매를 요구하는 도둑놈들의 친구들에게 돈을 줄 수밖에 없었던 팔찌 사기를 당하며 걱정은 두려움으로 번져갔습니다. 후다닥 로마에서 떠나고 싶었지만, 이미 일정에 맞게 예약된 기차 때문에 떠날 수가 없었고 예약된 시간은 앞으로도 하루가 남았기에 두려움 때문에 설렘 가득했던 저의 첫 여행을 망치고 싶지 않았습니다. 시간도 남았고, 아직 팔찌밖에 털리지 않았으니 조금 더 여유롭게 생각하자며 자신을 다독이며 로마 관광지도 밖으로 나가 보았습니다. 주변을 둘러보며 걸어간 21Km에서 뜻밖에 만났던 외국인들은 조금 다르게 느껴졌습니다. 먼저 인사해주기도 하고 좋은 명소를 알려주고 사진도 찍어주었습니다. 언제 사기를 당했느냐는 듯 그들이 주는 친절함에 취해 먼저 말도 걸어보고 이야기도 나눠보고 싶은 욕심이 생겼고 이 욕심은 저에게 작은 변화를 일으키고 있었습니다. 두려움으로 당장에라도 떠나고 싶었던 로마에서 앞으로의 도착지들을 기대하게 되는 긍정적인 바람으로 바뀌었습니다. 오히려 사기를 당했을 때 여행을 포기했더라면 저는 훗날이라도 겪게 되었을 두려움들로 전전긍긍하며 여행을 마무리했을 것 같습니다.<br/>
			
								  &nbsp;&nbsp;만약 모두가 도둑놈 같은 외국인이라는 선입견에 사로잡혀 여행을 포기했더라면, 저는 로마의 콜로세움도 에펠탑도 제일 가보고 싶었던 리버풀 구장도 볼 수 없었을 것입니다. 새로운 나라, 새로운 만남에 있어 저의 첫 해외여행은 두려워하지 않고 부딪힐 수 있는 터닝포인트가 되었습니다.
							</p>
			
			
							<div style="border-bottom:1px solid #ccc;margin:50px 0;"> </div>
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								“두 마리 토끼? 다 잡아내는 안 혁”
							</h4>
			
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								&nbsp;&nbsp;첫 회사에서 JAVA, JSP, SPRING을 교육을 동기 4명과 받았습니다. 교육이 마무리 되어 갈 쯤에 투입될 프로젝트의 면접을 보러가게 되었습니다. 투입될 프로젝트는 태권도 승품단 심사시스템을 개발하는 일이였고 개발언어로는 C#을 추가로 사용해야했습니다. 동기들은 처음하는 언어에 대한 부담감에 이 프로젝트를 꺼려했고 저 또한 솔직히 꺼려졌지만 프로젝트를 수행하지 않는다면 다른 프로젝트가 잡히기 전까지 대기해야 했고 대기기간동안 회사는 금전적인 피해를 입을 수 밖에 없었습니다. 그래서 저 혼자 프로젝트에 투입하게 되었습니다. C# 개발에 대한 업무를 이해하며 사용할 시간이 부족했고 추가로 업무 시간 외에 퇴근 후에도 소스를 파악하며 업무를 진행했습니다. 참, 귀중했던 시간이되었습니다. JAVA만 다룰 줄 알았던 저는 이제 C#도 다룰 수 있게 되었습니다.<br/>
							</p>
							<div style="border-bottom:1px solid #ccc;margin:50px 0;"> </div>
			
							<h4 style="font-size:18px; font-weight: 400; margin:50px 0 0px 0; color:#0F4C81;text-align:left;">
								"책임감을 느끼고 업무에 임해야겠다"
							</h4>
			
							<p style="padding: 10px 0; margin:30px auto; line-height:2; font-size:1rem;text-align:left;">
								  &nbsp;&nbsp;ERP 솔루션을 신규 업체에 도입하는 과정에서 당사 업체의 요구에 따라 솔루션의 프로세스가 약간 변경되어야 하는 이슈가 있었습니다. 사소한 프로세스 변경 작업에 대해서는 크게 신경 쓰지 않고 큰 작업에만 신경을 쓰며 작업을 진행하였습니다. 작업을 마치고 업체 적용을 진행하였고 현장에 가서 직접 사용자들이 프로그램을 사용하는 것을 지켜보았습니다. 사용자들이 프로그램을 사용하며 작업을 진행하는데 에러가 발생하여 현장이 멈추는 현상이 일어났습니다. 부리나케 에러의 원인을 파악하고 수정하려고 하는 순간 사소하게 생각하고 넘겼던 프로세스 소스 부분에서 리턴 타입에 대한 예외 처리를 하지 않아 에러가 발생한 것이었습니다. 개발자 입장에서는 사소한 에러라고 생각하고 당장 수정 작업을 진행하고 해결하였는데 이미 사용자들은 단 한 번의 에러로 인해서 프로그램에 대한 불신을 갖기 시작했습니다. 이런 모습을 보니 사소한 작업이라도 책임감을 느끼고 작업을 진행하지 않은 자신이 상당히 부끄럽고 창피했습니다. 이 계기로 그동안 개발에 임하는 자세에 대해 많은 생각을 해보게 되었고 `책임감을 느끼고 업무에 임해야겠다.`라는 결론을 도출해냈습니다.<br/>
								 &nbsp;&nbsp;이후 프로젝트에서는 책임감을 느끼고 업무에 임하였으며 작업에 대한 자세 또한 사소한 작업을 진행할 때도 큰 작업을 진행하듯이 업무에 임했습니다. 그러다 보니 자연스레 에러율이 현저하게 줄었고 큰 문제 없이 프로젝트를 성공적으로 마칠 수 있었습니다.																		
							</p>
							
						</div>
					</div>
			
					<div class="tab_con03" style="display:none;">
						<table class="rq_table">
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
								
							<tbody>
								<tr>
									<th>근무처</th>
									<td>디엔비소프트</td>
									<th>재직인원</th>
									<td>11명</td>
								</tr>
								<tr>
									<th>근무기간</th>
									<td>2020-04-13 ~ 2021-09-30</td>
									<th>근무처 사업업종</th>
									<td>ERP 솔루션</td>
								</tr>
								<tr>
									<th>퇴직사유</th>
									<td colspan="3">신규 사업 매출 하락으로 인한 경영 불안</td>
								</tr>
								<tr>
									<th>주요업무</th>
									<td colspan="3">
										- 축산경영정보시스템 개발 및 운영<br/>
										- 그룹웨어 개발 및 운영<br/>
										- 경리회계 개발 및 운영<br/>
										- 생산관리시스템 개발 및 운영<br/>
										- SI 프로젝트 개발<br/>
										- JAVA, Spring, PHP을 이용한 웹 개발<br/>
										- C# .NET을 이용한 응용프로그램 개발
									</td>
								</tr>
								<tr>
									<th>프로젝트</th>
									<td colspan="3">
										1) 프로젝트명 : 축산경영정보시스템 스마트 팩토리 구축<br/>
											&nbsp;- 연계/소속회사 : 굿푸드 시스템, 축산기업중앙회횡성지부, 우리강산축산물육가공장 / 디엔비소프트<br/>
											&nbsp;- 주요 업무 : 프론트, 백 엔드 개발 및 운영, 유지관리<br/>
											&nbsp;- 담당 역할 : 개발 및 운영, 유지관리<br/>
											&nbsp;- 기술 스택 : PHP, jQuery, JavaScript, jQWdgets, C#, MySQL, MariaDB, Editplus, VisualStudio<br/>
											&nbsp;- 업무 기간 : 2020.04 ~ 2021.09 (약 18개월)<br/>
											&nbsp;- 개발 인원 : 5명<br/>
											&nbsp;- 상세 내용 : <br/>
											    &nbsp;&nbsp;&nbsp;&nbsp;- 축산경영정보 솔루션 개발 및 유지관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 축산 육가공 입고, 투입, 생산, 출고, 재고, 통계 프로세스 작업 및 유지 관리<br/>
												  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 축산 이력제 신고 API 연동 개발 작업<br />
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 공통 모듈 개발 및 프로세스별 클래스화 작업<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 부자재 프로세스 설계 및 개발<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 업체 요구 산출물 개발<br/>
											    &nbsp;&nbsp;&nbsp;&nbsp;- 정육식당 솔루션 솔루션 개발 및 유지관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 정육식당 입고, 투입, 생산, 판매, 재고, 통계 프로세스 작업 및 유지 관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 저울 및 스캐너 시리얼 통신 개발<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- POS 프로그램 기획, 설계, 개발, 유지관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- NICE VAN 결제 모듈 연동<br/>
											    &nbsp;&nbsp;&nbsp;&nbsp;- 그룹웨어 솔루션 솔루션 개발 및 유지관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 기존 WORK 솔루션 그룹웨어 솔루션 이관 작업<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 구글 Mail API 연동 개발<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 업체별 업무요청 API 개발<br/>
											    &nbsp;&nbsp;&nbsp;&nbsp;- 경리회계 솔루션 솔루션 개발 및 유지관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 재무회계, 입출 전표, 통계 프로세스 작업 및 유지관리<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 세금계산서, 거래명세서, 거래명세표 및 통계 산출물 개발<br/>
											    &nbsp;&nbsp;&nbsp;&nbsp;- 생산관리 솔루션 솔루션 개발<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 주문, 발주, 구매, 생산, 판매, 재고, 통계, BOM, BOR 프로세스 개발<br/>
											      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 프로세스별 산출물 개발<br/>
											<br/>
											2) 프로젝트명 : KA-1 CBT 시스템 시뮬레이션 고도화<br/>
											&nbsp;- 연계/소속회사 : 공군 제8전투 비행단  / 디엔비소프트<br/>
											&nbsp;- 주요 업무 : 프론트, 백 엔드<br/>
											&nbsp;- 담당 역할 : 개발 및 유지관리<br/>
											&nbsp;- 기술 스택 : JAVA, JSP, Spring, Mybatis, Oracle, eclipse<br/>
											&nbsp;- 업무 기간 : 2020.05 ~ 2020.06 (약 2개월)<br/>
											&nbsp;- 개발 인원 : 2명<br/>
											&nbsp;- 상세 내용 : <br />
											&nbsp;&nbsp;&nbsp;&nbsp;- 강의검색 개발<br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 강의 그룹별 데이터 조회 페이지 및 기능 개발<br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 계층형 데이터베이스 설계<br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 강의 학습페이지 개발<br />
											&nbsp;&nbsp;&nbsp;&nbsp;- 비행임무계획 유지관리<br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 임무계획 요구사항에 따른 유지관리<br />
											&nbsp;&nbsp;&nbsp;&nbsp;- 사격장브리핑 문서 인쇄 페이지 개발<br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 가이드에 따른 양식 인쇄<br />
		
			
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="rq_table" style="margin-top:10px;">
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
								
							<tbody>
								<tr>
									<th>근무처</th>
									<td>자이언트솔루션</td>
									<th>재직인원</th>
									<td>20명</td>
								</tr>
								<tr>
									<th>근무기간</th>
									<td>2019-10-08 ~ 2020-03-20</td>
									<th>근무처 사업업종</th>
									<td>SI 프로젝트 사업</td>
								</tr>
								<tr>
									<th>퇴직사유</th>
									<td colspan="3">COVID-19로 인한 경영악화로 프리랜서 권고</td>
								</tr>
								<tr>
									<th>주요업무</th>
									<td colspan="3">
										- SI 프로젝트 개발<br/>
									    - Java, Spring을 이용한 웹 개발 및 운영<br/>
									    - C# .NET을 이용한 응용프로그램 개발 및 운영
									</td>
								</tr>
								<tr>
									<th>프로젝트</th>
									<td colspan="3">
										1)프로젝트명 : 국기원 태권도 승품단 심사 전자채점시스템<br/>
										&nbsp;- 연계/소속회사 : 유비스포(태권소프트) / 자이언트 솔루션<br/>
										&nbsp;- 주요 업무 : 프론트, 백 엔드<br/>
										&nbsp;- 담당 역할 : 개발 및 운영, 유지관리<br/>
										&nbsp;- 기술 스택 : JAVA, JSP, Spring, Mybatis, C#, MS-SQL, VisualStudio, eclipse<br/>
										&nbsp;- 업무 기간 : 2019.11 ~ 2020.03(약 5개월)<br/>
										&nbsp;- 개발 인원 : 2명<br/>
										&nbsp;- 상세 내용 : <br/>
										&nbsp;&nbsp;&nbsp;&nbsp;- Spring MVC 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 관리자 페이지<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 관리자 아이디 CRUD 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 합격 데이터 CRUD 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- DB 변경에 대한 로그 테이블 설계<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 결과 페이지<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 결과 조회 페이지 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- EXCEL 다운로드 기능 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 결과 인쇄 기능 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 통계 페이지<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 코트별 심사위원 평가 불합격 통계<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 전체 심사 합격 불합격 통계<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 품/단별 불합격 통계<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 과목별 불합격 통계<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;- C# WINFORM 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사위원 채점 프로그램<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- UI 및 프로세스 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 기록 프로그램과 TCP/IP 통신 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 일정표 프로그램<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 진행 상황에 따른 예상 소요시간 계산 및 일정 조회<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 코트별 진행중인 응심자 조회<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 관리 프로그램<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 응심자 EXCEL IMPORT 프로세스 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 응심자 정보 CRUD 페이지 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사대회 Local DB -> Server DB 업로드 기능 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 일정표 세팅 CRUD 개발<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 조배정 프로그램 유지관리<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 심사 기록 프로그램 유지관리<br/><br/>
										2)프로젝트명 : 자이언트 솔루션 Spring 교육<br/>
										&nbsp;- 소속회사 : 자이언트 솔루션<br/>
										&nbsp;- 주요 업무 : 프론트, 백 엔드<br/>
										&nbsp;- 담당 역할 : 개발<br/>
										&nbsp;- 기술 스택 : JAVA, JSP, Spring, Mybatis,  JavaScript, jQuery, Oracle, Mi-platform<br/>
										&nbsp;- 업무 기간 : 2019.10 ~ 2019.10(약 1개월)<br/>
										&nbsp;- 개발 인원 : 1명<br/>
										&nbsp;- 상세 내용 : Spring MVC 개발, 게시판 CRUD, 페이징 처리, Ajax, 파일 업로드 다운로드, Mi-platform 연동, 회원가입, 로그인, 직급별 결재 프로세스, DB설계<br/>
										
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		$(".tab01").click(function(){
			$(".tab_wrap li").removeClass("active");
			$(this).addClass("active");
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
		});
		$(".tab03").click(function(){
			$(".tab_wrap li").removeClass("active");
			$(this).addClass("active");
			$(".tab_con01").hide();
			$(".tab_con02").hide();
			$(".tab_con03").show();
		});

		$(".tab_con02").hide();
		$(".tab_con01").show();
		
	});
	
</script>