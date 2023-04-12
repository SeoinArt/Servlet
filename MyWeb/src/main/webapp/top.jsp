<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ex43_layout.html</title>
    <link rel="stylesheet" type="text/css" href="css/layout.css">
</head>
<body>
    <div id="wrap">
        <!-- 헤더 : 로고 이미지, 검색폼, 목차 등 -->
        <header>
            <!-- header -->
            <a href="#">
                <img src="images/logo.png">
            </a>
        </header>

        <div class="cls"></div>
        <!-- 네이게이션바 : 메뉴 -->
        <nav>
            <!-- nav -->
            <ul>
                <li><a href="main.jsp">Home</a></li>
                <li><a href="#">Signup</a></li>
                <li><a href="#">Signin</a></li>
                <li><a href="#">Board</a></li>
            </ul>
        </nav>

        <div class="cls"></div>
        <!-- article : 주로 컨텐츠가 들어감 -->
        <article>