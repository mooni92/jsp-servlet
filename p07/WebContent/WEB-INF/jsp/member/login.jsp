<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
                            <h1>로그인</h1>
                            <span class="subheading">Have questions? I have answers.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

   
   <main class="login nav justify-content-center">
   <form method= "post">
   <fieldset> 
      <legend>로그인</legend>
      <h4><label for="id"> 아이디 </label></h4>
      <input type = "text col-sm-2" name = "id" id="id">
      <h4><label for="pwd"> 비밀번호 </label></h4>
      <input type = "password" name="pwd">
      <p><label><input type = "checkbox" name="savedId" id="savedId">아이디 저장</label></p>
      <button class="btn btn-outline-secondary">로그인</button>
      <a href="${pageContext.request.contextPath}/join"><input type="button" class = "btn btn-outline-secondary" value="회원가입"></a>
    
           </form>
           <p><a href="${pageContext.request.contextPath}/login">ID/PW찾기</a></p> 
      
      
      </fieldset>
      </form>
      <h3>${param.msg}</h3>
   </main>
   
 
   
   <jsp:include page="../common/footer.jsp"/>
   <script>
      $(function(){
         if($.cookie("savedId")){
            $("#id").val($.cookie("savedId"));
            $("#savedId").prop("checked", true);
         }
      });
   </script>
</body>
</html>