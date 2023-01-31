<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<title>FrontendFunn - Semantic UI - Sample Admin Dashboard
		Template</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<link rel="stylesheet" charset="utf8"
		href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
		integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />
	<link rel="stylesheet" charset="utf8"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
		integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ=" crossorigin="anonymous" />
	<link rel="stylesheet" type="text/css" charset="utf8"
		href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" charset="utf8"
		href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>
<style type="text/css">
	@import url("https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap");

	:root {
		- -tablet: 768px;
		- -smallMonitor: 992px;
		- -largeMonitor: 1200px;
		- -font-family: 'Open Sans', sans-serif;
	}

	body {
		font-family: var(- -font-family) !important;
	}

	body ::-webkit-scrollbar {
		width: 6px;
	}

	.ui.vertical.menu.sidebar-menu {
		margin-top: 0px !important;
		max-height: calc(100% - 0px) !important;
		height: calc(100% - 0px) !important;
	}

	.ui.vertical.menu.sidebar-menu .item i.icon {
		float: left;
		margin: 0em 0.5em 0em 0em;
	}

	.main-content {
		margin-top: 40px;
	}

	@media (min-width : 768px) {
		.ui.vertical.menu.sidebar-menu {
			visibility: visible;
			-webkit-transform: translate3d(0, 0, 0);
			transform: translate3d(0, 0, 0);
			width: 15rem !important;
		}

		.main-content {
			margin-left: 15rem;
		}

		.sidebar-menu-toggler {
			display: none !important;
		}
	}
</style>

<body>
	<!-- sidebar -->
	<div class="ui sidebar inverted vertical menu sidebar-menu" id="sidebar">
		<div class="item">
			<div class="header">QUẢN LÝ KHO HÀNG</div>
		</div>
		<c:if
			test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 2 || current.nhanVien.chucVu.maCV == 4}">
			<a href="admin/hanghoa/index" class="item">
				<div>
					<i class="boxes icon"></i> Sản Phẩm
				</div>
			</a></c:if>
		<c:if
			test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 2 || current.nhanVien.chucVu.maCV == 4}">
			<a href="admin/dondathang/index" class="item">
				<div>
					<i class="cart arrow down icon"></i> Đơn Hàng
				</div>
			</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 4}"><a
				href="admin/nhanvien/index" class="item">
				<div>
					<i class="user icon"></i> Nhân Viên
				</div>
			</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1}"><a href="admin/taikhoan/index" class="item">
				<div>
					<i class="address card outline icon"></i> Tài khoản
				</div>
			</a></c:if>
		<c:if
			test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 4 || current.nhanVien.chucVu.maCV == 5}">
			<a href="admin/nhacungcap/index" class="item">
				<div>
					<i class="icon building"></i> Nhà Cung Cấp
				</div>
			</a></c:if>
		<c:if
			test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 4 || current.nhanVien.chucVu.maCV == 2}">
			<a href="admin/daily/index" class="item">
				<div>
					<i class="icon building"></i> Đại Lý
				</div>
			</a>
		</c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 5}">
			<a href="admin/nhap/index" class="item">
				<div>
					<i class="icon truck icon"></i> Nhập Hàng
				</div>
			</a>
		</c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 5}"><a
				href="admin/xuat/index" class="item">
				<div>
					<i class="icon truck icon"></i> Xuất Hàng
				</div>
			</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1}"><a href="admin/doanhso" class="item">
				<div>
					<i class="icon chart line"></i> Thống Kê Doanh Thu
				</div>
			</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1}"><a href="admin/doanhthu" class="item">
				<div>
					<i class="icon chart line"></i> Thống Kê Hàng Hóa
				</div>
			</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1}"><a href="admin/top10" class="item">
				<div>
					<i class="icon chart line"></i> Top 10 Sản Phẩm
				</div>
			</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1}"><a href="admin/loinhuan" class="item">
        		<div>
        			<i class="icon chart line"></i> Lợi Nhuận
        		</div>
        	</a></c:if>
		<c:if test="${current.nhanVien.chucVu.maCV == 1 || current.nhanVien.chucVu.maCV == 5}"><a
				href="admin/hanghoa/kho" class="item">
				<div>
					<i class="icon warehouse line"></i> Kiểm kho
				</div>
			</a></c:if>
	</div>

	<!-- sidebar -->
	<!-- top nav -->

	<nav class="ui top fixed inverted menu">
		<div class="left menu">
			<a href="#" class="sidebar-menu-toggler item" data-target="#sidebar">
				<i class="sidebar icon"></i>
			</a> <a href="#" class="header item"> Semantic UI </a>
		</div>

		<div class="right menu">
			<div class="ui dropdown item">
				<i class="user cirlce icon"></i>
				<div class="menu">
					<a href="taikhoan" class="item"> <i class="info circle icon"></i>
						Tài Khoản
					</a> <a href="logout" class="item"> <i class="sign-out icon"></i> Đăng Xuất
					</a>
				</div>
			</div>
		</div>
	</nav>

</body>

</html>