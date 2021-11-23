   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp" />
<style>
   .detail table {width: 50%; margin:40px auto; border-collapse: collapse;}
   .detail td {paddig: 8px; border-top: 3px solid #bbb; border-bottom: 3px solid #bbb;}
   .detail td + td {width : 20%}
   .detail tr:last-child td {height: 300px; vertical-align: top; white-space: pre-line;}
</style>
</head>

<body>
<jsp:include page="../common/header.jsp" />
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
    <br>
    <b><font size="6" color="gray">글 수정</font></b>
    <br>
    
    <form method="post">
 
    <input type="hidden" name="bno" id="bno" value="${board.bno}"/>
    <input type="hidden" name="id" id="id" value="${board.id}"/>
    <input type="hidden" name="existing_file" id="existing_file" value="${board.attachs}"/>
 
    <table width="700" border="3" bordercolor="lightgray" align="center">
      
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="title" type="text" id="title" size="70" maxlength="100" 
                    value="${board.title}"/>
            </td>        
        </tr>
        <tr>
            <td id="content">
                내 용
            </td>
            <td>
                <textarea name="content" id="content" cols="72" rows="20" ><c:out value="${board.content}" /></textarea>            
            </td>        
        </tr>

        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소" >
                <input type="submit" value="수정" >
                <input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/board/list'" >            
            </td>
        </tr>
    </table>    
    </form>

        <jsp:include page="../common/footer.jsp" />
</body>
</html>