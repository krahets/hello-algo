# Bản tóm tắt

### Đánh giá chính

- Đồ thị bao gồm các đỉnh và các cạnh và có thể được biểu diễn dưới dạng một tập hợp các đỉnh và một tập hợp các cạnh.
- So với các mối quan hệ tuyến tính được mô hình hóa bằng danh sách liên kết và các mối quan hệ chia để trị được mô hình hóa bằng cây, các mối quan hệ mạng được mô hình hóa bằng biểu đồ mang lại tính linh hoạt cao hơn nhiều và do đó phức tạp hơn.
- Trong đồ thị có hướng, các cạnh có hướng; trong các đồ thị liên thông, mọi đỉnh đều có thể truy cập được từ bất kỳ đỉnh nào khác; và trong đồ thị có trọng số, mỗi cạnh mang một trọng số.
- Ma trận kề sử dụng ma trận để biểu diễn đồ thị, trong đó mỗi hàng (cột) đại diện cho một đỉnh và các phần tử ma trận đại diện cho các cạnh, sử dụng $1$ hoặc $0$ để cho biết hai đỉnh có cạnh hay không. Ma trận kề có hiệu quả cao cho các phép toán cộng, xóa, tra cứu và sửa đổi nhưng tiêu tốn không gian đáng kể.
- Danh sách kề sử dụng nhiều danh sách liên kết để biểu diễn một biểu đồ: danh sách liên kết $i$-th tương ứng với đỉnh $i$ và lưu trữ tất cả các đỉnh liền kề với nó. So với ma trận kề, danh sách kề sử dụng ít không gian hơn, nhưng việc tra cứu cạnh kém hiệu quả hơn vì danh sách liên kết phải được duyệt qua.
- Khi danh sách liên kết trong danh sách kề quá dài, chúng có thể được chuyển đổi thành cây đỏ đen hoặc bảng băm, từ đó nâng cao hiệu quả tra cứu.
- Từ góc độ thuật toán, ma trận kề thể hiện "trao đổi không gian lấy thời gian", trong khi danh sách kề thể hiện "trao đổi thời gian lấy không gian".
- Đồ thị có thể được sử dụng để mô hình hóa các hệ thống trong thế giới thực khác nhau, chẳng hạn như mạng xã hội và đường tàu điện ngầm.
- Cây là trường hợp đặc biệt của đồ thị và duyệt cây là trường hợp đặc biệt của đồ thị.
- Tìm kiếm theo chiều rộng trong biểu đồ khám phá từ gần đến xa, mở rộng từng lớp và thường được triển khai bằng hàng đợi.
- Tìm kiếm theo chiều sâu trong đồ thị đi theo một đường dẫn càng sâu càng tốt và quay lại khi không thể đi xa hơn và thường được triển khai bằng đệ quy.

### Hỏi đáp

**Q**: Đường đi được xác định là một chuỗi các đỉnh hay một chuỗi các cạnh?

Các định nghĩa trong các phiên bản ngôn ngữ khác nhau của Wikipedia không nhất quán: phiên bản tiếng Anh nêu rõ "đường đi là một chuỗi các cạnh", trong khi phiên bản tiếng Trung nói rằng "đường đi là một chuỗi các đỉnh". Sau đây là văn bản gốc tiếng Anh: Trong lý thuyết đồ thị, đường đi trong đồ thị là một chuỗi hữu hạn hoặc vô hạn các cạnh nối một chuỗi các đỉnh.

Trong văn bản này, một đường dẫn được xem như một chuỗi các cạnh chứ không phải một chuỗi các đỉnh. Điều này là do có thể có nhiều cạnh nối hai đỉnh, trong trường hợp đó mỗi cạnh tương ứng với một đường dẫn.

**Q**: Trong một biểu đồ bị ngắt kết nối, liệu có các đỉnh không thể tiếp cận được không?

Trong đồ thị không liên kết, nếu bạn bắt đầu từ một đỉnh thì ít nhất một đỉnh khác sẽ không thể truy cập được. Để duyệt một đồ thị rời rạc, bạn cần có nhiều điểm bắt đầu để bao phủ tất cả các thành phần được kết nối.

**Q**: Trong danh sách kề, có yêu cầu sắp xếp nào cho các đỉnh liền kề với một đỉnh nhất định không?

Chúng có thể xuất hiện theo bất kỳ thứ tự nào. Tuy nhiên, trong thực tế, chúng có thể cần được sắp xếp theo các quy tắc cụ thể, chẳng hạn như thứ tự các đỉnh được thêm vào hoặc thứ tự các giá trị đỉnh, giúp ích khi nhanh chóng tìm thấy một đỉnh có giá trị cực trị nào đó.
