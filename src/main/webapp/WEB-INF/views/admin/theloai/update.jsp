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
				<h2 class="ui header" style="margin-top: 20px">SỬA LOẠI SẢN PHẨM</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/theloai/update" modelAttribute="theLoai">
						<div class="field">
							<label>Mã Loại</label>
							<form:input path="maLoai" readonly="true" />
						</div>
						<div class="field">
							<label>Tên Loại</label>
							<form:input path="tenLoai" />

						</div>
						<div class="field">
							<div>
								<button class="ui button" type="submit">Cập Nhật</button>
								<a href="admin/theloai/index">
									<div class="ui button">Trở
										Lại</div>
								</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>