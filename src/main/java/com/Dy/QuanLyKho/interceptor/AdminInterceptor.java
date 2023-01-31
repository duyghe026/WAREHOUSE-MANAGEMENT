package com.Dy.QuanLyKho.interceptor;

import com.Dy.QuanLyKho.bean.Account;
import com.Dy.QuanLyKho.entity.TaiKhoan;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        TaiKhoan account = (TaiKhoan) session.getAttribute("current");
        String error = "";
        if (account == null) {
            error = "Vui long dang nhap!";
        } else if (account.getNhanVien().getChucVu().getMaCV() > 6 && uri.startsWith("/admin")) {
            error = "Vui long dang nhap tai khoan!";
        }
        if (error.length() > 0) {
            response.sendRedirect("/login?error=" + error); //?error=" + error);
            return false;
        }
        return true;
    }
}