# Đánh giá hiệu quả thuật toán

Trong thiết kế thuật toán, chúng tôi theo đuổi hai cấp độ mục tiêu sau đây một cách tuần tự.

1. **Tìm giải pháp cho vấn đề**: Thuật toán phải thu được giải pháp chính xác một cách đáng tin cậy trong phạm vi đầu vào được chỉ định.
2. **Tìm kiếm giải pháp tối ưu**: Có thể tồn tại nhiều giải pháp cho cùng một vấn đề và chúng tôi hy vọng tìm được thuật toán hiệu quả nhất có thể.

Nói cách khác, với tiền đề là có thể giải được bài toán, hiệu quả của thuật toán đã trở thành tiêu chí đánh giá chính để đo lường chất lượng của thuật toán. Nó bao gồm hai chiều sau đây.

- **Hiệu quả về thời gian**: Khoảng thời gian chạy thuật toán.
- **Hiệu quả về không gian**: Kích thước của không gian bộ nhớ mà thuật toán chiếm giữ.

Nói tóm lại, **mục tiêu của chúng tôi là thiết kế các cấu trúc dữ liệu và thuật toán "vừa nhanh vừa tiết kiệm bộ nhớ"**. Đánh giá hiệu quả hiệu quả của thuật toán là rất quan trọng, bởi vì chỉ bằng cách này, chúng ta mới có thể so sánh các thuật toán khác nhau và hướng dẫn quá trình thiết kế và tối ưu hóa thuật toán.

Phương pháp đánh giá hiệu quả chủ yếu được chia thành hai loại: thử nghiệm thực tế và ước tính lý thuyết.

## Thử nghiệm thực tế

Giả sử bây giờ chúng ta có thuật toán `A` và thuật toán `B`, cả hai thuật toán này đều có thể giải quyết cùng một vấn đề và chúng ta cần so sánh hiệu quả của chúng. Phương pháp trực tiếp nhất là chạy chúng trên máy tính và đo thời gian chạy cũng như mức sử dụng bộ nhớ của chúng. Cách tiếp cận đánh giá này có thể phản ánh hành vi trong thế giới thực, nhưng nó cũng có những hạn chế đáng kể.

Một mặt, **rất khó để loại bỏ các yếu tố gây nhiễu khỏi môi trường thử nghiệm**. Cấu hình phần cứng ảnh hưởng đến hiệu suất thuật toán. Ví dụ: nếu một thuật toán có mức độ song song cao thì thuật toán đó sẽ phù hợp hơn để chạy trên CPU đa lõi; nếu một thuật toán thực hiện các hoạt động sử dụng nhiều bộ nhớ thì thuật toán đó sẽ được hưởng lợi nhiều hơn từ bộ nhớ hiệu suất cao. Nói cách khác, kết quả thử nghiệm của một thuật toán trên các máy khác nhau có thể không nhất quán. Điều này có nghĩa là chúng tôi cần thử nghiệm trên nhiều máy khác nhau và tính toán hiệu suất trung bình, điều này không thực tế.

Mặt khác, **tiến hành thử nghiệm hoàn chỉnh rất tốn tài nguyên**. Khi khối lượng dữ liệu đầu vào thay đổi, thuật toán sẽ thể hiện các hiệu quả khác nhau. Ví dụ: khi khối lượng dữ liệu đầu vào nhỏ, thời gian chạy của thuật toán `A` sẽ ngắn hơn thuật toán `B`; nhưng khi khối lượng dữ liệu đầu vào lớn, kết quả kiểm tra có thể hoàn toàn ngược lại. Do đó, để có được kết luận thuyết phục, chúng ta cần kiểm tra dữ liệu đầu vào ở nhiều quy mô khác nhau, đòi hỏi một lượng lớn tài nguyên tính toán.

## Ước tính lý thuyết

Do thử nghiệm thực tế có những hạn chế đáng kể nên chúng ta có thể xem xét đánh giá hiệu quả của thuật toán thông qua tính toán lý thuyết. Phương pháp ước tính này được gọi là <u>phân tích độ phức tạp tiệm cận</u> hay viết tắt là <u>phân tích độ phức tạp</u>.

Phân tích độ phức tạp có thể phản ánh mối quan hệ giữa tài nguyên thời gian và không gian cần thiết để thực hiện thuật toán và quy mô dữ liệu đầu vào. **Nó mô tả xu hướng tăng trưởng về thời gian và không gian cần thiết để thực hiện thuật toán khi quy mô dữ liệu đầu vào tăng lên**. Định nghĩa này hơi phức tạp nên chúng ta có thể chia nó thành ba điểm chính để hiểu.

- "Tài nguyên thời gian và không gian" tương ứng với <u>độ phức tạp về thời gian</u> và <u>độ phức tạp về không gian</u>.
- "Khi quy mô dữ liệu đầu vào tăng lên" có nghĩa là độ phức tạp phản ánh mối quan hệ giữa hiệu quả chạy thuật toán và quy mô dữ liệu đầu vào.
- "Xu hướng tăng trưởng của thời gian và không gian" chỉ ra rằng phân tích độ phức tạp không tập trung vào các giá trị cụ thể của thời gian chạy hoặc không gian bị chiếm dụng, mà vào thời gian hoặc không gian phát triển "nhanh" như thế nào.

**Phân tích độ phức tạp khắc phục được những hạn chế của phương pháp thử nghiệm thực tế**, được phản ánh ở các khía cạnh sau.

- Nó không thực sự cần phải chạy mã, khiến nó thân thiện với môi trường hơn và tiết kiệm năng lượng hơn.
- Nó độc lập với môi trường thử nghiệm và kết quả phân tích có thể áp dụng cho tất cả các nền tảng đang chạy.
- Nó có thể phản ánh hiệu quả của thuật toán ở các khối lượng dữ liệu khác nhau, đặc biệt là hiệu suất thuật toán ở các khối lượng dữ liệu lớn.

!!! mẹo

    Nếu bạn vẫn còn bối rối về khái niệm độ phức tạp, đừng lo lắng—chúng tôi sẽ giới thiệu chi tiết về nó trong các chương tiếp theo.

Phân tích độ phức tạp cung cấp cho chúng ta một "thước đo" để đánh giá hiệu quả của thuật toán, cho phép chúng ta đo lường tài nguyên thời gian và không gian cần thiết để thực hiện một thuật toán nhất định và so sánh hiệu quả giữa các thuật toán khác nhau.

Độ phức tạp là một khái niệm toán học có thể trừu tượng và đầy thách thức đối với người mới bắt đầu. Từ góc độ này, phân tích độ phức tạp có thể không phải là chủ đề phù hợp nhất để giới thiệu đầu tiên. Tuy nhiên, khi chúng ta thảo luận về các đặc điểm của một cấu trúc dữ liệu hoặc thuật toán nhất định, khó có thể tránh khỏi việc phân tích tốc độ chạy và mức sử dụng không gian của nó.

Tóm lại, trước khi đi sâu vào cấu trúc dữ liệu và thuật toán, **trước tiên bạn nên thiết lập hiểu biết sơ bộ về phân tích độ phức tạp để có thể phân tích độ phức tạp của các thuật toán đơn giản**.
