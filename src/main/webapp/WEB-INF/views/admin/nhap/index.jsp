<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>PHIẾU NHẬP</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">QUẢN LÝ PHIẾU NHẬP</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table id="example" class="ui blue table">
						<thead>
							<tr>
								<th>Mã Phiếu Nhập</th>
								<th>Ngày</th>
								<th>Nhân Viên</th>
								<th>Nhà Cung Cấp</th>
								<th>Tình Trạng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsPhieuNhap}">
								<tr>
									<td>${u.maPN}</td>
									<td>${u.ngayNhap}</td>
									<td>${u.nhanVien.fullName}</td>
									<td>${u.nhaCungCap.tenNCC}</td>
									<td>${u.tinhTrang==false?'Chưa nhận':'Đã nhận'}</td>
									<td><a href="admin/nhap/detail/${u.maPN}"><button class="ui pink basic button">
												<i class="file alternate outline icon"></i>Xem Chi Tiết
											</button></a>
										<c:if test="${u.tinhTrang == false}"><a
												href="admin/nhap/xacnhan/${u.maPN}"><button
													class="ui blue basic button"></i>Xác Nhận
												</button></a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/nhap/insert"><button class="ui green button">
							<i class="plus icon"></i>Thêm
						</button></a>
					<a href="admin/nhap/excel"><button class="ui blue button">
							<i class="plus icon"></i>Thêm Bằng File Excel
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