# Cùng nhau đóng góp

Do năng lực có hạn nên cuốn sách này không thể tránh khỏi những thiếu sót, sai sót. Chúng tôi đánh giá cao sự hiểu biết của bạn và rất biết ơn sự giúp đỡ của bạn trong việc sửa chữa chúng. Nếu bạn phát hiện lỗi chính tả, liên kết bị hỏng, thiếu nội dung, từ ngữ mơ hồ, giải thích không rõ ràng hoặc vấn đề về cấu trúc, vui lòng giúp chúng tôi chỉnh sửa để cung cấp cho độc giả nguồn tài liệu học tập chất lượng cao hơn.

ID GitHub của tất cả [người đóng góp](https://github.com/krahets/hello-algo/graphs/contributors) sẽ được hiển thị trên trang chủ của kho sách, phiên bản web và phiên bản PDF để ghi nhận những đóng góp quên mình của họ cho cộng đồng nguồn mở.

!!! thành công "Sức hấp dẫn của mã nguồn mở"

    Khoảng cách giữa hai lần in của một cuốn sách giấy thường khá dài khiến việc cập nhật nội dung rất bất tiện.

    Ở cuốn sách mã nguồn mở này, thời gian cập nhật nội dung đã được rút ngắn xuống chỉ còn vài ngày, thậm chí vài giờ.

### Điều chỉnh nội dung nhỏ

Như minh họa trong hình bên dưới, có một "biểu tượng chỉnh sửa" ở góc trên bên phải của mỗi trang. Bạn có thể sửa đổi văn bản hoặc mã bằng cách làm theo các bước sau.

1. Nhấp vào "biểu tượng chỉnh sửa". Nếu bạn gặp lời nhắc yêu cầu bạn "Fork kho lưu trữ này", vui lòng phê duyệt thao tác.
2. Sửa đổi nội dung của tệp nguồn Markdown, xác minh tính chính xác của nội dung và duy trì định dạng nhất quán nhất có thể.
3. Điền mô tả về những thay đổi của bạn ở cuối trang, sau đó nhấp vào nút "Đề xuất thay đổi tệp". Sau khi tải trang mới, hãy nhấp vào nút "Tạo yêu cầu kéo" để gửi yêu cầu kéo của bạn.

![Nút chỉnh sửa trang](contribution.assets/edit_markdown.png)

Hình ảnh không thể được sửa đổi trực tiếp. Vui lòng mô tả sự cố bằng cách tạo [Vấn đề](https://github.com/krahets/hello-algo/issues) mới hoặc để lại nhận xét. Chúng tôi sẽ nhanh chóng vẽ lại và thay thế hình ảnh.

### Sáng tạo nội dung

Nếu bạn quan tâm đến việc đóng góp cho dự án nguồn mở này, bao gồm dịch mã sang các ngôn ngữ lập trình khác hoặc mở rộng nội dung bài viết, bạn sẽ cần tuân theo quy trình làm việc của Yêu cầu Kéo bên dưới.

1. Đăng nhập vào GitHub và Fork [kho mã](https://github.com/krahets/hello-algo) của cuốn sách vào tài khoản cá nhân của bạn.
2. Đi tới trang kho lưu trữ phân nhánh của bạn và sử dụng lệnh `git clone` để sao chép kho lưu trữ vào máy cục bộ của bạn.
3. Tạo nội dung cục bộ và tiến hành kiểm tra toàn diện để xác minh tính chính xác của mã.
4. Cam kết các thay đổi cục bộ của bạn và đẩy chúng vào kho lưu trữ từ xa.
5. Làm mới trang web kho lưu trữ và nhấp vào nút "Tạo yêu cầu kéo" để gửi yêu cầu kéo của bạn.

### Triển khai Docker

Từ thư mục gốc của `hello-algo`, hãy chạy lệnh Docker sau để truy cập dự án tại `http://localhost:8000`:

```shell
docker-compose up -d
```

Sử dụng lệnh sau để loại bỏ việc triển khai:

```shell
docker-compose down
```
