<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Top 10 Sản Phẩm Được Bán</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {
        'packages': ['bar']
    });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
       var data = google.visualization.arrayToDataTable([
       ['Tên Hàng Hóa', 'Số Lượng'],
       ['${hanghoa0.hangHoa.ten}', ${hanghoa0.soLuong}],
       ['${hanghoa1.hangHoa.ten}', ${hanghoa1.soLuong}],
       ['${hanghoa2.hangHoa.ten}', ${hanghoa2.soLuong}],
       ['${hanghoa3.hangHoa.ten}', ${hanghoa3.soLuong}],
       ['${hanghoa4.hangHoa.ten}', ${hanghoa4.soLuong}],
       ['${hanghoa5.hangHoa.ten}', ${hanghoa5.soLuong}],
       ['${hanghoa6.hangHoa.ten}', ${hanghoa6.soLuong}],
       ['${hanghoa7.hangHoa.ten}', ${hanghoa7.soLuong}],
       ['${hanghoa8.hangHoa.ten}', ${hanghoa8.soLuong}],
       ['${hanghoa9.hangHoa.ten}', ${hanghoa9.soLuong}],
       ]);

        var options = {
            chart: {
                title: 'TOP 10 SẢN PHẨM'
            }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
</script>

<body>
    <jsp:include page="header.jsp" />
    <div class="pusher">
        <div class="main-content">
            <div class="ui grid stackable padded">
                <h2 class="ui header" style="margin-top: 20px">TOP 10 SẢN PHẨM ĐƯỢC BÁN</h2>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <form class="ui form" action="admin/top10" method="post">
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
                <div id="columnchart_material" style="width: 1800px; height: 500px;"></div>
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
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>

</html>