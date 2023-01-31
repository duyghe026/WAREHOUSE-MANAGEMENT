<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Chi Tiết Phiếu Xuất</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/xuat/insertdetail/${maPX}" method="post"
						modelAttribute="CTPX">
						<div class="field">
							<div class="fields">
								<div class="four wide field">
									<label>Hàng Hóa</label>
									<form:select path="hangHoa.maHangHoa" items="${dsHangHoa}" itemValue="maHangHoa"
										itemLabel="ten" />
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
					<table id="mytable" class="ui blue table">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Loại</th>
								<th>Số Lượng</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${phieuXuat.dsCTPhieuXuat}">
								<tr>
									<td>${u.hangHoa.maHangHoa}</td>
									<td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.hangHoa.ten}</td>
									<td>${u.hangHoa.theLoai.tenLoai}</td>
									<td>${u.soLuong}</td>
									<td><a href="admin/xuat/insertdetail/${maPX}/update/${u.hangHoa.maHangHoa}"><button
												class="ui blue button"><i class="edit icon"></i>Sửa
											</button>
											<a href="admin/xuat/insertdetail/${maPX}/delete/${u.hangHoa.maHangHoa}"><button
													class="ui red button"><i class="delete icon"></i>Xóa
												</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="ui right floated button">
						<div class="ui animated fade button" tabindex="0">
							<a href="admin/xuat/index">
								<div class="visible content">
									Lưu</div>
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>