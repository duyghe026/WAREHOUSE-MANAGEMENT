<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Hàng Hóa</title>
    <base href="${pageContext.servletContext.contextPath}/">
</head>
<style>
</style>

<body>
    <jsp:include page="../header.jsp" />
    <div class="pusher">
        <div class="main-content">
            <div class="ui grid stackable padded">
                <h2 class="ui header" style="margin-top: 20px">QUẢN LÝ KHO</h2>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <table id="example" class="ui blue table">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th class="filterhead">Thể Loại</th>
                                <th></th>
                                <th class="filterhead1">Tình Trạng</th>
                            </tr>
                            <tr>
                                <th>Mã</th>
                                <th>Ảnh</th>
                                <th>Tên Hàng Hóa</th>
                                <th>Thể Loại</th>
                                <th>Số Lượng</th>
                                <th>Tình Trạng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${dshangHoa}">
                                <tr>
                                    <td>${u.hangHoa.maHangHoa}</td>
                                    <td><img src="${u.hangHoa.anh}" style="width: 100px; height: 100px" alt="" /></td>
                                    <td>${u.hangHoa.ten}</td>
                                    <td>${u.hangHoa.theLoai.tenLoai}</td>
                                    <td>${u.soLuong}</td>
                                    <td>${u.hangHoa.tinhTrang==false?'Ngưng Bán':'Đang Bán'}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        <script>
            var table = $('#example').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'excel'
                ],
                "lengthMenu": [
                    [5, 10, 20, -1],
                    [5, 10, 20, "All"]
                ],
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json'
                },
                initComplete: function () {}
            });
            $(".filterhead").each(function () {
                var select = $('<select><option value="">Tất cả thể loại</option></select>')
                    .appendTo($(this).empty())
                    .on('change', function () {
                        var term = $(this).val();
                        table.column(3).search(term, false, false).draw();
                    });
                table.column(3).data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });
            $(".filterhead1").each(function () {
                var select = $('<select><option value="">Tất cả tình trạng</option></select>')
                    .appendTo($(this).empty())
                    .on('change', function () {
                        var term = $(this).val();
                        table.column(5).search(term, false, false).draw();
                    });
                table.column(5).data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });
        </script>
</body>

</html>