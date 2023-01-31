package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.HangHoa;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface HangHoaDao extends JpaRepository<HangHoa, Integer> {
    List<HangHoa> findAll();

    List<HangHoa> findAllByMaHangHoa(int id);

    List<HangHoa> findAllByTinhTrang(Boolean tinhTrang);

    HangHoa findById(int id);
}

