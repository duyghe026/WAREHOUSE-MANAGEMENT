<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Thêm Nhân Viên</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÊM NHÂN
					VIÊN</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/nhanvien/insert" modelAttribute="nhanVien" method="post">
						<div class="two fields">
							<div class="field">
								<label>Họ</label>
								<div class="field">
									<form:input path="ho" />
								</div>
							</div>
							<div class="field">
								<label>Tên</label>
								<div class="field">
									<form:input path="ten" />
								</div>
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>Địa chỉ </label>
								<form:input path="diaChi" />
							</div>
							<div class="field">
								<label>Ngày Sinh </label>
								<form:input path="ngaySinh" type="date" required="required" />
							</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>SĐT </label>
								<form:input path="sdt" />
							</div>
							<div class="field">
								<label>CMND </label>
								<form:input path="cmnd" />
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="mail icon"></i>
								<form:input type="email" path="email" placeholder="Email" />
							</div>
						</div>
						<div class="field">
							<div class="three fields">
								<div class="field">
									<label>Giới Tính</label>
									<form:select path="gioiTinh">
										<form:option value="1">Nam</form:option>
										<form:option value="0">Nữ</form:option>
									</form:select>
								</div>
								<div class="field">
									<label>Chức Vụ</label>
									<form:select path="chucVu.maCV" items="${dsChucVu}" itemValue="maCV"
										itemLabel="tenCV" />
								</div>
								<div class="field">
									<label>Tình Trạng</label>
									<form:select path="tinhTrang">
										<form:option value="1">Còn Làm</form:option>
										<form:option value="0">Nghỉ Việc</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<div>
							<button class="ui green button" type="submit">
								<i class="plus icon"></i>Thêm
							</button>
							<a href="admin/nhanvien/index">
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