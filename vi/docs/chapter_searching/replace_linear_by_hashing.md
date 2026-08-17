# Chiến lược tối ưu hóa hàm băm

Trong các bài toán về thuật toán, **chúng tôi thường giảm độ phức tạp về thời gian của thuật toán bằng cách thay thế tìm kiếm tuyến tính bằng tìm kiếm dựa trên hàm băm**. Hãy sử dụng một vấn đề thuật toán để hiểu sâu hơn.

!!! câu hỏi

    Cho một mảng số nguyên `nums` và một giá trị đích `target`, tìm hai phần tử trong mảng có tổng là `target` và trả về chỉ số của chúng. Giải pháp nào cũng được.

## Tìm kiếm tuyến tính: Đánh đổi thời gian lấy không gian

Xem xét việc duyệt trực tiếp tất cả các kết hợp có thể. Như minh họa trong hình bên dưới, chúng tôi sử dụng các vòng lặp lồng nhau và kiểm tra mỗi lần lặp xem tổng của hai số nguyên có phải là `target` hay không. Nếu vậy, hãy trả lại chỉ số của họ.

![Giải pháp tìm kiếm tuyến tính cho hai tổng](replace_linear_by_hashing.assets/two_sum_brute_force.png)

Mã được hiển thị dưới đây:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_brute_force}
```

Phương thức này có độ phức tạp về thời gian là $O(n^2)$ và độ phức tạp về không gian là $O(1)$, khiến nó rất tốn thời gian đối với các đầu vào lớn.

## Tìm kiếm dựa trên hàm băm: Trao đổi không gian lấy thời gian

Hãy cân nhắc sử dụng bảng băm có khóa là các phần tử mảng và giá trị là chỉ mục của chúng. Duyệt mảng và thực hiện các bước được hiển thị trong hình bên dưới trong mỗi lần lặp:

1. Kiểm tra xem số `target - nums[i]` có trong bảng băm hay không. Nếu vậy, hãy trả về trực tiếp chỉ số của hai phần tử này.
2. Thêm cặp khóa-giá trị `nums[i]` và chỉ mục `i` vào bảng băm.

=== "<1>"
    ![Giải pháp bảng băm cho hai tổng](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png)

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png)

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png)

Việc triển khai được hiển thị bên dưới và chỉ yêu cầu một vòng lặp duy nhất:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_hash_table}
```

Phương pháp này giảm độ phức tạp về thời gian từ $O(n^2)$ xuống $O(n)$ thông qua tìm kiếm dựa trên hàm băm, cải thiện đáng kể hiệu quả thời gian chạy.

Vì cần phải duy trì một bảng băm bổ sung nên độ phức tạp của không gian là $O(n)$. **Tuy nhiên, phương pháp này mang lại sự cân bằng tổng thể về không gian-thời gian cân bằng hơn, khiến nó trở thành giải pháp tối ưu cho vấn đề này**.
