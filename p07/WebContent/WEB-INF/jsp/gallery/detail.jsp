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
<main class = "detail">
<div class="col-sm-6">
<table>
  <tr>
    <td><c:out value="${board.title}" /></td>
    <td><c:out value="${board.regDate}" /></td>
  </tr>
  <tr>
     <td>
        <c:forEach items="${board.attachs}" var="attach">
        <p><a href="${pageContext.request.contextPath}/download?filename=${attach.uuid}">${attach.origin}</a></p>
        </c:forEach>
     </td>
  </tr>
  <tr>
   <td colspan="2">${board.content}</td>
  </tr>
</table>

<c:if test="${not empty member}">
<div class="col-6 mx-auto">
   <div class="form-group clearfix">
      <p><c:out value="${member.name}" /></p>
      <form id="frmReplyWrite">
        <input type="text" class="form-control" placeholder="댓글 제목을 입력하세요" name="title" id="title">
        <textarea class="form-control my-1" placeholder="댓글을 입력하세요" name="content" id="content"></textarea>
        <input type="hidden" name="bno" value="${board.bno}">
        <input type="hidden" name="id" value="${member.id}">
        <button class="btn btn-primary float-right disabled" id="btnReplyWrite">등록</button>
        </form>
   </div>
</div>
</c:if>

<div class="col-10 mx-auto reply-wrapper">
</div>
</div>
</main>
<script>
var cp = "${pageContext.request.contextPath}";
var bno = '${param.bno}';
$(function() {
   showList();
   function showList () {
      var url = cp + "/reply/list?bno=" + bno;
      console.log(url);
      
      $.getJSON(url).done(function(data) {
         console.log(data);
         
         var str = "";
         for(var i in data) {            
            str += '<div class="card mt-3 border-secondary" data-rno="' + data[i].rno + '">'
            str += '   <div class="card-header bg-dark text-light">' + data[i].title + '</div>'
            str += '   <div class="card-body">' + data[i].content + '</div>'
            str += '</div>'
         }
         $(".reply-wrapper").html(str);
      })   
   }
   
   
   // 이벤트 위임 댓글상세 이벤트
   $(".reply-wrapper").on("click", ".card", function() {
      var url = cp + "/reply?rno=" + $(this).data("rno");
      $.getJSON(url).done(function(data) {
         console.log(data);
         console.log(data.title);
         console.log(data.content);
         $("#myModal")
            .data("rno", data.rno)
               .find(".modal-title").text(data.title)
            .end()
               .find(".modal-body").text(data.content)
            .end()   
               .modal("show");
         //alert($(this).data("rno"));
      });
   })
   
   $("#btnRm").click(function() {
      alert($(this).closest(".modal").data("rno"));
      var rno = $(this).closest(".modal").data("rno");
      var url = cp + "/reply?rno=" + rno;
      
      // ajax
      $.ajax(url, {
         method:"delete",
         success : function(data) {
            // 성공적으로 종료
            showList();
            $("#myModal").modal("hide");
         }
      });
   });
   
   $("#title, #content").keyup(function() {
      var titleLen = $("#title").val().trim().length;
      var contentLen = $("#content").val().trim().length;
      
      if(titleLen && contentLen) {
         $("#btnReplyWrite").removeClass("disabled");
      }
      else {
         $("#btnReplyWrite").addClass("disabled");
      }
      
   });
   
   $("#frmReplyWrite").submit(function() {
      event.preventDefault();
      if($("#btnReplyWrite").is(".disabled")) reutrn;
      
      var reply = {};
      reply.title = $(this.title).val();
      reply.content = $(this.content).val();
      reply.id = $(this.id).val();
      reply.bno = $(this.bno).val();
      
      var data = JSON.stringify(reply);
      console.log(reply);
      console.log(data);
      
      var frm = this;
      var url = cp + "/reply"
      $.ajax(url, {
         method:"post",
         data : {"jsonData" : data},
         success : function(data) {
            showList();
            frm.reset();
            $("#btnReplyWrite").addClass("disabled");
         }
      })
   });
});
</script>   
   
<!-- Button to Open the Modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Open modal
</button> -->

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="btnRm">삭제</button>
      </div>

    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>