<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/head.jsp"/>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
        <!-- Page Header-->
      <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/./resources/assets/img/contact-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                           <h1>Gallery</h1>
                            <span class="subheading">Have questions? I have answers.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
<main class = "list">
<div class="container">

   <c:set var="endCount" value="${page.cri.amount - (page.cri.amount-1)%3+2}"/>
   <c:forEach begin="1" end="${endCount}" varStatus="stat">
      <c:set var="board" value="${list[stat.index-1]}"/>
      <c:if test="${stat.index %3 ==1}">
      <div class="row justify-content-center">
      </c:if>
      <div class="col m-4">
      <c:if test="${not empty board}">
       <div><img src="${pageContext.request.contextPath}/display?filename=${board.attachs[0].path}/s_${board.attachs[0].uuid}" class="border border-secondary w-100"></div>
         <div class="text-nowrap text-truncate text-center" style="width:250px">
            <a href="#"><c:out value="${board.title}" /></a>
         </div>
      </c:if>
      </div>
      
      <c:if test="${stat.index %3 ==0}">
      </div>
      </c:if>
   </c:forEach>
   <hr>
   
      <ul class="pagination justify-content-center">
           <li class="page-item ${page.prev ? '' : 'disabled'}">
                 <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${page.startPage-1}&amount=${page.cri.amount}">Previous</a>
           </li>
           
           <c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
           <li class="page-item ${p == page.cri.pageNum ? 'active' : ''}">
                 <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${p}&amount=${page.cri.amount}">${p}</a>
           </li>
           </c:forEach>
           <li class="page-item ${page.next ? '' : 'disabled'}">
                 <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${page.endPage+1}&amount=${page.cri.amount}">Next</a>
              </li>
      </ul>   
   
      <a href="${pageContext.request.contextPath}/gallery/write"><button class= "btn btn-primary float-right">글쓰기</button></a>
   
   <c:if test="${not empty member}">
   </c:if>
</main>
<jsp:include page="../common/footer.jsp"/>   
</body>
</html>