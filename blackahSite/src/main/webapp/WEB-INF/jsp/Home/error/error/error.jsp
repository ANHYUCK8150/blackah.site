<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${path}/images/favicon.ico">
    <title>서비스 오류 안내</title>
    <style type="text/css">
        .blackout {
            width: 578px;
            margin: 12% auto 0;
            padding: 210px 0 90px;
            background: url('/images/icon_error.png') no-repeat center 69px;
            text-align: center;
        }

        .blackout > strong {
            color: #222222;
            font-size: 28px;
        }

        .blackout > strong > em {
            font-style: normal;
            color: #EC1C23;
        }

        * {
            font-family: Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움", sans-serif;
        }

        .blackout p {
            padding: 20px 0 0;
            color: #222222;
            font-size: 13px;
            line-height: 1.5;
            color: #666666;
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            -webkit-text-size-adjust: none;
        }

        .c-point {
            color: #EC1C23;
        }

        .submitbtn .skinbtn {
            width: 130px;
        }

        .skinbtn {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            height: 40px;
            padding: 0 5px;
            text-align: center;
            vertical-align: top;
            box-sizing: border-box;
            cursor: pointer;
            font-size: 14px;

            border: 1px solid #B1B1B1;
            background: #FFFFFF;
            color: #777777;
        }

        .btn-m2 {
            height: 44px;
        }

        .submitbtn {
            margin: 30px 0 0;
        }

        @media (max-width: 768px) {
            .blackout {
                width: auto;
                padding: 190px 0 90px;
                /*background-size: 97px 84px;*/
            }

            .blackout > strong {
                font-size: 20px;
            }

            .blackout p {
                padding: 10px 0 0;
                font-size: 14px;
                line-height: 18px;
                letter-spacing: -0.05em;
            }

            .submitbtn {
                margin: 20px 0 0;
            }
        }
    </style>
   	<script src="${path}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $('#btnGoBack').click(function(e){
                window.history.back();
            });
            $('#btnGoHome').click(function(e){
            	location.href="../home.do";
            });
        });
    </script>
    
</head>
<body>
    <div class="blackout">
        <strong>요청하신 페이지를 <em>찾을 수 없습니다.</em></strong>
        <div class="submitbtn">
            <button type="button" class="skinbtn default btn-m2" id="btnGoBack"><b>뒤로가기</b></button>
            <button type="button" class="skinbtn default btn-m2" id="btnGoHome"><b>홈 바로가기</b></button>
        </div>
    </div>
</body>
</html>