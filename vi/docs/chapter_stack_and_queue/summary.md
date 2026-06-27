# Bản tóm tắt

### Đánh giá chính

- Ngăn xếp là cấu trúc dữ liệu tuân theo nguyên tắc LIFO và có thể được triển khai bằng cách sử dụng mảng hoặc danh sách liên kết.
- Về mặt hiệu quả về mặt thời gian, việc triển khai mảng của ngăn xếp có hiệu suất trung bình cao hơn, nhưng trong quá trình mở rộng, độ phức tạp về thời gian của một thao tác đẩy đơn lẻ giảm xuống $O(n)$. Ngược lại, việc triển khai danh sách liên kết của ngăn xếp mang lại hiệu suất ổn định hơn.
- Về mặt hiệu quả không gian, việc triển khai mảng của ngăn xếp có thể dẫn đến lãng phí không gian ở một mức độ nào đó. Tuy nhiên, cần lưu ý rằng không gian bộ nhớ mà các nút danh sách liên kết chiếm giữ lớn hơn không gian bộ nhớ của các phần tử mảng.
- Hàng đợi là cấu trúc dữ liệu tuân theo nguyên tắc FIFO và cũng có thể được triển khai bằng cách sử dụng mảng hoặc danh sách liên kết. Các kết luận liên quan đến việc so sánh hiệu quả về thời gian và hiệu quả về không gian đối với hàng đợi cũng tương tự như đối với các ngăn xếp được đề cập ở trên.
- Deque là một hàng đợi có độ linh hoạt cao hơn cho phép thêm và xóa các phần tử ở cả hai đầu.

### Hỏi đáp

**Q**: Chức năng tiến và lùi của trình duyệt có được triển khai bằng danh sách liên kết đôi không?

Hành vi tiến và lùi của trình duyệt về cơ bản là một ứng dụng của "ngăn xếp". Khi người dùng truy cập một trang mới, trang đó sẽ được thêm vào đầu ngăn xếp; khi người dùng nhấp vào nút quay lại, trang đó sẽ được bật lên từ đầu ngăn xếp. Deque có thể hỗ trợ một cách thuận tiện một số thao tác bổ sung, như đã đề cập trong phần "Deque".

**Q**: Sau khi lấy ra khỏi ngăn xếp, chúng ta có cần giải phóng bộ nhớ của nút được lấy ra không?

Nếu nút đã bật ra sau này vẫn cần thiết thì bộ nhớ không cần phải được giải phóng. Nếu sau đó nó không được sử dụng, các ngôn ngữ như Java và Python có tính năng thu gom rác tự động, do đó không cần phải phân bổ bộ nhớ thủ công; trong C và C++, việc phân bổ bộ nhớ thủ công là cần thiết.

**Q**: Một deque có vẻ giống như hai ngăn xếp được ghép lại với nhau. Mục đích của nó là gì?

Deque giống như sự kết hợp giữa ngăn xếp và hàng đợi hoặc hai ngăn xếp được nối với nhau. Nó kết hợp logic của cả hai, do đó nó có thể hỗ trợ tất cả các ứng dụng của ngăn xếp và hàng đợi đồng thời mang lại tính linh hoạt cao hơn.

**Q**: Việc hoàn tác và làm lại được triển khai cụ thể như thế nào?

Sử dụng hai ngăn xếp: ngăn xếp `A` để hoàn tác và xếp chồng `B` để làm lại.

1. Bất cứ khi nào người dùng thực hiện một thao tác, hãy đẩy thao tác này lên ngăn xếp `A` và xóa ngăn xếp `B`.
2. Khi người dùng thực hiện "hoàn tác", hãy bật thao tác gần đây nhất từ ​​ngăn xếp `A` và đẩy thao tác đó vào ngăn xếp `B`.
3. Khi người dùng thực hiện "làm lại", hãy bật thao tác gần đây nhất từ ​​ngăn xếp `B` và đẩy nó vào ngăn xếp `A`.
