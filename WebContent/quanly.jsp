<%@page import="java.net.URLDecoder"%>
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
  <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
  <link rel="stylesheet" href="styleThi.css">
  
</head>
<body>
	<%
	loaibo lbo = new loaibo(); 
	baobo bbo = new baobo();
	tacgiabo tgbo = new tacgiabo();
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	adminbean dn = (adminbean)session.getAttribute("dn");
	ArrayList<chitietbaobean> ds = (ArrayList<chitietbaobean>)request.getAttribute("ctbao");
	ArrayList<chitietbaobean> mbsl = (ArrayList<chitietbaobean>)request.getAttribute("mbsl");
	ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
	ArrayList<loaibean> mlsl = (ArrayList<loaibean>) request.getAttribute("mlsl");
	ArrayList<tacgiabean> tg = (ArrayList<tacgiabean>)request.getAttribute("dstacgia");
	ArrayList<tacgiabean> mtgsl = (ArrayList<tacgiabean>)request.getAttribute("mtgsl");
	ArrayList<nguoidocbean> nd = (ArrayList<nguoidocbean>)request.getAttribute("dsnguoidoc");
	ArrayList<nguoidocbean> mndsl = (ArrayList<nguoidocbean>)request.getAttribute("mndsl");
	String tb1 = (String)request.getAttribute("tb1");
	String tb2 = (String)request.getAttribute("tb2");
	String tb3 = (String)request.getAttribute("tb3");
	String tb4 = (String)request.getAttribute("tb4");
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
	<%
		if(ds !=null) { 
	%>
			<div style="padding-top:100px;">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-12 text-center">
							<h1>Quản lý báo</h1>
						</div>
						<%
			               	if (tb1 != null) {
			            %>
			              		<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Thêm bài viết thành công!</strong>
								   </div>
							    </div>
					   <%}else if (tb2 != null) { %>
					   			<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Bài viết đã được sửa!</strong>
								   </div>
							    </div>
						<%}else if (tb3 != null){ %>
								<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Xóa bài viết thành công!</strong>.
								   </div>
							    </div>
						<%} %>
						<div class="col-md-12 col-sm-12 col-12">
							<form action="xoasuabaoController" method="post" enctype= "multipart/form-data">
								<div class="form-row">
								    <div class="form-group col-md-6 col-12 col-sm-12">
										<div class="form-row">
											<div class="form-group col-md-4 col-12 col-sm-12">
											    <label for="inputState">Mã báo:</label>
											    <input type="text" name="txtmb" class="form-control" id="inputAddress" placeholder="Mã báo" <%if (mbsl != null) {for (chitietbaobean c : mbsl) { %> value="<%=c.getMabao()%>" <%}} %>>
										    </div>
										    <div class="form-group col-md-4 col-12 col-sm-12">
											    <label for="inputState">Loại báo:</label>
										    	<select id="inputState" class="form-control" name="txtml">
											    	<% for (loaibean l : loai) { %>
												            <option value="<%= l.getMaloai() %>" 
												                <% if (mbsl != null) { 
												                    for (chitietbaobean ct : mbsl) { 
												                        if (l.getMaloai().equals(ct.getMaloai())) { %>
												                            selected="selected"
												                        <% }
												                    }
												                } %>
												            >
												                <%= l.getTenloai() %>
												            </option>
												        <% } %>
										    	</select>
										    </div>
										    <div class="form-group col-md-4 col-12 col-sm-12">
											    <label for="inputState">Tác giả:</label>
											    <select id="inputState" class="form-control" name="txtmtg">
											        <% for (tacgiabean t : tg) { %>
											            <option value="<%= t.getMatacgia() %>" 
											                <% if (mbsl != null) { 
											                    for (chitietbaobean ct : mbsl) { 
											                        if (t.getMatacgia()==ct.getMatacgia()) { %>
											                            selected="selected"
											                        <% }
											                    }
											                } %>
											            >
											                <%= t.getTentacgia() %>
											            </option>
											        <% } %>
											    </select>
											</div>
										</div>
								    	<div class="form-group">
										    <label for="inputAddress">Tiêu đề:</label>
										    <input type="text" name="txttieude" required class="form-control" id="inputAddress" placeholder="Tiêu đề" <%if (mbsl != null) {for (chitietbaobean c : mbsl) { %> value="<%=c.getTieude()%>" <%}} %>>
									  	</div>
									    <div class="form-group">
										    <label for="inputEmail4">Ảnh bìa:</label>
										    <input type="file" name="txtanhbia" required class="form-control" id="inputEmail4" <%if (mbsl != null) {for (chitietbaobean c : mbsl) { %> value="<%=c.getAnhbia()%>" <%}} %>>
									    </div>
									  	<div class="form-group">
										    <label for="comment">Mô tả:</label>
		      								<%if (mbsl != null) {
		      										for (chitietbaobean c : mbsl) {
		      								%>
		      								<textarea class="form-control" required rows="5" id="comment" name="txtmota"><%=c.getMota() %></textarea>
		      								<%}} else {  %>
		      								<textarea class="form-control" required rows="5" id="comment" name="txtmota"></textarea>
											<%} %>
										</div>
								    </div>
								    <div class="form-group col-md-6 col-12 col-sm-12">
								    	<div class="form-group">
										    <label for="comment">Nội dung:</label>
										    <%if (mbsl != null) {
		      										for (chitietbaobean c : mbsl) {
		      								%>
		      								<textarea class="form-control" required cols="20" rows="20" id="editor" name="txtnd" style="min-height: 391px"><%=c.getNoidung() %></textarea>
		      								<%}} else {  %>
		      								<textarea id="editor" name="txtnd" required cols="20" rows="20"></textarea>
											<%} %>
										</div>
								    </div>
								</div>
								<p class="font-weight-bold text-danger">* Thêm báo không cần nhập mã báo</p>
						  		<div class="text-center">
						  			<button type="submit" name="them" value="1" class="btn-lg btn btn-primary">Thêm</button>
						  			<button type="submit" name="capnhat" value="1" class="btn-lg btn btn-primary">Cập nhật</button>
						  		</div>
							</form>
						</div>
					</div>
				</div>
				<div class="container-fluid pt-4">
				    <div class="row">
				        <div class="col-md-12 col-sm-12 col-12 text-center">
				            <h1 class="text-center">Danh sách báo</h1>
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
				                                <th>Tên tác giả</th>
				                                <th style="min-width: 91px">Sửa/Xóa</th>
				                            </tr>
				                        </thead>
				                        <tbody>
				                            <%
				                                for (chitietbaobean bao: ds) {
				                            %>
				                            <tr>
				                                <td><%=bao.getMabao() %></td>
				                                <td><%=bao.getTenloai() %></td>
				                                <td><%=bao.getTieude() %></td>
				                                <td><%=bao.getMota() %></td>
				                                <td><%=bao.getNoidung() %></td>
				                                <td><img alt="" src="<%=bao.getAnhbia() %>" style="width:100%;"></td>
				                                <td><%=bao.getNgayxuatban() %></td>
				                                <td><%=bao.getTentacgia() %></td>
				                                <td>
				                                    <a href="xoasuabaoController?mbsl=<%=bao.getMabao()%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-pen-to-square"></i></a>
				                                    <a href="xoasuabaoController?mb=<%=bao.getMabao()%>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-trash-can"></i></a>
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
			</div>
	<%} else if(loai !=null) { %>
			<div style="padding-top:100px;">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-12 col-lg-12 col-sm-12 text-center">
			                <h1>Quản lý loại</h1>
			            </div>
			            <%
			               	if (tb1 != null) {
			            %>
			              		<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Thêm thể loại thành công!</strong>
								   </div>
							    </div>
					   <%}else if (tb2 != null) { %>
					   			<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Tên thể loại đã được sửa!</strong>
								   </div>
							    </div>
						<%}else if (tb3 != null){ %>
								<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Xóa thể loại thành công!</strong>.
								   </div>
							    </div>
						<%}else if (tb4 != null){ %>
								<div class="col-md-12 text-center">
					               <div class="alert alert-danger mt-2">
								   		<strong>Mã thể loại đã tồn lại!</strong>.
								   </div>
							    </div>
						<%} %>
			            <div class="col-md-6 mx-auto d-block">
			                <form action="xoasualoaiController" method="post">
			                    <div class="form-row">
			                        <div class="form-group col-md-6">
			                            <label for="inputEmail4">Mã loại</label>
			                            <input type="text" name="txtml" required class="form-control" id="inputEmail4" placeholder="Mã loại" <%if (mlsl!=null) {for(loaibean l: mlsl){ %>value="<%=l.getMaloai() %> <%}}%>">
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="inputPassword4">Tên loại</label>
			                            <input type="text" required name="txttl" class="form-control" id="inputPassword4" placeholder="Tên loại" <%if (mlsl!=null) {for(loaibean l: mlsl){ %>value="<%=l.getTenloai() %> <%}}%>">
			                        </div>
			                    </div>
			                    <div class="text-center">
			                        <button type="submit" name="them" value="1" class="btn btn-primary">Thêm</button>
			                        <button type="submit" name="capnhat" value="1" class="btn btn-primary">Cập nhật</button>
			                    </div>
			                </form>
			            </div>
			            <div class="col-md-12 text-center pt-4">
			                <h1 class="text-center">Danh sách loại báo</h1>
			                <div class="table-responsive">
			                    <table class="table table-bordered">
			                        <thead>
			                            <tr>
			                                <th>Mã loại báo</th>
			                                <th>Tên loại báo</th>
			                                <th>Sửa/Xóa</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <%for (loaibean l: loai) { %>
			                                <tr>
			                                    <td><%=l.getMaloai() %></td>
			                                    <td><%=l.getTenloai() %></td>
			                                    <td>
			                                        <a href="xoasualoaiController?mlsl=<%=l.getMaloai()%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-pen-to-square"></i></a>
			                                        <a href="xoasualoaiController?ml=<%=l.getMaloai()%>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-trash-can"></i></a>
			                                    </td>
			                                </tr>
			                            <%} %>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
    <% } else if(tg !=null) { %>
	    	<div style="padding-top:100px;">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-12 col-lg-12 col-sm-12 text-center">
			                <h1>Quản lý tác giả</h1>
			            </div>
			            <%
			               	if (tb1 != null) {
			            %>
			              		<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Thêm tác giả thành công!</strong>
								   </div>
							    </div>
					   <%}else if (tb2 != null) { %>
					   			<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Tên tác giả đã được sửa!</strong>
								   </div>
							    </div>
						<%}else if (tb3 != null){ %>
								<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Xóa tác giả thành công!</strong>.
								   </div>
							    </div>
						<%} %>
			            <div class="col-md-6 mx-auto d-block">
			                <form action="xoasuatgController" method="post">
			                    <div class="form-row">
			                        <div class="form-group col-md-6">
			                            <label for="inputEmail4">Mã tác giả</label>
			                            <input type="text" name="txtmtg" class="form-control" id="inputEmail4" placeholder="Mã tác giả" <%if(mtgsl!=null) {for (tacgiabean t: mtgsl) { %> value="<%=t.getMatacgia() %>" <% }}%>>
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="inputPassword4">Tên tác giả</label>
			                            <input type="text" name="txtttg" required class="form-control" id="inputPassword4" placeholder="Tên tác giả" <%if(mtgsl!=null){for(tacgiabean t: mtgsl) { %> value="<%= t.getTentacgia() %>" <%}} %>>
			                        </div>
			                    </div>
			                    <p class="font-weight-bold text-danger">* Thêm tác giả không cần nhập mã tác giả</p>
			                    <div class="text-center">
			                        <button type="submit" name="them" value="1" class="btn btn-primary">Thêm</button>
			                        <button type="submit" name="capnhat" value="1" class="btn btn-primary">Cập nhật</button>
			                    </div>
			                </form>
			            </div>
			            <div class="col-md-12 text-center pt-4">
			                <h1 class="text-center">Danh sách tác giả</h1>
			                <div class="table-responsive">
			                    <table class="table table-bordered">
			                        <thead>
			                            <tr>
			                                <th>Mã tác giả</th>
			                                <th>Tên tác giả</th>
			                                <th>Sửa/Xóa</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <%for (tacgiabean t: tg) { %>
			                                <tr>
			                                    <td><%=t.getMatacgia() %></td>
			                                    <td><%=t.getTentacgia() %></td>
			                                    <td>
			                                        <a href="xoasuatgController?mtgsl=<%=t.getMatacgia()%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-pen-to-square"></i></a>
			                                        <a href="xoasuatgController?mtg=<%=t.getMatacgia()%>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-trash-can"></i></a>
			                                    </td>
			                                </tr>
			                            <%} %>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<% } else if(nd !=null) { %>
	    	<div style="padding-top:100px;">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-12 col-lg-12 col-sm-12 text-center">
			                <h1>Quản lý người đọc</h1>
			            </div>
			            <%
			               	if (tb1 != null) {
			            %>
			              		<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Thêm người đọc thành công!</strong>
								   </div>
							    </div>
					   <%}else if (tb2 != null) { %>
					   			<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Thông tin người đọc đã được sửa!</strong>
								   </div>
							    </div>
						<%}else if (tb3 != null){ %>
								<div class="col-md-12 text-center">
					               <div class="alert alert-success mt-2">
								   		<strong>Xóa người đọc thành công!</strong>
								   </div>
							    </div>
						<%}else if (tb4 != null){ %>
								<div class="col-md-12 text-center">
					               <div class="alert alert-danger mt-2">
								   		<strong>Tài khoản đã tồn lại!</strong> Vui lòng đổi tài khoản khác.
								   </div>
							    </div>
						<%} %>
			            <div class="col-md-6 mx-auto d-block">
			                <form action="xoasuandController" method="post">
			                    <div class="form-group">
		                            <label for="txtmand">Mã người đọc:</label>
		                            <input name="txtmnd" type="text" class="form-control mt-1" placeholder="Nhập mã người đọc"<%if (mndsl != null) {for (nguoidocbean n : mndsl) { %> value="<%=n.getManguoidoc()%>" <%}} %>>
		                        </div>
		                        <div class="form-group">
		                            <label for="txtht">Họ tên:</label>
		                            <input name="txtht" type="text" required class="form-control mt-1" placeholder="Nhập tên người đọc"<%if (mndsl != null) {for (nguoidocbean n : mndsl) { %> value="<%=n.getHoten()%>" <%}} %>>
		                        </div>
		                        <div class="form-group">
		                            <label for="txtemail">Email:</label>
		                            <input name="txtemail" type="email" required class="form-control mt-1" placeholder="Nhập email"<%if (mndsl != null) {for (nguoidocbean n : mndsl) { %> value="<%=n.getEmail()%>" <%}} %>>
		                        </div>
		                        <div class="form-group">
		                            <label for="txttk">Tài khoản:</label>
		                            <input name="txttk" type="text" required class="form-control mt-1" placeholder="Nhập tên đăng nhập"<%if (mndsl != null) {for (nguoidocbean n : mndsl) { %> value="<%=n.getTaikhoan()%>" <%}} %>>
		                        </div>
		                        <div class="form-group">
		                            <label for="txtmk">Mật khẩu:</label>
		                            <input name="txtmk" type="text" required class="form-control mt-1" placeholder="Nhập mật khẩu"<%if (mndsl != null) {for (nguoidocbean n : mndsl) { %> value="<%=n.getMatkhau()%>" <%}} %>>
		                        </div>
		                        <p class="font-weight-bold text-danger">* Thêm người đọc không cần nhập mã người đọc</p>
			                    <div class="text-center">
			                        <button type="submit" name="them" value="1" class="btn btn-primary">Thêm</button>
			                        <button type="submit" name="capnhat" value="1" class="btn btn-primary">Cập nhật</button>
			                    </div>
			                </form>
			            </div>
			            <div class="col-md-12 text-center pt-4">
			                <h1 class="text-center">Danh sách người đọc</h1>
			                <div class="table-responsive">
			                    <table class="table table-bordered">
			                        <thead>
			                            <tr>
			                                <th>Mã người đọc</th>
			                                <th>Họ tên</th>
			                                <th>Email</th>
			                                <th>Tài khoản</th>
			                                <th>Mật khẩu đã được mã hóa</th>
			                                <th style="min-width: 91px;">Sửa/Xóa</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <%for (nguoidocbean n : nd) { %>
			                                <tr>
			                                    <td><%=n.getManguoidoc() %></td>
			                                    <td><%=n.getHoten() %></td>
			                                    <td><%=n.getEmail() %></td>
			                                    <td><%=n.getTaikhoan() %></td>
			                                    <td><%=n.getMatkhau() %></td>
			                                    <td>
			                                        <a href="xoasuandController?mndsl=<%=n.getManguoidoc()%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-pen-to-square"></i></a>
			                                        <a href="xoasuandController?mndx=<%=n.getManguoidoc()%>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span><i class="fa-regular fa-trash-can"></i></a>
			                                    </td>
			                                </tr>
			                            <%} %>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
    <%} else { %>
    	<p>Không có dữ liệu</p>
    <%} %>
<script>
	CKEDITOR.replace( 'editor' );
</script> 
</body>
</html>