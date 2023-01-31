<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Xuất Hàng</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">XUẤT HÀNG</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table id="mytable2" class="ui blue table">
						<thead>
							<tr>
								<th>Mã Số Đơn Đặt Hàng</th>
								<th>Ngày</th>
								<th>Nhân Viên</th>
								<th>Tổng Tiền</th>
								<th>Tình Trạng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsDonDatHang}">
								<tr>
									<td>${u.maDDH}</td>
									<td>${u.ngay}</td>
									<td>${u.nhanVien.fullName}</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.tongTien}" /> đ</td>
									<td>${u.tinhTrangString}</td>
									<td>
										<c:if test="${u.tinhTrang == 1}"><a href="admin/xuat/insert/${u.maDDH}"><button
													class="ui blue basic button"></i>Xuất Hàng
												</button></a></c:if>
										<c:if test="${u.tinhTrang == 2}"><a
												href="admin/dondathang/hoadon/${u.maDDH}"><button
													class="ui blue basic button">Hóa Đơn
												</button></a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>