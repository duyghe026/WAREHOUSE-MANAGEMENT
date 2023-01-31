<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Đơn Đặt Hàng</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">QUẢN LÝ ĐƠN ĐẶT HÀNG</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table id="example" class="ui blue table">
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
									<td><a href="admin/dondathang/detail/${u.maDDH}"><button
												class="ui pink basic button">
												<i class="file alternate outline icon"></i>Xem Chi Tiết
											</button></a>
										<c:if test="${u.tinhTrang == 2 || u.tinhTrang == 3}"><a
												href="admin/dondathang/hoadon/${u.maDDH}"><button
													class="ui blue basic button">Hóa Đơn
												</button></a>
										</c:if>
										<c:if test="${u.tinhTrang == 2}"><a
												href="admin/dondathang/xacnhan/${u.maDDH}"><button
													class="ui green basic button"></i>Đã Nhận
												</button></a></c:if>
										<c:if test="${u.tinhTrang == 1 || u.tinhTrang == 2}"><a
												href="admin/dondathang/huy/${u.maDDH}"><button
													class="ui red basic button"></i>Hủy
												</button></a></c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/dondathang/insert"><button class="ui green button">
							<i class="plus icon"></i>Thêm
						</button></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		var table = $('#example').DataTable({
			dom: 'Bfrtip',
			buttons: [{
				extend: 'excelHtml5',
				exportOptions: {
					columns: [0, 1, 2, 3, 4]
				}
			}],
			"order": [
				[0, "desc"]
			],
			"lengthMenu": [
				[5, 10, 20, -1],
				[5, 10, 20, "All"]
			],
			language: {
				url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json'
			},
		});
	</script>
</body>

</html>