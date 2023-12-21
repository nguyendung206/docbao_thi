<%@page import="java.util.ArrayList"%>
<%@page import="bean.duyetbaibean"%>
<%@page import="bean.adminbean"%>
<%@page import="bo.baobo"%>
<%@page import="bo.tacgiabo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="styleThi.css">
</head>
<body>
	<%
	ArrayList<duyetbaibean> ds = (ArrayList<duyetbaibean>)request.getAttribute("ds");
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
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
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminController"><i class="fa-solid fa-check"></i> Duyệt bài</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?bao=1"><i class="fa-regular fa-newspaper"></i> Bài báo</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?loai=1"><i class="fa-solid fa-tags"></i> Loại báo</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?tg=1"><i class="fa-solid fa-user-pen"></i> Tác giả</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminqlController?nd=1"><i class="fa-solid fa-user"></i> Người đọc</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn m-1" href="adminthongkeController"><i class="fa-solid fa-chart-column"></i> Thống kê</a></li>
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
	                <%
	                  adminbean dn = (adminbean)session.getAttribute("dn");
	                  if (dn != null) {
	                %>
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
	<div class="container-fluid" style="padding-top:100px;">
	    <div class="row">
	        <div class="col-md-12 col-sm-12 col-12 text-center">
	            <h1 class="text-center">Danh sách bài báo chờ duyệt</h1>
	            <div class="col-md-12 col-sm-12 col-12 text-center">
	                <div class="table-responsive">
	                    <table class="table table-bordered" style="min-width: 500px; text-align: justify;">
	                        <thead>
	                            <tr class="text-center">
	                                <th>Tiêu đề</th>
	                                <th>Thể loại</th>
	                                <th style="min-width: 150px;">Mô tả</th>
	                                <th style="min-width: 500px;">Nội dung</th>
	                                <th style="min-width: 250px;">Ảnh bìa</th>
	                                <th>Ngày xuất bản</th>
	                                <th>Tên tác giả</th>
	                                <th style="min-width: 96px;">Xác nhận</th>
	                                <th>Xóa</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <%
	                                for (duyetbaibean d: ds) {
	                            %>
	                            <tr>
	                                <td><%=d.getTieude() %></td>
	                                <td><%=d.getTenloai() %></td>
	                                <td><%=d.getMota() %></td>
	                                <td><%=d.getNoidung() %></td>
	                                <td><img alt="" src="<%=d.getAnhbia() %>" style="width:100%;"></td>
	                                <td><%=d.getNgayxuatban() %></td>
	                                <td><%=d.getTentacgia() %></td>
	                                <td>
	                                    <a href="duyetbaiController?mbd=<%=d.getMabao()%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-solid fa-check"></i> Duyệt</a>
	                                </td>
	                                <td>
	                                	<a href="duyetbaiController?mbx=<%=d.getMabao()%>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-trash-can"></i></a>
                                	</td>
	                            </tr>
	                            <%  }  %>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>