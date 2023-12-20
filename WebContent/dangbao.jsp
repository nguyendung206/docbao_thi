<%@page import="bean.tacgiabean"%>
<%@page import="bean.chitietbaobean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
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
	loaibo lbo = new loaibo(); 
	baobo bbo = new baobo();
	tacgiabo tgbo = new tacgiabo();
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
	ArrayList<tacgiabean> tg = (ArrayList<tacgiabean>)request.getAttribute("dstacgia");
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
	                  nguoidocbean dn = (nguoidocbean)session.getAttribute("dn");
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
	<div class="container py-4">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 text-center">
               <h1>Đăng ký tác giả</h1>
            </div>
            <div class="col-md-6 mx-auto d-block">
            	<form action="dkytgController" method="post">
                    <div class="form-group">
                        <label for="inputPassword4">Tên tác giả:</label>
                        <input type="text" name="txtttg" class="form-control" id="inputPassword4" placeholder="Tên tác giả" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Đăng ký</button>
                    </div>
               </form>
            </div>
			<div class="col-md-12 col-sm-12 col-12 text-center">
				<h1>Đăng bài</h1>
			</div>
			<div class="col-md-12 col-sm-12 col-12">
				<form action="dangbaoController" method="post" enctype= "multipart/form-data">
					<div class="form-row">
					    <div class="form-group col-md-6">
					    	<div class="form-group">
							    <label for="inputAddress">Tiêu đề:</label>
							    <input required type="text" name="txttieude" class="form-control" id="inputAddress" placeholder="Tiêu đề">
						  	</div>
						  	<div class="form-group">
							    <label for="inputState">Loại báo:</label>
						    	<select id="inputState" class="form-control" name="txtml">
							    	<% for (loaibean l : loai) { %>
							            <option value="<%= l.getMaloai() %>">
							                <%= l.getTenloai() %>
							            </option>
							        <% } %>
						    	</select>
						    </div>
						    <div class="form-group">
							    <label for="inputEmail4">Ảnh bìa:</label>
							    <input required type="file" name="txtanhbia" class="form-control" id="inputEmail4">
						    </div>
						  	<div class="form-group">
							    <label for="comment">Mô tả:</label>
   								<textarea required class="form-control" rows="5" id="comment" name="txtmota"></textarea>
							</div>
					    </div>
					    <div class="form-group col-md-6 col-12 col-sm-12">
					    	<div class="form-group">
							    <label for="comment">Nội dung:</label>
   								<textarea required class="form-control" rows="5" id="comment" name="txtnd" style="min-height: 391px"></textarea>
							</div>
					    </div>
					</div>
			  		<div class="text-center">
			  			<button type="submit" name="them" value="1" class="btn-lg btn btn-primary">Đăng</button>
			  		</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>