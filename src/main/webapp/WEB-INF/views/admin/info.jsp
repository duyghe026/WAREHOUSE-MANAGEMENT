<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>

<body>
    <jsp:include page="header.jsp" />
    <div class="pusher">
        <div class="main-content">
            <div class="ui grid stackable padded">
                <h2 class="ui header" style="margin-top: 20px">THÔNG TIN TÀI KHOẢN</h2>
            </div>
            <div class="ui grid stackable padded">
                <div class="ui fluid card"></div>
            </div>
            <div class="ui grid stackable padded">
                <div class="column">
                    <div class="ui grid stackable padded">
                        <div class="column">
                            <form:form class="ui form" action="info/update" modelAttribute="nhanVien">
                                <form:input path="maNV" value="${maNV}" type="hidden" />
                                <form:input path="tinhTrang" value="${tinhTrang}" type="hidden" />
                                <div class="two fields">
                                    <div class="field">
                                        <label>Họ</label>
                                        <div class="field">
                                            <form:input path="ho" />
                                            <div style="color: red">
                                                <form:errors path="ho" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Tên</label>
                                        <div class="field">
                                            <form:input path="ten" />
                                            <div style="color: red">
                                                <form:errors path="ten" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="two fields">
                                    <div class="field">
                                        <label>Địa chỉ </label>
                                        <form:input path="diaChi" />
                                        <div style="color: red">
                                            <form:errors path="diaChi" />
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Ngày Sinh </label>
                                        <form:input path="ngaySinh" type="date" />
                                        <div style="color: red">
                                            <form:errors path="ngaySinh" />
                                        </div>
                                    </div>
                                </div>
                                <div class="two fields">
                                    <div class="field">
                                        <label>SĐT </label>
                                        <form:input path="sdt" />
                                        <div style="color: red">
                                            <form:errors path="sdt" />
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>CMND </label>
                                        <form:input path="cmnd" />
                                        <div style="color: red">
                                            <form:errors path="cmnd" />
                                        </div>
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="two fields">
                                        <div class="field">
                                            <label>Giới Tính</label>
                                            <form:select path="gioiTinh">
                                                <form:option value="1">Nam</form:option>
                                                <form:option value="0">Nữ</form:option>
                                            </form:select>
                                        </div>
                                        <div class="field">
                                            <label>Chức Vụ</label>
                                            <form:input path="chucVu.tenCV" readonly="true" />
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button class="ui button">Update</button>
                                    ${message}
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>

</html>