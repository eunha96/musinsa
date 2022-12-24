<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//ajaxSetup():  실행될  AJAX 요청에 대한 기본 속성을 정의해 재사용
		$.ajaxSetup({
			success:function(result){
				alert(result);
			},
			error: function (jqXHR) {
                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
            }
		});//ajaxSetup
		$("#rewardPost").click(function(){
			$.ajax({
				type:"post",
				url:"reward/postUserApi" ,
				success:function(item){

				    alert(item.id+" "+item.title+" "+item.content);
                }
			});//ajax
		});//click
		$("#rewardGet").click(function(){
			$.ajax({
				type:"get",
				url:"reward/rewardData/reward" ,
				success:function(item){
				    $("#rewardList").empty();
				    $("#rewardList").append(
				    '<thead>'+
				        '<tr>' +
				        '<th>아이디</th>'+
				        '<th>제목</th>'+
				        '<th>내용</th>'+
				        '</tr>'+
                    '</thead>'
				        +item.id+"</td><td>"+item.title+"</td><td>"+item.content
				        +"</td></tr><br>"
				    );
                }
			});//ajax
		});//click
		$("#rewardUserListGet").click(function(){
			$.ajax({
				type:"get",
				url:"reward/rewardUserList" ,
				data: {
				    date:$("#date").val() ,
				    orderBy:$("#orderBy").val()
				},
				success:function(itemList){
				    $("#userList").empty();
				    var tr = '<thead>'+
                            	    '<tr>' +
                            	        '<th>번호</th>'+
                                        '<th>아이디</th>'+
                                        '<th>이름 </th>'+
                                        '<th>포인트 </th>'+
                                        '<th>날짜/시간 </th>'+
                                   	'</tr>'+
                              '</thead>';
				    $.each(itemList,function(i,item){
				    tr += '<td>'
				        + [i+1] + '</td><td>'
				        + item.id + '</td><td>'
				        + item.name + '</td><td>'
				        + item.point + '</td><td>'
				        + item.date + '</td></tr>';
                    });
                    $("#userList").append(tr);
                },
                error: function(request,status,error){
                    alert("입력값이 올바르지 않습니다. ")
                }
			});//ajax
		});//click
	});//ready
</script>
<style type="text/css">
	.restImg{
		width: 600px;
		height: 400px
	}
</style>
</head>
<body>
<h3>보상지급 구현 예제 </h3>
   <ul>
   	<li>
   	HTTP Request Method <br><br>
   	POST : 보상지급 조회 <input type="button" value="rewardPost" id="rewardPost"><br>
   	GET : 보상데이터 조회 <input type="button" value="rewardGet" id="rewardGet"><br>
   	<div>
   	    <table id ="rewardList"  width ="500" height="300" align = "center"></table>
    </div><br>
   	GET : 보상 유저 리스트 조회 <input type="button" value="rewardUserListGet" id="rewardUserListGet"><br>
       	<form id="rewardUserListForm">
       	    날짜: <input type="text" pattern="yyyy-MM-dd" name="date" id="date" size="10"> 정렬(asc/desc): <input type="text" name="orderBy" id="orderBy" size="4">
        </form> <br>
   	<div>
        <table id ="userList"  width ="600" height="300" align = "center"></table>
   	</div><br>
   	</li>
   </ul>
</body>
</html>