# Thuật toán chia để trị

<u>Chia để trị</u> là một chiến lược thuật toán rất quan trọng và phổ biến. Chia để trị thường được thực hiện dựa trên đệ quy, bao gồm hai bước: “chia” và “chinh phục”.

1. **Chia (giai đoạn phân vùng)**: Chia đệ quy bài toán ban đầu thành hai hoặc nhiều bài toán con cho đến khi đạt được bài toán con nhỏ nhất.
2. **Chinh phục (giai đoạn hợp nhất)**: Bắt đầu từ các bài toán con nhỏ nhất với lời giải đã biết, hợp nhất lời giải của các bài toán con từ dưới lên trên để xây dựng lời giải cho bài toán ban đầu.

Như thể hiện trong hình bên dưới, "sắp xếp hợp nhất" là một trong những ứng dụng điển hình của chiến lược chia để trị.

1. **Chia**: Chia đệ quy mảng ban đầu (bài toán gốc) thành hai mảng con (bài toán con) cho đến khi mảng con chỉ còn một phần tử (bài toán con nhỏ nhất).
2. **Chinh phục**: Hợp nhất các mảng con đã sắp xếp (lời giải cho bài toán con) từ dưới lên trên để thu được mảng ban đầu đã được sắp xếp (lời giải cho bài toán gốc).

![Chiến lược phân chia và chinh phục sắp xếp hợp nhất](divide_and_conquer.assets/divide_and_conquer_merge_sort.png)

## Làm thế nào để xác định vấn đề phân chia và chinh phục

Việc một bài toán có phù hợp để giải bằng phương pháp chia để trị hay không thường có thể được xác định dựa trên các tiêu chí sau.

1. **Bài toán có thể được phân tách**: Bài toán ban đầu có thể được chia thành các bài toán con nhỏ hơn, tương tự nhau và có thể được chia đệ quy theo cách tương tự.
2. **Các bài toán con độc lập**: Không có sự chồng chéo giữa các bài toán con, chúng độc lập với nhau và có thể giải độc lập.
3. **Lời giải của các bài toán con có thể được hợp nhất**: Lời giải của bài toán ban đầu thu được bằng cách hợp nhất lời giải của các bài toán con.

Rõ ràng, sắp xếp hợp nhất thỏa mãn ba tiêu chí này.

1. **Bài toán có thể được phân tách**: Chia đệ quy mảng (bài toán ban đầu) thành hai mảng con (bài toán con).
2. **Các bài toán con độc lập**: Mỗi mảng con có thể được sắp xếp độc lập (các bài toán con có thể được giải độc lập).
3. **Lời giải của các bài toán con có thể được hợp nhất**: Hai mảng con đã sắp xếp (lời giải của các bài toán con) có thể được hợp nhất thành một mảng đã được sắp xếp (lời giải của bài toán ban đầu).

## Cải thiện hiệu quả thông qua chia để trị

**Chia để trị không chỉ có thể giải quyết các vấn đề thuật toán một cách hiệu quả mà còn thường có thể cải thiện hiệu quả thuật toán**. Trong các thuật toán sắp xếp, sắp xếp nhanh, sắp xếp hợp nhất và sắp xếp đống nhanh hơn so với sắp xếp lựa chọn, bong bóng và chèn vì chúng áp dụng chiến lược phân chia và chinh phục.

Điều này đặt ra câu hỏi: **Tại sao phép chia để trị lại cải thiện hiệu quả của thuật toán và logic cơ bản** là gì? Nói cách khác, tại sao việc chia một bài toán lớn thành nhiều bài toán con, giải các bài toán con và hợp nhất các lời giải của chúng lại hiệu quả hơn việc giải trực tiếp bài toán ban đầu? Câu hỏi này có thể được thảo luận từ hai khía cạnh: số lượng hoạt động và tính toán song song.

### Tối ưu hóa số lượng hoạt động

Lấy "sắp xếp bong bóng" làm ví dụ, việc xử lý một mảng có độ dài $n$ yêu cầu thời gian $O(n^2)$. Giả sử chúng ta chia mảng ở điểm giữa thành hai mảng con, như minh họa trong hình bên dưới. Phép chia yêu cầu thời gian $O(n)$, việc sắp xếp từng mảng con yêu cầu thời gian $O((n / 2)^2)$ và việc hợp nhất hai mảng con yêu cầu thời gian $O(n)$, dẫn đến độ phức tạp về mặt thời gian tổng thể là:

$$
O(n + (\frac{n}{2})^2 \times 2 + n) = O(\frac{n^2}{2} + 2n)
$$

![Sắp xếp bong bóng trước và sau khi chia mảng](divide_and_conquer.assets/divide_and_conquer_bubble_sort.png)

Tiếp theo, chúng ta tính bất đẳng thức sau, trong đó vế trái và vế phải lần lượt biểu thị tổng số phép toán trước và sau phép chia:

$$
\bắt đầu{căn chỉnh}
n^2 & > \frac{n^2}{2} + 2n \newline
n^2 - \frac{n^2}{2} - 2n & > 0 \newline
n(n - 4) & > 0
\end{căn chỉnh}
$$

**Điều này có nghĩa là khi $n > 4$, số phép toán sau khi chia sẽ nhỏ hơn và hiệu quả sắp xếp sẽ cao hơn**. Lưu ý rằng độ phức tạp về thời gian sau khi chia vẫn là bậc hai $O(n^2)$, nhưng số hạng không đổi trong độ phức tạp đã trở nên nhỏ hơn.

Đi xa hơn, **điều gì sẽ xảy ra nếu chúng ta liên tục chia các mảng con từ điểm giữa của chúng thành hai mảng con** cho đến khi các mảng con chỉ có một phần tử? Cách tiếp cận này thực sự là "sắp xếp hợp nhất", với độ phức tạp về thời gian là $O(n \log n)$.

Nghĩ xa hơn, **điều gì sẽ xảy ra nếu chúng ta đặt nhiều điểm chia** và chia đều mảng ban đầu thành các mảng con $k$? Tình huống này rất giống với "sắp xếp nhóm", rất phù hợp để sắp xếp lượng dữ liệu khổng lồ, với độ phức tạp về mặt lý thuyết là $O(n + k)$.

### Tối ưu hóa tính toán song song

Chúng ta biết rằng các bài toán con được tạo ra bởi phép chia để trị độc lập với nhau, **nên chúng thường có thể được giải song song**. Điều này có nghĩa là phân chia để chinh phục không chỉ có thể giảm độ phức tạp về thời gian của các thuật toán **mà còn có thể tuân theo sự tối ưu hóa song song của hệ điều hành**.

Tối ưu hóa song song đặc biệt hiệu quả trong môi trường đa lõi hoặc đa bộ xử lý, vì hệ thống có thể xử lý đồng thời nhiều vấn đề phụ, tận dụng tối đa tài nguyên máy tính và giảm đáng kể thời gian chạy tổng thể.

Ví dụ: trong "sắp xếp nhóm" được hiển thị trong hình bên dưới, chúng tôi phân phối đồng đều dữ liệu lớn vào các nhóm khác nhau và nhiệm vụ sắp xếp cho tất cả các nhóm có thể được phân phối cho các đơn vị tính toán khác nhau. Sau khi hoàn thành, kết quả sẽ được gộp lại.

![Tính toán song song trong sắp xếp nhóm](divide_and_conquer.assets/divide_and_conquer_parallel_computing.png)

## Các ứng dụng phổ biến của Chia để trị

Một mặt, chia để trị có thể được sử dụng để giải quyết nhiều vấn đề thuật toán cổ điển.

- **Tìm cặp điểm gần nhất**: Thuật toán này trước tiên chia tập hợp điểm thành hai phần, sau đó tìm cặp điểm gần nhất trong mỗi phần một cách riêng biệt và cuối cùng tìm cặp điểm gần nhất trải dài cả hai phần.
- **Phép nhân số nguyên lớn**: Ví dụ: thuật toán Karatsuba, phân tách phép nhân số nguyên lớn thành nhiều phép nhân và phép cộng số nguyên nhỏ hơn.
- **Phép nhân ma trận**: Ví dụ: thuật toán Strassen, phân tách phép nhân ma trận lớn thành nhiều phép nhân và phép cộng ma trận nhỏ.
- **Bài toán Hanota**: Bài toán hanota có thể được giải bằng đệ quy, đây là một ứng dụng điển hình của chiến lược chia để trị.
- **Giải cặp nghịch đảo**: Trong một dãy số, nếu số trước lớn hơn số sau thì hai số này tạo thành một cặp nghịch đảo. Giải quyết vấn đề cặp đảo ngược có thể sử dụng phương pháp phân chia và chinh phục với sự trợ giúp của sắp xếp hợp nhất.

Mặt khác, phân chia để trị được ứng dụng rộng rãi trong việc thiết kế các thuật toán và cấu trúc dữ liệu.

- **Tìm kiếm nhị phân**: Tìm kiếm nhị phân chia mảng đã sắp xếp thành hai phần dựa trên chỉ mục điểm giữa, sau đó quyết định loại bỏ nửa nào dựa trên kết quả so sánh giữa giá trị đích và giá trị phần tử ở giữa, đồng thời thực hiện cùng một bước tìm kiếm nhị phân trên khoảng còn lại.
- **Sắp xếp hợp nhất**: Đã được giới thiệu ở đầu phần này, không cần giải thích thêm.
- **Sắp xếp nhanh**: Sắp xếp nhanh chọn một giá trị trục, sau đó chia mảng thành hai mảng con, một mảng có các phần tử nhỏ hơn trục xoay và mảng kia có các phần tử lớn hơn trục xoay, sau đó thực hiện thao tác chia tương tự trên hai phần này cho đến khi các mảng con chỉ có một phần tử.
- **Sắp xếp nhóm**: Ý tưởng cơ bản của sắp xếp nhóm là phân tán dữ liệu vào nhiều nhóm, sau đó sắp xếp các phần tử trong mỗi nhóm và cuối cùng trích xuất các phần tử từ mỗi nhóm theo trình tự để thu được một mảng được sắp xếp.
- **Cây**: Ví dụ: cây tìm kiếm nhị phân, cây AVL, cây đỏ đen, cây B, cây B+, v.v. Các hoạt động tìm kiếm, chèn và xóa của chúng đều có thể được xem là ứng dụng của chiến lược chia để trị.
- **Đống**: Đống là một cây nhị phân hoàn chỉnh đặc biệt và các hoạt động khác nhau của nó, chẳng hạn như chèn, xóa và tạo đống, thực sự hàm ý ý tưởng phân chia và chinh phục.
- **Bảng băm**: Mặc dù bảng băm không áp dụng trực tiếp chiến lược chia để trị, một số phương pháp giải quyết xung đột hàm băm gián tiếp áp dụng chiến lược chia để trị. Ví dụ: danh sách liên kết dài theo chuỗi có thể được chuyển đổi thành cây đỏ đen để cải thiện hiệu quả tra cứu.

Có thể thấy **chia để trị là một ý tưởng thuật toán có sức lan tỏa âm thầm**, được nhúng trong nhiều thuật toán và cấu trúc dữ liệu khác nhau.
