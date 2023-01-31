<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Sửa Chức Vụ</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">SỬA CHỨC VỤ</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/chucvu/update" modelAttribute="chucVu">
						<div class="field">
							<label>Mã Chức Vụ</label>
							<form:input path="maCV" readonly="true" />
						</div>
						<div class="field">
							<label>Tên Chức Vụ</label>
							<form:input path="TenCV" />
						</div>
						<div class="field">
							<div>
								<button class="ui button" type="submit">Cập Nhật</button>
								<a href="admin/chucvu/index">
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