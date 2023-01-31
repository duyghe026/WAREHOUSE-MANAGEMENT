<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Thể Loại</title>
</head>

<body>
  <jsp:include page="../header.jsp" />
  <div class="pusher">
    <div class="main-content">
      <div class="ui grid stackable padded">
        <h2 class="ui header" style="margin-top: 20px">QUẢN LÝ LOẠI SẢN PHẨM</h2>
      </div>
      <div class="ui grid stackable padded">
        <div class="column">
          <table id="example" class="ui blue table">
            <thead>
              <tr>
                <th>Mã Loại</th>
                <th>Tên Loại</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="u" items="${listTheLoai}">
                <tr>
                  <td>${u.maLoai}</td>
                  <td>${u.tenLoai}</td>
                  <td>
                    <a href="admin/theloai/update/${u.maLoai}"><button class="ui blue button"><i
                          class="edit icon"></i>Sửa
                      </button></a>
                    <button class="ui red button" onclick="showModel('theloai','${u.maLoai}')"><i
                        class="delete icon"></i>Xóa
                    </button>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <a href="admin/theloai/insert"><button class="ui green button">
              <i class="plus icon"></i>Thêm
            </button></a>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../footer.jsp" />
  <script>
    var table = $('#example').DataTable({
      dom: 'Bfrtip',
      buttons: [{
        extend: 'excelHtml5',
        exportOptions: {
          columns: [0, 1]
        }
      }],
      "order": [
        [0, "asc"]
      ],
      "lengthMenu": [
        [5, 10, 20, -1],
        [5, 10, 20, "All"]
      ],
      language: {
        url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json'
      },
    });
  </script>
</body>

</html>