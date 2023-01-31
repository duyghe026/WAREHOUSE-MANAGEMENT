<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Tài Khoản</title>
</head>

<body>
  <jsp:include page="../header.jsp" />
  <div class="pusher">
    <div class="main-content">
      <div class="ui grid stackable padded">
        <h2 class="ui header" style="margin-top: 20px">QUẢN LÝ TÀI KHOẢN</h2>
      </div>
      <div class="ui grid stackable padded">
        <div class="column">
          <table id="example" class="ui blue table">
            <thead>
              <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Nhân Viên</th>
                <th>Chức Vụ</th>
                <th>Active</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="u" items="${listTaiKhoan}">
                <tr>
                  <td>${u.username}</td>
                  <td>${u.password}</td>
                  <td>${u.nhanVien.fullName}</td>
                  <td>${u.nhanVien.chucVu.tenCV}</td>
                  <td>${u.active==false?'Ngưng kích Hoạt':'Kích Hoạt'}</td>
                  <td>
                    <a href="admin/taikhoan/update/${u.username}"><button class="ui blue button"><i
                          class="edit icon"></i>Sửa
                      </button></a>

                    <c:if test="${u.nhanVien.chucVu.maCV != 1}">
                      <button class="ui red button" onclick="showModel('taikhoan','${u.username}')"><i
                          class="delete icon"></i>Xóa
                      </button></c:if>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <a href="admin/taikhoan/insert"><button class="ui green button">
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
          columns: [0, 1, 2, 3, 4]
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