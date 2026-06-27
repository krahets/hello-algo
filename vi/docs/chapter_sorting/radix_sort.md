# Sắp xếp cơ số

Phần trước đã giới thiệu cách sắp xếp đếm, phù hợp khi số lượng phần tử $n$ lớn nhưng phạm vi giá trị $m$ nhỏ. Giả sử chúng ta cần sắp xếp $n = 10^6$ ID sinh viên, mỗi ID là một số có 8 chữ số. Khi đó phạm vi giá trị $m = 10^8$ là rất lớn. Sử dụng phương pháp sắp xếp đếm sẽ yêu cầu một lượng lớn bộ nhớ, trong khi phương pháp sắp xếp cơ số sẽ tránh được vấn đề này.

<u>Sắp xếp cơ số</u> dựa trên ý tưởng cốt lõi giống như sắp xếp đếm: nó cũng sắp xếp bằng cách đếm số lần xuất hiện. Dựa trên điều này, sắp xếp cơ số khai thác mối quan hệ vị trí giữa các chữ số và sắp xếp chúng từng chữ số một để thu được kết quả cuối cùng.

## Luồng thuật toán

Lấy dữ liệu ID sinh viên làm ví dụ, giả sử chữ số thấp nhất là chữ số thứ $1$ và chữ số cao nhất là chữ số thứ $8$. Luồng sắp xếp cơ số được thể hiện trong hình bên dưới.

1. Khởi tạo chữ số $k = 1$.
2. Thực hiện "sắp xếp đếm" trên chữ số thứ $k$ của mã số sinh viên. Sau khi hoàn thành, dữ liệu sẽ được sắp xếp từ nhỏ nhất đến lớn nhất theo chữ số thứ $k$.
3. Tăng $k$ lên $1$, sau đó quay lại bước `2.` và tiếp tục lặp lại cho đến khi tất cả các chữ số được sắp xếp, lúc đó quá trình kết thúc.

![Luồng thuật toán sắp xếp cơ số](radix_sort.assets/radix_sort_overview.png)

Tiếp theo, chúng ta hãy xem mã. Đối với một số $x$ trong cơ số $d$, $k$chữ số thứ $x_k$ của nó có thể thu được bằng công thức sau:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Ở đây, $\lfloor a \rfloor$ biểu thị việc làm tròn số dấu phẩy động $a$ xuống và $\bmod \: d$ biểu thị việc lấy modulo $d$ còn lại. Đối với dữ liệu ID sinh viên, $d = 10$ và $k \in [1, 8]$.

Ngoài ra, chúng ta cần sửa đổi một chút mã sắp xếp đếm để sắp xếp nó dựa trên chữ số thứ $k$ của số:

```src
[file]{radix_sort}-[class]{}-[func]{radix_sort}
```

!!! câu hỏi "Tại sao bắt đầu sắp xếp từ chữ số thấp nhất?"

    Trong các lần sắp xếp liên tiếp, lần sắp xếp sau sẽ ghi đè kết quả của lần sắp xếp trước đó. Ví dụ: nếu lần vượt qua đầu tiên mang lại $a < b$ but the second yields $a > b$ thì kết quả của lần vượt qua thứ hai sẽ chiếm ưu thế. Vì các chữ số có thứ tự cao hơn có mức độ ưu tiên cao hơn các chữ số có thứ tự thấp hơn nên chúng ta nên sắp xếp các chữ số có thứ tự thấp hơn trước rồi đến các chữ số có thứ tự cao hơn.

## Đặc điểm thuật toán

So với sắp xếp đếm, sắp xếp cơ số phù hợp với phạm vi giá trị lớn hơn, **nhưng chỉ khi dữ liệu có thể được biểu diễn bằng một số chữ số cố định và số chữ số đó không quá lớn**. Ví dụ: các số có dấu phẩy động không phù hợp lắm với kiểu sắp xếp cơ số vì số lượng chữ số $k$ có thể quá lớn, có khả năng dẫn đến độ phức tạp về thời gian $O(nk) \gg O(n^2)$.

- **Độ phức tạp về thời gian của $O(nk)$, sắp xếp không thích ứng**: Đặt số mục là $n$, đặt các giá trị được biểu thị theo cơ số $d$ và đặt số chữ số tối đa là $k$. Việc sắp xếp đếm trên một chữ số mất $O(n + d)$ thời gian, do đó việc sắp xếp tất cả $k$ chữ số mất $O((n + d)k)$ thời gian. Trong thực tế, $d$ và $k$ thường tương đối nhỏ, do đó độ phức tạp về thời gian tổng thể đạt tới $O(n)$.
- **Độ phức tạp về không gian của $O(n + d)$, sắp xếp không tại chỗ**: Tương tự như sắp xếp đếm, sắp xếp cơ số yêu cầu các mảng phụ trợ `res` và `counter` có độ dài $n$ và $d$.
- **Sắp xếp ổn định**: Khi sắp xếp đếm ổn định, sắp xếp cơ số cũng ổn định; khi sắp xếp đếm không ổn định, sắp xếp cơ số không thể đảm bảo kết quả sắp xếp chính xác.
