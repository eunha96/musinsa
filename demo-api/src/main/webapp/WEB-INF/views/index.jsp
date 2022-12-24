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
				url:"reward/rewardData/reward" ,
				success:function(item){
				    alert(item.id+" "+item.title+" "+item.content);
                }
			});//ajax
		});//click
		$("#rewardGet").click(function(){
			$.ajax({
				type:"get",
				url:"postUserApi" ,
				success:function(item){
				    alert(item.id+" "+item.title+" "+item.content);
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
				    $("#listView").empty();
				    $.each(itemList,function(i,item){
				        $("#listView").append(item.id+" "+item.name+" "+item.point+" "+item.date+"<br>").css("background","pink");
                    });
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
   	GET : 보상 유저 리스트 조회 <input type="button" value="rewardUserListGet" id="rewardUserListGet"><br>
       	<form id="rewardUserListForm">
       	    날짜(yyyy-mm-dd) <input type="text" name="date" id="date" size="10"> 정렬(asc/desc) <input type="text" name="orderBy" id="orderBy" size="4">
        </form> <br>
   	<div id="listView"></div> 	<br> <br>
   	</li>
   </ul>
</body>
</html>