<%@page import="java.util.ArrayList"%>
<%@page import="bean.baobean"%>
<%@page import="bean.nguoidocbean"%>
<%@page import="bo.tacgiabo"%>
<%@page import="bo.baobo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="styleThi.css">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
    nguoidocbean dn = (nguoidocbean)session.getAttribute("dn");
	ArrayList<baobean> ds = (ArrayList<baobean>)request.getAttribute("ls");
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
	                <li class="nav-item active"><a class="nav-link text-white btn" href="htDangbaoController"><i class="fa-solid fa-pen-to-square"></i> Đăng bài</a></li>
	                <li class="nav-item active"><a class="nav-link text-white btn" href="lichsuController"><i class="fa-solid fa-clock-rotate-left"></i></i> Lịch sử đăng bài</a></li>
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
	                <%
	                 if (dn != null) { %>
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
	<div style="padding-top: 100px;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-12 text-center">
					<h1>Lịch sử đăng bài</h1>
				</div>
				<div class="col-md-12 col-sm-12 col-12 text-center">
					<div class="table-responsive">
	                    <table class="table table-bordered" style="min-width: 500px; text-align: justify;">
	                        <thead>
	                            <tr class="text-center">
	                                <th>Mã báo</th>
	                                <th>Thể loại</th>
	                                <th>Tiêu đề</th>
	                                <th style="min-width: 150px;">Mô tả</th>
	                                <th style="min-width: 500px;">Nội dung</th>
	                                <th style="min-width: 250px;">Ảnh bìa</th>
	                                <th>Ngày xuất bản</th>
	                                <th>Đã duyệt</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <%
	                                for (baobean bao: ds) {
	                            %>
	                            <tr>
	                                <td><%=bao.getMabao() %></td>
	                                <td><%=bao.getMaloai()%></td>
	                                <td><%=bao.getTieude() %></td>
	                                <td><%=bao.getMota() %></td>
	                                <td><%=bao.getNoidung() %></td>
	                                <td><img alt="" src="<%=bao.getAnhbia() %>" style="width:100%;"></td>
	                                <td><%=bao.getNgayxuatbang() %></td>
	                                <%
		                            	if(bao.isTrangthai()==true) {
		                            %>
		                            		<td>Rồi </td>		
		                            <%
		                            	} else {
		                            %>	
		                            		<td>Chưa </td>
		                            <%} %>
	                            </tr>
	                            <%  }  %>
	                        </tbody>
	                    </table>
	                </div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>