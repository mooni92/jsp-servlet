<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {border-collapse : collapse; margin: 0 auto}
	table, th, td {border: 1px solid black;}
	th, td{padding: 10px}
</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
           <!-- Page Header-->
        <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/./resources/assets/img/contact-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h1>Contact Me</h1>
                            <span class="subheading">Have questions? I have answers.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
	<table>
		<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
		<th>이름</th>
		</tr>
		<c:forEach items="${members}" var=member">
		<tr>
			<td>${member.id }</td>
			<td>${member.pwd }</td>
			<td>${member.email }</td>
			<td>${member.name }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>