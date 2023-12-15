<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8"); %>

<div class="container" style=" text-align: center;">

		<form method="post" action="themsachController" enctype="multipart/form-data">
			<div class="row" style="width: 30%">
				Mã sách:<input type="text"  name="txtmasach"> 
				Tên sách:<input type="text" name="txttensach">
				Tác giả:<input type="text" name="txttacgia">
				Giá:<input type="text" name="txtgia">
				Số lượng:<input type="text" name="txtsoluong">
				Ngày nhập:<input type="datetime" name="txtngay">
				Ảnh:<input type="file" name="txtfile">
				Số tập:<input type="text" name="txtsotap">
				Mã loại:<select name="txtmaloai">
					<%-- <%
					loaibo lbo = new loaibo();
					for (loaibean sach : lbo.getLoai()) {
					%>
					<option value="<%=sach.getMaloai()%>"><%=sach.getTenloai()%></option>
					<%}%> --%>
				</select><br>
				<button style="" type="submit" name="butadd">Add</button>
				<button style="" type="submit" name="butsave">Save</button>
				
			</div>
			</form>
			<div class="container" style=" text-align: center; ">
			<table class="table ">
						<tr>
							<th>Mã sách</th>
							<th>Tên sách</th>
							<th>Tác giả</th>
							<th>Số lượng</th>
							<th>Ảnh</th>
						</tr>
						<tr>
						<%-- <%sachbo sbo = new sachbo();
							for(sachbean s: sbo.getsach()){
						%>
							<td><%=s.getMasach()%></td>
							<td><%=s.getTensach()%></td>
							<td><%=s.getTacgia()%></td>
							<td><%=s.getSoluong()%></td>
							<td><%=s.getAnh()%></td>
							<td>
								<button type="submit" name="but2" value="">select</button>
							</td>
							<td>
								<a href="themsachController?action=delete&ms=<%=s.getMasach()%>">
									<p>
										<button type="butxoa" class="btn btn-default btn-sm">
											<span class="glyphicon glyphicon-trash"></span> delete
										</button>
									</p>
								</a>
							</td>

						</tr>
						<%} %> --%>
				</table>
				</div>
		
	</div>
</body>
<script>
    		// Khởi tạo CKEditor cho textarea có id là "txtnoidung"
		    CKEDITOR.replace('txtnoidung');
		</script>
</html>