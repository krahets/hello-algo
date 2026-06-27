# Bản tóm tắt

### Đánh giá chính

- Các thuật toán tham lam thường được sử dụng để giải các bài toán tối ưu hóa. Nguyên tắc là đưa ra các quyết định tối ưu cục bộ ở mỗi giai đoạn quyết định với hy vọng đạt được giải pháp tối ưu toàn cục.
- Các thuật toán tham lam lặp đi lặp lại thực hiện hết lựa chọn tham lam này đến lựa chọn tham lam khác, chuyển vấn đề thành một bài toán con nhỏ hơn trong mỗi vòng cho đến khi vấn đề được giải quyết.
- Thuật toán tham lam không chỉ dễ thực hiện mà còn có hiệu quả giải quyết vấn đề cao. So với lập trình động, thuật toán tham lam thường có độ phức tạp về thời gian thấp hơn.
- Trong bài toán đổi xu, đối với một số kết hợp đồng xu nhất định, thuật toán tham lam có thể đảm bảo tìm ra giải pháp tối ưu; Tuy nhiên, đối với các kết hợp tiền xu khác, thuật toán tham lam có thể tìm ra giải pháp rất kém.
- Các bài toán phù hợp để giải bằng thuật toán tham lam có hai thuộc tính chính: thuộc tính lựa chọn tham lam và cấu trúc con tối ưu. Thuộc tính lựa chọn tham lam thể hiện tính hiệu quả của chiến lược tham lam.
- Đối với một số bài toán phức tạp, việc chứng minh tính chất lựa chọn tham lam không hề đơn giản. Nói một cách tương đối, việc bác bỏ nó dễ dàng hơn, chẳng hạn như trong vấn đề đổi xu.
- Giải quyết vấn đề tham lam chủ yếu bao gồm ba bước: phân tích vấn đề, xác định chiến lược tham lam và chứng minh tính đúng đắn. Trong số này, việc xác định chiến lược tham lam là bước cốt lõi và việc chứng minh tính đúng đắn thường là khó khăn chính.
- Bài toán ba lô phân số, dựa trên bài toán ba lô 0-1, cho phép chọn các phân số của các vật phẩm và do đó có thể được giải bằng thuật toán tham lam. Tính đúng đắn của chiến lược tham lam có thể được chứng minh bằng cách chứng minh bằng phản chứng.
- Vấn đề về dung lượng tối đa có thể được giải quyết bằng cách sử dụng phép liệt kê toàn diện với độ phức tạp về thời gian $O(n^2)$. Bằng cách thiết kế một chiến lược tham lam để di chuyển phía ngắn hơn vào trong mỗi vòng, độ phức tạp về thời gian có thể được tối ưu hóa thành $O(n)$.
- Trong bài toán cắt sản phẩm tối đa, chúng ta lần lượt rút ra hai chiến lược tham lam: các số nguyên $\geq 4$ sẽ tiếp tục được chia và hệ số chia tối ưu là $3$. Mã bao gồm các phép toán lũy thừa và độ phức tạp về thời gian phụ thuộc vào phương pháp triển khai lũy thừa, thường là $O(1)$ hoặc $O(\log n)$.
