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
<style>
   .list table {width:50%; margin:0 auto; border-collapse:collapse;}
   .list th, .list td {padding:8px;}
   .list th {background: #bbb;}
   .list td {border-bottom: 3px solid #bbb; text-align: center; width:10%}
   .list td + td{text-align : left; width:60%}
   .list td+td+td {text-align:center; width:10%}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
     <!-- Page Header-->
        <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/./resources/assets/img/about-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h1>Free Board</h1>
                            <span class="subheading">This is what I do.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
<main class = "list">
<table>
   <tr>
      <th>연번</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
   </tr>
   <c:forEach items="${list}" var="b">
   <tr>
      <td><c:out value="${b.bno}" /></td>
      <td><a href="${pageContext.request.contextPath}/board/detail?bno=${b.bno}"> <c:out value="${b.title}" /></a><span class = "text-muted small">[${b.replyCnt}]</span></td>
      <td><c:out value="${b.id}" /></td>
   	  <td><fmt:formatDate value="${b.regDate}" pattern="yy/MM/dd HH:mm:ss"/></td>
      
   </tr>
   
   
   
   </c:forEach>
   <tr>
   	<td colspan="4">
   		<ul class="pagination justify-content-end">
  			<li class="page-item ${page.prev ? '' : 'disabled'}">
  				<a class="page-link" href="${pageContext.request.contextPath}/board/list?pageNum=${page.startPage-1}&amount=${page.cri.amount}">Previous</a>
  			</li>
  			
  			<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
  			<li class="page-item ${p == page.cri.pageNum ? 'active' : ''}">
  			<a class="page-link" href="${pageContext.request.contextPath}/board/list?pageNum=${p}&amount=${page.cri.amount}">${p}</a>
  			</li>
  			</c:forEach>
  			<li class="page-item ${page.next ? '' : 'disabled'}">
  			<a class="page-link" href="${pageContext.request.contextPath}/board/list?pageNum=${page.endPage+1}&amount=${page.cri.amount}">Next</a></li>
	</ul>
   		<%-- ${page} --%>
   	</td>
   	</tr>
   <c:if test="${not empty member}">
   <tr>
      <td colspan = "4"><a href="write"><button class= "btn btn-primary">글쓰기</button></a>
   </tr>
   </c:if>
</table>
</main>
<jsp:include page="../common/footer.jsp"/>   
</body>
</html>