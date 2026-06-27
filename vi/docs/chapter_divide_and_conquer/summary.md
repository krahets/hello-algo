# Bản tóm tắt

### Đánh giá chính

- Chia để trị là một chiến lược thiết kế thuật toán phổ biến bao gồm hai giai đoạn, chia (phân vùng) và chinh phục (hợp nhất) và thường được triển khai đệ quy.
- Tiêu chí để xác định xem một bài toán có phải là bài toán chia để trị hay không bao gồm: bài toán đó có thể được phân tách hay không, các bài toán con có độc lập hay không và liệu các bài toán con có thể được hợp nhất hay không.
- Sắp xếp hợp nhất là một ứng dụng điển hình của chiến lược chia để trị. Nó chia đệ quy một mảng thành hai mảng con có độ dài bằng nhau cho đến khi chỉ còn lại một phần tử, sau đó hợp nhất chúng từng lớp để hoàn thành việc sắp xếp.
- Việc giới thiệu chiến lược chia để trị thường có thể cải thiện hiệu quả của thuật toán. Một mặt, nó làm giảm số lượng thao tác; mặt khác, nó làm cho việc tối ưu hóa song song của hệ thống trở nên dễ dàng hơn.
- Chia để trị có thể giải quyết nhiều vấn đề thuật toán và cũng được sử dụng rộng rãi trong cấu trúc dữ liệu và thiết kế thuật toán, khiến nó trở nên phổ biến.
- So với tìm kiếm brute-force, tìm kiếm thích ứng hiệu quả hơn. Các thuật toán tìm kiếm có độ phức tạp về thời gian $O(\log n)$ thường được triển khai dựa trên chiến lược phân chia để chinh phục.
- Tìm kiếm nhị phân là một ứng dụng điển hình khác của phép chia để trị. Nó không bao gồm bước hợp nhất lời giải của các bài toán con. Chúng ta có thể thực hiện tìm kiếm nhị phân thông qua phép chia và chinh phục đệ quy.
- Trong bài toán xây dựng cây nhị phân, việc xây dựng cây (bài toán ban đầu) có thể được chia thành xây dựng cây con bên trái và cây con bên phải (các bài toán con), có thể đạt được bằng cách chia các khoảng chỉ mục của các lần duyệt thứ tự trước và thứ tự.
- Trong bài toán hanota, một bài toán có kích thước $n$ có thể được chia thành hai bài toán con có kích thước $n-1$ và một bài toán con có kích thước $1$. Sau khi giải quyết ba bài toán con này theo thứ tự, bài toán ban đầu sẽ được giải.
