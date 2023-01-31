<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Hàng Hóa</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<style>
</style>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">QUẢN LÝ HÀNG HÓA</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table id="example" class="ui blue table">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th class="filterhead">Thể Loại</th>
								<th></th>
								<th class="filterhead1">Tình Trạng</th>
								<c:if test="${current.nhanVien.chucVu.maCV == 1}">
									<th></th>
								</c:if>
							</tr>
							<tr>
								<th>Mã</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Đơn Giá</th>
								<th>Giảm Giá</th>
								<th>DVT</th>
								<th>Thể Loại</th>
								<th>Số Lượng</th>
								<th>Tình Trạng</th>
								<c:if test="${current.nhanVien.chucVu.maCV == 1}">
									<th></th>
								</c:if>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dshangHoa}">
								<tr>
									<td>${u.maHangHoa}</td>
									<td><img src="${u.anh}" style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.ten}</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.gia}" /> đ</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.giamGia}" />%</td>
									<td>${u.dvt}</td>
									<td>${u.theLoai.tenLoai}</td>
									<td>${u.soLuong}</td>
									<td>${u.tinhTrang==false?'Ngưng Bán':'Đang Bán'}</td>
									<c:if test="${current.nhanVien.chucVu.maCV == 1}">
										<td>
											<a href="admin/hanghoa/update/${u.maHangHoa}"><button
													class="ui blue button"><i class="edit icon"></i>Sửa
												</button></a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${current.nhanVien.chucVu.maCV == 1}">
						<div class="ui grid stackable padded">
							<div class="ui buttons">
								<a href="admin/hanghoa/insert"><button class="ui green button">
										<i class="plus icon"></i>Thêm
									</button></a>
							</div>

							<div class="ui buttons">
								<a href="admin/theloai/index"><button class="ui pink button">
										<i class="archive icon"></i>Loại
									</button></a>
							</div>
						</div>
					</c:if>
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
					columns: [0, 2, 3, 4, 5, 6]
				}
			}],
			"lengthMenu": [
				[5, 10, 20, -1],
				[5, 10, 20, "All"]
			],
			language: {
				url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json'
			},
			initComplete: function () {}
		});
		$(".filterhead").each(function () {
			var select = $('<select><option value="">Tất cả thể loại</option></select>')
				.appendTo($(this).empty())
				.on('change', function () {
					var term = $(this).val();
					table.column(6).search(term, false, false).draw();
				});
			table.column(6).data().unique().sort().each(function (d, j) {
				select.append('<option value="' + d + '">' + d + '</option>')
			});
		});
		$(".filterhead1").each(function () {
			var select = $('<select><option value="">Tất cả tình trạng</option></select>')
				.appendTo($(this).empty())
				.on('change', function () {
					var term = $(this).val();
					table.column(8).search(term, false, false).draw();
				});
			table.column(8).data().unique().sort().each(function (d, j) {
				select.append('<option value="' + d + '">' + d + '</option>')
			});
		});
	</script>
</body>

</html>