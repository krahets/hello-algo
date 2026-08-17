# Bản tóm tắt

### Đánh giá chính

- Các thuật toán có mặt khắp nơi trong cuộc sống hàng ngày và không phải là một khối kiến ​​thức xa xôi, bí truyền. Trên thực tế, chúng ta đã học được nhiều thuật toán một cách vô thức và sử dụng chúng để giải quyết các vấn đề lớn nhỏ trong cuộc sống.
- Nguyên tắc tra từ điển phù hợp với thuật toán tìm kiếm nhị phân. Tìm kiếm nhị phân thể hiện ý tưởng thuật toán quan trọng về phân chia và chinh phục.
- Quá trình sắp xếp các lá bài rất giống với thuật toán sắp xếp chèn. Sắp xếp chèn phù hợp để sắp xếp các tập dữ liệu nhỏ.
- Các bước thực hiện thay đổi về cơ bản là một thuật toán tham lam, trong đó lựa chọn tốt nhất được đưa ra ở mỗi bước dựa trên tình hình hiện tại.
- Thuật toán là một tập hợp các hướng dẫn hoặc các bước vận hành để giải quyết một vấn đề cụ thể trong một khoảng thời gian hữu hạn, trong khi cấu trúc dữ liệu là cách tổ chức và lưu trữ dữ liệu trong máy tính.
- Cấu trúc dữ liệu và thuật toán được kết nối chặt chẽ. Cấu trúc dữ liệu là nền tảng của thuật toán và thuật toán thổi sức sống vào cấu trúc dữ liệu.
- Chúng ta có thể so sánh cấu trúc dữ liệu và thuật toán với việc lắp ráp các khối xây dựng. Các khối biểu thị dữ liệu, cách chúng được định hình và kết nối thể hiện cấu trúc dữ liệu và các bước được sử dụng để tập hợp chúng tương ứng với thuật toán.

### Hỏi đáp

**Q**: Là một lập trình viên, tôi chưa bao giờ sử dụng thuật toán để giải quyết các vấn đề trong công việc hàng ngày của mình. Các thuật toán phổ biến đã được gói gọn trong các ngôn ngữ lập trình và có thể được sử dụng trực tiếp. Phải chăng điều này có nghĩa là các vấn đề trong công việc của chúng ta vẫn chưa đạt đến mức cần đến thuật toán?

Nếu chúng ta so sánh các kỹ năng làm việc cụ thể với “kỹ thuật” trong võ thuật, thì các môn cơ bản sẽ giống “nội công” hơn.

Tôi tin rằng tầm quan trọng của việc học các thuật toán (và các môn học cơ bản khác) không phải là việc bạn cần phải triển khai chúng ngay từ đầu trong công việc, mà là kiến ​​thức bạn thu được cho phép bạn đưa ra những đánh giá chuyên nghiệp đúng đắn khi giải quyết vấn đề, từ đó cải thiện chất lượng tổng thể công việc của bạn. Đây là một ví dụ đơn giản. Mọi ngôn ngữ lập trình đều có chức năng sắp xếp tích hợp:

- Nếu chúng ta chưa nghiên cứu cấu trúc dữ liệu và thuật toán, chúng ta có thể chỉ cần cung cấp bất kỳ dữ liệu nhất định nào cho chức năng sắp xếp này. Nó chạy trơn tru với hiệu suất tốt và dường như không có vấn đề gì.
- Nhưng nếu chúng ta đã nghiên cứu các thuật toán, chúng ta sẽ biết rằng độ phức tạp về thời gian của hàm sắp xếp tích hợp sẵn là $O(n \log n)$. Tuy nhiên, nếu dữ liệu đã cho bao gồm các số nguyên có số chữ số cố định (chẳng hạn như ID sinh viên), chúng ta có thể sử dụng "sắp xếp cơ số" hiệu quả hơn, giảm độ phức tạp về thời gian xuống $O(nk)$, trong đó $k$ là số chữ số. Khi khối lượng dữ liệu rất lớn, thời gian chạy được lưu có thể tạo ra giá trị đáng kể (giảm chi phí, cải thiện trải nghiệm, v.v.).

Trong kỹ thuật, nhiều vấn đề khó giải quyết một cách tối ưu và nhiều vấn đề khác chỉ được giải quyết “đủ tốt”. Độ khó của một vấn đề một mặt phụ thuộc vào bản chất của vấn đề đó và mặt khác phụ thuộc vào kiến ​​thức của người nghiên cứu nó. Kiến thức của một người càng đầy đủ và họ càng có nhiều kinh nghiệm thì khả năng phân tích của họ càng sâu và vấn đề có thể được giải quyết một cách tao nhã hơn.
