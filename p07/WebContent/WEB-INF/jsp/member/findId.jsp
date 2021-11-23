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
                            <h1>Contact Me</h1>
                            <span class="subheading">Have questions? I have answers.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

   
   <main class="findId nav justify-content-center">
   <form method= "post">
   <fieldset> 
      <legend>ID찾기</legend>
      <h4><label for="name">이름</label></h4>
      <input type = "text col-sm-2" name = "name" id="name">
      <h4><label for="email"> 이메일 주소 </label></h4>
      <input type = "email" name="email">
      <button class="btn btn-outline-secondary">ID찾기</button>
    
           </form>
      
      </fieldset>
      </form>
      <h3>${param.msg}</h3>
   </main>
   
   
      <main class="findpwd nav justify-content-center">
   <form method= "post">
   <fieldset> 
      <legend>pwd찾기</legend>
      <h4><label for="Id">ID</label></h4>
      <input type = "text col-sm-2" name = "id" id="id">
      <h4><label for="email"> 이메일 주소 </label></h4>
      <input type = "email" name="email">
      <button class="btn btn-outline-secondary">PWD찾기</button>
    
           </form>
      
      </fieldset>
      </form>
      <h3>${param.msg}</h3>
   </main>
 
   
   <jsp:include page="../common/footer.jsp"/>
   <!-- <script>
      $(function(){
         if($.cookie("savedId")){
            $("#id").val($.cookie("savedId"));
            $("#savedId").prop("checked", true);
         }
      });
   </script> -->
</body>
</html>