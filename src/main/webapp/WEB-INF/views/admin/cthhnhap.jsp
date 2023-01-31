<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Chi tiết hàng hóa nhập</title>
</head>

<body>
    <jsp:include page="header.jsp" />
    <div class="pusher">
        <div class="main-content">
            <div class="ui grid stackable padded">
                <h2 class="ui header" style="margin-top: 20px">CHI TIẾT CÁC LẦN NHẬP</h2>
            </div>
            <div class="ui grid stackable padded">
                <div class="ui items">
                    <div class="item" style="margin-top: 20px">
                        <a class="ui tiny image">
                            <img src="${hangHoa.anh}" alt="" />
                        </a>
                        <div class="content">
                            <a class="header">Mã Hàng Hóa: ${hangHoa.maHangHoa}</a>
                            <div class="description">
                                <p>Tên Hàng Hóa: ${hangHoa.ten}
                                </p>
                                <p>Loại: ${hangHoa.theLoai.tenLoai}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <table id="mytable2" class="ui blue table">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Ngày</th>
                                <th>Số Lượng</th>
                                <th>Đơn Giá</th>
                                <th>Tổng Giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${dsPhieuNhap}">
                                <tr>
                                    <td>${u.stt}</td>
                                    <td>${u.phieuNhap.ngayNhap}</td>
                                    <td>${u.soLuong}</td>
                                    <td>
                                        <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                            value="${u.gia}" /> đ</td>
                                    <td>
                                        <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                            value="${u.gia * u.soLuong}" /> đ</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="admin/doanhthu"><button class="ui button">Trở
                            Lại</button></a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>

</html>