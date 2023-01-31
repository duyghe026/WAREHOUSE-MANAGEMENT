package com.Dy.QuanLyKho.service;

import com.Dy.QuanLyKho.dao.DonDatHangDao;
import com.Dy.QuanLyKho.entity.CTDDH;
import com.Dy.QuanLyKho.entity.DonDatHang;
import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Service
public class PDFGeneratorService {
    @Autowired
    DonDatHangDao donDatHangDao;

    public PdfPCell createCell(String content, float borderWidth, int colspan, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(content));
        cell.setBorderWidth(borderWidth);
        cell.setColspan(colspan);
        cell.setHorizontalAlignment(alignment);
        return cell;
    }

    @Autowired
    ServletContext context;

    public void export(HttpServletResponse response, int maDDH) throws IOException {
        DonDatHang donDatHang = donDatHangDao.findById(maDDH);

        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        String filePath = context.getRealPath("/resources/fonts/vuArial.ttf");
        File fontFile = new File(filePath);
        BaseFont bf = BaseFont.createFont(fontFile.getAbsolutePath(), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font fontParagraph = new Font(bf,15);

        Font fontTitle = new Font(bf,18);
        String string = "HÓA ĐƠN BÁN HÀNG";
        byte[] bytes = string.getBytes(StandardCharsets.UTF_8);
        String utf8EncodedString = new String(bytes, StandardCharsets.UTF_8);

        Paragraph paragraph = new Paragraph(utf8EncodedString, fontTitle);
        paragraph.setAlignment(Paragraph.ALIGN_CENTER);

        Paragraph paragraph2 = new Paragraph("Mã Hóa Đơn: " + donDatHang.getMaDDH(), fontParagraph);
        paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

        Paragraph paragraph3 = new Paragraph("Nhân Viên: " + donDatHang.getNhanVien().getFullName(), fontParagraph);
        paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

        Paragraph paragraph4 = new Paragraph("Ngày: " + donDatHang.getNgay(), fontParagraph);
        paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

        Paragraph paragraph5 = new Paragraph("Tổng Tiền: " + donDatHang.getTongTien(), fontParagraph);
        paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

        Paragraph paragraph6 = new Paragraph("---------------------------------------------------------------------", fontParagraph);
        paragraph2.setAlignment(Paragraph.ALIGN_LEFT);

        PdfPTable table = new PdfPTable(6);
        Font fontTable = new Font(bf,12);
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(new PdfPCell(new Phrase("STT", fontTable)));
        table.addCell(new PdfPCell(new Phrase("Tên Hàng Hóa", fontTable)));
        table.addCell(new PdfPCell(new Phrase("Loại", fontTable)));
        table.addCell(new PdfPCell(new Phrase("Số Lượng", fontTable)));
        table.addCell(new PdfPCell(new Phrase("Đơn Giá", fontTable)));
        table.addCell(new PdfPCell(new Phrase("Thành Tiền", fontTable)));
        table.setHeaderRows(1);
        PdfPCell[] cells = table.getRow(0).getCells();
        int i = 1;
        for (CTDDH u :donDatHang.getDsCTDonDatHang()){
            table.addCell(new PdfPCell(new Phrase(String.valueOf(i++), fontTable)));
            table.addCell(new PdfPCell(new Phrase(u.getHangHoa().getTen(), fontTable)));
            table.addCell(new PdfPCell(new Phrase(u.getHangHoa().getTheLoai().getTenLoai(), fontTable)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(u.getSoLuong()), fontTable)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(u.getHangHoa().getGiaThat()), fontTable)));
            table.addCell(new PdfPCell(new Phrase(String.valueOf(u.getSoLuong() * u.getHangHoa().getGiaThat()), fontTable)));
        }

        document.add(paragraph);
        document.add(paragraph2);
        document.add(paragraph3);
        document.add(paragraph4);
        document.add(paragraph5);
        document.add(paragraph6);
        document.add(table);
        document.close();
    }
}
