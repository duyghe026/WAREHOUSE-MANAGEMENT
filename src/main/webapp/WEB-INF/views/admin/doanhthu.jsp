<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Doanh Thu Theo Sản Phẩm</title>
</head>


<body>
    <jsp:include page="header.jsp" />
    <div class="pusher">
        <div class="main-content">
            <div class="ui grid stackable padded">
                <h2 class="ui header" style="margin-top: 20px">DOANH THU THEO SẢN PHẨM</h2>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <form class="ui form" action="admin/doanhthu" method="post">
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
                    <c:if test="${tongTien > 0}">
                        <div class="ui massive label">
                            <div style="color: red">TỔNG SỐ LƯỢNG BÁN:
                                <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                    value="${tongTien}" />
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <c:if test="${tongTien > 0}">
                        <table id="mytable2" class="ui blue table">
                            <thead>
                                <tr>
                                    <th>Mã</th>
                                    <th>Ảnh</th>
                                    <th>Tên Hàng Hóa</th>
                                    <th>Thể Loại</th>
                                    <th>Số Lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${dshangHoa1}">
                                    <tr>
                                        <td>${u.hangHoa.maHangHoa}</td>
                                        <td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" />
                                        </td>
                                        <td>${u.hangHoa.ten}</td>
                                        <td>${u.hangHoa.theLoai.tenLoai}</td>
                                        <td>${u.soLuong}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <c:if test="${tongTienNhap > 0}">
                        <div class="ui massive label">
                            <div style="color: blue">TỔNG SỐ LƯỢNG NHẬP:
                                <f:formatNumber type="currency" maxFractionDigits="0" currencySymbol=""
                                    value="${tongTienNhap}" />
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <c:if test="${tongTienNhap > 0}">
                        <table id="mytable" class="ui blue table">
                            <thead>
                                <tr>
                                    <th>Mã</th>
                                    <th>Ảnh</th>
                                    <th>Tên Hàng Hóa</th>
                                    <th>Thể Loại</th>
                                    <th>Số Lượng</th>
                                    <th></th>
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
                                        <td>${u.soLuong}</td>
                                        <td><a href="admin/doanhthu/detail/${u.hangHoa.maHangHoa}"><button
                                                    class="ui pink basic button">
                                                    <i class="file alternate outline icon"></i>Xem Chi Tiết
                                                </button></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>

</html>