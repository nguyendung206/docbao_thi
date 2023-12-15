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
/**
 * 
 */