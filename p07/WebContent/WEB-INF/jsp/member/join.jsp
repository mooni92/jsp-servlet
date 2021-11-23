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
						<h1>회원가입</h1>
						<span class="subheading">Have questions? I have answers.</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<main class="login p-5 nav justify-content-center">
	<form method="post" class="form-group col-sm-2">
		<fieldset>
			<legend>회원가입</legend>
			<label for="id"> 아이디 </label> <input type="text" name="id" id="id"
				class="form-control">
			  <input type="button" value="중복확인" id="btnCkId" > 
			<p class="msg text-danger"></p>

			<label for="pwd"> 비밀번호 </label> <input type="password" name="pwd"
				id="pwd" class="form-control">
			<p class="msg text-danger"></p>

			<label for="pwd"> 비밀번호 확인</label> <input type="password" name="pwdCk"
				id="pwdCk" class="form-control">
			<p class="msg text-danger"></p>

			<label for="email"> 이메일 </label> <input type="text" name="email"
				id="email" class="form-control">
			<p class="msg text-danger"></p>

			<label for="name"> 이름 </label> <input type="text" name="name"
				id="name" class="form-control">
			<p class="msg text-danger"></p>

			<button class="btn btn-primary" id="btnJoin">회원가입</button>

		</fieldset>
	</form>

	<h3>${param.msg}</h3>
	<!--  로그인 실패 메세지 띄우기-->
	<h3><%=request.getParameter("msg") == null ? "" : request.getParameter("msg")%></h3>
	</main>
	<script>
    var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  //이메일 유효성검사
    var n_RegExp = /^[가-힣]{2,15}$/; //이름 유효성검사 정규식 */
   
   //아이디 중복체크
  
   
   $(function() {
            $("#btnCkId").click(function () {
                var id = $("#id").val();
                var idPwdPattern = RegExp(/^[a-zA-Z0-9]{4,12}$/); //영 대,소문자 또는 숫자 4~12
                
                if(id) {
                    if(!idPwdPattern.test(id)) {
                        $("#btnCkId").attr("ckId", "N");
                        alert("사용할수없는 아이디 형식");
                        $("#id").focus();
                    } else {
                        $.ajax("idValid?id=" + id , {
                            success : function(data) {
                                if(data / 1) {
                                    $("#btnCkId").attr("ckId", "Y");
                                    $("#btnCkId").attr("tmpId", id);
                                    alert("사용할수있는 아이디 입니다");
                                    $("#id").focus();
                                } else {
                                    $("#btnCkId").attr("ckId", "N");
                                    alert("이미 사용중인 아이디 입니다");
                                    $("#id").focus();
                                }
                            }
                        })
                    }
                    
                } else {
                    alert("아이디를 입력해주세요");
                    $("#id").focus();
                }
            })
            
            $("#btnJoin").click(function() {
                
                var id = $("#id").val();
                var tmpId = $("btnCkId").attr("tmpId");
                var pwd = $("#pwd").val();
                var pwdCk = $("#pwdCk").val();
                var email = $("#email").val();
              /*   var objPwd = document.getElementById("pwd"); //비밀번호
                var objPwd2 = document.getElementById("pwdCk"); //비밀번호확인 */

                var name = $("#name").val();
                var namePattern = RegExp(/^[가-힣]{2,15}$/);
                var idPwdPattern = RegExp(/^[A-Za-z0-9]{4,12}$/);
                
                // 테스트 끝나면 최대 글자수 정하기
                var emailPattern = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
                var ckId = $("#btnCkId").attr("ckId");
                
                // 아이디
                if(id) {
                    if(ckId == "") {
                        alert("중복체크를 해주세요");
                        $("#id").focus();
                        return false;
                    } else if (ckId == "N") {
                        alert("사용할수없는 아이디 입니다");
                        $("#id").focus();
                        return false;
                    }
                } else {
                    alert("아이디를 입력해주세요");
                    $("#id").focus();
                    return false;
                }
                
           /*      if(tmpId != id) {
                    alert("다시 중복체크해주세요");
                    $("#btnCkId").focus();
                    return false;
                }  */
                
                
                // 비밀번호 유효성 검사
                if(pwd) {
                    if(!idPwdPattern.test(pwd)) {
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
                
                
                
                // 이메일
                if(email) {
                    if(!emailPattern.test(email)) {
                        alert("사용할수없는 이메일 형식");
                        $("#email").focus();
                        return false;
                    }
                } else{
                    alert("이메일을 입력해주세요");
                    $("#email").focus();
                    return false;
                }
                
                
                //이름
                if(name) {
                    if( !namePattern.test(name) ) {
                        alert("사용할수없는 이름");
                        $("#name").focus();
                        return false;
                    }
                    
                } else{
                    alert("이름을 입력해주세요");
                    $("#name").focus();
                    return false;
                }
                
            })
        })	
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>