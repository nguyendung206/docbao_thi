<%@page import="bean.adminbean"%>
<%@page import="bo.tacgiabo"%>
<%@page import="bean.tacgiabean"%>
<%@page import="bean.nguoidocbean"%>
<%@page import="bean.baobean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.baobo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Báo mới</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="styleThi.css">
</head>
<style>
	.navbar {
	    position: fixed;
	    width: 100%;
	    top: 0;
	    z-index: 1000;
   }
   .navbar-toggler-icon {
    	background-color: #fff;
   }
  .sidebar {
    background-color: #f4f4f4;
    padding: 15px;
    border-radius: 10px;
  }


  /* Style the list items */
  .sidebar ul {
    list-style: none;
    padding: 0;
  }

  .sidebar li {
    margin-bottom: 10px;
  }

  /* Add some styles to the links */
  .sidebar a {
    text-decoration: none;
    color: #007bff;
    font-weight: 500;
  }

  /* Change link color on hover */
  .sidebar a:hover {
    color: #0056b3;
  }

  /* Style the icon */
  .sidebar i {
    margin-right: 5px;
  }
</style>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	loaibo lbo = new loaibo(); 
	baobo bbo = new baobo();
	tacgiabo tgbo = new tacgiabo();
    nguoidocbean dn = (nguoidocbean)session.getAttribute("dn");
 	ArrayList<tacgiabean> dstacgia = (ArrayList<tacgiabean>)request.getAttribute("dstacgia");
	ArrayList<baobean> ds = (ArrayList<baobean>) request.getAttribute("dsbao");
 	ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
	%>
	<nav class="navbar navbar-expand-lg header">
    	<div class="container-fluid">
	        <a class="navbar-brand text-white" href="trangchuController"><img src="./image_bao/bm-logo.png" style="width:15vh"></a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
	            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" style="border-color:white">
	            <span><i class="fa-solid fa-bars text-white"></i></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarNav" style="font-size: 18px">
	            <ul class="navbar-nav mr-auto">
	                <li class="nav-item active"><a class="nav-link text-white btn" href="trangchuController"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
	                <% if (dn != null) { %>
	                <li class="nav-item active"><a class="nav-link text-white btn" href="htDangbaoController"><i class="fa-solid fa-pen-to-square"></i> Đăng bài</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn" href="lichsuController"><i class="fa-solid fa-clock-rotate-left"></i></i> Lịch sử đăng bài</a></li>
	            	<%} %>
	            </ul>
	            <form class="form-inline my-2 my-lg-0 mx-auto" action="trangchuController" method="post">
	                <div class="input-group">
	                    <input class="form-control" type="text" name="txttk" placeholder="Tìm kiếm" aria-label="Search">
	                    <div class="input-group-append">
	                        <button class="btn text-white" type="submit" style="border-color:white"><i class="fa-solid fa-magnifying-glass"></i> Tìm</button>
	                    </div>
	                </div>
	            </form>
	            <ul class="navbar-nav ">
	                <% if (dn != null) { %>
	                <li class="nav-item "><a class="nav-link text-white btn m-1" href="#"><i class="fa-solid fa-user"></i> Xin chào: <%=dn.getHoten()  %></a></li>
	                <li class="nav-item"><a class="nav-link text-white btn m-1" href="dangxuatController" style="background: #e74c3c;"><span class="glyphicon glyphicon-log-out"></span><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
	                <% } else { %>
	                <li class="nav-item"><a href="dangnhapController" class="nav-link text-white btn m-1" style="background: tomato;"><i class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a></li>
	                <li class="nav-item"><a href="dangkyController" class="nav-link text-white btn m-1" style="background: green;"><i class="fa-solid fa-user-plus"></i> Đăng Ký</a></li>
	                <% }; %>
	            </ul>
        	</div>
    	</div>
	</nav>
	<div style="padding-top:100px">
		<div class="container-fluid">
			<div class="row">
		    	<div class="col-md-2 col-sm-3 pb-4">
		        	<div class="sidebar" style="width: 100%">
		        		<h4 class="text-center pt-3" style="color:red;">THỂ LOẠI</h4>
  						<ul class="list-unstyled">
				         <%
				         	for(loaibean l: lbo.getloai()) {
				          %>
			          		<li>
			          			<a href="trangchuController?ml=<%= l.getMaloai() %>"> 
				          			<i class="fa-solid fa-tags"></i>
				          			<%= l.getTenloai() %>
			          			</a>
			          		</li>
			         	<%} %>
			        	</ul>
					</div>
		      	</div>
				<div class="col-md-8 col-sm-6">
					<div id="carouselExampleControls" class="carousel slide mb-4" data-ride="carousel">
			            <div class="carousel-inner">
			                <div class="carousel-item active">
			                    <img class="d-block w-100 carousel-img" src="./image_bao/24.jpg" alt="...">
			                </div>
			                <div class="carousel-item">
			                    <img class="d-block w-100 carousel-img" src="./image_bao/27.jpg" alt="...">
			                </div>
			                <div class="carousel-item">
			                    <img class="d-block w-100 carousel-img" src="./image_bao/29.jpg" alt="...">
			                </div>
			            </div>
			            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                <span class="sr-only">Previous</span>
			            </a>
			            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			                <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                <span class="sr-only">Next</span>
			            </a>
			        </div>
					<div class="row">
					<%
					if(ds !=null) {
						for (baobean bao: ds) {
					%>
						<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
							<div class="about">
								<img src="<%=bao.getAnhbia()%>" class="img-bao"><br>
								<h6 style="text-align: justify; margin-top:16px"><%=bao.getTieude() %></h6>
								<span><i class="fa-regular fa-clock"></i> : <%=bao.getNgayxuatbang() %></span>
								<p><%=bao.getMota() %></p>
								<div class="text-center pb-3">
									<a href="htbaoController?mb=<%=bao.getMabao()%>" class="btn btn-success "><i class="fa-solid fa-book-open-reader"></i> Đọc báo</a>
								</div>
							</div>
						</div>
					<%} }%>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 tacgia">
		        	<div class="sidebar" style="width: 100%">
		        		<h4 class="text-center pt-3" style="color:red;">TÁC GIẢ</h4>
  						<ul class="list-unstyled">
				         <%
				         	for(tacgiabean tg: tgbo.gettacgia()) {
				          %>
			          		<li>
				          		<a href="trangchuController?mtg=<%= tg.getMatacgia() %>"> 
				          			<i class="fa-solid fa-user-pen"></i>
				          			<%= tg.getTentacgia() %> 
				          		</a>
			          		</li>
			         	<%} %>
			        	</ul>
					</div>
		      	</div>
			</div>
		</div>
	</div>
</body>
</html>