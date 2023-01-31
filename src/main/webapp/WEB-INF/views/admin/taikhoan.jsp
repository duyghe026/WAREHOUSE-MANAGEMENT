<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Thông Tin Tài Khoản</title>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÔNG TIN TÀI KHOẢN</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<div class="ui grid stackable padded">
						<div class="column">
							<form:form class="ui form" action="taikhoan/update" modelAttribute="taiKhoan">
								<div class="field">
									<label>Tài Khoản</label>
									<form:input path="username" readonly="true" />
								</div>
								<div class="field">
									<label>Mật Khẩu</label>
									<form:input path="password" required="required" />
								</div>
								<form:input path="active" value="${active}" type="hidden" />
								<form:input path="nhanVien.maNV" value="${nhanVien.maNV}" type="hidden" />
								<div>
									<button class="ui button">Cập nhật</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>

</html>