<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="dangnhap.css">
    <title>Đăng nhập</title>
</head>

<body>

    <div class="container" id="container">
        <div class="">
        	<div class="form-container sign-up">
            <form action="dangkyController" method="post">
                <h1> <strong>Đăng ký</strong></h1>
                <input type="text" name = "txtht" placeholder="Họ tên" required>
                <input type="email" name = "txtemail" placeholder="Email" required>
                <input type="text" name = "txtun" placeholder="Tài khoản" required>
                <input type="password" name = "txtpass" placeholder="Mật khẩu" required>
                <%
                	String tb1 = (String)session.getAttribute("tbdk");
                	if (tb1 != null) {
                %>
                <div class="alert alert-danger">
				    <strong>Đăng ký thất bại! Vui lòng thử lại.</strong>
				</div>
				<%} %>
                <button>Đăng ký</button>
            </form>
        </div>
        <div class="form-container sign-in">
            <form action = "dangnhapController" method = "post">
                <h1> <strong>Đăng nhập</strong></h1>
                <input type="text" name = "txtun" placeholder="Tài khoản">
                <input type="password" name = "txtpass" placeholder="Mật khẩu">
                <div class="form-group mb-3 w-100">
              	 	<input type="text" name="answer" placeholder="Nhập mã CAPTCHA"/><br>
              	  	<img src="simpleCaptcha.jpg" />
                </div>
                <%
                	String tb2 = (String)session.getAttribute("tbdn");
                	if (tb2 != null) {
                %>
                <div class="alert alert-danger">
				    <strong>Đăng nhập thất bại! Vui lòng thử lại.</strong>
				</div>
				<%} %>
                <button>Đăng nhập</button>
            </form>
           
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Welcome Back!</h1>
                    <p>Nhập thông tin cá nhân của bạn để sử dụng tất cả các tính năng của trang web</p>
                    <button class="hidden" id="login">Đăng nhập</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Xin chào!</h1>
                    <p>Đăng ký với thông tin cá nhân của bạn để sử dụng tất cả các tính năng của trang web</p>
                    <button class="hidden" id="register">Đăng ký</button>
                </div>
            </div>
        </div>
        </div>
    </div>
    <script>
	    const container = document.getElementById('container');
	    const registerBtn = document.getElementById('register');
	    const loginBtn = document.getElementById('login');
	
	    registerBtn.addEventListener('click', () => {
	        container.classList.add("active");
	    });
	
	    loginBtn.addEventListener('click', () => {
	        container.classList.remove("active");
	    });
    </script>
</body>

</html>