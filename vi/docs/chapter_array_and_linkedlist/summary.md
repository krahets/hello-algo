# Bản tóm tắt

### Đánh giá chính

- Mảng và danh sách liên kết là hai cấu trúc dữ liệu cơ bản, thể hiện hai cách khác nhau để lưu trữ dữ liệu trong bộ nhớ máy tính: lưu trữ liền kề và lưu trữ phân tán. Điểm mạnh và điểm yếu của họ bổ sung cho nhau.
- Mảng hỗ trợ truy cập ngẫu nhiên và sử dụng ít bộ nhớ hơn; tuy nhiên, việc chèn và xóa các phần tử không hiệu quả và độ dài không thay đổi sau khi khởi tạo.
- Danh sách liên kết đạt được khả năng chèn và xóa nút hiệu quả bằng cách sửa đổi tham chiếu (con trỏ) và có thể điều chỉnh độ dài một cách linh hoạt; tuy nhiên, việc truy cập nút không hiệu quả và mức tiêu thụ bộ nhớ cao hơn. Các loại danh sách liên kết phổ biến bao gồm danh sách liên kết đơn, danh sách liên kết vòng và danh sách liên kết đôi.
- Danh sách là tập hợp các phần tử có thứ tự hỗ trợ chèn, xóa, tìm kiếm và sửa đổi, thường được triển khai dựa trên mảng động. Nó vẫn giữ được những ưu điểm của mảng đồng thời cho phép điều chỉnh độ dài linh hoạt.
- Sự xuất hiện của danh sách đã cải thiện đáng kể tính thực tiễn của mảng, nhưng nó cũng có thể lãng phí một số không gian bộ nhớ.
- Trong quá trình thực hiện chương trình, dữ liệu chủ yếu được lưu trữ trong bộ nhớ. Mảng mang lại hiệu quả không gian bộ nhớ cao hơn, trong khi danh sách liên kết mang lại sự linh hoạt cao hơn trong việc sử dụng bộ nhớ.
- Bộ nhớ đệm cung cấp quyền truy cập dữ liệu nhanh vào CPU thông qua các cơ chế như dòng bộ đệm, tìm nạp trước cũng như vị trí không gian và thời gian, cải thiện đáng kể hiệu quả thực thi chương trình.
- Bởi vì mảng có tốc độ truy cập bộ nhớ đệm cao hơn nên chúng thường hiệu quả hơn danh sách liên kết. Khi chọn cấu trúc dữ liệu, cần lựa chọn phù hợp dựa trên các yêu cầu và kịch bản cụ thể.

### Hỏi đáp

**Q**: Việc lưu trữ một mảng trên ngăn xếp so với trên heap có ảnh hưởng đến hiệu quả về thời gian và không gian không?

Mảng được lưu trữ trên ngăn xếp và trên heap đều được lưu trữ trong không gian bộ nhớ liền kề, do đó hiệu quả xử lý dữ liệu về cơ bản là như nhau. Tuy nhiên, ngăn xếp và đống có những đặc điểm riêng dẫn đến những khác biệt sau.

1. Hiệu quả phân bổ và giải phóng: Ngăn xếp là một phần bộ nhớ tương đối nhỏ, được trình biên dịch xử lý tự động; heap tương đối lớn hơn và có thể được phân bổ động trong mã, dễ bị phân mảnh hơn. Do đó, các hoạt động phân bổ và giải phóng trên heap thường chậm hơn trên stack.
2. Giới hạn kích thước: Bộ nhớ ngăn xếp tương đối nhỏ và kích thước heap thường bị giới hạn bởi bộ nhớ khả dụng. Vì vậy, heap phù hợp hơn để lưu trữ các mảng lớn.
3. Tính linh hoạt: Kích thước của mảng trên ngăn xếp phải được xác định tại thời điểm biên dịch, trong khi kích thước của mảng trên heap có thể được xác định linh hoạt khi chạy.

**Q**: Tại sao mảng yêu cầu các phần tử cùng loại, trong khi danh sách liên kết không nhấn mạnh yêu cầu này?

Danh sách liên kết bao gồm các nút, với các nút được kết nối thông qua tham chiếu (con trỏ) và mỗi nút có thể lưu trữ các loại dữ liệu khác nhau, chẳng hạn như `int`, `double`, `string`, `object`, v.v.

Ngược lại, các phần tử mảng phải cùng loại để có thể xác định vị trí của chúng bằng cách tính toán độ lệch. Ví dụ: nếu một mảng chứa cả hai loại `int` và `long`, với các phần tử riêng lẻ lần lượt chiếm 4 byte và 8 byte thì không thể sử dụng công thức sau để tính toán độ lệch vì mảng chứa hai "kích thước phần tử" khác nhau.

```shell
# element address = array base address (address of the first element) + element size * element index
```

**Q**: Sau khi xóa nút `P`, chúng ta có cần đặt `P.next` thành `None` không?

Không cần thiết phải sửa đổi `P.next`. Từ góc nhìn của danh sách liên kết, việc di chuyển từ nút đầu đến nút đuôi sẽ không còn gặp phải `P`. Điều này có nghĩa là nút `P` đã bị xóa khỏi danh sách liên kết và việc nút `P` trỏ tới đâu vào thời điểm này không quan trọng—nó sẽ không ảnh hưởng đến danh sách liên kết.

Từ góc độ giải quyết vấn đề và thuật toán, việc để con trỏ được kết nối là được miễn là logic chương trình là chính xác. Từ góc độ triển khai thư viện tiêu chuẩn, việc ngắt kết nối rõ ràng sẽ an toàn và rõ ràng hơn. Nếu nó không bị ngắt kết nối và nút bị xóa không được thu hồi đúng cách, nó có thể ảnh hưởng đến việc thu hồi các nút kế thừa.

**Q**: Trong danh sách liên kết, độ phức tạp về thời gian của các thao tác chèn và xóa là $O(1)$. Tuy nhiên, cả việc chèn và xóa đều yêu cầu thời gian $O(n)$ để tìm phần tử; tại sao thời gian không phức tạp $O(n)$?

Nếu phần tử được tìm thấy lần đầu tiên và sau đó bị xóa, độ phức tạp về thời gian thực sự là $O(n)$. Tuy nhiên, ưu điểm của việc chèn và xóa $O(1)$ trong danh sách liên kết có thể được thể hiện trong các ứng dụng khác. Ví dụ: một deque rất phù hợp để triển khai danh sách liên kết, trong đó chúng tôi duy trì các biến con trỏ luôn trỏ đến nút đầu và nút đuôi, với mỗi thao tác chèn và xóa là $O(1)$.

**Q**: Trong sơ đồ "Phương pháp lưu trữ và định nghĩa danh sách liên kết", nút con trỏ màu xanh nhạt có chiếm một địa chỉ bộ nhớ duy nhất hay nó chia sẻ đồng đều với giá trị nút?

Sơ đồ này là một biểu diễn định tính; một đại diện định lượng đòi hỏi phải phân tích dựa trên tình hình cụ thể.

- Các loại giá trị nút khác nhau chiếm lượng không gian khác nhau, chẳng hạn như `int`, `long`, `double` và các đối tượng phiên bản, v.v.
- Lượng không gian bộ nhớ bị chiếm bởi các biến con trỏ phụ thuộc vào hệ điều hành và môi trường biên dịch được sử dụng, thường là 8 byte hoặc 4 byte.

**Q**: Việc thêm một phần tử vào cuối danh sách có luôn là $O(1)$ không?

Nếu việc thêm một phần tử vượt quá độ dài danh sách thì danh sách trước tiên phải được mở rộng trước khi thêm. Hệ thống phân bổ một khối bộ nhớ mới và di chuyển tất cả các phần tử từ danh sách ban đầu sang nó, trong trường hợp đó độ phức tạp về thời gian trở thành $O(n)$.

**Q**: "Sự xuất hiện của danh sách đã cải thiện đáng kể tính thực tiễn của mảng, nhưng có thể dẫn đến lãng phí một số dung lượng bộ nhớ"—liệu sự lãng phí dung lượng này có nghĩa là bộ nhớ bị chiếm bởi các biến bổ sung như dung lượng, độ dài và hệ số mở rộng không?

Sự lãng phí không gian này chủ yếu có hai khía cạnh: một mặt, danh sách thường đặt độ dài ban đầu mà chúng ta có thể không cần sử dụng đầy đủ; mặt khác, để ngăn chặn việc mở rộng thường xuyên, việc mở rộng thường nhân với một hệ số, chẳng hạn như $\times 1,5$. Kết quả là sẽ có nhiều vị trí trống mà chúng tôi thường không thể lấp đầy hoàn toàn.

**Q**: Trong Python, sau khi khởi tạo `n = [1, 2, 3]`, địa chỉ của 3 phần tử này liền kề nhau, nhưng việc khởi tạo `m = [2, 1, 3]` cho thấy id của mỗi phần tử không liên tục; đúng hơn, chúng giống với những gì trong `n`. Vì địa chỉ của các phần tử này không liền kề nhau nên `m` có còn là một mảng không?

Nếu chúng ta thay thế các thành phần danh sách bằng các nút danh sách liên kết `n = [n1, n2, n3, n4, n5]` thì thông thường 5 đối tượng nút này cũng nằm rải rác trong bộ nhớ. Tuy nhiên, với một chỉ mục danh sách, chúng ta vẫn có thể lấy địa chỉ bộ nhớ nút trong thời gian $O(1)$, từ đó truy cập vào nút tương ứng. Điều này là do mảng lưu trữ các tham chiếu đến các nút chứ không phải bản thân các nút đó.

Không giống như nhiều ngôn ngữ, các số trong Python được gói dưới dạng đối tượng và danh sách không lưu trữ chính các số đó mà lưu trữ các tham chiếu đến các số đó. Do đó, chúng tôi thấy rằng các số giống nhau trong hai mảng có cùng id và địa chỉ bộ nhớ của các số này không nhất thiết phải liền kề nhau.

**Q**: C++ STL có `std::list` đã triển khai danh sách liên kết đôi nhưng có vẻ như một số sách về thuật toán không sử dụng trực tiếp danh sách đó. Có một hạn chế?

Một mặt, chúng ta thường thích sử dụng mảng để triển khai thuật toán và chỉ sử dụng danh sách liên kết khi cần thiết, chủ yếu vì hai lý do.

- Tiêu hao không gian: Vì mỗi phần tử yêu cầu hai con trỏ bổ sung (một cho phần tử trước và một cho phần tử tiếp theo), `std::list` thường tiêu tốn nhiều dung lượng hơn `std::vector`.
- Tính không thân thiện với bộ nhớ đệm: Do dữ liệu không được lưu trữ liên tục nên `std::list` mức sử dụng bộ nhớ đệm thấp hơn. Nói chung, `std::vector` có hiệu suất tốt hơn.

Mặt khác, các trường hợp cần đến danh sách liên kết chủ yếu liên quan đến cây nhị phân và đồ thị. Ngăn xếp và hàng đợi thường sử dụng `stack` và `queue` do ngôn ngữ lập trình cung cấp thay vì danh sách được liên kết.

**Q**: Thao tác `res = [[0]] * n` có tạo danh sách 2D trong đó mỗi `[0]` độc lập không?

Không, họ không độc lập. Trong danh sách 2D này, tất cả `[0]` thực tế đều là tham chiếu đến cùng một đối tượng. Nếu chúng ta sửa đổi một phần tử, chúng ta sẽ thấy rằng tất cả các phần tử tương ứng đều thay đổi tương ứng.

Nếu muốn mỗi `[0]` trong danh sách 2D độc lập, chúng ta có thể sử dụng `res = [[0] for _ in range(n)]` để đạt được điều này. Nguyên tắc của phương pháp này là khởi tạo các đối tượng danh sách `[0]` độc lập $n$.

**Q**: Thao tác `res = [0] * n` có tạo danh sách trong đó mỗi số nguyên 0 là độc lập không?

Trong danh sách này, tất cả các số nguyên đều tham chiếu đến cùng một đối tượng. Điều này là do Python sử dụng cơ chế lưu vào bộ đệm cho các số nguyên nhỏ (thường là -5 đến 256) để tối đa hóa việc tái sử dụng đối tượng và cải thiện hiệu suất.

Mặc dù tất cả chúng đều tham chiếu đến cùng một đối tượng nhưng chúng ta vẫn có thể sửa đổi từng thành phần trong danh sách một cách độc lập. Điều này là do số nguyên Python là "đối tượng bất biến". Khi chúng tôi sửa đổi một phần tử, chúng tôi thực sự chuyển phần tử đó để tham chiếu đến một đối tượng khác, thay vì thay đổi chính đối tượng ban đầu.

Tuy nhiên, khi các phần tử danh sách là "đối tượng có thể thay đổi" (chẳng hạn như danh sách, từ điển hoặc thể hiện lớp), việc sửa đổi một phần tử sẽ trực tiếp thay đổi chính đối tượng đó và tất cả các phần tử tham chiếu đến đối tượng đó sẽ có cùng thay đổi.
