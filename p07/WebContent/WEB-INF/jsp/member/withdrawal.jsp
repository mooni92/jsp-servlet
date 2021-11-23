<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp" />
<style>
.msg {
	height: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('${pageContext.request.contextPath}/./resources/assets/img/contact-bg.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>회원 탈퇴</h1>
						<span class="subheading">Have questions? I have answers.</span>
					</div>
				</div>
			</div>
		</div>
	</header>
<main class="withdrawal p-5 nav justify-content-center">
	<form method="post" class="form-group col-sm-2">
		<fieldset>
			<legend>회원 탈퇴</legend>
			<label for="id"> 아이디 </label>  <input type="text" name="id" value=<%=((Member)session.getAttribute("member")).getId() %>
				id="id" class="form-control" readonly="readonly">
		<!--   <input type="button" value="중복확인" id="btnCkId" > -->
			<p class="msg text-danger"></p> 
			<label for="pwd"> 비밀번호 </label> <input type="password" name="pwd" value=<%=((Member)session.getAttribute("member")).getPwd() %>
				id="pwd" class="form-control" readonly= "readonly">
				<p class="msg text-danger">비밀번호와 비밀번호 확인이 같고 게시글 없으면 탈퇴 진행.</p>
				<!-- <input type="button" value="본인 확인" id="btnCkPwd" >  -->
	
			<p class="msg text-danger"></p>
			<label for="pwd"> 비밀번호 확인</label> <input type="password" name="pwdCk" 
				id="pwdCk" class="form-control">
			<p class="msg text-danger"></p>

			<button class="btn btn-primary" id="btnWithdrawal" >회원 탈퇴</button>
			
		</fieldset>
	</form>

	<h3>${param.msg}</h3>
	<!--  로그인 실패 메세지 띄우기-->
	<h3><%=request.getParameter("msg") == null ? "" : request.getParameter("msg")%></h3>
	</main>
	<script>
   
   $(function() {
	 
            $("#btnWithdrawal").click(function() {
                
                var pwd = $("#pwd").val();
                var pwdCk = $("#pwdCk").val();

                var PwdPattern = RegExp(/^[A-Za-z0-9]{4,12}$/);
                
                // 테스트 끝나면 최대 글자수 정하기
                var ckId = $("#btnCkId").attr("ckId");
   
                
                // 비밀번호 유효성 검사
                if(pwd) {
                    if(!PwdPattern.test(pwd)) {
                        alert("사용할 수 없는 비밀번호 형식");
                        $("#pwd").focus();
                        return false;
                    }
                    if(pwd != pwdCk ){ //비밀번호와 비밀번호확인이 동일한지 검사
                        alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
                        $("#pwdCk").focus();
                        return false;
                    }
                    
                } else{
                    alert("비밀번호를 입력해주세요");
                    $("#pwd").focus();
                    return false;
                }
                
                
            })
        })	

</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>