# Bản tóm tắt

### Đánh giá chính

- Sắp xếp bong bóng đạt được sự sắp xếp bằng cách hoán đổi các phần tử liền kề. Bằng cách thêm cờ để cho phép quay lại sớm, chúng tôi có thể tối ưu hóa độ phức tạp về thời gian trong trường hợp tốt nhất của sắp xếp bong bóng thành $O(n)$.
- Trong mỗi vòng, sắp xếp chèn sẽ chèn một phần tử từ phần chưa được sắp xếp vào đúng vị trí của nó trong phần được sắp xếp. Mặc dù sắp xếp chèn có độ phức tạp về thời gian là $O(n^2)$, nhưng nó vẫn rất phổ biến đối với các tác vụ sắp xếp nhỏ vì mỗi thao tác tương đối nhẹ.
- Sắp xếp nhanh dựa trên phân vùng trọng điểm. Trong phân vùng trọng điểm, việc liên tục chọn trục xoay tệ nhất có thể có thể làm giảm độ phức tạp về thời gian xuống $O(n^2)$. Việc chọn một trục xoay dựa trên trung vị hoặc một trục xoay ngẫu nhiên có thể làm giảm khả năng xảy ra sự xuống cấp này. Bằng cách đệ quy trên mảng con ngắn hơn trước, chúng ta có thể giảm độ sâu đệ quy một cách hiệu quả và tối ưu hóa độ phức tạp của không gian xuống $O(\log n)$.
- Sắp xếp hợp nhất bao gồm hai giai đoạn: phân chia và hợp nhất, thường thể hiện chiến lược phân chia và chinh phục. Trong sắp xếp hợp nhất, việc sắp xếp một mảng yêu cầu tạo các mảng phụ, với độ phức tạp về không gian là $O(n)$; tuy nhiên, độ phức tạp về không gian của việc sắp xếp danh sách liên kết có thể được tối ưu hóa thành $O(1)$.
- Sắp xếp nhóm bao gồm ba bước: phân phối dữ liệu vào các nhóm, sắp xếp trong các nhóm và hợp nhất các kết quả. Nó cũng thể hiện chiến lược chia để trị và phù hợp với khối lượng dữ liệu rất lớn. Chìa khóa để sắp xếp nhóm là phân phối dữ liệu đồng đều.
- Sắp xếp đếm là trường hợp đặc biệt của sắp xếp nhóm, thực hiện sắp xếp bằng cách đếm số lần xuất hiện của dữ liệu. Sắp xếp đếm phù hợp với các tình huống khi khối lượng dữ liệu lớn nhưng phạm vi dữ liệu bị giới hạn và yêu cầu dữ liệu có thể được chuyển đổi thành số nguyên dương.
- Sắp xếp cơ số đạt được việc sắp xếp dữ liệu bằng cách sắp xếp từng chữ số, yêu cầu dữ liệu đó có thể được biểu diễn dưới dạng số có chữ số cố định.
- Nhìn chung, chúng tôi hy vọng tìm được một thuật toán sắp xếp hiệu quả, ổn định, phù hợp và có khả năng thích ứng. Tuy nhiên, cũng như các cấu trúc dữ liệu và thuật toán khác, không có thuật toán sắp xếp nào có thể đáp ứng tất cả các tiêu chí này cùng một lúc. Trong thực tế, chúng ta cần lựa chọn thuật toán sắp xếp phù hợp dựa trên đặc điểm của dữ liệu.
- Hình dưới đây so sánh các thuật toán sắp xếp chính thống về hiệu quả, tính ổn định, thuộc tính tại chỗ và khả năng thích ứng.

![So sánh thuật toán sắp xếp](summary.assets/sorting_algorithms_comparison.png)

### Hỏi đáp

**Q**: Sự ổn định của thuật toán sắp xếp là cần thiết trong những tình huống nào?

Trong thực tế, chúng ta có thể sắp xếp dựa trên một thuộc tính nhất định của đối tượng. Ví dụ: sinh viên có hai thuộc tính: tên và chiều cao. Chúng tôi muốn triển khai tính năng sắp xếp theo nhiều cấp độ: đầu tiên sắp xếp theo tên để nhận được `(A, 180) (B, 185) (C, 170) (D, 170)`; sau đó sắp xếp theo chiều cao. Vì thuật toán sắp xếp không ổn định nên chúng tôi có thể nhận được `(D, 170) (C, 170) (A, 180) (B, 185)`.

Chúng ta có thể thấy học sinh D và C đã hoán đổi vị trí cho nhau, phá hủy thứ tự theo tên, đây không phải là điều chúng ta mong muốn.

**Q**: Thứ tự "tìm kiếm từ phải sang trái" và "tìm kiếm từ trái sang phải" trong phân vùng trọng điểm có thể hoán đổi được không?

Không. Khi chúng ta sử dụng phần tử ngoài cùng bên trái làm trục, trước tiên chúng ta phải "tìm kiếm từ phải sang trái" và sau đó "tìm kiếm từ trái sang phải". Kết luận này có phần phản trực giác; hãy cùng phân tích nguyên nhân.

Bước cuối cùng của quá trình phân vùng trọng điểm `partition()` là hoán đổi `nums[left]` và `nums[i]`. Sau khi hoán đổi hoàn tất, các phần tử ở bên trái của trục đều là `<=` trục, **điều này yêu cầu `nums[left] >= nums[i]` phải giữ trước lần hoán đổi cuối cùng**. Giả sử trước tiên chúng ta "tìm kiếm từ trái sang phải", sau đó nếu chúng ta không thể tìm thấy phần tử lớn hơn trục xoay, **chúng ta sẽ thoát khỏi vòng lặp khi `i == j`, tại thời điểm đó có thể là `nums[j] == nums[i] > nums[left]`**. Nói cách khác, thao tác hoán đổi cuối cùng sẽ hoán đổi một phần tử lớn hơn trục tới đầu ngoài cùng bên trái của mảng, khiến việc phân vùng trọng điểm không thành công.

Ví dụ: cho mảng `[0, 0, 0, 0, 1]`, nếu trước tiên chúng ta "tìm kiếm từ trái sang phải", mảng sau khi phân vùng trọng điểm là `[1, 0, 0, 0, 0]`, điều này không chính xác.

Theo lý do tương tự, nếu chúng ta chọn `nums[right]` làm trục, thứ tự sẽ bị đảo ngược: trước tiên chúng ta phải "tìm kiếm từ trái sang phải".

**Q**: Về việc tối ưu hóa độ sâu đệ quy trong sắp xếp nhanh, tại sao việc chọn mảng ngắn hơn có thể đảm bảo rằng độ sâu đệ quy không vượt quá $\log n$?

Độ sâu đệ quy là số lượng cuộc gọi đệ quy chưa được trả về. Mỗi vòng phân vùng trọng điểm sẽ chia mảng ban đầu thành hai mảng con. Sau lần tối ưu hóa này, mảng con được chọn để đệ quy tiếp theo có độ dài tối đa bằng một nửa mảng ban đầu. Trong trường hợp xấu nhất, nếu nó luôn dài bằng một nửa thì độ sâu đệ quy cuối cùng là $\log n$.

Xem lại cách sắp xếp nhanh ban đầu, chúng tôi có thể liên tục lặp lại trên mảng dài hơn. Trong trường hợp xấu nhất, nó sẽ là $n$, $n - 1$, $\dots$, $2$, $1$, với độ sâu đệ quy là $n$. Tối ưu hóa độ sâu đệ quy có thể tránh được tình trạng này.

**Q**: Khi tất cả các phần tử trong mảng đều bằng nhau, độ phức tạp về thời gian của việc sắp xếp nhanh $O(n^2)$ có phải không? Trường hợp thoái hóa này nên xử lý thế nào?

Đúng. Trong trường hợp này, mảng có thể được phân chia thành ba phần thông qua phân vùng trọng điểm: nhỏ hơn, bằng và lớn hơn trục xoay. Sau đó chúng tôi chỉ lặp lại ở phần nhỏ hơn và lớn hơn. Với cách tiếp cận này, một mảng có các phần tử bằng nhau có thể được sắp xếp chỉ trong một vòng phân vùng trọng điểm.

**Q**: Tại sao độ phức tạp về thời gian trong trường hợp xấu nhất của loại nhóm $O(n^2)$?

Trong trường hợp xấu nhất, tất cả các phần tử sẽ được phân phối vào cùng một nhóm. Nếu chúng ta sử dụng thuật toán $O(n^2)$ để sắp xếp các phần tử này, độ phức tạp về thời gian sẽ là $O(n^2)$.
