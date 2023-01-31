package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.TheLoai;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface TheLoaiDao extends JpaRepository<TheLoai, Integer> {
    List<TheLoai> findAll();

    TheLoai findById(int id);
}
