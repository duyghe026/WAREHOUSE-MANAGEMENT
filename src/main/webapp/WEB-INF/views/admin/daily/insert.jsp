<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Thêm Đại Lý</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÊM ĐẠI LÝ</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/daily/insert" modelAttribute="daiLy">
						<div class="field">
							<label>Mã Số Thuế</label>
							<form:input path="mst" type="number" />
						</div>
						<div class="field">
							<label>Tên Đại Lý</label>
							<form:input path="tenDL" />
						</div>
						<div class="field">
							<label>Địa chỉ </label>
							<form:input path="diaChi" />
						</div>
						<div class="field">
							<label>Số Điện Thoại</label>
							<form:input path="sdt" type="number" />
						</div>
						<div class="field">
							<button class="ui button">Thêm</button>
							<a href="admin/daily/index">
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