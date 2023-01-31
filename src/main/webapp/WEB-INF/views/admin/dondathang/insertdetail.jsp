<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Chi Tiết Đơn Đặt Hàng</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÊM CHI TIẾT ĐƠN ĐẶT HÀNG</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/dondathang/insertdetail/${maDDH}" method="post"
						modelAttribute="CTDDH">
						<div class="field">
							<div class="fields">
								<div class="four wide field">
									<label>Hàng Hóa</label>
									<form:select class="ui fluid search selection dropdown" path="hangHoa.maHangHoa"
										items="${dsHangHoa}" itemValue="maHangHoa" itemLabel="ten" />
								</div>
								<div class="four wide field">
									<label>Số Lượng</label>
									<form:input type="number" path="soLuong" min="1" />
								</div>
								<div class="field" style="margin-top: 24px">
									<button class="ui green button">
										<i class="plus icon"></i>Thêm
									</button></a>${message}
								</div>
							</div>
						</div>
					</form:form>
				</div>
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
								<th>Đơn Giá</th>
								<th>Giảm Giá</th>
								<th>Số Lượng</th>
								<th>Tổng Giá</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${donDatHang.dsCTDonDatHang}">
								<tr>
									<td>${u.hangHoa.maHangHoa}</td>
									<td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.hangHoa.ten}</td>
									<td>${u.hangHoa.theLoai.tenLoai}</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.hangHoa.gia}" /> đ</td>
									<td>${u.hangHoa.giamGia} %</td>
									<td>${u.soLuong}</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.giaBan * u.soLuong}" /> đ</td>
									<td><a href="admin/dondathang/insertdetail/${maDDH}/update/${u.hangHoa.maHangHoa}"><button
												class="ui blue button"><i class="edit icon"></i>Sửa
											</button>
											<a
												href="admin/dondathang/insertdetail/${maDDH}/delete/${u.hangHoa.maHangHoa}"><button
													class="ui red button"><i class="delete icon"></i>Xóa
												</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- <div class="ui right floated button">
						<div class="ui animated fade button" tabindex="0">
							<div class="visible content">TẠO ĐƠN HÀNG</div>
							<div class="hidden content">
								<a href="admin/dondathang/save/${maDDH}">
									<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
										value="${donDatHang.tongTienTemp}" />
									đ</a>
							</div>
						</div>
					</div> -->
					<h5 class="ui right header" style="margin-top: 20px"> TỔNG TIỀN :
						<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
							value="${donDatHang.tongTienTemp}" /> đ
					</h5>
					<div>
						<a href="admin/dondathang/save/${maDDH}"><button class="ui right green button" type="submit">
								<i class="plus icon"></i>TẠO ĐƠN HÀNG
							</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		var table = $('#example').DataTable({
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