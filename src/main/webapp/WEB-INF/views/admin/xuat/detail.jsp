<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
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
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/xuat/index"><button class="ui button">Trở
							Lại</button></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>