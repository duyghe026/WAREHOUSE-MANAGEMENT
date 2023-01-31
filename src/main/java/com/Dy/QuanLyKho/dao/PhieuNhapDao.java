package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.PhieuNhap;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface PhieuNhapDao extends JpaRepository<PhieuNhap, Integer> {
    List<PhieuNhap> findAll();

    List<PhieuNhap> findByOrderByMaPNDesc();

    PhieuNhap findById(int id);

    List<PhieuNhap> findAllByNgayNhapBetweenAndTinhTrang(Date form, Date to, Boolean tinhTrang);
}
