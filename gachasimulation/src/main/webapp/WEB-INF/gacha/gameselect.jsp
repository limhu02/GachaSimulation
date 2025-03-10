<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가챠 선택</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .title {
            font-size: 2rem;
            font-weight: bold;
            flex-grow: 1;
        }

        .info-button {
            padding: 10px 20px;
            background-color: blue;
            color: white;
            border: none;
            cursor: pointer;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .box {
            border: 2px solid black;
            padding: 20px;
            text-align: center;
        }

        .buttons {
            margin-top: 10px;
        }

        .draw-button {
            padding: 5px 10px;
            margin: 5px;
            border: none;
            background-color: orange;
            cursor: pointer;
        }

        /* 마지막 두 개를 한 줄에 배치 */
        .bottom-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .bottom-box {
            width: 200px;
            border: 2px solid black;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
	
    <div class="header">
        <div class="title">${game }</div>
        <a href="/item/itemList.html"><button class="info-button">아이템 정보 확인하기</button></a>
    </div>
  

    <div class="container">
      <c:forEach var="gameBox" items="${boxList }">
    	 <div class="box" >
            <p>${gameBox.name} 뽑기<br>(가격: ${gameBox.price}원)</p>
            <div class="buttons">
               <a href="/gacha/gacha1.html?code=${gameBox.code }">  <button class="draw-button">1회 뽑기</button></a>
               <a href="/gacha/gacha10.html?code=${gameBox.code }"> <button class="draw-button">10회 뽑기</button> </a>
            </div>
        </div>
    	</c:forEach>
       

   
    </div>

   
</body>
</html>
