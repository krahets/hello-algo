# Bản tóm tắt

### Đánh giá chính

- Tìm kiếm nhị phân dựa trên dữ liệu được sắp xếp và tìm kiếm bằng cách liên tục giảm một nửa khoảng thời gian tìm kiếm. Nó yêu cầu dữ liệu đầu vào phải được sắp xếp và chỉ áp dụng cho mảng hoặc cấu trúc dữ liệu dựa trên mảng.
- Tìm kiếm Brute-Force định vị dữ liệu bằng cách duyệt qua cấu trúc dữ liệu. Tìm kiếm tuyến tính áp dụng cho mảng và danh sách liên kết, trong khi tìm kiếm theo chiều rộng và tìm kiếm theo chiều sâu áp dụng cho biểu đồ và cây. Các thuật toán này có thể áp dụng rộng rãi và không yêu cầu xử lý trước dữ liệu, nhưng độ phức tạp về thời gian tương đối cao của chúng là $O(n)$.
- Tìm kiếm dựa trên hàm băm, tìm kiếm cây và tìm kiếm nhị phân là các phương pháp tìm kiếm hiệu quả có thể nhanh chóng xác định vị trí các phần tử mục tiêu trong cấu trúc dữ liệu cụ thể. Các thuật toán như vậy có hiệu quả cao với độ phức tạp về thời gian đạt $O(\log n)$ hoặc thậm chí $O(1)$, nhưng thường yêu cầu cấu trúc dữ liệu bổ sung.
- Trong thực tế, chúng ta cần phân tích các yếu tố như quy mô dữ liệu, yêu cầu về hiệu suất tìm kiếm cũng như tần suất truy vấn và cập nhật dữ liệu để chọn phương pháp tìm kiếm phù hợp.
- Tìm kiếm tuyến tính phù hợp với các tập dữ liệu nhỏ hoặc dữ liệu được cập nhật thường xuyên; tìm kiếm nhị phân phù hợp với các tập dữ liệu được sắp xếp lớn; tìm kiếm dựa trên hàm băm phù hợp khi yêu cầu hiệu quả truy vấn cao và truy vấn phạm vi là không cần thiết; tìm kiếm cây phù hợp với các tập dữ liệu động lớn phải duy trì thứ tự và hỗ trợ các truy vấn phạm vi.
- Thay thế tìm kiếm tuyến tính bằng tìm kiếm dựa trên hàm băm là một chiến lược thường được sử dụng để tối ưu hóa thời gian chạy, giảm độ phức tạp về thời gian từ $O(n)$ xuống $O(1)$.
