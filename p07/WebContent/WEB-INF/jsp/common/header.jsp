<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
 <div class="container px-4 px-lg-5">
 <h6><a class="navbar-brand" href="<%=request.getContextPath()%>/index.html">Start human academy</a></h6>
 	<%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> --%>
 	<i class="fas fa-carrot"></i>
 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
       Menu
<i class="fab fa-bars"></i>
</button>
 <div class="collapse navbar-collapse" id="navbarResponsive">
 <ul class="navbar-nav ms-auto py-4 py-lg-0">
 <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/index.html"><h6>Home</h6></a></li>
<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/notice/list"><h6>공지사항</h6></a></li>
 <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/board/list"><h6>자유게시판</h6></a></li>
 <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/gallery/list"><h6>갤러리</h6></a></li>
 
   <c:choose>
   <c:when test="${empty member}">
          
 <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 " href="${pageContext.request.contextPath}/login"><h6>Login</h6></a></li>
  </c:when>
  <c:otherwise>
         <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 "><h6><%=((Member)session.getAttribute("member")).getName() %> 님 환영합니다.</h6></a></li>
         <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 " href="${pageContext.request.contextPath}/member/modify"><h6>정보수정</h6></a></li>
         <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 " href="${pageContext.request.contextPath}/logout"><h6>로그아웃</h6></a></li>
         <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 " href="${pageContext.request.contextPath}/member/withdrawal"><h6>탈퇴</h6></a></li>
           </c:otherwise>
       </c:choose>
              </ul>
    	</div>
	</div>
</nav>

  