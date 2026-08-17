# Mảng

<u>mảng</u> là cấu trúc dữ liệu tuyến tính lưu trữ các phần tử cùng loại trong không gian bộ nhớ liền kề. Vị trí của một phần tử trong mảng được gọi là <u>chỉ mục</u> của phần tử đó. Hình dưới đây minh họa các khái niệm chính và phương pháp lưu trữ của mảng.

![Định nghĩa mảng và phương pháp lưu trữ](array.assets/array_definition.png)

## Hoạt động mảng phổ biến

### Đang khởi tạo mảng

Chúng ta có thể chọn giữa hai phương pháp khởi tạo mảng dựa trên nhu cầu của mình: có hoặc không có giá trị ban đầu. Khi không có giá trị ban đầu nào được chỉ định, hầu hết các ngôn ngữ lập trình đều khởi tạo các phần tử mảng thành $0$:

=== "Python"

    ```python title="array.py"
    # Initialize array
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Initialize array */
    // Stored on stack
    int arr[5];
    int nums[5] = { 1, 3, 2, 5, 4 };
    // Stored on heap (requires manual memory release)
    int* arr1 = new int[5];
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="array.java"
    /* Initialize array */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Initialize array */
    int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
    int[] nums = [1, 3, 2, 5, 4];
    ```

=== "Go"

    ```go title="array.go"
    /* Initialize array */
    var arr [5]int
    // In Go, specifying length ([5]int) creates an array; not specifying length ([]int) creates a slice
    // Since Go's arrays are designed to have their length determined at compile time, only constants can be used to specify the length
    // For convenience in implementing the extend() method, slices are treated as arrays below
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Initialize array */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* Initialize array */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Initialize array */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Initialize array */
    List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Initialize array */
    let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
    let slice: &[i32] = &[0; 5];
    // In Rust, specifying length ([i32; 5]) creates an array; not specifying length (&[i32]) creates a slice
    // Since Rust's arrays are designed to have their length determined at compile time, only constants can be used to specify the length
    // Vector is the type generally used as a dynamic array in Rust
    // For convenience in implementing the extend() method, vectors are treated as arrays below
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* Initialize array */
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Initialize array */
    var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
    var nums = intArrayOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="array.rb"
    # Initialize array
    arr = Array.new(5, 0)
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7% BB%84%0Aarr%20%3D%20%5B0%5D%20*%205%20%20%23%20%5B%200,%200,%200,%200,%200%20%5D%0Anums% 20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=0&heapPrimitives=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Truy cập các phần tử

Các phần tử mảng được lưu trữ trong không gian bộ nhớ liền kề, điều đó có nghĩa là việc tính toán địa chỉ bộ nhớ của các phần tử mảng rất dễ dàng. Cho địa chỉ bộ nhớ của mảng (địa chỉ bộ nhớ của phần tử đầu tiên) và chỉ mục của một phần tử, chúng ta có thể sử dụng công thức hiển thị trong hình bên dưới để tính địa chỉ bộ nhớ của phần tử và truy cập trực tiếp vào phần tử đó.

![Tính toán địa chỉ bộ nhớ cho các phần tử mảng](array.assets/array_memory_location_calculation.png)

Quan sát hình trên, chúng ta thấy rằng phần tử đầu tiên của mảng có chỉ số $0$, điều này có vẻ phản trực giác vì việc đếm từ $1$ sẽ tự nhiên hơn. Tuy nhiên, từ góc nhìn của công thức tính toán địa chỉ, **chỉ mục về cơ bản là phần chênh lệch so với địa chỉ bộ nhớ**. Độ lệch địa chỉ của phần tử đầu tiên là $0$, do đó, việc chỉ mục của nó là $0$ là hợp lý.

Việc truy cập các phần tử trong mảng có hiệu quả cao; chúng ta có thể truy cập ngẫu nhiên bất kỳ phần tử nào trong mảng trong thời gian $O(1)$.

```src
[file]{array}-[class]{}-[func]{random_access}
```

### Chèn phần tử

Các phần tử mảng được đóng gói chặt chẽ với nhau trong bộ nhớ, không có khoảng trống giữa chúng để dành cho dữ liệu bổ sung. Như trong hình bên dưới, nếu muốn chèn một phần tử vào giữa mảng, chúng ta cần dịch chuyển tất cả các phần tử tiếp theo sang phải một vị trí rồi gán giá trị tại chỉ mục đó.

![Ví dụ chèn một phần tử vào mảng](array.assets/array_insert_element.png)

Điều đáng chú ý là vì độ dài của mảng là cố định nên việc chèn một phần tử chắc chắn sẽ đẩy phần tử cuối cùng ra khỏi mảng. Chúng ta sẽ để lại giải pháp cho vấn đề này để thảo luận trong chương "Danh sách".

```src
[file]{array}-[class]{}-[func]{insert}
```

### Loại bỏ các phần tử

Tương tự, như trong hình bên dưới, để xóa phần tử tại chỉ mục $i$, chúng ta cần dịch chuyển tất cả các phần tử sau chỉ mục $i$ về phía trước một vị trí.

![Ví dụ về xóa một phần tử khỏi mảng](array.assets/array_remove_element.png)

Lưu ý rằng sau khi xóa xong, phần tử cuối cùng ban đầu không còn ý nghĩa nữa nên chúng ta không cần phải sửa đổi nó một cách rõ ràng.

```src
[file]{array}-[class]{}-[func]{remove}
```

Nhìn chung, các thao tác chèn và xóa mảng có những nhược điểm sau:

- **Độ phức tạp về thời gian cao**: Độ phức tạp về thời gian trung bình cho cả việc chèn và xóa trong mảng là $O(n)$, trong đó $n$ là độ dài của mảng.
- **Mất phần tử**: Vì độ dài của mảng là không thay đổi nên sau khi chèn phần tử vào, các phần tử vượt quá độ dài của mảng sẽ bị mất.
- **Lãng phí bộ nhớ**: Chúng ta có thể khởi tạo một mảng tương đối dài và chỉ sử dụng phần phía trước, do đó mọi phần tử đuôi bị ghi đè chỉ là phần giữ chỗ không được sử dụng, nhưng điều này sẽ lãng phí một số dung lượng bộ nhớ.

### Di chuyển mảng

Trong hầu hết các ngôn ngữ lập trình, chúng ta có thể duyệt mảng theo chỉ mục hoặc bằng cách lặp trực tiếp qua từng phần tử trong mảng:

```src
[file]{array}-[class]{}-[func]{traverse}
```

### Tìm phần tử

Việc tìm kiếm một phần tử được chỉ định trong một mảng yêu cầu duyệt qua mảng và kiểm tra xem giá trị phần tử có khớp trong mỗi lần lặp hay không; nếu nó khớp, xuất chỉ mục tương ứng.

Vì mảng là cấu trúc dữ liệu tuyến tính nên thao tác tìm kiếm ở trên được gọi là "tìm kiếm tuyến tính".

```src
[file]{array}-[class]{}-[func]{find}
```

### Mảng mở rộng

Trong môi trường hệ thống phức tạp, các chương trình không thể đảm bảo rằng không gian bộ nhớ sau một mảng có sẵn, khiến việc mở rộng dung lượng của mảng trở nên không an toàn. Do đó, trong hầu hết các ngôn ngữ lập trình, **độ dài của mảng là không thay đổi**.

Nếu muốn mở rộng một mảng, chúng ta cần tạo một mảng mới, lớn hơn rồi sao chép từng phần tử mảng ban đầu sang mảng mới. Đây là thao tác $O(n)$, rất tốn thời gian khi mảng lớn. Mã được hiển thị dưới đây:

```src
[file]{array}-[class]{}-[func]{extend}
```

## Ưu điểm và hạn chế của mảng

Mảng được lưu trữ trong không gian bộ nhớ liền kề với các phần tử cùng loại. Cách tiếp cận này chứa thông tin phong phú trước đó mà hệ thống có thể sử dụng để tối ưu hóa hiệu quả hoạt động của cấu trúc dữ liệu.

- **Hiệu quả không gian cao**: Mảng phân bổ các khối bộ nhớ liền kề cho dữ liệu mà không cần thêm chi phí cấu trúc.
- **Hỗ trợ truy cập ngẫu nhiên**: Mảng cho phép truy cập bất kỳ phần tử nào trong thời gian $O(1)$.
- **Vị trí bộ đệm**: Khi truy cập các phần tử mảng, máy tính không chỉ tải phần tử mà còn lưu vào bộ đệm dữ liệu xung quanh, từ đó tận dụng bộ đệm để cải thiện tốc độ thực thi các thao tác tiếp theo.

Lưu trữ không gian liền kề là con dao hai lưỡi với những hạn chế sau:

- **Hiệu suất chèn và xóa thấp**: Khi một mảng có nhiều phần tử, các thao tác chèn và xóa yêu cầu dịch chuyển một số lượng lớn phần tử.
- **Độ dài bất biến**: Sau khi khởi tạo một mảng, độ dài của mảng sẽ cố định. Việc mở rộng mảng yêu cầu sao chép tất cả dữ liệu sang một mảng mới, việc này rất tốn kém.
- **Lãng phí không gian**: Nếu kích thước được phân bổ của một mảng vượt quá mức thực sự cần thiết thì không gian bổ sung sẽ bị lãng phí.

## Các ứng dụng điển hình của mảng

Mảng là một cấu trúc dữ liệu cơ bản và phổ biến, thường được sử dụng trong các thuật toán khác nhau và để triển khai các cấu trúc dữ liệu phức tạp khác nhau.

- **Truy cập ngẫu nhiên**: Nếu muốn lấy mẫu ngẫu nhiên một số mục, chúng ta có thể sử dụng một mảng để lưu trữ chúng và tạo một chuỗi ngẫu nhiên để triển khai lấy mẫu ngẫu nhiên dựa trên các chỉ số.
- **Sắp xếp và tìm kiếm**: Mảng là cấu trúc dữ liệu được sử dụng phổ biến nhất cho các thuật toán sắp xếp và tìm kiếm. Sắp xếp nhanh, sắp xếp hợp nhất, tìm kiếm nhị phân và các thứ khác chủ yếu được thực hiện trên mảng.
- **Bảng tra cứu**: Khi cần tìm nhanh một phần tử hoặc mối quan hệ tương ứng của nó, chúng ta có thể sử dụng mảng làm bảng tra cứu. Ví dụ: nếu chúng ta muốn triển khai ánh xạ từ các ký tự sang mã ASCII, chúng ta có thể sử dụng giá trị mã ASCII của một ký tự làm chỉ mục, với phần tử tương ứng được lưu trữ ở vị trí đó trong mảng.
- **Học máy**: Mạng thần kinh sử dụng rộng rãi các phép toán đại số tuyến tính giữa vectơ, ma trận và tensor, tất cả đều được xây dựng dưới dạng mảng. Mảng là cấu trúc dữ liệu được sử dụng phổ biến nhất trong lập trình mạng nơ-ron.
- **Triển khai cấu trúc dữ liệu**: Mảng có thể được sử dụng để triển khai ngăn xếp, hàng đợi, bảng băm, vùng heap, biểu đồ và các cấu trúc dữ liệu khác. Ví dụ, biểu diễn ma trận kề của đồ thị về cơ bản là một mảng hai chiều.
