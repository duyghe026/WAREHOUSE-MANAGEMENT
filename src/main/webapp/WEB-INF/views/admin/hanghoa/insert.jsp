<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Thêm Hàng Hóa</title>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<h2 class="ui header" style="margin-top: 20px">THÊM HÀNG HÓA</h2>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<form:form class="ui form" action="admin/hanghoa/insert" method="post" enctype="multipart/form-data"
						modelAttribute="hangHoa">
						<div class="ui two column centered grid">
							<div class="column">
								<label>Tên Hàng Hóa</label>
								<form:input path="ten" />
							</div>
							<div class="column">
								<label>Đơn Giá</label>
								<form:input type="number" path="gia" value="1000" min="1000" />
							</div>
							<div class="column">
								<label>Giảm Giá</label>
								<form:input type="number" path="giamGia" value="0" min="0" max="99" />
							</div>
							<div class="column">
								<label>Hình ảnh</label> <input type="file" name="photo">
							</div>
						</div>
						<div class="ui three column centered grid">
							<div class="column">
								<label>Thể Loại</label>
								<form:select path="theLoai.maLoai" items="${dsLoai}" itemValue="maLoai"
									itemLabel="tenLoai" />
							</div>
							<div class="column">
								<label>Đơn Vị Tính</label>
								<form:select path="dvt">
									<form:option value="LON">LON</form:option>
									<form:option value="CHAI">CHAI</form:option>
									<form:option value="KEN">KEN</form:option>
								</form:select>
							</div>
							<div class="column">
								<label>Tình Trạng</label>
								<form:select path="tinhTrang">
									<form:option value="1">Bán</form:option>
									<form:option value="0">Không Bán</form:option>
								</form:select>
							</div>
						</div>
						<div class="field">
							<label>Mô tả</label>
							<form:textarea path="ghiChu"></form:textarea>
						</div>
						<div>
							<button class="ui button" type="submit">Thêm</button>
							<a href="admin/hanghoa/index">
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