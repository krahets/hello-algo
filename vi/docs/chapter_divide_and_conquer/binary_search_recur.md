# Chiến lược tìm kiếm phân chia và chinh phục

Chúng ta đã biết rằng các thuật toán tìm kiếm được chia thành hai loại chính.

- **Tìm kiếm Brute-force**: Được triển khai bằng cách duyệt qua cấu trúc dữ liệu, với độ phức tạp về thời gian là $O(n)$.
- **Tìm kiếm thích ứng**: Tận dụng tổ chức dữ liệu cụ thể hoặc thông tin trước đó, với độ phức tạp về thời gian đạt tới $O(\log n)$ hoặc thậm chí $O(1)$.

Trên thực tế, **thuật toán tìm kiếm có độ phức tạp về thời gian $O(\log n)$ thường được triển khai dựa trên chiến lược chia để trị**, chẳng hạn như tìm kiếm nhị phân và cây.

- Mỗi bước tìm kiếm nhị phân chia bài toán (tìm kiếm phần tử đích trong mảng) thành một bài toán nhỏ hơn (tìm kiếm phần tử đích trong một nửa mảng), tiếp tục cho đến khi mảng trống hoặc tìm thấy phần tử đích.
- Cây cối đại diện cho ý tưởng chia để trị. Trong các cấu trúc dữ liệu như cây tìm kiếm nhị phân, cây AVL và vùng heap, độ phức tạp về thời gian của các phép toán khác nhau là $O(\log n)$.

Chiến lược phân chia và chinh phục của tìm kiếm nhị phân như sau.

- **Bài toán có thể được phân tách**: Tìm kiếm nhị phân phân rã đệ quy bài toán ban đầu (tìm kiếm trong một mảng) thành các bài toán con (tìm kiếm trong một nửa mảng), đạt được bằng cách so sánh phần tử ở giữa với phần tử đích.
- **Các bài toán con độc lập**: Trong tìm kiếm nhị phân, mỗi vòng chỉ xử lý một bài toán con, không bị ảnh hưởng bởi các bài toán con khác.
- **Lời giải của các bài toán con không cần phải hợp nhất**: Tìm kiếm nhị phân nhằm mục đích tìm ra một phần tử cụ thể nên không cần phải hợp nhất lời giải của các bài toán con. Khi một bài toán con được giải quyết thì bài toán ban đầu cũng được giải quyết.

Chia để trị có thể cải thiện hiệu quả tìm kiếm vì tìm kiếm vũ phu chỉ có thể loại bỏ một tùy chọn mỗi vòng, **trong khi tìm kiếm chia để trị có thể loại bỏ một nửa số tùy chọn mỗi vòng**.

### Thực hiện tìm kiếm nhị phân dựa trên phân chia và chinh phục

Trong các phần trước, tìm kiếm nhị phân được triển khai dựa trên phép lặp. Bây giờ chúng tôi triển khai nó dựa trên phân chia và chinh phục (đệ quy).

!!! câu hỏi

    Cho một mảng được sắp xếp `nums` có độ dài $n$, trong đó tất cả các phần tử là duy nhất, hãy tìm `target`.

Từ góc độ chia để trị, chúng ta biểu thị bài toán con tương ứng với khoảng tìm kiếm $[i, j]$ là $f(i, j)$.

Bắt đầu từ bài toán ban đầu $f(0, n-1)$, thực hiện tìm kiếm nhị phân qua các bước sau.

1. Tính điểm giữa $m$ của khoảng tìm kiếm $[i, j]$ và sử dụng nó để loại bỏ một nửa khoảng tìm kiếm.
2. Giải đệ quy bài toán con giảm đi một nửa kích thước, có thể là $f(i, m-1)$ hoặc $f(m+1, j)$.
3. Lặp lại các bước `1.` và `2.` cho đến khi tìm thấy `target` hoặc quay lại khi khoảng trống.

Hình dưới đây cho thấy quá trình phân chia và chinh phục tìm kiếm nhị phân cho phần tử $6$ trong một mảng.

![Quá trình phân chia và chinh phục tìm kiếm nhị phân](binary_search_recur.assets/binary_search_recur.png)

Trong mã triển khai, chúng tôi khai báo hàm đệ quy `dfs()` để giải quyết vấn đề $f(i, j)$:

```src
[file]{binary_search_recur}-[class]{}-[func]{binary_search}
```
