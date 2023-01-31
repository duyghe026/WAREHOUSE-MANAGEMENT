<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>THÊM PHIẾU NHẬP</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÊM PHIẾU NHẬP</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/nhap/excel" method="post" enctype="multipart/form-data">
						<div class="field">
							<label>Chọn File</label> <input type="file" name="file">
						</div>
						<div class="field">
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm
							</button>
							<a href="admin/nhap/index">
								<div class="ui button">Trở
									Lại</div>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>