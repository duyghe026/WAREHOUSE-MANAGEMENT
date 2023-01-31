package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaiKhoanDao extends JpaRepository<TaiKhoan, String> {
    List<TaiKhoan> findAll();

    TaiKhoan findByUsername(String id);

    List<TaiKhoan> findAllByUsername(String id);
}
