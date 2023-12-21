<%@page import="bean.chitietbaobean"%>
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
 .row {
 	justify-content: space-around;
 }
 .input-group {
 	align-items: center;
 
</style>
<body>
	<%
	loaibo lbo = new loaibo(); 
	baobo bbo = new baobo();
	tacgiabo tgbo = new tacgiabo();
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	adminbean dn = (adminbean)session.getAttribute("dn");
	int tongBao = (int)request.getAttribute("tongBao");
	int tongLoai = (int)request.getAttribute("tongLoai");
	int tongNguoidoc = (int)request.getAttribute("tongNguoidoc");
	int tongTacgia = (int)request.getAttribute("tongTacgia");
	%>
	<nav class="navbar navbar-expand-lg header">
    	<div class="container-fluid">
	        <a class="navbar-brand text-white" href="adminController"><img src="./image_bao/bm-logo.png" style="width:15vh"></a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
	            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" style="border-color:white">
	            <span><i class="fa-solid fa-bars text-white"></i></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarNav" style="font-size: 18px">
	            <ul class="navbar-nav mr-auto">
	            	<% if (dn != null) { %>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="duyetbaiController"><i class="fa-solid fa-check"></i> Duyệt bài</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?bao=1"><i class="fa-regular fa-newspaper"></i> Bài báo</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?loai=1"><i class="fa-solid fa-tags"></i> Loại báo</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?tg=1"><i class="fa-solid fa-user-pen"></i> Tác giả</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?nd=1"><i class="fa-solid fa-user"></i> Người đọc</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminthongkeController"><i class="fa-solid fa-chart-column"></i> Thống kê</a></li>
	            	<%} else { %>
	            	<li class="nav-item active"><a class="nav-link text-white btn" href="adminController"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
	            	<%} %>
	            </ul>
	            <form class="form-inline my-2 my-lg-0 mx-auto" action="adminController" method="post">
	                <div class="input-group">
	                    <input class="form-control" type="text" name="txttk" placeholder="Tìm kiếm" aria-label="Search">
	                    <div class="input-group-append">
	                        <button class="btn text-white" type="submit" style="border-color:white"><i class="fa-solid fa-magnifying-glass"></i> Tìm</button>
	                    </div>
	                </div>
	            </form>
	            <ul class="navbar-nav ">
	                <% if (dn != null) { %>
	                <li class="nav-item "><a class="nav-link text-white btn m-1" href="#"><i class="fa-solid fa-user"></i> Xin chào: <%= dn.getTaikhoanadmin() %></a></li>
	                <li class="nav-item"><a class="nav-link text-white btn m-1" href="dangxuatController" style="background: #e74c3c;"><span class="glyphicon glyphicon-log-out"></span><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
	                <% } else { %>
	                <li class="nav-item"><a href="dangnhapController" class="nav-link text-white btn m-1" style="background: tomato;"><i class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a></li>
	                <li class="nav-item"><a href="dangkyController" class="nav-link text-white btn m-1" style="background: green;"><i class="fa-solid fa-user-plus"></i> Đăng Ký</a></li>
	                <% }; %>
	            </ul>
        	</div>
    	</div>
	</nav>
	<div id="layoutSidenav_content">
	    <main>
	        <div class="container-fluid" style="padding-top:70px;">
	            <h2 class="mt-4">Tổng quát</h2>
	            <div class="row">
	                <div class="col-md-6">
	                    <div class="card mb-4">
	                        <div class="card-header">
	                            <i class="fas fa-chart-area me-1"></i>
	                            Thống kê tổng số:
	                        </div>
	                        <div class="card-body">
	                            <table class="table table-hover">
	                                <tr>
	                                    <th>Tổng số bài báo</th>
	                                    <td><%= tongBao %></td>
	                                    <td class="text-center">
	                                        <a class="btn btn-primary btn-sm" href="adminqlController?bao=1">Xem chi tiết</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>Tổng số loại báo</th>
	                                    <td><%= tongLoai %></td>
	                                    <td class="text-center">
	                                        <a class="btn btn-primary btn-sm" href="adminqlController?loai=1">Xem chi tiết</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>Tổng số tác giả</th>
	                                    <td><%= tongTacgia %></td>
	                                    <td class="text-center">
	                                        <a class="btn btn-primary btn-sm" href="adminqlController?tg=1">Xem chi tiết</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>Tổng số người đọc</th>
	                                    <td><%= tongNguoidoc%></td>
	                                    <td class="text-center">
	                                    	<a class="btn btn-primary btn-sm" href="adminqlController?nd=1">Xem chi tiết</a>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <div class="card mb-4">
	                        <div class="card-header">
	                            <i class="fas fa-chart-area me-1"></i>
	                            Đồ thị thống kê
	                        </div>
	                        <div class="card-body">
	                            <canvas id="myChart"></canvas>
	                        </div>
	                    </div>
	                </div>
	                <div class="pt-4 col-md-12 text-center">
	                    <h1 class="col-md-12">Thống kê</h1>
	                    <div class="container pt-4">
						    <div class="row">
						        <div class="col-md-4 text-center">
						            <form action="adminthongkeController" method="post">
						                <div class="form-group mb-2">
						                    <label for="txtngay" class="mr-2">Chọn ngày:</label>
						                    <input class="form-control" type="date" name="txtngay" id="txtngay">
						                </div>
						                <button type="submit" name="tk" value="1" class="btn btn-primary mb-2 mr-sm-2">Thống kê</button>
						                <button type="submit" name="all" value="1" class="btn btn-primary mb-2">Hiển thị tất cả</button>
						            </form>
						        </div>
						    </div>
						</div>
	                    <div class="table-responsive">
	                        <%
	                            ArrayList<chitietbaobean> ds = (ArrayList<chitietbaobean>)request.getAttribute("ds");
	                            if(ds != null && !ds.isEmpty()) { 
	                        %>
	                        <table class="table table-bordered" style="text-align: justify;">
	                            <thead>
	                                <tr class="text-center">
	                                    <th>Tiêu đề</th>
	                                    <th>Thể loại</th>
	                                    <th style="min-width: 150px;">Mô tả</th>
		                                <th style="min-width: 500px;">Nội dung</th>
		                                <th style="min-width: 250px;">Ảnh bìa</th>
	                                    <th>Ngày xuất bản</th>
	                                    <th>Tên tác giả</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <%
	                                    for (chitietbaobean bao: ds) {
	                                %>
	                                <tr>
	                                    <td><%=bao.getTieude() %></td>
	                                    <td><%=bao.getTenloai() %></td>
	                                    <td><%=bao.getMota() %></td>
	                                    <td><%=bao.getNoidung() %></td>
	                                    <td><img alt="" src="<%=bao.getAnhbia() %>" style="width:100%;"></td>
	                                    <td><%=bao.getNgayxuatban() %></td>
	                                    <td><%=bao.getTentacgia() %></td>
	                                </tr>
	                                <%  }  %>
	                            </tbody>
	                        </table>
	                        <%
	                        } else {
	                        %>
	                        <p>Không có dữ liệu</p>
	                        <%} %>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	</div>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script src="js/thongke.js"></script>
	<script>
		    var tongBao = <%=tongBao%>;
		    var tongLoai = <%=tongLoai%>;
		    var tongNguoidoc = <%=tongNguoidoc%>;
		    var tongTacgia = <%=tongTacgia%>;
		    window.addEventListener('DOMContentLoaded', event => {
		    	
			     // Toggle the side navigation
			     const sidebarToggle = document.body.querySelector('#sidebarToggle');
			     if (sidebarToggle) {
			         sidebarToggle.addEventListener('click', event => {
			             event.preventDefault();
			             document.body.classList.toggle('sb-sidenav-toggled');
			             localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
			         });
			     }
	
			 // Dữ liệu biểu đồ
			 var ctx = document.getElementById("myChart").getContext("2d");
			 var myChart = new Chart(ctx, {
			     type: "bar", // Loại biểu đồ (có thể thay đổi)
			     data: {
			         labels: ["Bài báo", "Thể loại", "Tác giả", "Người đọc"], // Nhãn trục x
			         datasets: [{
			             label: "Số lượng", // Nhãn dữ liệu
			             data: [tongBao, tongLoai, tongTacgia, tongNguoidoc],
			             backgroundColor: [
			                 "rgba(255, 99, 132, 0.2)", // Màu nền cho cột 1
			                 "rgba(54, 162, 235, 0.2)", // Màu nền cho cột 2
			                 "rgba(75, 192, 192, 0.2)", // Màu nền cho cột 3
			                 "rgba(255, 205, 86, 0.2)", // Màu nền cho cột 4 (thể loại)
			             ],
			             borderColor: [
			                 "rgba(255, 99, 132, 1)", // Màu viền cho cột 1
			                 "rgba(54, 162, 235, 1)", // Màu viền cho cột 2
			                 "rgba(75, 192, 192, 1)", // Màu viền cho cột 3
			                 "rgba(255, 205, 86, 1)", // Màu viền cho cột 4 (thể loại)
			             ],
			             borderWidth: 1
			         }]
			     },
			     options: {
			         scales: {
			             y: {
			                 beginAtZero: true
			             }
			         }
			     }
			 });
			 });
	</script>
</html>