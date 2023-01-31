<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>CHI TIẾT PHIẾU NHẬP</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÊM CHI TIẾT PHIẾU NHẬP</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/nhap/insertdetail/${maPN}" method="post"
						modelAttribute="CTPN">
						<div class="field">
							<div class="fields">
								<div class="four wide field">
									<label>Hàng Hóa</label>
									<form:select class="ui fluid search selection dropdown" path="hangHoa.maHangHoa"
										items="${dsHangHoa}" itemValue="maHangHoa" itemLabel="ten" />
								</div>
								<div class="four wide field">
									<label>Đơn Giá</label>
									<form:input type="number" path="gia" min="1000" />
								</div>
								<div class="four wide field">
									<label>Số Lượng</label>
									<form:input type="number" path="soLuong" min="1" />
								</div>
								<div class="field" style="margin-top: 24px">
									<button class="ui green button">
										<i class="plus icon"></i>Thêm
									</button></a>
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
								<th>Số Lượng</th>
								<th>Tổng Giá</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${phieuNhap.dsCTPhieuNhap}">
								<tr>
									<td>${u.hangHoa.maHangHoa}</td>
									<td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.hangHoa.ten}</td>
									<td>${u.hangHoa.theLoai.tenLoai}</td>
									<td>
                                    	<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                    		value="${u.gia}" /> đ</td>
									<td>${u.soLuong}</td>
									<td>
										<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
											value="${u.gia * u.soLuong}" /> đ</td>
									<td><a href="admin/nhap/insertdetail/${maPN}/update/${u.hangHoa.maHangHoa}"><button
												class="ui blue button"><i class="edit icon"></i>Sửa
											</button>
											<a href="admin/nhap/insertdetail/${maPN}/delete/${u.hangHoa.maHangHoa}"><button
													class="ui red button"><i class="delete icon"></i>Xóa
												</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- <div class="ui right floated button">
						<div class="ui animated fade button" tabindex="0">
							<div class="visible content">Lưu</div>
							<div class="hidden content">
								<a href="admin/nhap/index">
									<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
										value="${phieuNhap.tongTien}" />đ</a>
							</div>
						</div>
					</div> -->
					<h5 class="ui header" style="margin-top: 20px"> TỔNG TIỀN :
						<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
							value="${phieuNhap.tongTien}" /> đ
					</h5>
					<div>
						<a href="admin/nhap/index"><button class="ui green button" type="submit">
								<i class="plus icon"></i>TẠO PHIẾU NHẬP
							</button></a>
						<a href="admin/nhap/xacnhan/${phieuNhap.maPN}"><button class="ui blue button"></i>Xác Nhận
							</button></a>
						<a href="admin/nhap/huy/${phieuNhap.maPN}"><button class="ui red button">
								<i class="delete icon"></i>Hủy
							</button></a>
						<a href="admin/nhap/index"><button class="ui button">Trở
								Lại</button></a>
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