# MStudio Live — Hướng dẫn cài đặt & kết nối

MStudio Live là phần mềm thu âm từ xa của M.Studio (dựa trên SonoBus mã nguồn mở).
Boss nghe được giọng khách trực tiếp, chất lượng cao, độ trễ thấp — không cần
gọi Zalo rồi loopback từ DAW nữa.

Tải bản cài đặt: https://github.com/mstudiotb-dev/Mstudio-Live/releases
(File: `MStudioLive-1.0.0-Installer.exe`)

---

## 1. Cài đặt (cả máy Boss và máy khách)

1. Tải file `MStudioLive-1.0.0-Installer.exe` ở link trên.
2. Chạy file, bấm Next cho tới hết. Bản cài gồm 2 phần:
   - **Standalone** — app MStudio Live chạy riêng.
   - **VST3** — plugin để chèn vào DAW (mục 3).
3. Khi Windows hỏi Firewall, bấm **Allow / Cho phép** (cả mạng Private và Public).
   Không cho phép thì 2 máy sẽ không thấy nhau.
4. Lần đầu mở app, nếu Windows SmartScreen hiện cảnh báo (do bản này chưa ký số),
   bấm **More info → Run anyway**.

Yêu cầu: Windows 10/11 64-bit.
**Bắt buộc: tai nghe CÓ DÂY cho cả 2 bên.** Không dùng loa ngoài (sẽ vọng),
không dùng tai nghe Bluetooth (trễ khoảng 250ms).

---

## 2. Kết nối (làm trước giờ thu 30 phút)

**Boss làm:**

1. Mở MStudio Live → mục **Connect**.
2. Đặt tên nhóm riêng, ví dụ `MStudio-TienQuang`, đặt mật khẩu → bấm **Create / Join**.
3. Gửi cho khách: tên nhóm + mật khẩu.

**Khách làm:**

1. Mở MStudio Live → mục **Connect**.
2. Nhập tên nhóm + mật khẩu Boss gửi → bấm **Join**.
3. Kiểm tra: **Input** = mic / sound card của mình, **Output** = tai nghe.
4. Nói thử vài câu — thấy sóng nhảy và nghe được nhau là xong.

---

## 3. Thu trong DAW (máy Boss)

1. Trong DAW, chèn plugin VST3 **MStudio Live** vào 1 track riêng —
   giọng khách sẽ vào track này.
2. Beat gửi về cho khách nghe qua MStudio Live để khách hát theo.
3. **Bản thu cuối: file WAV thu LOCAL ở máy khách** (khách bấm Record trong
   MStudio Live, hoặc thu bằng DAW của khách), gửi lại cho Boss sau buổi thu.
   Đường truyền live chỉ để nghe và chỉ đạo, không phải bản thu chính.

---

## 4. Nếu không nghe thấy nhau

- Kiểm tra Input/Output đã đúng mic và tai nghe chưa.
- Kiểm tra Firewall đã Allow chưa (mục 1, bước 3).
- Kiểm tra tên nhóm + mật khẩu gõ đúng chưa (phân biệt hoa/thường).
- Cả 2 cùng thoát nhóm rồi Join lại.
- Dây mạng LAN tốt hơn Wi-Fi; nếu dùng Wi-Fi thì ngồi gần router.
- Khách dùng tai nghe Bluetooth thì đổi sang tai nghe có dây.

---

## 5. Gỡ cài đặt

Control Panel → Programs → MStudio Live → Uninstall (plugin VST3 được gỡ theo).

---

M.Studio — 1B Ngõ 30 Lê Thánh Tông, Bồ Xuyên, Thái Bình — 0933 101 995
