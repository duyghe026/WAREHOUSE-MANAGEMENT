<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Lợi Nhuận</title>
</head>


<body>
    <jsp:include page="header.jsp" />
    <div class="pusher">
        <div class="main-content">
            <div class="ui grid stackable padded">
                <h2 class="ui header" style="margin-top: 20px">LỢI NHUẬN</h2>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <form class="ui form" action="admin/loinhuan" method="post">
                        <div class="field">
                            <div class="fields">
                                <div class="eight  wide field">
                                    <label>Từ Ngày</label> <input name="from" type="date" value="${from}" />
                                </div>
                                <div class="eight  wide field">
                                    <label>Tới Ngày</label> <input name="to" type="date" value="${to}" />
                                </div>
                                <div class="four wide field" style="margin-top: 25px">
                                    <button class="ui button">Xem</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                        <table id="mytable2" class="ui blue table">
                            <thead>
                                <tr>
                                    <th>Mã</th>
                                    <th>Ảnh</th>
                                    <th>Tên Hàng Hóa</th>
                                    <th>Thể Loại</th>
                                    <th>Tổng SL Nhập</th>
                                    <th>Tổng Giá Nhập</th>
                                    <th>Tổng SL Bán</th>
                                    <th>Tổng Giá Bán</th>
                                    <th>Giá TB Nhập</th>
                                    <th>Giá TB Bán</th>
                                    <th>Lợi Nhuận/1sp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${dshangHoa}">
                                    <tr>
                                        <td>${u.hangHoa.maHangHoa}</td>
                                        <td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" />
                                        </td>
                                        <td>${u.hangHoa.ten}</td>
                                        <td>${u.hangHoa.theLoai.tenLoai}</td>
                                        <td>${u.soLuongNhap}</td>
                                        <td>
                                        	<f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                        	value="${u.tongTienNhap}" /> đ</td>
                                        <td>${u.soLuongBan}</td>
                                        <td>
                                             <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                             value="${u.tongTienBan}" /> đ</td>
                                        <td>
                                            <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                            value="${u.tongTienNhap / u.soLuongNhap}" /> đ</td>
                                        <td>
                                            <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                            value="${u.tongTienBan / u.soLuongBan}" /> đ</td>
                                        <td>
                                            <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                            value="${u.tongTienBan / u.soLuongBan - u.tongTienNhap / u.soLuongNhap}" /> đ</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>

</html>