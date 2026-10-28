BEGIN TRANSACTION;
CREATE TABLE admission_methods (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    method_code TEXT NOT NULL UNIQUE,
    method_name TEXT NOT NULL,
    quota_percent TEXT NOT NULL,
    conditions TEXT NOT NULL,
    scoring_formula TEXT NOT NULL,
    notes TEXT
);
INSERT INTO "admission_methods" VALUES(1,'PT1 (Mã 301)','Xét tuyển thẳng theo quy định của Bộ GD&ĐT và Học viện','3% tổng chỉ tiêu','Anh hùng lao động, Chiến sĩ thi đua toàn quốc; Thí sinh đạt giải Nhất, Nhì, Ba kỳ thi chọn HSG Quốc gia, Quốc tế hoặc thi KHKT cấp Quốc gia, Quốc tế (trong vòng 3 năm); Người dân tộc thiểu số rất ít người, người khuyết tật nặng, lưu học sinh đủ điều kiện.','Xét duyệt trực tiếp theo hồ sơ năng lực và giải thưởng đạt được.','Nếu thí sinh không dùng quyền xét tuyển thẳng mà đăng ký xét tuyển thông thường sẽ được cộng 3.0 điểm thưởng (thang điểm 30).');
INSERT INTO "admission_methods" VALUES(2,'PT2 (Mã 100)','Xét kết quả thi tốt nghiệp THPT năm 2026','Thuộc 97% chỉ tiêu chung','Thí sinh tốt nghiệp THPT và có tổng điểm 3 môn thi tốt nghiệp THPT theo tổ hợp xét tuyển ≥ 15.0 điểm. Riêng ngành Luật và Luật Kinh tế: tổng điểm ≥ 18.0 và môn Toán/Ngữ văn ≥ 6.0 điểm.','Điểm xét tuyển = (Môn 1 + Môn 2 + Môn 3) + Điểm cộng (nếu có, tối đa 3.0) + Điểm ưu tiên khu vực/đối tượng.','Thí sinh có chứng chỉ tiếng Anh quốc tế (IELTS ≥ 5.0) được quy đổi sang điểm 7.0 - 10.0 môn Tiếng Anh hoặc cộng điểm khuyến khích.');
INSERT INTO "admission_methods" VALUES(3,'PT3 (Mã 200)','Xét kết quả học tập cấp THPT (Xét học bạ)','Thuộc 97% chỉ tiêu chung','Áp dụng cho thí sinh tốt nghiệp THPT năm 2026, đạt hạnh kiểm Tốt. Ngành Luật & Luật kinh tế: Học lực lớp 12 xếp loại Giỏi, ĐTB 3 năm môn Toán/Văn ≥ 6.0 và tổng 3 môn ≥ 18.0. Ngành CNTT & Thiết kế Game: ĐTB môn Toán 3 năm lớp 10, 11, 12 ≥ 7.0.','Điểm xét tuyển = (ĐTB Môn 1 + ĐTB Môn 2 + ĐTB Môn 3) + Điểm cộng (nếu có) + Điểm ưu tiên. Trong đó ĐTB mỗi môn = (Điểm cả năm lớp 10 + lớp 11 + lớp 12) / 3.','Lưu ý: Theo quy định tuyển sinh năm 2026, thí sinh xét học bạ vẫn cần đảm bảo tổng điểm 3 môn thi tốt nghiệp THPT theo tổ hợp đạt tối thiểu 15.0 điểm (ngành Luật/Luật KT ≥ 18.0 điểm hoặc điểm xét TN ≥ 8.5).');
INSERT INTO "admission_methods" VALUES(4,'PT4 (Mã 402SPT & 402HSA)','Xét kết quả thi Đánh giá năng lực (ĐHSP Hà Nội - SPT & ĐHQG Hà Nội - HSA)','Thuộc 97% chỉ tiêu chung','Thí sinh tham dự kỳ thi ĐGNL năm 2026 do ĐH Sư phạm Hà Nội (Mã 402SPT) hoặc ĐH Quốc gia Hà Nội (Mã 402HSA) tổ chức. Ngành Luật & Luật KT yêu cầu học lực lớp 12 loại Giỏi và điểm Toán/Văn ≥ 6.0.','Xét theo ngưỡng điểm quy đổi tương đương do Học viện công bố theo kế hoạch chung của Bộ GD&ĐT.','Giúp tăng cơ hội trúng tuyển sớm bằng điểm thi ĐGNL độc lập.');
INSERT INTO "admission_methods" VALUES(5,'PT5 (Mã 500)','Phương thức khác (Dành cho hệ Dự bị đại học)','Theo chỉ tiêu riêng','Thí sinh đã tốt nghiệp THPT, hoàn thành chương trình Dự bị đại học và đạt ngưỡng điểm trung bình chung học tập THPT theo quy định.','Xét tuyển dựa trên kết quả hoàn thành chương trình dự bị đại học và hồ sơ trường dự bị gửi về Học viện.','Chương trình Chất lượng cao yêu cầu thêm điều kiện ngoại ngữ tiếng Anh.');
CREATE TABLE chat_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id TEXT NOT NULL,
    user_message TEXT NOT NULL,
    bot_response TEXT NOT NULL,
    intent_detected TEXT,
    engine_mode TEXT DEFAULT 'Hybrid-RAG',
    created_at TEXT NOT NULL
);
INSERT INTO "chat_logs" VALUES(1,'sess_demo_01','Điểm chuẩn ngành Truyền thông đa phương tiện năm 2026 là bao nhiêu?','Năm 2026, ngành **Truyền thông đa phương tiện (Mã ngành: 7320104)** có điểm chuẩn dẫn đầu Học viện Phụ nữ Việt Nam là **26.10 điểm** (tổ hợp D01, C00) và **25.60 điểm** (tổ hợp C03, D14, D15).','tra_cuu_nganh','Hybrid-SQL-RAG','2026-10-27 09:10:12');
INSERT INTO "chat_logs" VALUES(2,'sess_demo_02','Trường mình có tuyển nam không ạ?','Có bạn nhé! Học viện Phụ nữ Việt Nam là trường đại học công lập đa ngành và tuyển sinh cả NAM và NỮ bình đẳng ở tất cả 100% các ngành đào tạo.','faq_policy','Hybrid-SQL-RAG','2026-10-27 09:35:40');
INSERT INTO "chat_logs" VALUES(3,'sess_demo_03','Mình được 24.5 điểm khối D01 thì đỗ những ngành nào?','Với mức điểm **24.50** ở tổ hợp **D01**, bạn đủ điểm trúng tuyển vào 13/17 chương trình tại Hà Nội (như Luật, Luật kinh tế, Kinh tế, Kinh tế số, CNTT, Giới và Phát triển...) và cả 2 ngành tại Phân hiệu TP.HCM.','goi_y_chon_nganh','Score-Advisor','2026-10-27 10:15:22');
CREATE TABLE english_conversion (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    level_rank INTEGER NOT NULL,
    ielts_score TEXT NOT NULL,
    toefl_itp TEXT NOT NULL,
    toefl_ibt TEXT NOT NULL,
    toeic_four_skills TEXT NOT NULL,
    sat_score TEXT NOT NULL,
    converted_score_pt100 REAL NOT NULL,
    bonus_points REAL NOT NULL
);
INSERT INTO "english_conversion" VALUES(1,1,'Từ 7.0 trở lên','Từ 627 trở lên','Từ 94 trở lên','Nghe ≥490, Đọc ≥455, Nói ≥180, Viết ≥180','≥ 1400',10.0,1.5);
INSERT INTO "english_conversion" VALUES(2,2,'6.5','584 - 626','78 - 93','Nghe 458-485, Đọc 429-450, Nói 168-170, Viết 164-170','1301 - 1399',9.5,1.0);
INSERT INTO "english_conversion" VALUES(3,3,'6.0','542 - 583','62 - 77','Nghe 429-457, Đọc 407-428, Nói 164-167, Viết 157-163','1201 - 1300',9.0,0.75);
INSERT INTO "english_conversion" VALUES(4,4,'5.5','500 - 541','46 - 61','Nghe 400-428, Đọc 385-406, Nói 160-163, Viết 150-156','1101 - 1200',8.0,0.5);
INSERT INTO "english_conversion" VALUES(5,5,'5.0','450 - 499','30 - 45','Nghe 275-395, Đọc 275-380, Nói 120-150, Viết 120-140','1000 - 1100',7.0,0.25);
CREATE TABLE faqs_knowledge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    question TEXT NOT NULL,
    keywords TEXT NOT NULL,
    answer TEXT NOT NULL,
    source_url TEXT
);
INSERT INTO "faqs_knowledge" VALUES(1,'Thông tin chung','Học viện Phụ nữ Việt Nam có mã trường là gì và địa chỉ ở đâu?','mã trường, địa chỉ, ở đâu, cơ sở, hà nội, tphcm, sài gòn, nguyễn chí thanh, gia lâm','Học viện Phụ nữ Việt Nam (Vietnam Women''s Academy - VWA) là trường Đại học Công lập trực thuộc Trung ương Hội Liên hiệp Phụ nữ Việt Nam.
- **Mã trường tại Hà Nội:** `HPN`
  + Trụ sở chính: Số 68 đường Nguyễn Chí Thanh, phường Láng, TP. Hà Nội.
  + Cơ sở mở rộng: Đường Kiêu Kỵ, xã Gia Lâm, TP. Hà Nội.
- **Mã Phân hiệu tại TP. Hồ Chí Minh:** `SPN`
  + Địa chỉ: Số 620 Đỗ Xuân Hợp, phường Phước Long, TP. Hồ Chí Minh.','https://tuyensinh.hvpnvn.edu.vn/');
INSERT INTO "faqs_knowledge" VALUES(2,'Đối tượng tuyển sinh','Học viện Phụ nữ Việt Nam có tuyển sinh nam giới không?','con trai, nam giới, bạn nam, tuyển nam, tuyển sinh nam, chỉ tuyển nữ, nam học được không','**CÓ!** Mặc dù mang tên là Học viện Phụ nữ Việt Nam (do trực thuộc Hội Liên hiệp Phụ nữ Việt Nam), nhưng Học viện là trường đại học công lập đào tạo đa ngành và **tuyển sinh cả thí sinh NAM và NỮ** bình đẳng ở tất cả 100% các ngành đào tạo đại học, thạc sĩ, tiến sĩ. Hiện nay tỷ lệ nam sinh viên tại Học viện đang ngày càng tăng cao, đặc biệt ở các ngành CNTT, Thiết kế Game, Luật, Kinh tế số, Quản trị kinh doanh, Truyền thông.','https://tuyensinh.hvpnvn.edu.vn/');
INSERT INTO "faqs_knowledge" VALUES(3,'Học phí','Học phí của Học viện Phụ nữ Việt Nam năm 2026 là bao nhiêu?','học phí, tiền học, bao nhiêu tiền, một tín chỉ, một kỳ, đắt không','Học viện Phụ nữ Việt Nam là trường đại học công lập nên mức học phí rất hợp lý theo quy định của Nhà nước:
- **Hệ đại học chính quy đại trà:** Dự kiến từ **550.000 – 605.000 VNĐ/tín chỉ** (tương đương khoảng **9,0 – 12,0 triệu VNĐ/học kỳ** tùy theo số tín chỉ đăng ký của từng ngành).
- **Hệ Chất lượng cao (QTKD CLC & Kinh tế CLC):** Khoảng 15 – 18 triệu VNĐ/học kỳ với chương trình tăng cường tiếng Anh và thực tập doanh nghiệp.','https://hvpnvn.edu.vn/cat-tin-tuc/su-kien/thong-tin-tuyen-sinh-2026-ban-cap-nhat-thang-5-2026/');
INSERT INTO "faqs_knowledge" VALUES(4,'Ký túc xá','Học viện có ký túc xá cho sinh viên ở xa không? Bao nhiêu chỗ?','ký túc xá, ktx, nội trú, chỗ ở, phòng ở, ở trọ','Học viện có hệ thống Ký túc xá khang trang, an ninh 24/7 ngay trong khuôn viên trường với tổng cộng **1.792 chỗ ở nội trú**:
- **Tại Hà Nội:** 980 chỗ nội trú (gồm 660 chỗ ngay tại Trụ sở chính 68 Nguyễn Chí Thanh và 320 chỗ tại cơ sở Gia Lâm).
- **Tại Phân hiệu TP. Hồ Chí Minh:** 812 chỗ nội trú.
Phòng ở đầy đủ tiện nghi (điều hòa, bình nóng lạnh, wifi, khu tự học, căng tin).','https://hvpnvn.edu.vn/cat-tin-tuc/su-kien/thong-tin-tuyen-sinh-2026-ban-cap-nhat-thang-5-2026/');
INSERT INTO "faqs_knowledge" VALUES(5,'Học bổng','Chính sách học bổng và ưu đãi cho tân sinh viên năm 2026 như thế nào?','học bổng, miễn giảm học phí, hỗ trợ, du học, tân sinh viên, 24 điểm','Học viện Phụ nữ Việt Nam có quỹ học bổng rất đa dạng cho sinh viên:
1. **Học bổng Tân sinh viên:** Thí sinh trúng tuyển có tổng điểm 3 môn thi THPT năm 2026 đạt **≥ 24,0 điểm** (không tính điểm ưu tiên) hoặc diện tuyển thẳng có cơ hội nhận Học bổng đầu vào giá trị cao.
2. **Học bổng Khuyến khích học tập:** 100% sinh viên đạt học lực Xuất sắc và rèn luyện Tốt mỗi học kỳ đều được nhận học bổng.
3. **Học bổng Quốc tế & Doanh nghiệp:** Học bổng từ Quỹ Hợp tác Quốc tế các Ngân hàng Tiết kiệm Đức (DSIK), Ngân hàng PVcomBank, học bổng trao đổi/du học tại Nga và các đối tác quốc tế cho sinh viên đạt loại Giỏi từ Học kỳ I.
4. **Chính sách Nhà nước:** Miễn giảm học phí 100% hoặc 50-70% cho sinh viên thuộc diện chính sách, hộ nghèo, dân tộc thiểu số và các ngành khoa học cơ bản theo quy định.','https://hvpnvn.edu.vn/cat-tin-tuc/su-kien/thong-tin-tuyen-sinh-2026-ban-cap-nhat-thang-5-2026/');
INSERT INTO "faqs_knowledge" VALUES(6,'Chứng chỉ Tiếng Anh & Điểm cộng','Có chứng chỉ IELTS, TOEIC, SAT hay giải Học sinh giỏi được quy đổi hoặc cộng điểm thế nào?','ielts, toeic, toefl, sat, quy đổi tiếng anh, cộng điểm, học sinh giỏi, hsg cấp tỉnh','Quy định điểm cộng và quy đổi chứng chỉ năm 2026 (thang điểm 30, tổng điểm cộng tối đa không quá 3.0 điểm):
- **Quy đổi điểm môn Tiếng Anh (PT xét điểm thi THPT) hoặc cộng điểm khuyến khích:**
  + **IELTS ≥ 7.0** (hoặc SAT ≥ 1400): Quy đổi **10.0 điểm** môn Tiếng Anh hoặc cộng **1.50 điểm**.
  + **IELTS 6.5** (hoặc SAT 1301-1399): Quy đổi **9.5 điểm** hoặc cộng **1.00 điểm**.
  + **IELTS 6.0** (hoặc SAT 1201-1300): Quy đổi **9.0 điểm** hoặc cộng **0.75 điểm**.
  + **IELTS 5.5** (hoặc SAT 1101-1200): Quy đổi **8.0 điểm** hoặc cộng **0.50 điểm**.
  + **IELTS 5.0** (hoặc SAT 1000-1100): Quy đổi **7.0 điểm** hoặc cộng **0.25 điểm**.
- **Điểm thưởng Học sinh giỏi:**
  + Giải Nhất/Nhì/Ba HSG Quốc gia (không dùng quyền tuyển thẳng): Cộng **3.0 điểm**.
  + Giải Khuyến khích HSG Quốc gia hoặc Giải Nhất HSG cấp Tỉnh/Thành phố: Cộng **1.50 điểm**.
  + Giải Nhì HSG cấp Tỉnh/TP: Cộng **1.25 điểm**; Giải Ba HSG cấp Tỉnh/TP: Cộng **1.0 điểm**.
*(Lưu ý: Không chấp nhận chứng chỉ thi hình thức Home Edition)*.','https://hvpnvn.edu.vn/cat-tin-tuc/su-kien/thong-tin-tuyen-sinh-2026-ban-cap-nhat-thang-5-2026/');
INSERT INTO "faqs_knowledge" VALUES(7,'Liên hệ & Hotline','Số điện thoại hotline, email và fanpage tư vấn tuyển sinh của Học viện là gì?','liên hệ, hotline, số điện thoại, sđt, email, fanpage, facebook, zalo, nhập học','Bạn có thể liên hệ trực tiếp với Phòng Tuyển sinh - Học viện Phụ nữ Việt Nam qua các kênh chính thức:
- **Trụ sở chính Hà Nội (68 Nguyễn Chí Thanh, Phường Láng, Hà Nội):**
  + Hotline: **0243.775.1750** hoặc **0912.991.355**
  + Email: `tuyensinh@hvpnvn.edu.vn`
  + Website: https://tuyensinh.hvpnvn.edu.vn/ | https://hvpnvn.edu.vn/
  + Fanpage: https://www.facebook.com/Hocvienphunu/
- **Phân hiệu TP. Hồ Chí Minh (620 Đỗ Xuân Hợp, Phường Phước Long, TP.HCM):**
  + Điện thoại: **0283.731.4056** | **0916.036.118** | **0373.902.608**
  + Website: https://phhvpnvn.edu.vn/','https://tuyensinh.hvpnvn.edu.vn/');
INSERT INTO "faqs_knowledge" VALUES(8,'Tổ hợp xét tuyển mới','Tổ hợp X06 và X26 gồm những môn nào?','x06, x26, tổ hợp môn, môn tin học, tổ hợp xét tuyển','Năm 2026, Học viện Phụ nữ Việt Nam áp dụng 11 tổ hợp xét tuyển, trong đó có 2 tổ hợp mới có môn Tin học dành cho nhóm ngành Công nghệ và Kinh tế:
- **A00:** Toán, Vật lý, Hóa học
- **A01:** Toán, Vật lý, Tiếng Anh
- **C00:** Ngữ văn, Lịch sử, Địa lý
- **C03:** Ngữ văn, Toán, Lịch sử
- **D01:** Toán, Ngữ văn, Tiếng Anh
- **D07:** Toán, Hóa học, Tiếng Anh
- **D09:** Toán, Lịch sử, Tiếng Anh
- **D14:** Ngữ văn, Lịch sử, Tiếng Anh
- **D15:** Ngữ văn, Địa lý, Tiếng Anh
- **X06:** Toán, Vật lý, Tin học
- **X26:** Toán, Tiếng Anh, Tin học','https://hvpnvn.edu.vn/cat-tin-tuc/su-kien/thong-tin-tuyen-sinh-2026-ban-cap-nhat-thang-5-2026/');
CREATE TABLE leads (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    phone TEXT NOT NULL,
    email TEXT,
    high_school_province TEXT,
    target_major TEXT NOT NULL,
    exam_block TEXT,
    estimated_score REAL,
    question_note TEXT,
    status TEXT DEFAULT 'Mới tiếp nhận',
    created_at TEXT NOT NULL
);
INSERT INTO "leads" VALUES(1,'Nguyễn Minh Anh','0987654321','minhanh2k8@gmail.com','Hà Nội','Truyền thông đa phương tiện (7320104)','D01',26.25,'Em có IELTS 6.5 muốn hỏi về quy đổi điểm xét tuyển ngành Truyền thông đa phương tiện ạ.','Đã tư vấn','2026-10-25 09:15:00');
INSERT INTO "leads" VALUES(2,'Trần Hoàng Nam','0912345678','hoangnam.dev@gmail.com','Hải Phòng','Công nghệ thông tin (7480201)','A01',22.5,'Em là nam muốn đăng ký ngành CNTT và đăng ký ở Ký túc xá tại 68 Nguyễn Chí Thanh.','Mới tiếp nhận','2026-10-26 14:30:00');
INSERT INTO "leads" VALUES(3,'Lê Thị Thảo Vy','0938112233','thaovy.le@gmail.com','TP. Hồ Chí Minh','Quản trị dịch vụ du lịch và lữ hành - Phân hiệu TP.HCM (7810103PH)','D14',23.8,'Tư vấn giúp em thủ tục xét học bạ vào Phân hiệu TP.HCM ạ.','Đang chăm sóc','2026-10-26 16:45:00');
INSERT INTO "leads" VALUES(4,'Phạm Đức Duy','0977889900','ducduy.pham@gmail.com','Nam Định','Thiết kế và phát triển Game (74802011)','X26',19.5,'Em muốn tìm hiểu chương trình học ngành Thiết kế Game bằng tổ hợp X26 (Toán, Anh, Tin).','Mới tiếp nhận','2026-10-27 08:20:00');
INSERT INTO "leads" VALUES(5,'Hoàng Khánh Linh','0965432109','khanhlinh.h@gmail.com','Thanh Hóa','Luật kinh tế (7380107)','A00',24.1,'Cho em hỏi điều kiện môn Toán và Văn ≥ 6.0 của ngành Luật kinh tế với ạ.','Đã tư vấn','2026-10-27 10:05:00');
CREATE TABLE majors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    admission_code TEXT NOT NULL UNIQUE,
    major_code TEXT NOT NULL,
    name TEXT NOT NULL,
    campus TEXT NOT NULL, -- 'HPN (Hà Nội)' hoặc 'SPN (TP.HCM)'
    faculty TEXT NOT NULL,
    quota_2026 INTEGER NOT NULL,
    subject_combos TEXT NOT NULL,
    score_thpt_2026 REAL NOT NULL,
    score_detail_2026 TEXT NOT NULL,
    score_thpt_2025 REAL,
    score_hocba_2025 REAL,
    tuition_per_credit TEXT NOT NULL,
    estimated_semester_tuition TEXT NOT NULL,
    description TEXT NOT NULL,
    career_prospects TEXT NOT NULL,
    special_conditions TEXT
);
INSERT INTO "majors" VALUES(1,'7340101','7340101','Quản trị kinh doanh','HPN (Hà Nội)','Khoa Quản trị kinh doanh',170,'A00, A01, C00, C03, D01, D14, D15',24.52,'24.52 điểm (A00, D01, C00); 24.02 điểm (A01, C03, D14, D15)',23.93,25.45,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.5 triệu VNĐ/học kỳ','Đào tạo cử nhân Quản trị kinh doanh có kiến thức nền tảng và chuyên sâu về quản trị doanh nghiệp, quản trị chiến lược, khởi nghiệp, quản trị nhân sự, tài chính và thương mại điện tử.','Chuyên viên/Quản lý tại các doanh nghiệp trong và ngoài nước, chuyên viên phát triển kinh doanh, quản trị dự án, khởi nghiệp hoặc làm việc tại các tổ chức kinh tế.','Tổng điểm 3 môn thi tốt nghiệp THPT ≥ 15.0 điểm.');
INSERT INTO "majors" VALUES(2,'7340101E','7340101','Quản trị kinh doanh (Chất lượng cao)','HPN (Hà Nội)','Khoa Quản trị kinh doanh',30,'A00, A01, C00, C03, D01, D14, D15',18.0,'18.00 điểm (A00, D01, C00); 17.50 điểm (A01, C03, D14, D15)',24.0,24.0,'Theo định mức chương trình Chất lượng cao','Khoảng 15 - 18 triệu VNĐ/học kỳ','Chương trình đào tạo tăng cường tiếng Anh chuyên ngành, sĩ số lớp nhỏ, giảng viên giàu kinh nghiệm quốc tế và thực tập sớm tại các tập đoàn đa quốc gia.','Chuyên viên quản trị tại các công ty đa quốc gia, tập đoàn kinh tế lớn, ngân hàng quốc tế, chuyên viên tư vấn quản trị.','Yêu cầu có chứng chỉ tiếng Anh tối thiểu Bậc 3 (tương đương IELTS ≥ 4.5) hoặc điểm TB tiếng Anh 3 năm THPT ≥ 8.0 hoặc đạt ngưỡng điểm thi tiếng Anh THPT.');
INSERT INTO "majors" VALUES(3,'7380101','7380101','Luật','HPN (Hà Nội)','Khoa Luật',200,'A00, A01, C00, D01, D14, D15',24.0,'24.00 điểm (A00, D01); 23.50 điểm (A01, D14, D15); 23.00 điểm (C00)',23.68,25.26,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.0 triệu VNĐ/học kỳ','Đào tạo cử nhân Luật nắm vững hệ thống pháp luật Việt Nam và quốc tế, kỹ năng tranh tụng, tư vấn pháp lý, thực hành diễn án tại Tòa án giả định.','Thẩm phán, Kiểm sát viên, Luật sư, Công chứng viên, Chuyên viên pháp chế doanh nghiệp, Cán bộ tư pháp tại cơ quan nhà nước.','Điểm Toán và Ngữ văn (hoặc Toán/Ngữ văn trong tổ hợp) ≥ 6.0 điểm và tổng điểm 3 môn ≥ 18.0 điểm (với xét học bạ cần thêm học lực lớp 12 loại Giỏi).');
INSERT INTO "majors" VALUES(4,'7380107','7380107','Luật kinh tế','HPN (Hà Nội)','Khoa Luật',200,'A00, A01, C00, D01, D14, D15',23.5,'23.50 điểm (A00, D01); 23.00 điểm (A01, D14, D15); 22.50 điểm (C00)',23.83,25.37,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.0 triệu VNĐ/học kỳ','Chuyên sâu về pháp luật trong hoạt động kinh doanh, thương mại quốc tế, đầu tư, tài chính - ngân hàng, sở hữu trí tuệ và giải quyết tranh chấp thương mại.','Chuyên viên pháp chế tại ngân hàng, tập đoàn, doanh nghiệp FDI, trọng tài thương mại, luật sư tư vấn doanh nghiệp.','Điểm Toán và Ngữ văn (hoặc Toán/Ngữ văn trong tổ hợp) ≥ 6.0 điểm và tổng điểm 3 môn ≥ 18.0 điểm (với xét học bạ cần thêm học lực lớp 12 loại Giỏi).');
INSERT INTO "majors" VALUES(5,'7480201','7480201','Công nghệ thông tin','HPN (Hà Nội)','Viện Công nghệ thông tin',140,'A00, A01, D01, D09, X06, X26',21.8,'21.80 điểm (A00, D01); 21.30 điểm (A01, D09, X06, X26)',20.68,23.01,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 10.5 - 12.0 triệu VNĐ/học kỳ','Đào tạo kỹ sư/cử nhân CNTT chuyên sâu về Công nghệ phần mềm, Trí tuệ nhân tạo (AI), Khoa học dữ liệu, An toàn thông tin và Hệ thống thông tin hiện đại (được PVcomBank tài trợ phòng Lab hiện đại).','Lập trình viên Full-stack, Kỹ sư AI/Data, Chuyên viên kiểm thử phần mềm (QA/Tester), Quản trị mạng và hệ thống tại các tập đoàn công nghệ.','Với phương thức xét học bạ: Điểm trung bình chung môn Toán cả 3 năm lớp 10, 11, 12 phải ≥ 7.0 điểm.');
INSERT INTO "majors" VALUES(6,'74802011','7480201','Thiết kế và phát triển Game (thuộc ngành CNTT)','HPN (Hà Nội)','Viện Công nghệ thông tin',70,'A00, A01, D01, D09, X06, X26',17.85,'17.85 điểm (A00, D01); 17.35 điểm (A01, D09, X06, X26)',20.68,23.01,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 10.5 - 12.0 triệu VNĐ/học kỳ','Chương trình đào tạo chuyên sâu về lập trình Game (Unity, Unreal Engine), đồ họa 2D/3D, thiết kế kịch bản và cơ chế tương tác game đa nền tảng. Cấp bằng Cử nhân Công nghệ thông tin.','Game Developer, Game Designer, 3D Technical Artist, Lập trình viên ứng dụng tương tác thực tế ảo AR/VR tại các studio trong và ngoài nước.','Với phương thức xét học bạ: Điểm trung bình chung môn Toán cả 3 năm lớp 10, 11, 12 phải ≥ 7.0 điểm.');
INSERT INTO "majors" VALUES(7,'7760101','7760101','Công tác xã hội','HPN (Hà Nội)','Khoa Công tác xã hội',150,'C00, C03, D01, D14, D15',25.0,'25.00 điểm (D01); 24.50 điểm (C03, D14, D15); 24.00 điểm (C00)',24.17,25.63,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.0 - 10.5 triệu VNĐ/học kỳ','Ngành truyền thống thế mạnh của Học viện, đào tạo kỹ năng tham vấn, hỗ trợ tâm lý - xã hội, quản lý ca, phát triển cộng đồng và thực hiện chính sách an sinh xã hội.','Chuyên viên tại các tổ chức phi chính phủ (NGOs) quốc tế, bệnh viện, trường học, cơ quan Lao động - Thương binh & Xã hội, Hội Liên hiệp Phụ nữ các cấp.','Tổng điểm 3 môn thi tốt nghiệp THPT ≥ 15.0 điểm.');
INSERT INTO "majors" VALUES(8,'77601011','7760101','Phát triển và quản lý dịch vụ xã hội (ngành CTXH)','HPN (Hà Nội)','Khoa Công tác xã hội',80,'C00, C03, D01, D14, D15',21.25,'21.25 điểm (D01); 20.75 điểm (C03, D14, D15); 20.25 điểm (C00)',24.17,25.63,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.0 - 10.5 triệu VNĐ/học kỳ','Đào tạo năng lực thiết kế, vận hành và quản trị các mô hình dịch vụ xã hội, chăm sóc sức khỏe tinh thần, phúc lợi doanh nghiệp và dự án cộng đồng.','Quản lý dự án xã hội, điều phối viên CSR tại doanh nghiệp, quản lý trung tâm dịch vụ an sinh và chăm sóc xã hội.','Cấp bằng tốt nghiệp đại học ngành Công tác xã hội kèm phụ lục văn bằng chuyên sâu.');
INSERT INTO "majors" VALUES(9,'7310399','7310399','Giới và Phát triển','HPN (Hà Nội)','Khoa Giới và Phát triển',150,'C00, C03, D01, D09, D14, D15',22.85,'22.85 điểm (D01); 22.35 điểm (C03, D09, D14, D15); 21.85 điểm (C00)',22.43,24.32,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.0 - 10.5 triệu VNĐ/học kỳ','Học viện Phụ nữ Việt Nam là cơ sở duy nhất trên cả nước đào tạo cử nhân ngành Giới và Phát triển, kết hợp kiến thức xã hội học, kinh tế phát triển, lồng ghép giới và quản lý dự án.','Chuyên gia tư vấn giới tại Liên Hợp Quốc (UN Women, UNDP), các tổ chức quốc tế, cơ quan hoạch định chính sách, Hội LHPN Việt Nam và các bộ ngành.','Có nhiều cơ hội nhận học bổng tài trợ từ các tổ chức quốc tế và Nhà nước.');
INSERT INTO "majors" VALUES(10,'7810103','7810103','Quản trị dịch vụ du lịch và lữ hành','HPN (Hà Nội)','Khoa Quản trị kinh doanh',250,'A00, A01, C00, C03, D01, D14, D15',25.17,'25.17 điểm (A00, D01); 24.67 điểm (A01, C03, D14, D15); 24.17 điểm (C00)',24.41,25.81,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.5 triệu VNĐ/học kỳ','Đào tạo thực chiến về thiết kế điều hành tour, quản trị khách sạn - resort, tổ chức sự kiện (MICE), hướng dẫn du lịch và truyền thông điểm đến.','Quản lý điều hành tour, Quản trị khách sạn/resort 4-5 sao, Chuyên viên tổ chức sự kiện, Hướng dẫn viên quốc tế.','Ngành có điểm chuẩn thuộc nhóm dẫn đầu của Học viện với 250 chỉ tiêu tại Hà Nội.');
INSERT INTO "majors" VALUES(11,'7320104','7320104','Truyền thông đa phương tiện','HPN (Hà Nội)','Khoa Truyền thông đa phương tiện',130,'C00, C03, D01, D14, D15',26.1,'26.10 điểm (D01, C00); 25.60 điểm (C03, D14, D15) - Cao nhất toàn Học viện',25.12,26.34,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 10.0 - 12.0 triệu VNĐ/học kỳ','Ngành học hot nhất tại VWA, trang bị kỹ năng sản xuất nội dung số, báo chí truyền hình, thiết kế đồ họa, quay dựng phim, PR và quản trị chiến dịch truyền thông tích hợp.','Chuyên viên PR, Content Creator, Đạo diễn hình ảnh, Biên tập viên truyền hình/báo chí, Chuyên viên thiết kế đồ họa & Digital Media tại các Agency.','Ngành có điểm chuẩn cao nhất Học viện năm 2026 (26.10 điểm).');
INSERT INTO "majors" VALUES(12,'73201041','7320104','Truyền thông xã hội (thuộc ngành TTĐPT)','HPN (Hà Nội)','Khoa Truyền thông đa phương tiện',70,'C00, C03, D01, D14, D15',25.1,'25.10 điểm (D01, C00); 24.60 điểm (C03, D14, D15)',25.12,26.34,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 10.0 - 12.0 triệu VNĐ/học kỳ','Tập trung chuyên sâu vào quản trị mạng xã hội (Social Media), xây dựng thương hiệu số, phân tích xu hướng truyền thông mạng xã hội và xử lý khủng hoảng truyền thông.','Social Media Manager, Quản trị cộng đồng, Chuyên viên truyền thông thương hiệu, KOL/KOC Management tại các doanh nghiệp và Agency.','Cấp bằng tốt nghiệp đại học ngành Truyền thông đa phương tiện.');
INSERT INTO "majors" VALUES(13,'7310101','7310101','Kinh tế','HPN (Hà Nội)','Khoa Kinh tế và Tài chính',215,'A00, A01, C03, D01, D07, X26',23.25,'23.25 điểm (A00, D01); 22.75 điểm (A01, C03, D07, X26)',24.03,25.52,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.0 triệu VNĐ/học kỳ','Đào tạo kiến thức sâu rộng về kinh tế đầu tư, kinh tế quốc tế, tài chính - ngân hàng, phân tích chính sách kinh tế và dự báo thị trường.','Chuyên viên phân tích kinh tế - tài chính, chuyên viên ngân hàng, đầu tư chứng khoán, hoạch định chính sách tại các bộ ban ngành.','Xét tuyển thêm tổ hợp mới X26 (Toán, Tiếng Anh, Tin học).');
INSERT INTO "majors" VALUES(14,'7310101E','7310101','Kinh tế (Chất lượng cao)','HPN (Hà Nội)','Khoa Kinh tế và Tài chính',35,'A00, A01, C03, D01, D07, X26',18.0,'18.00 điểm (A00, D01); 17.50 điểm (A01, C03, D07, X26)',24.03,25.52,'Theo định mức chương trình Chất lượng cao','Khoảng 15 - 18 triệu VNĐ/học kỳ','Chương trình Kinh tế chất lượng cao giảng dạy tăng cường bằng tiếng Anh, gắn kết chặt chẽ với mạng lưới ngân hàng và định chế tài chính quốc tế.','Chuyên viên phân tích đầu tư quốc tế, chuyên viên tài chính tại các ngân hàng nước ngoài, tổ chức kinh tế quốc tế.','Yêu cầu có chứng chỉ tiếng Anh tối thiểu Bậc 3 (tương đương IELTS ≥ 4.5) hoặc điểm TB tiếng Anh 3 năm THPT ≥ 8.0.');
INSERT INTO "majors" VALUES(15,'7310401','7310401','Tâm lý học','HPN (Hà Nội)','Khoa Khoa học cơ bản / Tâm lý học',230,'C00, C03, D01, D14, D15',24.6,'24.60 điểm (D01, C00); 24.10 điểm (C03, D14, D15)',24.17,25.63,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.0 triệu VNĐ/học kỳ','Đào tạo chuyên sâu về Tâm lý học tham vấn - trị liệu, Tâm lý học lâm sàng, Tâm lý học học đường và Tâm lý học quản trị nhân sự.','Chuyên viên tham vấn tâm lý học đường, trị liệu tâm lý tại bệnh viện/trung tâm, chuyên viên nhân sự - đào tạo tại doanh nghiệp.','Ngành thu hút đông thí sinh với 230 chỉ tiêu năm 2026.');
INSERT INTO "majors" VALUES(16,'7310109','7310109','Kinh tế số','HPN (Hà Nội)','Khoa Kinh tế và Tài chính',240,'A00, A01, C03, D01, D07, X26',23.25,'23.25 điểm (A00, D01); 22.75 điểm (A01, C03, D07, X26)',23.2,24.9,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.5 triệu VNĐ/học kỳ','Kết hợp giữa kiến thức Kinh tế hiện đại, Phân tích dữ liệu lớn (Big Data), Trí tuệ nhân tạo trong kinh doanh, Fintech và Thương mại điện tử.','Chuyên viên phân tích dữ liệu kinh doanh (Business Analyst), chuyên viên Fintech, quản trị chuyển đổi số, thương mại điện tử.','Một trong những ngành mũi nhọn thời đại số với 240 chỉ tiêu năm 2026.');
INSERT INTO "majors" VALUES(17,'7340115','7340115','Marketing','HPN (Hà Nội)','Khoa Quản trị kinh doanh',190,'A00, A01, C00, C03, D01, D14, D15',24.85,'24.85 điểm (A00, D01, C00); 24.35 điểm (A01, C03, D14, D15)',24.93,26.2,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.5 triệu VNĐ/học kỳ','Đào tạo toàn diện về Digital Marketing, Quản trị thương hiệu, Nghiên cứu thị trường, Hành vi người tiêu dùng và Chiến lược truyền thông Marketing tích hợp (IMC).','Chuyên viên Digital Marketing, Brand Manager, Nghiên cứu thị trường, Quản trị chiến dịch quảng cáo tại các tập đoàn và Agency.','Điểm chuẩn luôn nằm trong Top 5 ngành cao nhất Học viện.');
INSERT INTO "majors" VALUES(18,'7760101PH','7760101','Công tác xã hội (Phân hiệu TP.HCM)','SPN (TP.HCM)','Phân hiệu Học viện tại TP.HCM',70,'C00, C03, D01, D14, D15',23.35,'23.35 điểm (D01); 22.85 điểm (C03, D14, D15); 22.35 điểm (C00)',21.5,23.5,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.0 - 10.5 triệu VNĐ/học kỳ','Đào tạo cử nhân Công tác xã hội tại Phân hiệu TP. Hồ Chí Minh (Số 620 Đỗ Xuân Hợp, phường Phước Long, TP.HCM) đáp ứng nhu cầu nhân lực khu vực phía Nam.','Làm việc tại các tổ chức xã hội, bệnh viện, trường học, doanh nghiệp và cơ quan nhà nước tại TP.HCM và các tỉnh phía Nam.','Mã xét tuyển tại Phân hiệu TP.HCM: Mã trường SPN - Mã ngành 7760101PH.');
INSERT INTO "majors" VALUES(19,'7810103PH','7810103','Quản trị dịch vụ du lịch và lữ hành (Phân hiệu TP.HCM)','SPN (TP.HCM)','Phân hiệu Học viện tại TP.HCM',70,'A00, A01, C00, C03, D01, D14, D15',23.15,'23.15 điểm (A00, D01); 22.65 điểm (A01, C03, D14, D15); 22.15 điểm (C00)',22.0,24.0,'550.000 - 605.000 VNĐ/tín chỉ','Khoảng 9.5 - 11.5 triệu VNĐ/học kỳ','Đào tạo cử nhân Quản trị dịch vụ du lịch và lữ hành tại Phân hiệu TP.HCM, kết nối thực tập trực tiếp với hệ thống doanh nghiệp lữ hành - khách sạn sôi động tại miền Nam.','Điều hành tour, quản lý khách sạn - sự kiện, hướng dẫn viên du lịch tại TP.HCM và khu vực phía Nam.','Mã xét tuyển tại Phân hiệu TP.HCM: Mã trường SPN - Mã ngành 7810103PH.');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('majors',19);
INSERT INTO "sqlite_sequence" VALUES('admission_methods',5);
INSERT INTO "sqlite_sequence" VALUES('english_conversion',5);
INSERT INTO "sqlite_sequence" VALUES('faqs_knowledge',8);
INSERT INTO "sqlite_sequence" VALUES('leads',5);
INSERT INTO "sqlite_sequence" VALUES('chat_logs',3);
COMMIT;
