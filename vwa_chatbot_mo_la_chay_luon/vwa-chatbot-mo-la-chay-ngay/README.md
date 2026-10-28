# 🎓 Bản Chạy Ngay (Zero-Setup) - Web & Chatbot AI Tư vấn Tuyển sinh Học viện Phụ nữ Việt Nam (VWA)

Phiên bản này được đóng gói **Tất cả trong một (All-in-One)**: Toàn bộ Giao diện, Bộ máy AI Hybrid RAG và 6 bảng Cơ sở dữ liệu Tuyển sinh 2026 đã được nhúng trực tiếp vào bên trong file HTML.

## 🚀 Cách mở lên là chạy luôn (Không cần cài đặt bất cứ thư viện nào):
1. **Cách 1 (Click đúp trực tiếp):** Nhấp đúp chuột vào file **`MO_FILE_NAY_LA_CHAY_LUON.html`** (hoặc `index.html`) — trình duyệt sẽ mở lên và toàn bộ Chatbot AI + Database hoạt động ngay lập tức 100%!
2. **Cách 2 (Mở trong Visual Studio Code):** Mở thư mục này trong VS Code, bấm chuột phải vào `index.html` chọn **Open with Live Server** (hoặc kéo thả file `index.html` vào trình duyệt).

## 🗄️ Đầy đủ Database đi kèm trong thư mục `database/`:
- Đã nhúng trực tiếp 6 bảng (`majors`, `admission_methods`, `english_conversion`, `faqs_knowledge`, `leads`, `chat_logs`) vào bộ nhớ ứng dụng và `localStorage` của trình duyệt (bạn thêm thí sinh hoặc nạp thêm câu hỏi FAQ ở tab Quản trị đều được lưu lại).
- Kèm theo đầy đủ 3 định dạng file vật lý trong thư mục `database/` để bạn nộp báo cáo hoặc mở xem trên VS Code:
  + `database/vwa_admissions.db` (SQLite Database)
  + `database/schema_and_seed.sql` (Kịch bản lệnh SQL tạo bảng và dữ liệu)
  + `database/vwa_admissions_database.json` (Dữ liệu JSON chuẩn)
