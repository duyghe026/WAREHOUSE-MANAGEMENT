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
					<form:form class="ui form" action="admin/xuat/insert" method="post" modelAttribute="phieuXuat">
						<div class="field">
							<label>Ngày</label>
							<form:input path="ngayXuat" type="date" />
						</div>
						<div class="field">
							<label>Nhân Viên</label>
							<form:select path="nhanVien.maNV" items="${dsNhanVien}" itemValue="maNV"
								itemLabel="FullName" />
						</div>
						<div class="field">
							<label>Đại Lý</label>
							<form:select path="daiLy.maDL" items="${dsDaiLy}" itemValue="maDL" itemLabel="tenDL" />
						</div>
						<div>
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm Chi Tiết Phiếu Nhập
							</button>
							${message}
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>