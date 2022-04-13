<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
	#gnbTable td:nth-child(3) { font-weight:bold; }
	#gnbTable td:nth-child(8) { color:red; }
	#gnbTable td:nth-child(9) { color:blue; }
	#gnbTable td:nth-child(10) { color:green; }
	#gnbTable td:nth-child(7),#gnbTable td:nth-child(8),#gnbTable td:nth-child(9),#gnbTable td:nth-child(10) { text-align:right; padding-right: 5px;}
	#gnbTable td:nth-child(11),#gnbTable td:nth-child(12) { text-align:left; padding-left:5px;}
	
	.listDetailType01 table, .noticeTableWrap table, .noticeDetailTableWrap table {width:100%; margin:14px 0;}
	.listDetailType01 th {height:52px; background:#f9f9f9; text-align:center;  font-size:15px; border-top:1px solid #666;} /* 20190604 수정 */
	.listDetailType01 td {height:60px; font-size:15px; padding:0px 0; background:#fff; text-align:center; border-top:1px solid #e9e9e9; font-weight:350; color:#666;} /* 20190529 수정 */
	.listDetailType01 td a {display:block; font-size:15px;} /* 20190603 수정 */
	.listDetailType01 td a:hover {text-decoration:underline; color:#377ded;}
	.listDetailType01 tr:last-child td {border-bottom:1px solid #d5d5d5;}
	.listDetailType01 td.none {height:438px; font-size:14px; border-top:1px solid #666;}
	
	.conditionOption {margin-top:40px;}
	.conditionOption:after {display:block; content:""; clear:both;}
	.conditionOption .searchTotal {float:left; width:426px;}
	
	.totalArea {float:left; height:40px; margin-right:180px; color:#999; vertical-align:top;}
	.totalArea > span, .totalArea > strong {display:inline-block; margin-top:26px;}
	.totalArea .tot {color:#666; font-weight:350; font-size:14px;}
	.totalArea .num {margin-left:5px; color:#444; font-weight:500; font-size:14px;}
	.totalArea .pageNum {margin-left:10px; padding-left:10px; font-weight:350; font-size:14px; color:#666;}
	.totalArea .totNum {margin-left:3px; color:#999; font-weight:500; font-size:14px;}
	.totalArea .slash {color:#999; font-size:14px; margin-left:3px;}
	
	.conditionOption .selectOption .searchSelect {width:117px; height:40px; padding:0px 0 0 9px; border-radius:0; font-weight:300; color:#666; font-size:14px;}
</style>

<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>API활용</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i></a></li>
                    <li class="breadcrumb-item active">경락가격정보서비스</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="about-box-main">
    <div class="container">
        <div class="row">
        	<div class="col-xl-12 col-lg-12 col-sm-12 col-xs-12">
        		<div class="searchDetailBtnArea" style="margin-top:0px; !important">
					<div class="searchTotal" style="float:left">
						<span><input type="text" class="calendar ipText" id="dates" value="" style="width:85px;"></span>
						<span style="color:#999; height:32px; line-height:50px;">※날짜는 필수 선택입니다.</span>
					</div>
					<div style="float:right;">
						<button class="btnInit" id="btnClear"><span>초기화</span></button>
						<button class="btnApply" id="btnSearch"><span>검색</span></button>
					</div>
				</div>
				<div class="category_wrap" >
					<div class="category_all_box mt30" style ="padding-top:20px;">
						<div class="gory_box w150px">
							<h2>품류</h2>
							<div>
								<ul id="FruitCate0">
									<c:forEach items="${fruitList }" var="fruitList">
										<li class = "listItem" ><a data-cate = '${fruitList.hmcIdx }'><p>${fruitList.hmcNM }</p><span></span></a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="gory_box w220px" id="lgPartContainer">
							<h2>품목</h2>
							<div>
								<ul id="FruitCate1"></ul>
							</div>
						</div>
						<div class="gory_box w220px" id="msPartContainer">
							<h2>품종</h2>
							<div>
								<ul id="FruitCate2"></ul>
							</div>
						</div>
						
						<div class="gory_box w260px" id="MarketPartContainer" style="margin-left:5%">
							<h2>도매시장</h2>
							<div>
								<ul id="Market">
									<c:forEach items="${marketList }" var="marketList">
										<li class = "listItem" ><a data-cate = '${marketList.hmcIdx }'><p>${marketList.hmcNM }</p><span></span></a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="gory_box w260px" id="CompanyPartContainer">
							<h2>도매법인</h2>
							<div>
								<ul id="Company"></ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="searchConditionArea floatBox" style="margin-top:10px; !important">
					<!-- start detail condition -->
					<div id="GridList" style="float: none !important;">
						<div class="searchDetail" style="margin-top:20px;">
							<div class="detailChartBox">
								<a>등급별 규격 대비 가격 그래프 보기<span class="openIcon"></span></a>
							</div>
							<div class="detailChart" id="detailChart" style = "width:100%; height:400px;">
								
								
							</div>
							<!-- start condition option -->
							<div class="conditionOption" style="margin-top:20px;">
								<div class="totalArea">
									<span class="tot">총 <span class="num" id="totNo">1</span></span> 
									<span class="pageNum">페이지 번호 <span><strong class="num" id="pageNo">1</strong>
									<span class="slash">/<span class="totNum" id="totNum">1</span></span></span></span>
								</div>
								<div class="searchTotal" style="float:right;">
									<div class="selectOption" style="float:right;">
										<select class="searchSelect devSearchSelect" id="pageCount">
											<option value="10" selected="">10개씩 보기</option>
											<option value="20">20개씩 보기</option>
											<option value="30">30개씩 보기</option>
											<option value="40">40개씩 보기</option>
										</select>
									</div>
								</div>
							</div>
							<!-- end condition option -->
							<!-- start list 1 -->
							<div class="listDetailType01">
								<table id="gnbTable" style="border-collapse: collapse; border:1px solid #ccc;">
									<colgroup>
										<col style="width: 4%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 8%">
										<col style="width: 6%">
										<col style="width: 13%">
										<col style="width: 6%">
										<col style="width: 7%">
										<col style="width: 7%">
										<col style="width: 7%">
										<col style="width: 13%">
										<col style="width: 13%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>날짜</th>
											<th>품목</th>
											<th>품종</th>
											<th>등급</th>
											<th>규격</th>
											<th>거래량</th>
											<th>최고가</th>
											<th>최저가</th>
											<th>평균가</th>
											<th>도매시장</th>
											<th>도매법인</th>
										</tr>
									</thead>
									<tbody>
										<tr >
											<td colspan = "12" style="height:100px">
												데이터가 없습니다.
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- end list 1 -->				
							<!-- start paging -->
							
							<div class="paging_wrap" style="margin-bottom:60px;">								
								<div id="pagination" class="paging">
									<a href = 'javascript:return false;' class="goFirst" alt="처음으로" onclick='eventController.getAPIData("1");'></a> <!-- javascript:return false; -->
									<a href="javascript:return false;" class="goPrev" title="이전페이지" onclick='eventController.getAPIData("1");'></a>
									<a class="pageNum on"><span>1</span></a>
									<a class="goNext" title="다음페이지" href="javascript:return false;" onclick='eventController.getAPIData("1");'></a>
									<a class="goLast" title="끝으로" href="javascript:return false;" onclick='eventController.getAPIData("1");'></a>
								</div>
							</div>
							<!-- end paging -->
						</div>
					</div>
				</div>
        	</div>
        </div>
    </div>
</div>


<div id="ExcelUpload" class="modal fade" style="margin-top:20px; z-index:1000">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<button type="button" class="close" data-dismiss="modal">x</button>
				<h5 class="modal-title">공통코드 넣기</h5>
			</div>

			<div class="modal-body">
				<div class="form-group putinForm">
					<div class="row">
						<div id="Spreadsheet"></div>
						<div class="linear" style="margin:10px 0;"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="button" class="btn bg-teal" id="BtnExcelUpload">
					입력 실행
				</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});

	var eventController = {
		spreadsheetSource : function(){
			var _dataField = dataController.gridInExcelColumns;
			var dataField = new Array();
		
			for(var k = 0 ; k < _dataField.length ; k++)
			{
				dataField.push({
					"name":_dataField[k]["datafield"] ,
					"type":_dataField[k]["type"] 
				});
			}
			
			var source =
			{
				unboundmode: true,
				totalrecords: 100,
				datafields: dataField,
			};
			var dataAdapter = new $.jqx.dataAdapter(source);
			$("#Spreadsheet").jqxGrid(
			{
				source : dataAdapter,
				width: '100%', 
				height: 475,
				editable: true,
				columnsresize: true,
				altrows: true,
				selectionmode: 'multiplecellsadvanced'	,
				columns: dataController.gridInExcelColumns
			});
		},
		excelUpload : function()
		{
			var rowAllData = $("#Spreadsheet").jqxGrid("getrows");
			var TrimData = new Array(); 

			for(var i = 0 ; i  < rowAllData.length ; i++)
			{
				if(rowAllData[i].hmcIdx != "")
					TrimData.push(rowAllData[i]);
			}

			if(TrimData.length==0)
			{
				alert("데이터가 없습니다.");
				return false;
			}
			
			var i=0;
			for(var k = 0 ; k  < TrimData.length ; k++)
			{
				var rowdata = TrimData[k];

				$.ajax({
					url : "CodeImport.do",
					type : "POST",
					dataType : "JSON",
					data : {
						"hmcIdx":rowdata.hmcIdx
						, "hmcParent":rowdata.hmcParent
						, "hmcNM":rowdata.hmcNM
					},
					async: true,
					success : function (data)
					{
						$("#Spreadsheet").jqxGrid("setcellvalue" , i , "returnMsg" ,  data);
						i++;
					},//success
					error: function(flag)
					{
					}
				});//ajax

			}

		},
		getAPIData : function(page){
			var dates = $("#dates").val();
			
			if(dates == ""){
				alert("날짜를 선택해주세요!");
				return;
			}
			
			$.ajax({
				dataType : "json",
				type : "POST",
				url : "GetFruitAPI.do",
				data : {
					"dates" : dates,
					"lcode" : dataController.lcode,
					"mcode" : dataController.mcode,
					"scode" : dataController.scode,
					"marketco" : dataController.marketco,
					"cocode" : dataController.cocode,
					"pageNo" : page,
					"numOfRows" : $("#pageCount").val()
				},
				async: false,
				success : function (data)
				{	
					var items = data.response.body.items.item;
					var trData = "";
					$("#gnbTable tbody > tr").remove();
					if(items == undefined){
						$("#gnbTable tbody").append("<tr style=\"height:100px;\"><td colspan=\"12\"> 데이터가 없습니다. </td></tr>");
					}else{
						if(items.length == undefined){
							trData += "<tr>";
							trData += "<td>"+items.rnum+"</td>";
							trData += "<td>"+items.dates+"</td><td>" + items.mclassname + "</td>";
							trData += "<td>"+items.sclassname+"</td><td>" + items.gradename + "</td>";
							trData += "<td>"+items.unitname+"</td><td>" + items.sumamt.toLocaleString("en") + "</td>";
							trData += "<td>"+items.maxprice.toLocaleString("en")+"</td><td>" + items.minprice.toLocaleString("en") + "</td>";
							trData += "<td>"+items.avgprice.toLocaleString("en")+"</td><td>" + items.marketname + "</td>";
							trData += "<td>"+items.coname+"</td>";
							trData += "</tr>";
						}else{
							for(var i=0;i<items.length;i++){
								trData += "<tr>";
								trData += "<td>"+items[i].rnum+"</td>";
								trData += "<td>"+items[i].dates+"</td><td>" + items[i].mclassname + "</td>";
								trData += "<td>"+items[i].sclassname+"</td><td>" + items[i].gradename + "</td>";
								trData += "<td>"+items[i].unitname+"</td><td>" + items[i].sumamt.toLocaleString("en") + "</td>";
								trData += "<td>"+items[i].maxprice.toLocaleString("en")+"</td><td>" + items[i].minprice.toLocaleString("en") + "</td>";
								trData += "<td>"+items[i].avgprice.toLocaleString("en")+"</td><td>" + items[i].marketname + "</td>";
								trData += "<td>"+items[i].coname+"</td>";
								trData += "</tr>";
							}
						}

						$("#gnbTable tbody").append(trData);
						
					}
					
					eventController.GetPaging(data.response.body);
					
				}
			});	
		},
		GetPaging : function(items){			
			var totNo = items.totalCount;
			var pageNo = items.pageNo;
			var totNum = Math.ceil(items.totalCount/items.numOfRows);
			var endPage = (Math.ceil(pageNo / 10)) * 10;
			if (totNum < endPage) {
				endPage = totNum;
			}
			var startPage = endPage - 10 + 1;
			if (startPage < 1) {
				startPage = 1;
			}
			
			var tmpHtml = "";

			tmpHtml += "<a href = 'javascript:return false;' class='goFirst' alt='처음으로' onclick='eventController.getAPIData(" + 1 + ");'></a>";
			if(startPage != "1"){
				tmpHtml += "<a href='javascript:return false;' class='goPrev' title='이전페이지' onclick='eventController.getAPIData("+ (startPage-1) +")'></a>";
			}else{
				tmpHtml += "<a href='javascript:return false;' class='goPrev' title='이전페이지' onclick='eventController.getAPIData("+ startPage +")'></a>";
			}
			
			if(endPage == "0"){
				tmpHtml += "<a class='pageNum on'><span>" + 1 + "</span></a>";
			}else{
				for(var i=startPage; i<=endPage;i++){
					if(i == pageNo){
						tmpHtml += "<a class='pageNum on'><span>" + i + "</span></a>";
					}else{
						tmpHtml += "<a class='pageNum' href='javascript:return false;' onclick='eventController.getAPIData(" + i + ")'><span>" + i + "</span></a>";
					}
				}
			}
			
			
			if(totNum != endPage){
				tmpHtml += "<a class='goNext' title='다음페이지' href='javascript:return false;' onclick='eventController.getAPIData(" + (endPage+1) + ")'></a>";
			}else{
				tmpHtml += "<a class='goNext' title='다음페이지' href='javascript:return false;' onclick='eventController.getAPIData(" + endPage + ")'></a>";
			}
			
			tmpHtml += "<a class='goLast' title='끝으로' href='javascript:return false;' onclick='eventController.getAPIData(" + totNum + ")'></a>";
			
			$("#pagination").empty();
			$("#pagination").append(tmpHtml);

			$("#totNo").text(totNo)
			$("#pageNo").text(pageNo)
			$("#totNum").text(totNum)
			
			dataController.pageNo = pageNo;
		},
		getChart : function(){
			var dates = $("#dates").val();
			
			var one_depth = new Array();
			var chartData = new Array();
			
			$.ajax({
				dataType : "json",
				type : "POST",
				url : "GetFruitAPI.do",
				data : {
					"dates" : dates,
					"lcode" : dataController.lcode,
					"mcode" : dataController.mcode,
					"scode" : dataController.scode,
					"marketco" : dataController.marketco,
					"cocode" : dataController.cocode,
					"pageNo" : "1",
					"numOfRows" : "99999"
				},
				async: false,
				success : function (data)
				{	
					var items = data.response.body.items.item;
					
					if(items == undefined){
						chartData = new Array(
							["등급","데이터 없음"],
							["데이터없음",0]
						);						
					}else{
						if(items.length == undefined){
							one_depth.push({grade:items.gradename, unit:items.unitname,price:items.avgprice});
						}else{
							for(var i=0;i<items.length;i++){
								if(i==0){
									one_depth.push({grade:items[i].gradename, unit:items[i].unitname,price:items[i].avgprice});
									continue;
								}
								
								var tmpObj = [];
								for(var key in one_depth){
									if(one_depth[key].grade == items[i].gradename && one_depth[key].unit == items[i].unitname){
										tmpObj = one_depth[key];
										break;
									}
								}
								
								if(tmpObj.length == undefined){
									if(tmpObj.price < items[i].avgprice){
										var index2 = one_depth.findIndex(obj => obj.grade == items[i].gradename && obj.unit == items[i].unitname);
										if(index2 > -1){
											one_depth[index2].price = items[i].avgprice;
										}
									}
								}else{
									one_depth.push({grade:items[i].gradename, unit:items[i].unitname,price:items[i].avgprice});
								}
								
							}
						}
						
						var col = ["등급"];
						var grade = new Array();
						for(var i=0;i<one_depth.length;i++){
							col.push(one_depth[i].unit);
							grade.push(one_depth[i].grade);
						}
						
						var set = new Set(col);
	
						var colArr = [...set];
						
						chartData.push(colArr);
						
						var set = new Set(grade);
	
						var gradeArr = [...set];
						
						for(var i=0;i<gradeArr.length;i++){
							var tmpArr = new Array();
							tmpArr.push(gradeArr[i]);
							for(var j=1;j<chartData[0].length;j++){
								tmpArr.push(0);
							}
							chartData.push(tmpArr);
						}
						
						for(var key in one_depth){
							var y = chartData[0].indexOf(one_depth[key].unit);
							var x = 1;
							for(var i=1;i<chartData.length;i++){
								if(chartData[i][0] == one_depth[key].grade){
									break;
								}
								
								x++;
							}
							
							chartData[x][y] = one_depth[key].price;
							console.log(x + "," + y);
						}
					}
					
					console.log(chartData);
					
					
				}
			});			
			
			var data = google.visualization.arrayToDataTable(chartData);

		        var options = {
		          width:'100%',
		          height:"400",
		          vAxis: {title: '평균가'},
		          hAxis: {title: '등급'},
		          seriesType: 'bars',
		        };

		        var chart = new google.visualization.ComboChart(document.getElementById('detailChart'));
		        chart.draw(data, options);
		        //window.addEventListener('resize', eventController.getChart, false);
		}
	}
	
	var dataController = {
		lcode : "",
		mcode : "",
		scode : "",
		marketco : "",
		cocode : "",
		pageNo : "1",
		gridInExcelColumns : [
			{ text: '인덱스',  datafield: 'hmcIdx',align: 'center',cellsalign: 'center' , type:"string" ,width:"20%", },
			{ text: '부모값',  datafield: 'hmcParent',align: 'center',cellsalign: 'center' , type:"string" ,width:"20%", },
			{ text: '이름',  datafield: 'hmcNM',align: 'center',cellsalign: 'center' , type:"string" ,width:"20%"},
			{ text: '결과',  datafield: 'returnMsg',align: 'center',cellsalign: 'center' , type:"string" ,width:"15%"},	
		]
	}
	
	$("#dates").pignoseCalendar({
		lang: 'ko',
		format: 'YYYY-MM-DD',
		disabledDates: [
			moment().format("YYYY-MM-DD") //format 속성과 상관없이 반드시 년-월-일 이어야 한다.
		]
	});
	
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;
	
	$("#dates").val(dateString);

	
	$("#btnExcel").click(function(){
		eventController.spreadsheetSource();
		$("#ExcelUpload").modal();		
	});
	
	$("#BtnExcelUpload").on('click',function(){
		eventController.excelUpload();
	});
	
	$("#btnClear").click(function(){
		dataController.marketco = "";
		dataController.cocode = "";
		dataController.pageNo = "1";
		$("#dates").val(dateString);
		
		$('#Market .listItem a.cat_sub').removeClass('cat_sub');
		$('#Market .listItem a.cat_on').removeClass('cat_on');
		$("#Company").html("");
		$("#FruitCate0 .listItem a").first().trigger("click");
		
		$(".detailChartBox a").removeClass("on");
		$(".detailChart").hide();
	});
	
	$("#btnSearch").click(function(){
		$(".detailChartBox a").removeClass("on");
		$(".detailChart").hide();
		
		eventController.getAPIData("1");
	});
	
	$("#pageCount").on("change",function(){
		eventController.getAPIData("1");
	});

	$(".detailChartBox a").click(function(){
		var hasClass = $(".detailChartBox a").hasClass("on");
		if(hasClass){
			$(this).removeClass("on");
			$(".detailChart").hide();
		}else{
			if(dataController.scode == ""){
				alert("품종을 선택해주세요.");
			}else{
				$(this).addClass("on");
				$(".detailChart").show();
				
				google.charts.setOnLoadCallback(eventController.getChart());
				eventController.getAPIData(dataController.pageNo);
			}
		}
	});
	
	$(".detailChart").hide();
	
	$("#FruitCate0 .listItem a").on("click", function(){
		$('#FruitCate0 .listItem a.cat_sub').removeClass('cat_sub');
		$('#FruitCate0 .listItem a.cat_on').removeClass('cat_on');
		$(this).addClass("cat_sub");
	   var value = $(this).attr("data-cate");
	   
	   dataController.lcode = value;
	   dataController.mcode = "";
	   dataController.scode = "";
	   
	    $("#FruitCate1").html("");
	    $("#FruitCate2").html("");
		$.ajax({
			dataType : "json",
			type : "POST",
			url : "GetCode.do",
			data : {
				"hmcParent" : value
			},
			async: false,
			success : function (data)
			{	
				for(var i = 0; i < data.length; i++){
					$("#FruitCate1").append("<li class = \"listItem\"><a data-cate = '"+data[i].hmcIdx+"'><p>"+data[i].hmcNM+"</p><span></span></a></li>");
				}

			}
		});	
		
	});
	
	$("#FruitCate0 .listItem a").first().trigger("click");

	$(document).on("click" , "#FruitCate1 .listItem a", function(){
		$('#FruitCate0 .listItem a.cat_sub').removeClass('cat_sub').addClass("cat_on");
		$('#FruitCate1 .listItem a.cat_on').removeClass('cat_on');
		$('#FruitCate1 .listItem a.cat_sub').removeClass('cat_sub');
		$(this).addClass("cat_sub");
	   var value = $(this).attr("data-cate");
	   
	   dataController.mcode = value;
	   dataController.scode = "";
	   
	   $("#FruitCate2").html("");
		$.ajax({
			dataType : "json",
			type : "POST",
			url : "GetCode.do",
			data : {
				"hmcParent" : value
			},
			async: false,
			success : function (data)
			{	
				for(var i = 0; i < data.length; i++){
					$("#FruitCate2").append("<li class = \"listItem\"><a data-cate = '"+data[i].hmcIdx+"'><p>"+data[i].hmcNM+"</p><span></span></a></li>");
				}
			}
		});	
		
	});
	
	$(document).on("click" , "#FruitCate2 .listItem a", function(){
		$('#FruitCate1 .listItem a.cat_sub').removeClass('cat_sub').addClass("cat_on");
		$('#FruitCate2 .listItem a.cat_on').removeClass('cat_on');
		$('#FruitCate2 .listItem a.cat_sub').removeClass('cat_sub');
		$(this).addClass("cat_sub");
		
	   	var value = $(this).attr("data-cate");
	   	
	   	dataController.scode = value;

	});
	
	$("#Market .listItem a").on("click", function(){
		$('#Market .listItem a.cat_sub').removeClass('cat_sub');
		$('#Market .listItem a.cat_on').removeClass('cat_on');
		$(this).addClass("cat_sub");
	   var value = $(this).attr("data-cate");
	   
	   dataController.marketco = value;
	   dataController.cocode = "";
	   
	    $("#Company").html("");
		$.ajax({
			dataType : "json",
			type : "POST",
			url : "GetCode.do",
			data : {
				"hmcParent" : value
			},
			async: false,
			success : function (data)
			{	
				for(var i = 0; i < data.length; i++){
					$("#Company").append("<li class = \"listItem\"><a data-cate = '"+data[i].hmcIdx+"'><p>"+data[i].hmcNM+"</p><span></span></a></li>");
				}

			}
		});	
		
	});
	
	$(document).on("click" , "#Company .listItem a", function(){
		$('#Market .listItem a.cat_sub').removeClass('cat_sub').addClass("cat_on");
		$('#Company .listItem a.cat_on').removeClass('cat_on');
		$('#Company .listItem a.cat_sub').removeClass('cat_sub');
		$(this).addClass("cat_sub");
		
	   	var value = $(this).attr("data-cate");
	   	
	   	dataController.cocode = value;

	});	
	
	
</script>


