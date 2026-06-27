# Bản tóm tắt

### Đánh giá chính

- Thuật toán quay lui về cơ bản là một phương pháp tìm kiếm đầy đủ. Nó tìm ra các giải pháp đáp ứng các điều kiện cụ thể bằng cách thực hiện duyệt theo chiều sâu của không gian giải pháp. Trong quá trình tìm kiếm, khi tìm được lời giải thỏa mãn điều kiện thì ghi lại. Việc tìm kiếm kết thúc sau khi tìm thấy tất cả các giải pháp hoặc khi quá trình duyệt hoàn tất.
- Quá trình tìm kiếm thuật toán quay lui bao gồm hai phần: thử và quay lui. Nó thử nhiều lựa chọn khác nhau thông qua tìm kiếm theo chiều sâu. Khi gặp phải tình huống vi phạm các ràng buộc, nó sẽ hoàn nguyên lựa chọn trước đó, quay lại trạng thái trước đó và tiếp tục khám phá các tùy chọn khác. Cố gắng và quay lại là các hoạt động theo hướng ngược nhau.
- Các bài toán quay lui thường chứa nhiều ràng buộc, có thể được sử dụng để thực hiện các thao tác cắt tỉa. Việc cắt tỉa có thể chấm dứt sớm các nhánh tìm kiếm không cần thiết, cải thiện đáng kể hiệu quả tìm kiếm.
- Thuật toán quay lui chủ yếu được sử dụng để giải quyết các vấn đề tìm kiếm và các vấn đề về sự thỏa mãn ràng buộc. Mặc dù các vấn đề tối ưu hóa tổ hợp có thể được giải quyết bằng phương pháp quay lui, nhưng thường có sẵn các giải pháp hiệu quả hơn hoặc hoạt động tốt hơn.
- Bài toán hoán vị nhằm mục đích tìm tất cả các hoán vị có thể có của các phần tử trong một tập hợp nhất định. Chúng tôi sử dụng một mảng để ghi lại xem mỗi phần tử đã được chọn hay chưa, từ đó cắt bớt các nhánh tìm kiếm cố gắng chọn cùng một phần tử nhiều lần, đảm bảo mỗi phần tử được chọn chính xác một lần.
- Trong bài toán hoán vị, nếu tập hợp chứa các phần tử trùng lặp thì kết quả cuối cùng sẽ chứa các hoán vị trùng lặp. Chúng ta cần áp đặt một ràng buộc để chỉ có thể chọn các phần tử bằng nhau một lần trong mỗi vòng, điều này thường đạt được bằng cách sử dụng bộ băm.
- Bài toán tổng tập hợp con nhằm mục đích tìm tất cả các tập hợp con của một tập hợp nhất định có tổng bằng một giá trị đích. Vì tập hợp này không có thứ tự nhưng quá trình tìm kiếm cho kết quả là tất cả các thứ tự, nên các tập hợp con trùng lặp sẽ được tạo ra. Chúng tôi sắp xếp dữ liệu trước khi quay lui và sử dụng một biến để chỉ ra điểm bắt đầu của mỗi vòng duyệt, từ đó cắt bớt các nhánh tìm kiếm tạo ra các tập hợp con trùng lặp.
- Đối với bài toán tổng tập hợp con, các phần tử bằng nhau trong mảng sẽ tạo ra các tập hợp con trùng lặp. Chúng tôi tận dụng điều kiện tiên quyết là mảng được sắp xếp bằng cách kiểm tra xem các phần tử liền kề có bằng nhau hay không để thực hiện việc cắt tỉa, đảm bảo rằng các phần tử bằng nhau chỉ có thể được chọn một lần mỗi vòng.
- Bài toán $n$ quân hậu nhằm mục đích tìm vị trí của các quân hậu $n$ trên bàn cờ $n \times n$ sao cho không có hai quân hậu nào có thể tấn công lẫn nhau. Các ràng buộc của bài toán này bao gồm ràng buộc hàng, ràng buộc cột, ràng buộc chính và ràng buộc đối chéo. Để đáp ứng các ràng buộc về hàng, chúng tôi áp dụng chiến lược sắp xếp theo từng hàng, đảm bảo đặt chính xác một quân hậu trong mỗi hàng.
- Việc xử lý các ràng buộc cột và ràng buộc đường chéo là tương tự nhau. Đối với các ràng buộc cột, chúng tôi sử dụng một mảng để ghi lại xem mỗi cột có một nữ hoàng hay không, từ đó cho biết liệu ô được chọn có hợp lệ hay không. Đối với các ràng buộc về đường chéo, chúng tôi sử dụng hai mảng để ghi lại riêng biệt xem quân hậu tồn tại trên mỗi đường chéo chính hay phản đường chéo. Thách thức nằm ở việc tìm ra mẫu chỉ mục hàng-cột mô tả các ô trên cùng một đường chéo chính (đối diện).

### Hỏi đáp

**Q**: Làm thế nào chúng ta có thể hiểu được mối quan hệ giữa quay lui và đệ quy?

Nhìn chung, quay lui là một chiến lược thuật toán, trong khi đệ quy được xem như một công cụ tốt hơn.

- Quay lui thường được thực hiện bằng đệ quy. Tuy nhiên, quay lui chỉ là một ứng dụng của đệ quy, cụ thể là ứng dụng của nó trong các bài toán tìm kiếm.
- Cấu trúc của đệ quy phản ánh mô hình giải quyết vấn đề dựa trên việc phân tách một vấn đề thành các bài toán con và nó thường được sử dụng trong phân chia và chinh phục, quay lui và lập trình động (đệ quy ghi nhớ).
