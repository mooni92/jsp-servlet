<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="head.jsp" />
</head>
<body>
	<!-- Navigation-->
	<jsp:include page="header.jsp" />
	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('${pageContext.request.contextPath}/./resources/assets/img/home-bg.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>HUMAN ACADEMY</h1>
						<span class="subheading">A Blog Theme</span>
					</div>
				</div>
			</div>
		</div>

	</header>

	<!-- Main Content-->
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">

				<!-- Post preview-->
				<div class="post-preview">
					<a href="#">
						<h2 class="post-title">Man must explore, and this is
							exploration at its greatest</h2>
						<h3 class="post-subtitle">Problems look mighty small from 150
							miles up</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#!">Start Java</a> on September 24, 2021
					</p>
				</div>
				<!-- Divider-->
				<hr class="my-4" />
				<!-- Post preview-->
				<div class="post-preview">
					<a href="#"><h2 class="post-title">I believe every human
							has a finite number of heartbeats. I don't intend to waste any of
							mine.</h2></a>
					<p class="post-meta">
						Posted by <a href="#!">Start Java</a> on September 18, 2021
					</p>
				</div>
				<!-- Divider-->
				<hr class="my-4" />
				<!-- Post preview-->
				<div class="post-preview">
					<a href="#">
						<h2 class="post-title">Science has not yet mastered prophecy</h2>
						<h3 class="post-subtitle">We predict too much for the next
							year and yet far too little for the next ten.</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#!">Start Java</a> on August 24, 2021
					</p>
				</div>

				<!-- Divider-->
				<hr class="my-4" />
				<!-- Post preview-->
				<div class="post-preview">
					<a href="#">
						<h2 class="post-title">Failure is not an option</h2>
						<h3 class="post-subtitle">Many say exploration is part of our
							destiny, but it’s actually our duty to future generations.</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#!">Start Java</a> on July 8, 2021
					</p>
				</div>


				<!--  <h4 class ="display-5">자유게시판</h4> -->
				<hr class="my-4" />
				<div class="post-preview">
					<c:forEach items="${list}" var="b">
						<a href="${pageContext.request.contextPath}/board/detail?bno=${b.bno}">
							<h2 class="post-title">
								<c:out value="${b.title}" escapeXml="true" />
							</h2>
							<h3 class="post-subtitle">
								<c:out value="${b.content}" escapeXml="true" />
							</h3>
						</a>
						<p class="post-meta">Posted by Y.M(2021.06.28)~(2021.11.15)</p>
						<hr class="my-4" />
					</c:forEach>
				</div>


				<!-- Divider-->
				<hr class="my-4" />
				<!-- Pager-->
				<div class="d-flex justify-content-end mb-4">
					<a class="btn btn-primary text-uppercase"
						href="${pageContext.request.contextPath}/board/list"">게시판 글쓰러
						가기 →</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/./resources/js/scripts.js"></script>
</body>
</html>
