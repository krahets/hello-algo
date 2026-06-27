# Phương pháp giải quyết vấn đề lập trình động

Hai phần trước đã giới thiệu những đặc điểm chính của bài toán quy hoạch động. Tiếp theo, chúng ta hãy cùng nhau khám phá thêm hai vấn đề thực tế nữa.

1. Làm thế nào để xác định xem một vấn đề có phải là một vấn đề lập trình động hay không?
2. Quy trình hoàn chỉnh để giải một bài toán quy hoạch động là gì và chúng ta nên bắt đầu từ đâu?

## Xác định vấn đề

Nói chung, nếu một bài toán chứa các bài toán con chồng chéo, cấu trúc con tối ưu và không thỏa mãn hậu quả nào thì nó thường phù hợp để giải quyết bằng quy hoạch động. Tuy nhiên, rất khó để trích xuất trực tiếp những đặc điểm này từ mô tả vấn đề. Do đó, chúng tôi thường nới lỏng các điều kiện và **trước tiên quan sát xem bài toán có phù hợp để giải bằng phương pháp quay lui (tìm kiếm toàn diện)** hay không.

**Các bài toán phù hợp để giải quyết bằng quay lui thường thỏa mãn "mô hình cây quyết định"**, nghĩa là bài toán có thể được mô tả bằng cấu trúc cây, trong đó mỗi nút biểu thị một quyết định và mỗi đường dẫn biểu thị một chuỗi các quyết định.

Nói cách khác, nếu một vấn đề chứa một khái niệm rõ ràng về các quyết định và giải pháp được tạo ra thông qua một loạt các quyết định thì nó thỏa mãn mô hình cây quyết định và thường có thể được giải quyết bằng cách quay lui.

Trên cơ sở đó, bài toán quy hoạch động cũng có một số dấu hiệu tích cực.

- Vấn đề chứa các mô tả như tối đa (tối thiểu) hoặc nhiều nhất (ít nhất), biểu thị sự tối ưu hóa.
- Trạng thái của vấn đề có thể được biểu diễn bằng danh sách, ma trận đa chiều hoặc cây và trạng thái có mối quan hệ lặp lại với các trạng thái xung quanh nó.

Tương ứng, cũng có một số chỉ số tiêu cực.

- Mục tiêu của bài toán là tìm ra tất cả các giải pháp có thể, chứ không phải là tìm ra giải pháp tối ưu.
- Việc mô tả bài toán có đặc điểm hoán vị và kết hợp rõ ràng, đòi hỏi phải trả về nhiều lời giải cụ thể.

Nếu một bài toán thỏa mãn mô hình cây quyết định và có các chỉ số tích cực tương đối rõ ràng, chúng ta có thể cho rằng đó là bài toán quy hoạch động và kiểm chứng giả định đó trong quá trình giải.

## Các bước giải quyết vấn đề

Quá trình giải quyết vấn đề trong lập trình động thay đổi tùy thuộc vào tính chất và độ khó của vấn đề, nhưng thường tuân theo các bước sau: mô tả các quyết định, xác định trạng thái, thiết lập bảng $dp$, suy ra phương trình chuyển đổi trạng thái, xác định các điều kiện biên, v.v.

Để minh họa các bước giải quyết vấn đề một cách sinh động hơn, chúng tôi sử dụng một bài toán kinh điển “tổng đường dẫn tối thiểu” làm ví dụ.

!!! câu hỏi

    Cho một lưới hai chiều $n \times m$ `grid` trong đó mỗi ô chứa một số nguyên không âm biểu thị giá trị của nó, robot bắt đầu từ ô trên cùng bên trái và chỉ có thể di chuyển xuống hoặc sang phải ở mỗi bước cho đến khi đến ô dưới cùng bên phải. Trả về tổng đường dẫn tối thiểu từ trên cùng bên trái đến dưới cùng bên phải.

Hình bên dưới hiển thị một ví dụ trong đó tổng đường dẫn tối thiểu cho lưới đã cho là $13$.

![Dữ liệu ví dụ về tổng đường dẫn tối thiểu](dp_solution_pipeline.assets/min_path_sum_example.png)

**Bước 1: Suy nghĩ về các quyết định trong mỗi vòng, xác định trạng thái và từ đó nhận được bảng $dp$**

Quyết định trong mỗi vòng của bài toán này là di chuyển xuống một bước hoặc sang phải từ ô hiện tại. Đặt chỉ số hàng và cột của ô hiện tại là $[i, j]$. Sau khi di chuyển xuống hoặc sang phải, các chỉ số trở thành $[i+1, j]$ hoặc $[i, j+1]$. Do đó, trạng thái nên bao gồm hai biến, chỉ mục hàng và chỉ mục cột, ký hiệu là $[i, j]$.

Trạng thái $[i, j]$ tương ứng với bài toán con: **tổng đường đi tối thiểu từ điểm bắt đầu $[0, 0]$ đến $[i, j]$**, ký hiệu là $dp[i, j]$.

Từ đó, chúng ta thu được ma trận $dp$ hai chiều được hiển thị trong hình bên dưới, có kích thước giống với lưới đầu vào $grid$.

![Định nghĩa trạng thái và bảng dp](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png)

!!! ghi chú

    Quá trình lập trình động và quay lui có thể được mô tả như một chuỗi các quyết định và trạng thái bao gồm tất cả các biến quyết định. Nó phải chứa tất cả các biến mô tả tiến trình giải quyết vấn đề và phải chứa đủ thông tin để rút ra trạng thái tiếp theo.

    Mỗi trạng thái tương ứng với một bài toán con và chúng tôi xác định một bảng $dp$ để lưu trữ lời giải cho tất cả các bài toán con. Mỗi biến độc lập của trạng thái là một thứ nguyên của bảng $dp$. Về cơ bản, bảng $dp$ là ánh xạ giữa các trạng thái và giải pháp cho các bài toán con.

**Bước 2: Xác định cấu trúc con tối ưu và sau đó rút ra phương trình chuyển trạng thái**

Đối với trạng thái $[i, j]$, nó chỉ có thể chuyển từ ô phía trên $[i-1, j]$ hoặc ô sang $[i, j-1]$ bên trái. Do đó, cấu trúc con tối ưu là: tổng đường dẫn tối thiểu để đạt tới $[i, j]$ được xác định bằng giá trị nhỏ hơn của tổng đường dẫn tối thiểu của $[i, j-1]$ và $[i-1, j]$.

Dựa trên phân tích trên, có thể rút ra phương trình chuyển trạng thái như trong hình bên dưới:

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + lưới[i, j]
$$

![Cấu trúc con tối ưu và phương trình chuyển trạng thái](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png)

!!! ghi chú

    Dựa trên bảng $dp$ đã xác định, hãy suy nghĩ về mối quan hệ giữa bài toán ban đầu và các bài toán con, đồng thời tìm ra phương pháp xây dựng lời giải tối ưu cho bài toán ban đầu từ lời giải tối ưu cho các bài toán con, tức là cấu trúc con tối ưu.

    Khi xác định được cấu trúc con tối ưu, chúng ta có thể sử dụng nó để xây dựng phương trình chuyển trạng thái.

**Bước 3: Xác định điều kiện biên và thứ tự chuyển trạng thái**

Trong bài toán này, các trạng thái ở hàng đầu tiên chỉ có thể đến từ trạng thái ở bên trái và các trạng thái ở cột đầu tiên chỉ có thể đến từ trạng thái phía trên chúng. Do đó, hàng đầu tiên $i = 0$ và cột đầu tiên $j = 0$ là các điều kiện biên.

Như được hiển thị trong hình bên dưới, vì mỗi ô chuyển đổi từ ô sang trái và ô phía trên nó, nên chúng ta sử dụng các vòng lặp để duyệt ma trận, với vòng lặp bên ngoài đi qua các hàng và vòng lặp bên trong đi qua các cột.

![Điều kiện biên và thứ tự chuyển trạng thái](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png)

!!! ghi chú

    Các điều kiện biên trong lập trình động được sử dụng để khởi tạo bảng $dp$, trong khi trong tìm kiếm, chúng được sử dụng để cắt tỉa.

    Cốt lõi của thứ tự chuyển trạng thái là đảm bảo rằng khi tính toán lời giải cho bài toán hiện tại, tất cả các bài toán con nhỏ hơn mà nó phụ thuộc vào đều đã được tính toán chính xác.

Dựa trên phân tích trên, chúng ta có thể viết trực tiếp mã lập trình động. Tuy nhiên, phân rã bài toán con là cách tiếp cận từ trên xuống, vì vậy việc triển khai theo thứ tự "tìm kiếm mạnh mẽ $\rightarrow$ ghi nhớ $\rightarrow$ lập trình động" sẽ phù hợp hơn với thói quen tư duy.

### Phương pháp 1: Tìm kiếm Brute Force

Bắt đầu từ trạng thái $[i, j]$, chúng tôi liên tục phân tách nó thành các trạng thái nhỏ hơn $[i-1, j]$ và $[i, j-1]$. Hàm đệ quy bao gồm các phần tử sau.

- **Tham số đệ quy**: trạng thái $[i, j]$.
- **Giá trị trả về**: tổng đường dẫn tối thiểu từ $[0, 0]$ đến $[i, j]$, tức là $dp[i, j]$.
- **Điều kiện kết thúc**: khi $i = 0$ và $j = 0$, chi phí trả về $grid[0, 0]$.
- **Cắt tỉa**: khi $i < 0$ or $j < 0$, the index is out of bounds, return cost $+\infty$, representing infeasibility.

The implementation code is as follows:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dfs}
```

The figure below shows the recursion tree rooted at $dp[2, 1]$, which includes some overlapping subproblems whose number will increase sharply as the size of grid `grid` grows.

Essentially, the reason for overlapping subproblems is: **there are multiple paths from the top-left corner to reach a certain cell**.

![Brute force search recursion tree](dp_solution_pipeline.assets/min_path_sum_dfs.png)

Each state has two choices, down and right, so the total number of steps from the top-left corner to the bottom-right corner is $m + n - 2$, giving a worst-case time complexity of $O(2^{m + n})$, where $n$ and $m$ are the number of rows and columns of the grid, respectively. Note that this calculation does not account for situations near the grid boundaries, where only one choice remains when reaching the grid boundary, so the actual number of paths will be somewhat less.

### Method 2: Memoization

We introduce a memo list `mem` of the same size as grid `grid` to record the solutions to subproblems and prune overlapping subproblems:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dfs_mem}
```

As shown in the figure below, after introducing memoization, all subproblem solutions only need to be computed once, so the time complexity depends on the total number of states, which is the grid size $O(nm)$.

![Memoization recursion tree](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png)

### Method 3: Dynamic Programming

Implement the dynamic programming solution based on iteration, as shown in the code below:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dp}
```

The figure below shows the state transition process for minimum path sum, which traverses the entire grid, **thus the time complexity is $O(nm)$**.

The array `dp` has size $n \times m$, **thus the space complexity is $O(nm)$**.

=== "<1>"
    ![Quy trình lập trình động cho tổng đường dẫn tối thiểu](dp_solution_pipeline.assets/min_path_sum_dp_step1.png)

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.png)

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.png)

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.png)

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.png)

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.png)

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.png)

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.png)

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.png)

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.png)

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.png)

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.png)

### Tối ưu hóa không gian

Vì mỗi ô chỉ liên quan đến ô bên trái và ô phía trên nó, nên chúng ta có thể sử dụng mảng một hàng để triển khai bảng $dp$.

Lưu ý rằng vì mảng `dp` chỉ có thể biểu thị trạng thái của một hàng, nên chúng tôi không thể khởi tạo trước trạng thái cột đầu tiên mà thay vào đó hãy cập nhật nó khi duyệt qua từng hàng:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dp_comp}
```
