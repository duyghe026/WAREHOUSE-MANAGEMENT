package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NhanVienDao extends JpaRepository<NhanVien, Integer>{
    List<NhanVien> findAll();

    NhanVien findById(int id);

    List<NhanVien> findAllByEmail(String email);
}