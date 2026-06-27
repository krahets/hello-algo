# Bản tóm tắt

### Đánh giá chính

- Với đầu vào `key`, bảng băm có thể truy xuất `value` tương ứng trong thời gian $O(1)$, điều này có hiệu quả cao.
- Các thao tác bảng băm phổ biến bao gồm truy vấn, thêm cặp khóa-giá trị, xóa cặp khóa-giá trị và duyệt qua bảng băm.
- Hàm băm ánh xạ `key` tới một chỉ mục mảng, cho phép truy cập vào nhóm tương ứng và truy xuất `value`.
- Hai khóa khác nhau có thể có cùng chỉ mục mảng sau khi băm, dẫn đến kết quả truy vấn sai. Hiện tượng này được gọi là va chạm băm.
- Dung lượng của bảng băm càng lớn thì xác suất xung đột băm càng thấp. Do đó, việc mở rộng bảng băm có thể giảm thiểu xung đột băm. Tương tự như việc mở rộng mảng, việc mở rộng bảng băm rất tốn kém.
- Hệ số tải, được định nghĩa là số phần tử chia cho số nhóm, phản ánh mức độ nghiêm trọng của xung đột băm và thường được sử dụng làm điều kiện để kích hoạt mở rộng bảng băm.
- Phân tách các xung đột băm địa chỉ chuỗi bằng cách lưu trữ tất cả các phần tử va chạm trong cùng một danh sách liên kết. Tuy nhiên, danh sách liên kết quá dài có thể làm giảm hiệu quả truy vấn, điều này có thể được cải thiện bằng cách chuyển đổi thêm danh sách liên kết thành cây đỏ đen.
- Địa chỉ mở xử lý các xung đột băm thông qua nhiều lần thăm dò. Thăm dò tuyến tính sử dụng kích thước bước cố định nhưng không thể xóa các phần tử và dễ bị phân cụm. Băm kép sử dụng nhiều hàm băm để thăm dò, giúp giảm phân cụm so với thăm dò tuyến tính nhưng lại tăng chi phí tính toán.
- Các ngôn ngữ lập trình khác nhau áp dụng các cách triển khai bảng băm khác nhau. Ví dụ: `HashMap` của Java sử dụng chuỗi riêng biệt, trong khi `dict` của Python sử dụng địa chỉ mở.
- Trong bảng băm, chúng tôi mong muốn các thuật toán băm có tính xác định, hiệu quả cao và phân phối đồng đều. Trong mật mã, thuật toán băm cũng phải có khả năng chống va chạm và hiệu ứng tuyết lở.
- Thuật toán băm thường sử dụng các số nguyên tố lớn làm mô đun để tối đa hóa sự phân bố đồng đều của các giá trị băm và giảm xung đột băm.
- Các thuật toán băm phổ biến bao gồm MD5, SHA-1, SHA-2 và SHA-3. MD5 thường được sử dụng để kiểm tra tính toàn vẹn của tệp, trong khi SHA-2 thường được sử dụng trong các ứng dụng và giao thức bảo mật.
- Các ngôn ngữ lập trình thường cung cấp thuật toán băm tích hợp cho các kiểu dữ liệu để tính chỉ số nhóm trong bảng băm. Nói chung, chỉ những đối tượng bất biến mới có thể băm được.

### Hỏi đáp

**Q**: Khi nào độ phức tạp về thời gian của bảng băm giảm xuống $O(n)$?

Độ phức tạp về thời gian của bảng băm có thể giảm xuống $O(n)$ khi xung đột băm nghiêm trọng. Khi hàm băm được thiết kế tốt, dung lượng được đặt phù hợp và các va chạm được phân bố đều, độ phức tạp về thời gian là $O(1)$. Chúng tôi thường coi độ phức tạp về thời gian là $O(1)$ khi sử dụng bảng băm tích hợp trong ngôn ngữ lập trình.

**Q**: Tại sao không sử dụng hàm băm $f(x) = x$? Điều này sẽ loại bỏ va chạm.

Trong hàm băm $f(x) = x$, mỗi phần tử tương ứng với một chỉ mục nhóm duy nhất, tương đương với một mảng. Tuy nhiên, không gian đầu vào thường lớn hơn nhiều so với không gian đầu ra (độ dài mảng), vì vậy bước cuối cùng của hàm băm thường là lấy modulo của độ dài mảng. Nói cách khác, mục tiêu của bảng băm là ánh xạ không gian trạng thái lớn hơn sang không gian trạng thái nhỏ hơn trong khi vẫn cung cấp hiệu quả truy vấn $O(1)$.

**Q**: Tại sao bảng băm có thể hiệu quả hơn mảng, danh sách liên kết hoặc cây nhị phân, ngay cả khi bảng băm được triển khai bằng các cấu trúc này?

Thứ nhất, bảng băm có hiệu quả về thời gian cao hơn nhưng hiệu quả về không gian lại thấp hơn. Một phần đáng kể bộ nhớ trong bảng băm vẫn chưa được sử dụng.

Thứ hai, bảng băm chỉ tiết kiệm thời gian hơn trong các trường hợp sử dụng cụ thể. Nếu một tính năng có thể được triển khai với cùng độ phức tạp về thời gian bằng cách sử dụng một mảng hoặc danh sách liên kết thì việc đó thường nhanh hơn việc sử dụng bảng băm. Điều này là do việc tính toán hàm băm phát sinh chi phí, làm cho hệ số không đổi về độ phức tạp thời gian lớn hơn.

Cuối cùng, độ phức tạp về thời gian của bảng băm có thể giảm đi. Ví dụ: trong chuỗi riêng biệt, chúng tôi thực hiện các hoạt động tìm kiếm trong danh sách được liên kết hoặc cây đỏ-đen, vẫn có nguy cơ giảm xuống thời gian $O(n)$.

**Q**: Băm kép cũng có nhược điểm là không thể xóa trực tiếp các phần tử phải không? Không gian được đánh dấu là đã xóa có thể được sử dụng lại không?

Băm kép là một dạng địa chỉ mở và tất cả các phương pháp đánh địa chỉ mở đều có nhược điểm là không thể xóa các phần tử trực tiếp; họ yêu cầu đánh dấu các phần tử đã bị xóa. Không gian được đánh dấu có thể được tái sử dụng. Khi chèn phần tử mới vào bảng băm và hàm băm trỏ đến một vị trí được đánh dấu là đã xóa, vị trí đó có thể được sử dụng bởi phần tử mới. Điều này duy trì trình tự thăm dò của bảng băm trong khi vẫn đảm bảo sử dụng không gian hiệu quả.

**Q**: Tại sao xung đột băm xảy ra trong quá trình tìm kiếm trong thăm dò tuyến tính?

Trong quá trình tìm kiếm, hàm băm trỏ đến cặp nhóm và khóa-giá trị tương ứng. Nếu `key` không khớp, điều đó cho biết có xung đột băm. Do đó, việc thăm dò tuyến tính sẽ tìm kiếm đi xuống ở kích thước bước được xác định trước cho đến khi tìm thấy cặp khóa-giá trị chính xác hoặc tìm kiếm không thành công.

**Q**: Tại sao việc mở rộng bảng băm có thể làm giảm bớt xung đột băm?

Bước cuối cùng của hàm băm thường liên quan đến việc lấy modulo của độ dài mảng $n$, để giữ đầu ra trong phạm vi chỉ số mảng. Khi mở rộng, độ dài mảng $n$ thay đổi và các chỉ số tương ứng với các khóa cũng có thể thay đổi. Các khóa trước đây được ánh xạ tới cùng một nhóm có thể được phân phối trên nhiều nhóm sau khi mở rộng, do đó giảm thiểu xung đột băm.

**Q**: Nếu mục tiêu là truy cập hiệu quả, tại sao không sử dụng trực tiếp một mảng?

Khi giá trị `key` là số nguyên liên tục trong một phạm vi nhỏ, mảng thực sự là một lựa chọn đơn giản và hiệu quả. Nhưng khi `key` thuộc loại khác, chẳng hạn như chuỗi, chúng ta cần hàm băm để ánh xạ `key` tới một chỉ mục mảng và sau đó lưu trữ phần tử trong mảng nhóm. Cấu trúc đó chính xác là bảng băm.
