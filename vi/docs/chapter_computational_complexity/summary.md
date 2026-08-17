# Bản tóm tắt

### Đánh giá chính

**Đánh giá hiệu quả thuật toán**

- Hiệu quả về thời gian và hiệu quả về không gian là hai thước đo đánh giá chính để đo hiệu suất thuật toán.
- Chúng ta có thể đánh giá hiệu quả của thuật toán thông qua thử nghiệm thực tế, nhưng rất khó để loại bỏ ảnh hưởng của môi trường thử nghiệm và nó tiêu tốn tài nguyên tính toán đáng kể.
- Phân tích độ phức tạp có thể khắc phục những hạn chế của thử nghiệm thực tế. Kết quả của nó áp dụng trên các nền tảng đang chạy và nó có thể tiết lộ hiệu quả của thuật toán theo các quy mô dữ liệu khác nhau.

**Độ phức tạp về thời gian**

- Độ phức tạp về thời gian được sử dụng để đo xu hướng thời gian chạy thuật toán khi khối lượng dữ liệu tăng lên. Nó có thể đánh giá hiệu quả thuật toán một cách hiệu quả, nhưng có thể ít thông tin hơn trong một số trường hợp nhất định, chẳng hạn như khi khối lượng dữ liệu đầu vào nhỏ hoặc khi độ phức tạp về thời gian giống nhau, khiến không thể so sánh chính xác hiệu quả của thuật toán.
- Độ phức tạp về thời gian trong trường hợp xấu nhất được biểu thị bằng ký hiệu Big $O$, tương ứng với cận trên tiệm cận của hàm, phản ánh mức độ tăng trưởng của số lượng thao tác $T(n)$ khi $n$ tiến đến vô cực dương.
- Việc suy ra độ phức tạp về thời gian bao gồm hai bước: đầu tiên, đếm số lượng thao tác, sau đó xác định giới hạn tiệm cận trên.
- Độ phức tạp về thời gian phổ biến được sắp xếp từ thấp đến cao bao gồm $O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$ và $O(n!)$.
- Độ phức tạp về thời gian của một số thuật toán không cố định mà phụ thuộc vào việc phân phối dữ liệu đầu vào. Độ phức tạp thời gian được chia thành độ phức tạp thời gian trường hợp xấu nhất, trường hợp tốt nhất và trường hợp trung bình. Độ phức tạp về thời gian trong trường hợp tốt nhất hiếm khi được sử dụng vì dữ liệu đầu vào thường cần đáp ứng các điều kiện nghiêm ngặt để đạt được trường hợp tốt nhất.
- Độ phức tạp thời gian trung bình phản ánh hiệu quả thời gian chạy của thuật toán trong điều kiện nhập dữ liệu ngẫu nhiên và gần nhất với hiệu suất của thuật toán trong các ứng dụng thực tế. Tính toán độ phức tạp thời gian trung bình yêu cầu phân tích phân phối dữ liệu đầu vào và kỳ vọng toán học thu được.

**Độ phức tạp của không gian**

- Độ phức tạp về không gian phục vụ mục đích tương tự như độ phức tạp về thời gian, được sử dụng để đo lường xu hướng sử dụng bộ nhớ thuật toán khi khối lượng dữ liệu tăng lên.
- Không gian bộ nhớ liên quan đến việc thực hiện thuật toán có thể được chia thành không gian đầu vào, không gian tạm thời và không gian đầu ra. Thông thường, không gian đầu vào không được đưa vào tính toán độ phức tạp của không gian. Không gian tạm thời có thể được chia thành dữ liệu tạm thời, không gian khung ngăn xếp và không gian lệnh, trong đó không gian khung ngăn xếp thường chỉ ảnh hưởng đến độ phức tạp của không gian trong các hàm đệ quy.
- Chúng tôi thường chỉ tập trung vào độ phức tạp không gian trong trường hợp xấu nhất, tức là độ phức tạp không gian của thuật toán trong dữ liệu đầu vào trong trường hợp xấu nhất và thời gian chạy trong trường hợp xấu nhất.
- Độ phức tạp của không gian phổ biến được sắp xếp từ thấp đến cao bao gồm $O(1)$, $O(\log n)$, $O(n)$, $O(n^2)$ và $O(2^n)$.

### Hỏi đáp

**Q**: Độ phức tạp về không gian của đệ quy đuôi có phải là $O(1)$ không?

Về mặt lý thuyết, độ phức tạp về không gian của hàm đệ quy đuôi có thể được tối ưu hóa thành $O(1)$. Tuy nhiên, hầu hết các ngôn ngữ lập trình (chẳng hạn như Java, Python, C++, Go, C#, v.v.) không hỗ trợ tối ưu hóa đệ quy đuôi tự động, do đó độ phức tạp của không gian thường được coi là $O(n)$.

**Q**: Sự khác biệt giữa thuật ngữ hàm và phương thức là gì?

Hàm <u></u> có thể được thực thi độc lập với tất cả tham số được truyền rõ ràng. Phương thức <u></u> được liên kết với một đối tượng, được liên kết ngầm với đối tượng gọi nó và có thể hoạt động trên dữ liệu chứa trong các phiên bản của lớp.

Các ví dụ sau đây sử dụng một số ngôn ngữ lập trình phổ biến để minh họa.

- C là ngôn ngữ lập trình thủ tục không có khái niệm hướng đối tượng nên chỉ có chức năng. Tuy nhiên, chúng ta có thể mô phỏng lập trình hướng đối tượng bằng cách tạo cấu trúc (struct), và các hàm liên kết với cấu trúc tương đương với các phương thức trong các ngôn ngữ lập trình khác.
- Java và C# là các ngôn ngữ lập trình hướng đối tượng trong đó các khối mã (phương thức) thường là một phần của một lớp. Các phương thức tĩnh hoạt động giống như các hàm vì chúng bị ràng buộc với lớp và không thể truy cập các biến thể hiện cụ thể.
- C++ và Python hỗ trợ cả lập trình thủ tục (hàm) và lập trình hướng đối tượng (phương thức).

**Q**: Sơ đồ về "các loại độ phức tạp của không gian chung" có phản ánh kích thước tuyệt đối của không gian bị chiếm dụng không?

Không, sơ đồ cho thấy độ phức tạp của không gian, phản ánh xu hướng tăng trưởng hơn là quy mô tuyệt đối của không gian bị chiếm dụng.

Giả sử $n = 8$, bạn có thể thấy rằng giá trị của mỗi đường cong không tương ứng với các hàm. Điều này là do mỗi đường cong chứa một thuật ngữ không đổi được sử dụng để nén phạm vi giá trị thành một phạm vi dễ nhìn thấy.

Trong thực tế, vì chúng ta thường không biết chi phí "không đổi" của từng phương pháp nên chúng ta thường không thể chọn giải pháp tối ưu cho các trường hợp như $n = 8$ chỉ dựa trên độ phức tạp. Nhưng với $n = 8^5$, sự lựa chọn rất đơn giản vì xu hướng tăng trưởng đã chiếm ưu thế.

**Q**: Có tình huống nào mà thuật toán được thiết kế để hy sinh thời gian (hoặc không gian) dựa trên các trường hợp sử dụng thực tế không?

Trong các ứng dụng thực tế, hầu hết các tình huống đều chọn cách hy sinh không gian để lấy thời gian. Ví dụ: với các chỉ mục cơ sở dữ liệu, chúng tôi thường chọn xây dựng cây B+ hoặc chỉ mục băm, chiếm không gian bộ nhớ đáng kể để đổi lấy các truy vấn hiệu quả $O(\log n)$ hoặc thậm chí $O(1)$.

Trong những tình huống mà tài nguyên không gian là quý giá, thời gian có thể bị hy sinh cho không gian. Ví dụ: trong phát triển nhúng, bộ nhớ thiết bị rất quý giá và các kỹ sư có thể từ bỏ việc sử dụng bảng băm và chọn sử dụng tìm kiếm tuần tự theo mảng để tiết kiệm mức sử dụng bộ nhớ, nhưng phải trả giá bằng việc tìm kiếm chậm hơn.
