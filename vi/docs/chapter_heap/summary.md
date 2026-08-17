# Bản tóm tắt

### Đánh giá chính

- Đống là một cây nhị phân hoàn chỉnh. Tùy thuộc vào thuộc tính mà nó thỏa mãn, nó có thể được phân loại thành heap tối đa hoặc heap tối thiểu. Phần tử trên cùng của heap tối đa (heap tối thiểu) là phần tử lớn nhất (nhỏ nhất).
- Hàng đợi ưu tiên là hàng đợi trong đó các phần tử được sắp xếp theo mức độ ưu tiên và thường được triển khai bằng cách sử dụng một đống.
- Các thao tác heap phổ biến và độ phức tạp về thời gian tương ứng của chúng bao gồm việc chèn một phần tử $O(\log n)$, loại bỏ phần tử trên cùng $O(\log n)$ và truy cập vào phần tử trên cùng $O(1)$.
- Cây nhị phân hoàn chỉnh rất phù hợp cho việc biểu diễn mảng, vì vậy chúng ta thường sử dụng mảng để lưu trữ các đống.
- Hoạt động Heapify được sử dụng để duy trì thuộc tính heap và được sử dụng trong cả hoạt động chèn và loại bỏ phần tử.
- Việc xây dựng một đống từ các phần tử đầu vào $n$ có thể được tối ưu hóa thành $O(n)$, mang lại hiệu quả cao.
- Top-k là một vấn đề thuật toán cổ điển có thể được giải quyết một cách hiệu quả bằng cách sử dụng heap, với độ phức tạp về thời gian là $O(n \log k)$.

### Hỏi đáp

**Q**: Thuật ngữ "heap" trong cấu trúc dữ liệu có giống với "heap" trong quản lý bộ nhớ không?

Chúng không phải là cùng một khái niệm; họ chỉ đơn giản là có cùng tên. Trong hệ thống máy tính, heap là một phần của quá trình cấp phát bộ nhớ động và các chương trình có thể sử dụng nó để lưu trữ dữ liệu khi chạy. Một chương trình có thể yêu cầu một lượng bộ nhớ heap nhất định để lưu trữ các cấu trúc phức tạp như đối tượng và mảng. Khi dữ liệu không còn cần thiết, chương trình phải giải phóng bộ nhớ đó để tránh rò rỉ bộ nhớ. So với bộ nhớ ngăn xếp, bộ nhớ heap yêu cầu quản lý và sử dụng cẩn thận hơn; xử lý không đúng cách có thể dẫn đến các vấn đề như rò rỉ bộ nhớ và con trỏ lơ lửng.
