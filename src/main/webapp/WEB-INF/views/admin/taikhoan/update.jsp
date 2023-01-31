<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Sửa Thể Loại</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">SỬA TÀI KHOẢN</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/taikhoan/update" modelAttribute="taiKhoan">
						<div class="field">
							<label>Username</label>
							<form:input path="username" readonly="true" />
						</div>
						<div class="field">
							<label>Password</label>
							<form:input path="password" />
						</div>
						<div class="field">
							<label>Tên Nhân Viên</label>
							<form:select path="nhanVien.maNV" items="${dsNhanVien}" itemValue="maNV"
								itemLabel="fullName" />
						</div>
						<div class="field">
							<label>Tình Trạng</label>
							<form:select path="active">
								<form:option value="1">Kích Hoạt</form:option>
								<form:option value="0">Ngưng Kích Hoạt</form:option>
							</form:select>
						</div>
						<div class="field">
							<button class="ui button">Cập nhật</button>
							<a href="admin/taikhoan/index">
								<div class="ui button">Trở
									Lại</div>
							</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>