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
  <link rel="stylesheet" href="styleThi.css">
</head>
<body>
	<%
	loaibo lbo = new loaibo(); 
	baobo bbo = new baobo();
	tacgiabo tgbo = new tacgiabo();
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
	                <li class="nav-item active"><a class="nav-link text-white" href="adminController">Trang chủ</a></li>
	                <li class="nav-item active"><a class="nav-link text-white" href="adminqlController?bao=1">Quản lý báo</a></li>
	                <li class="nav-item active"><a class="nav-link text-white" href="adminqlController?loai=1">Loại báo</a></li>
	                <li class="nav-item active"><a class="nav-link text-white" href="adminqlController?tg=1">Tác giả</a></li>
	                <li class="nav-item active"><a class="nav-link text-white" href="adminthongkeController">Thống kê</a></li>
	            </ul>
	            <form class="form-inline my-2 my-lg-0 mx-auto" action="adminController" method="post">
	                <div class="input-group">
	                    <input class="form-control" type="text" name="txttk" placeholder="Tìm kiếm" aria-label="Search">
	                    <div class="input-group-append">
	                        <button class="btn text-white" type="submit" style="border-color:white">Tìm</button>
	                    </div>
	                </div>
	            </form>
	            <ul class="navbar-nav ">
	                <%
	                  adminbean dn = (adminbean)session.getAttribute("dn");
	                  if (dn != null) {
	                %>
	                <li class="nav-item "><a class="nav-link text-white" href="#">Xin chào <%= dn.getTaikhoanadmin() %></a></li>
	                <li class="nav-item"><a class="nav-link text-white" href="dangxuatController"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
	                <% } else { %>
	                <li class="nav-item"><a href="dangnhapController" class="nav-link text-white">Đăng nhập</a></li>
	                <li class="nav-item"><a href="dangkyController" class="nav-link text-white">Đăng Ký</a></li>
	                <% }; %>
	            </ul>
        	</div>
    	</div>
	</nav>
	<%
		ArrayList<chitietbaobean> ds = (ArrayList<chitietbaobean>)request.getAttribute("ctbao");
		ArrayList<chitietbaobean> mbsl = (ArrayList<chitietbaobean>)request.getAttribute("mbsl");
		ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
		ArrayList<loaibean> mlsl = (ArrayList<loaibean>) request.getAttribute("mlsl");
		ArrayList<tacgiabean> tg = (ArrayList<tacgiabean>)request.getAttribute("dstacgia");
		ArrayList<tacgiabean> mtgsl = (ArrayList<tacgiabean>)request.getAttribute("mtgsl");
		if(ds !=null) { 
	%>
			<div class="pt-4">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-12 text-center">
							<h1>Quản lý báo</h1>
						</div>
						<div class="col-md-12 col-sm-12 col-12">
							<form action="xoasuabaoController" method="post" enctype= "multipart/form-data">
								<div class="form-row">
								    <div class="form-group col-md-6 col-12 col-sm-12">
										<div class="form-row">
											<div class="form-group col-md-4 col-12 col-sm-12">
											    <label for="inputState">Mã báo</label>
											    <input type="text" name="txtmb" class="form-control" id="inputAddress" placeholder="Mã báo" <%if (mbsl != null) {for (chitietbaobean c : mbsl) { %> value="<%=c.getMabao()%>" <%}} %>>
										    </div>
										    <div class="form-group col-md-4 col-12 col-sm-12">
											    <label for="inputState">Loại báo</label>
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
											    <label for="inputState">Tác giả</label>
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
										    <label for="inputAddress">Tiêu đề</label>
										    <input type="text" name="txttieude" class="form-control" id="inputAddress" placeholder="Tiêu đề" <%if (mbsl != null) {for (chitietbaobean c : mbsl) { %> value="<%=c.getTieude()%>" <%}} %>>
									  	</div>
									    <div class="form-group">
										    <label for="inputEmail4">Ảnh bìa</label>
										    <input type="file" name="txtanhbia" class="form-control" id="inputEmail4" <%if (mbsl != null) {for (chitietbaobean c : mbsl) { %> value="<%=c.getAnhbia()%>" <%}} %>>
									    </div>
									  	<div class="form-group">
										    <label for="comment">Mô tả:</label>
		      								<%if (mbsl != null) {
		      										for (chitietbaobean c : mbsl) {
		      								%>
		      								<textarea class="form-control" rows="5" id="comment" name="txtmota"><%=c.getMota() %></textarea>
		      								<%}} else {  %>
		      								<textarea class="form-control" rows="5" id="comment" name="txtmota"></textarea>
											<%} %>
										</div>
								    </div>
								    <div class="form-group col-md-6 col-12 col-sm-12">
								    	<div class="form-group">
										    <label for="comment">Nội dung:</label>
										    <%if (mbsl != null) {
		      										for (chitietbaobean c : mbsl) {
		      								%>
		      								<textarea class="form-control" rows="5" id="comment" name="txtnd" style="min-height: 391px"><%=c.getNoidung() %></textarea>
		      								<%}} else {  %>
		      								<textarea class="form-control" rows="5" id="comment" name="txtnd" style="min-height: 391px"></textarea>
											<%} %>
										</div>
								    </div>
								</div>
						  		<div class="text-center">
						  			<button type="submit" name="them" value="1" class="btn btn-primary">Thêm</button>
						  			<button type="submit" name="capnhat" value="1" class="btn btn-primary">Cập nhật</button>
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
				                                <th>Mô tả</th>
				                                <th style="max-width: 600px">Nội dung</th>
				                                <th>Ảnh bìa</th>
				                                <th>Ngày xuất bản</th>
				                                <th>Tên tác giả</th>
				                                <th style="min-width: 91px"></th>
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
				                                <td><%=bao.getAnhbia() %></td>
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
			<div class="pt-4">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-12 col-lg-12 col-sm-12 text-center">
			                <h1>Quản lý loại</h1>
			            </div>
			            <div class="col-md-6 mx-auto d-block">
			                <form action="xoasualoaiController" method="post">
			                    <div class="form-row">
			                        <div class="form-group col-md-6">
			                            <label for="inputEmail4">Mã loại</label>
			                            <input type="text" name="txtml" class="form-control" id="inputEmail4" placeholder="Mã loại" <%if (mlsl!=null) {for(loaibean l: mlsl){ %>value="<%=l.getMaloai() %> <%}}%>">
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="inputPassword4">Tên loại</label>
			                            <input type="text" name="txttl" class="form-control" id="inputPassword4" placeholder="Tên loại" <%if (mlsl!=null) {for(loaibean l: mlsl){ %>value="<%=l.getTenloai() %> <%}}%>">
			                        </div>
			                    </div>
			                    <div class="text-center">
			                        <button type="submit" name="them" value="1" class="btn btn-primary">Thêm</button>
			                        <button type="submit" name="capnhat" value="1" class="btn btn-primary">Cập nhật</button>
			                    </div>
			                </form>
			            </div>
			            <div class="col-md-12 text-center">
			                <h1 class="text-center">Danh sách loại báo</h1>
			                <div class="table-responsive">
			                    <table class="table table-bordered">
			                        <thead>
			                            <tr>
			                                <th>Mã loại báo</th>
			                                <th>Tên loại báo</th>
			                                <th></th>
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
	    	<div class="pt-4">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-12 col-lg-12 col-sm-12 text-center">
			                <h1>Quản lý tác giả</h1>
			            </div>
			            <div class="col-md-6 mx-auto d-block">
			                <form action="xoasuatgController" method="post">
			                    <div class="form-row">
			                        <div class="form-group col-md-6">
			                            <label for="inputEmail4">Mã tác giả</label>
			                            <input type="text" name="txtmtg" class="form-control" id="inputEmail4" placeholder="Mã tác giả" <%if(mtgsl!=null) {for (tacgiabean t: mtgsl) { %> value="<%=t.getMatacgia() %>" <% }}%>>
			                        </div>
			                        <div class="form-group col-md-6">
			                            <label for="inputPassword4">Tên tác giả</label>
			                            <input type="text" name="txtttg" class="form-control" id="inputPassword4" placeholder="Tên tác giả" <%if(mtgsl!=null){for(tacgiabean t: mtgsl) { %> value="<%= t.getTentacgia() %>" <%}} %>>
			                        </div>
			                    </div>
			                    <div class="text-center">
			                        <button type="submit" name="them" value="1" class="btn btn-primary">Thêm</button>
			                        <button type="submit" name="capnhat" value="1" class="btn btn-primary">Cập nhật</button>
			                    </div>
			                </form>
			            </div>
			            <div class="col-md-12 text-center">
			                <h1 class="text-center">Danh sách tác giả</h1>
			                <div class="table-responsive">
			                    <table class="table table-bordered">
			                        <thead>
			                            <tr>
			                                <th>Mã tác giả</th>
			                                <th>Tên tác giả</th>
			                                <th></th>
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
    <%} else { %>
    	<p>Không có dữ liệu</p>
    <%} %>
</body>
</html>