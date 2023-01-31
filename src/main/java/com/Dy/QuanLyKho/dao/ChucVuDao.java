package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.ChucVu;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface ChucVuDao extends JpaRepository<ChucVu, Integer> {
    List<ChucVu> findAll();

    ChucVu findById(int id);
}
