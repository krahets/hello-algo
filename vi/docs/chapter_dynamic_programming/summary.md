# Bản tóm tắt

### Điểm chính

- Lập trình động phân tích các bài toán và tránh tính toán dư thừa bằng cách lưu trữ lời giải của các bài toán con, từ đó cải thiện đáng kể hiệu quả tính toán.
- Nếu không xem xét các ràng buộc về thời gian, tất cả các bài toán lập trình động có thể được giải bằng cách quay lui (tìm kiếm vũ phu), nhưng cây đệ quy chứa một số lượng lớn các bài toán con chồng chéo, dẫn đến hiệu quả cực kỳ thấp. Bằng cách giới thiệu một danh sách ghi nhớ, chúng ta có thể lưu trữ lời giải cho tất cả các bài toán con được tính toán, đảm bảo rằng các bài toán con chồng chéo chỉ được tính toán một lần.
- Ghi nhớ là giải pháp đệ quy từ trên xuống, trong khi lập trình động tương ứng là giải pháp lặp từ dưới lên, tương tự như "điền vào bảng". Vì trạng thái hiện tại chỉ phụ thuộc vào một số trạng thái cục bộ nhất định nên chúng ta có thể loại bỏ một chiều của bảng $dp$ để giảm độ phức tạp về không gian.
- Phân rã bài toán con là một cách tiếp cận thuật toán tổng quát, với các thuộc tính khác nhau trong phân chia và chinh phục, lập trình động và quay lui.
- Các bài toán lập trình động có ba đặc điểm chính: các bài toán con chồng chéo, cấu trúc con tối ưu và không có hậu quả.
- Nếu giải pháp tối ưu cho bài toán ban đầu có thể được xây dựng từ các giải pháp tối ưu cho các bài toán con thì nó có cấu trúc con tối ưu.
- Không có hậu quả có nghĩa là đối với một trạng thái nhất định, sự phát triển trong tương lai của nó chỉ liên quan đến trạng thái đó và không liên quan gì đến tất cả các trạng thái trong quá khứ. Nhiều vấn đề tối ưu hóa tổ hợp không thỏa mãn tính chất này và không thể giải quyết một cách hiệu quả bằng quy hoạch động.

**Vấn đề về ba lô**

- Bài toán ba lô là một trong những bài toán lập trình động điển hình nhất, với các biến thể như ba lô 0-1, ba lô không giới hạn và nhiều ba lô.
- Định nghĩa trạng thái cho ba lô 0-1 là giá trị tối đa có thể đạt được bằng cách sử dụng các mục $i$ đầu tiên có sức chứa ba lô là $c$. Dựa trên hai quyết định không cho vật phẩm vào ba lô và cho vật phẩm vào trong, có thể xác định được cấu trúc con tối ưu và xây dựng được phương trình chuyển trạng thái. Trong tối ưu hóa không gian, vì mỗi trạng thái phụ thuộc vào trạng thái ngay phía trên và phía trên bên trái, nên danh sách cần được duyệt theo thứ tự ngược lại để tránh ghi đè trạng thái phía trên bên trái.
- Bài toán chiếc ba lô không giới hạn không có giới hạn về số lượng lựa chọn của từng loại vật phẩm nên việc chuyển trạng thái để chọn bỏ vào một vật phẩm khác với bài toán chiếc ba lô 0-1. Vì trạng thái phụ thuộc vào trạng thái ngay phía trên và ngay bên trái, nên tối ưu hóa không gian nên sử dụng truyền tải về phía trước.
- Bài toán đổi xu là một biến thể của bài toán chiếc ba lô không giới hạn. Nó thay đổi từ việc tìm kiếm giá trị "tối đa" sang tìm kiếm số lượng xu "tối thiểu", do đó $\max()$ trong phương trình chuyển trạng thái nên được đổi thành $\min()$. Nó thay đổi từ việc tìm kiếm "không vượt quá" dung lượng ba lô sang tìm kiếm "chính xác" đủ số tiền mục tiêu, vì vậy $amt + 1$ được sử dụng để thể hiện giải pháp không hợp lệ là "không thể bù đủ số tiền mục tiêu".
- Bài toán thay đổi tiền xu II thay đổi từ việc tìm kiếm "số lượng xu tối thiểu" sang tìm kiếm "số lượng kết hợp tiền xu", do đó phương trình chuyển đổi trạng thái tương ứng thay đổi từ $\min()$ sang toán tử tổng.

**Chỉnh sửa vấn đề khoảng cách**

- Khoảng cách chỉnh sửa (Khoảng cách Levenshtein) được sử dụng để đo độ tương tự giữa hai chuỗi, được định nghĩa là số bước chỉnh sửa tối thiểu từ chuỗi này sang chuỗi khác, với các thao tác chỉnh sửa bao gồm chèn, xóa và thay thế.
- Định nghĩa trạng thái cho bài toán khoảng cách chỉnh sửa là số bước chỉnh sửa tối thiểu cần thiết để thay đổi $i$ ký tự đầu tiên của $s$ thành $j$ ký tự đầu tiên của $t$. Khi $s[i] \ne t[j]$, có ba quyết định: chèn, xóa, thay thế, mỗi quyết định có các bài toán con còn lại tương ứng. Từ đó, cấu trúc con tối ưu có thể được xác định và phương trình chuyển trạng thái được xây dựng. Khi $s[i] = t[j]$, không cần chỉnh sửa ký tự hiện tại.
- Trong khoảng cách chỉnh sửa, trạng thái phụ thuộc vào trạng thái ngay phía trên, ngay bên trái và phía trên bên trái, do đó, sau khi tối ưu hóa không gian, cả việc truyền tải tiến và lùi đều không thể thực hiện chuyển đổi trạng thái một cách chính xác. Vì lý do này, chúng tôi sử dụng một biến để lưu trữ tạm thời trạng thái phía trên bên trái, từ đó chuyển sang tình huống tương đương với bài toán ba lô không giới hạn, cho phép di chuyển về phía trước sau khi tối ưu hóa không gian.
