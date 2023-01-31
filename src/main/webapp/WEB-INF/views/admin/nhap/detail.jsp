<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Chi Tiết Phiếu Nhập</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">CHI TIẾT PHIẾU NHẬP</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table id="example" class="ui blue table">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Loại</th>
								<th>Số Lượng</th>
								<th>Đơn Giá</th>
								<th>Tổng Giá</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${phieuNhap.dsCTPhieuNhap}">
								<tr>
									<td>${u.hangHoa.maHangHoa}</td>
									<td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.hangHoa.ten}</td>
									<td>${u.hangHoa.theLoai.tenLoai}</td>
									<td>${u.soLuong}</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.gia}" /> đ</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.gia * u.soLuong}" /> đ</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<h5 class="ui right header" style="margin-top: 20px"> TỔNG TIỀN :
						<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
							value="${phieuNhap.tongTien}" /> đ
					</h5>
					<a href="admin/nhap/index"><button class="ui button">Trở
							Lại</button></a>
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
			"order": [
				[0, "asc"]
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