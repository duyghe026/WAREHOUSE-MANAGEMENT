<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Thống Kê Doanh Thu</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load("current", {
			packages: ["corechart"]
		});
		google.charts.setOnLoadCallback(drawChart);

		var tongTien = '${tongTien}';
		var tongTienNhap = '${tongTienNhap}';

		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Đối tượng', 'Tiền'],
				["Tổng chi", Number(tongTienNhap)],
				['Tổng thu', Number(tongTien)]
			]);

			var options = {
				title: 'Biều Đồ Thống Kê Doanh Thu',
				is3D: true,
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
			chart.draw(data, options);
		}
	</script>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THỐNG KÊ DOANH THU</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/doanhso" method="post">
						<div class="field">
							<div class="fields">
								<div class="eight  wide field">
									<label>Từ Ngày</label> <input name="from" type="date" value="${from}" />
								</div>
								<div class="eight  wide field">
									<label>Tới Ngày</label> <input name="to" type="date" value="${to}" />
								</div>
								<div class="four wide field" style="margin-top: 25px">
									<button class="ui button">Xem Doanh Thu</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<c:if test="${tongTien > 0 && tongTienNhap > 0}">
					<div id="piechart_3d" style="width: 900px; height: 400px;"></div>
				</c:if>

			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTien > 0}">
						<div class="ui massive label">
							<div style="color: red">TỔNG THU:
								<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
									value="${tongTien}" />
								đ
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTien > 0}">
						<table id="mytable" class="ui blue table">
							<thead>
								<tr>
									<th>Mã Số Đơn Đặt Hàng</th>
									<th>Ngày</th>
									<th>Tổng Tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${dsDonDatHang}">
									<tr>
										<td>${u.maDDH}</td>
										<td>${u.ngay}</td>
										<td>
											<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
												value="${u.tongTien}" /> đ</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTienNhap > 0}">
						<div class="ui massive label">
							<div style="color: blue">TỔNG NHẬP:
								<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
									value="${tongTienNhap}" />
								đ
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTienNhap > 0}">
						<table id="mytable2" class="ui blue table">
							<thead>
								<tr>
									<th>Mã Phiếu Nhập</th>
									<th>Ngày</th>
									<th>Tổng Tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${dsPhieuNhap}">
									<tr>
										<td>${u.maPN}</td>
										<td>${u.ngayNhap}</td>
										<td>
											<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
												value="${u.tongTien}" /> đ</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>