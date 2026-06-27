# Bản tóm tắt

### Đánh giá chính

- Cây nhị phân là một cấu trúc dữ liệu phi tuyến tính thể hiện logic phân chia và chinh phục để chia thành hai. Mỗi nút cây nhị phân chứa một giá trị và hai con trỏ trỏ đến các nút con trái và phải của nó.
- Đối với một nút nhất định trong cây nhị phân, cây được hình thành bởi nút con trái (phải) của nó và tất cả các nút bên dưới được gọi là cây con trái (phải) của nút đó.
- Thuật ngữ liên quan của cây nhị phân bao gồm nút gốc, nút lá, cấp độ, độ, cạnh, chiều cao và độ sâu.
- Các hoạt động khởi tạo, chèn nút và loại bỏ nút của cây nhị phân tương tự như các hoạt động của danh sách liên kết.
- Các loại cây nhị phân phổ biến bao gồm cây nhị phân hoàn hảo, cây nhị phân hoàn chỉnh, cây nhị phân đầy đủ và cây nhị phân cân bằng. Cây nhị phân hoàn hảo là dạng lý tưởng, trong khi danh sách liên kết đại diện cho trường hợp suy biến xấu nhất.
- Cây nhị phân có thể được biểu diễn bằng cách sử dụng một mảng bằng cách sắp xếp các giá trị nút và các vị trí trống theo trình tự truyền tải theo thứ tự cấp độ và triển khai các con trỏ dựa trên mối quan hệ ánh xạ chỉ mục giữa các nút cha và nút con.
- Truyền tải thứ tự cấp độ của cây nhị phân là phương pháp tìm kiếm theo chiều rộng, tiến hành theo cấp độ, thường được triển khai bằng cách sử dụng hàng đợi.
- Việc duyệt theo thứ tự trước, theo thứ tự và theo thứ tự sau đều thuộc về tìm kiếm theo chiều sâu, tiến hành bằng cách đi sâu nhất có thể trước khi quay lui, thường sử dụng đệ quy.
- Cây tìm kiếm nhị phân là một cấu trúc dữ liệu hiệu quả để tìm kiếm phần tử, với các hoạt động tìm kiếm, chèn và xóa, tất cả đều có độ phức tạp về thời gian là $O(\log n)$. Khi cây tìm kiếm nhị phân thoái hóa thành một danh sách được liên kết, độ phức tạp theo thời gian sẽ giảm xuống $O(n)$.
- Cây AVL, còn được gọi là cây tìm kiếm nhị phân cân bằng, đảm bảo cây vẫn cân bằng sau khi chèn và xóa nút liên tục thông qua các thao tác xoay.
- Các thao tác xoay trong cây AVL bao gồm xoay phải, xoay trái, xoay phải rồi xoay trái và xoay trái rồi xoay phải. Sau khi chèn hoặc xóa các nút, cây AVL thực hiện các phép quay từ dưới lên trên để khôi phục lại sự cân bằng.

### Hỏi đáp

**Q**: Đối với cây nhị phân chỉ có một nút, cả chiều cao của cây và độ sâu của nút gốc có phải là $0$ không?

Có, vì chiều cao và chiều sâu thường được xác định bằng số cạnh trên đường dẫn.

**Q**: Việc chèn và xóa trong cây nhị phân thường được thực hiện bằng một tập hợp các thao tác. "Một tập hợp các hoạt động" đề cập đến điều gì ở đây? Nó có ngụ ý giải phóng tài nguyên của các nút con không?

Lấy cây tìm kiếm nhị phân làm ví dụ, thao tác loại bỏ một nút cần được xử lý theo ba kịch bản khác nhau, mỗi kịch bản yêu cầu nhiều bước thao tác nút.

**Q**: Tại sao việc duyệt cây nhị phân trong DFS có ba thứ tự: thứ tự trước, thứ tự thứ tự và thứ tự sau và công dụng của chúng là gì?

Tương tự như duyệt theo thứ tự trước và ngược của mảng, duyệt theo thứ tự trước, thứ tự thứ tự và thứ tự sau là ba phương pháp duyệt cây nhị phân cho phép chúng ta thu được kết quả duyệt theo một thứ tự cụ thể. Ví dụ: trong cây tìm kiếm nhị phân, vì các nút thỏa mãn mối quan hệ `left child node value < root node value < right child node value`, chúng ta chỉ cần duyệt cây với mức độ ưu tiên là "left $\rightarrow$ root $\rightarrow$ right" để thu được chuỗi nút có thứ tự.

**Q**: Trong thao tác xoay phải xử lý mối quan hệ giữa các nút không cân bằng `node`, `child` và `grand_child`, không phải kết nối giữa `node` và nút cha của nó bị mất sau khi xoay phải phải không?

Chúng ta cần xem vấn đề này từ góc độ đệ quy. Thao tác xoay phải `right_rotate(root)` đi vào nút gốc của cây con và cuối cùng trả về nút gốc của cây con sau khi xoay bằng `return child`. Kết nối giữa nút gốc của cây con và nút cha của nó được hoàn thành sau khi hàm trả về, điều này không nằm trong phạm vi bảo trì của thao tác xoay phải.

**Q**: Trong C++, các hàm được chia thành phần `private` và `public`. Có những cân nhắc gì cho việc này? Tại sao hàm `height()` và hàm `updateHeight()` lần lượt được đặt trong `public` và `private`?

Nó chủ yếu phụ thuộc vào phạm vi sử dụng của phương pháp. Nếu một phương thức chỉ được sử dụng trong lớp thì phương thức đó được thiết kế dưới dạng `private`. Ví dụ: chỉ người dùng gọi `updateHeight()` sẽ không có ý nghĩa gì vì đây chỉ là một bước trong thao tác chèn hoặc xóa. Tuy nhiên, `height()` được sử dụng để truy cập chiều cao nút, tương tự như `vector.size()` nên được đặt thành `public` để dễ sử dụng.

**Q**: Làm cách nào để xây dựng cây tìm kiếm nhị phân từ một tập hợp dữ liệu đầu vào? Việc lựa chọn nút gốc có quan trọng không?

Có, phương pháp xây dựng cây được cung cấp trong phương thức `build_tree()` trong mã cây tìm kiếm nhị phân. Đối với việc lựa chọn nút gốc, chúng tôi thường sắp xếp dữ liệu đầu vào, sau đó chọn phần tử ở giữa làm nút gốc và xây dựng đệ quy các cây con trái và phải. Cách tiếp cận này tối đa hóa sự cân bằng của cây.

**Q**: Trong Java, bạn có luôn phải sử dụng phương thức `equals()` để so sánh chuỗi không?

Trong Java, đối với các kiểu dữ liệu nguyên thủy, `==` được sử dụng để so sánh xem giá trị của hai biến có bằng nhau hay không. Đối với các loại tham chiếu, nguyên tắc làm việc của hai ký hiệu này là khác nhau.

- `==`: Được sử dụng để so sánh xem hai biến có trỏ đến cùng một đối tượng hay không, tức là vị trí của chúng trong bộ nhớ có giống nhau hay không.
- `equals()`: Dùng để so sánh xem giá trị của hai đối tượng có bằng nhau hay không.

Vì vậy, nếu muốn so sánh các giá trị, chúng ta nên sử dụng `equals()`. Tuy nhiên, các chuỗi được khởi tạo qua `String a = "hi"; String b = "hi";` được lưu trữ trong nhóm hằng số chuỗi và trỏ đến cùng một đối tượng, do đó, `a == b` cũng có thể được sử dụng để so sánh nội dung của hai chuỗi.

**Q**: Trước khi đạt đến mức dưới cùng, số lượng nút trong hàng đợi $2^h$ có được truyền tải theo chiều rộng không?

Có, ví dụ: một cây nhị phân đầy đủ có chiều cao $h = 2$ có tổng số nút $n = 7$, thì cấp dưới cùng có các nút $4 = 2^h = (n + 1) / 2$.
