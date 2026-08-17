# Thuật toán băm

Hai phần trước đã giới thiệu nguyên lý hoạt động của bảng băm và các phương pháp xử lý xung đột băm. Tuy nhiên, cả địa chỉ mở và chuỗi riêng biệt **chỉ có thể đảm bảo rằng bảng băm hoạt động bình thường khi xảy ra xung đột băm, chứ không thể giảm tần suất xung đột băm**.

Nếu xung đột băm xảy ra quá thường xuyên, hiệu suất của bảng băm sẽ giảm sút nghiêm trọng. Như được hiển thị trong hình bên dưới, đối với một bảng băm chuỗi riêng biệt, trong trường hợp lý tưởng, các cặp khóa-giá trị được phân bổ đều trên các nhóm, đạt được hiệu quả truy vấn tối ưu; trong trường hợp xấu nhất, tất cả các cặp khóa-giá trị được lưu trữ trong cùng một nhóm, làm giảm độ phức tạp về thời gian xuống $O(n)$.

![Các trường hợp va chạm băm lý tưởng và tồi tệ nhất](hash_algorithm.assets/hash_collision_best_worst_condition.png)

**Việc phân bổ các cặp khóa-giá trị được xác định bởi hàm băm**. Nhớ lại các bước của hàm băm: đầu tiên tính giá trị băm, sau đó lấy nó theo modulo độ dài mảng:

```shell
index = hash(key) % capacity
```

Quan sát công thức trên, khi dung lượng bảng băm `capacity` cố định, **thuật toán băm `hash()` xác định giá trị đầu ra**, từ đó xác định sự phân bố của các cặp khóa-giá trị trong bảng băm.

Điều này có nghĩa là, để giảm xác suất xảy ra xung đột băm, chúng ta nên tập trung vào việc thiết kế thuật toán băm `hash()`.

## Mục tiêu của thuật toán băm

Để xây dựng bảng băm vừa nhanh vừa mạnh, thuật toán băm phải có các thuộc tính sau:

- **Tính tất định**: Đối với cùng một đầu vào, thuật toán băm phải luôn tạo ra cùng một đầu ra. Chỉ khi đó bảng băm mới có thể đáng tin cậy.
- **Hiệu quả cao**: Quá trình tính toán giá trị băm phải đủ nhanh. Chi phí tính toán càng nhỏ thì bảng băm càng thực tế.
- **Phân phối đồng đều**: Thuật toán băm phải đảm bảo rằng các cặp khóa-giá trị được phân bổ đều trong bảng băm. Sự phân bố càng đồng đều thì xác suất va chạm băm càng thấp.

Trên thực tế, thuật toán băm không chỉ được sử dụng để triển khai bảng băm mà còn được ứng dụng rộng rãi trong các lĩnh vực khác.

- **Lưu trữ mật khẩu**: Để bảo vệ tính bảo mật của mật khẩu người dùng, hệ thống thường không lưu trữ mật khẩu dạng văn bản gốc mà lưu trữ giá trị băm của mật khẩu. Khi người dùng nhập mật khẩu, hệ thống sẽ tính toán giá trị băm của đầu vào và so sánh nó với giá trị băm được lưu trữ. Nếu chúng khớp nhau thì mật khẩu được coi là đúng.
- **Kiểm tra tính toàn vẹn dữ liệu**: Người gửi dữ liệu có thể tính toán giá trị băm của dữ liệu và gửi dữ liệu đó; người nhận có thể tính toán lại giá trị băm của dữ liệu nhận được và so sánh nó với giá trị băm nhận được. Nếu chúng khớp nhau, dữ liệu được coi là nguyên vẹn.

Đối với các ứng dụng mã hóa, thuật toán băm cần các thuộc tính bảo mật mạnh hơn để ngăn chặn kỹ thuật đảo ngược, chẳng hạn như suy ra mật khẩu gốc từ giá trị băm.

- **Tính đơn hướng**: Không thể suy ra bất kỳ thông tin nào về dữ liệu đầu vào từ giá trị băm.
- **Khả năng chống va chạm**: Rất khó để tìm thấy hai đầu vào khác nhau tạo ra cùng một giá trị băm.
- **Hiệu ứng tuyết lở**: Những thay đổi nhỏ ở đầu vào sẽ dẫn đến những thay đổi đáng kể và không thể đoán trước ở đầu ra.

Lưu ý rằng **"phân bố đồng đều" và "khả năng chống va chạm" là hai khái niệm độc lập**. Đáp ứng sự phân bố đồng đều không nhất thiết có nghĩa là có khả năng chống va chạm. Ví dụ: với đầu vào ngẫu nhiên `key`, hàm băm `key % 100` có thể tạo ra đầu ra được phân phối đồng đều. Tuy nhiên, thuật toán băm này quá đơn giản và tất cả `key` có hai chữ số cuối giống nhau sẽ có cùng một đầu ra, giúp dễ dàng suy ra `key` có thể sử dụng được từ giá trị băm, từ đó bẻ khóa mật khẩu.

## Thiết kế thuật toán băm

Việc thiết kế thuật toán băm là một vấn đề phức tạp đòi hỏi phải xem xét đến nhiều yếu tố. Tuy nhiên, đối với một số trường hợp ít đòi hỏi hơn, chúng ta cũng có thể thiết kế một số thuật toán băm đơn giản.

- **Băm cộng tính**: Cộng mã ASCII của từng ký tự trong dữ liệu đầu vào và sử dụng tổng số tiền làm giá trị băm.
- **Băm nhân**: Tận dụng mối tương quan thấp được tạo ra bởi phép nhân: nhân với một hằng số ở mỗi bước và tích lũy mã ASCII của các ký tự vào giá trị băm.
- **Băm XOR**: Tích lũy giá trị băm bằng cách XOR từng phần tử của dữ liệu đầu vào.
- **Băm xoay**: Tích lũy mã ASCII của từng ký tự thành một giá trị băm, thực hiện thao tác xoay trên giá trị băm trước mỗi lần tích lũy.

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

Chúng ta có thể quan sát rằng bước cuối cùng của mỗi thuật toán băm là lấy kết quả theo modulo số nguyên tố lớn $1000000007$, đảm bảo rằng giá trị băm nằm trong phạm vi phù hợp. Điều này đương nhiên đặt ra một câu hỏi: tại sao lại nhấn mạnh việc sử dụng mô đun nguyên tố và nhược điểm của việc sử dụng mô đun tổng hợp là gì?

Tóm lại: **sử dụng số nguyên tố lớn làm mô đun giúp tối đa hóa tính đồng nhất của các giá trị băm**. Bởi vì một số nguyên tố không có thừa số chung với các số khác, nên nó có thể giảm các mẫu tuần hoàn do phép toán modulo đưa ra và do đó giảm thiểu xung đột băm.

Ví dụ: giả sử chúng ta chọn số tổng hợp $9$ làm mô đun, có thể chia cho $3$, thì tất cả `key` chia hết cho $3$ sẽ được ánh xạ tới các giá trị băm $0$, $3$, $6$.

$$
\bắt đầu{căn chỉnh}
\text{mô-đun} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{căn chỉnh}
$$

Nếu các giá trị `key` đầu vào tuân theo kiểu cấp số cộng này thì các giá trị băm sẽ phân cụm, làm trầm trọng thêm các xung đột băm. Bây giờ giả sử chúng ta thay thế `modulus` bằng số nguyên tố $13$. Vì `key` và `modulus` không có thừa số chung nên giá trị băm đầu ra được phân bổ đồng đều hơn nhiều.

$$
\bắt đầu{căn chỉnh}
\text{mô-đun} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{căn chỉnh}
$$

Điều đáng chú ý là nếu `key` được đảm bảo phân phối ngẫu nhiên và đồng đều thì việc chọn số nguyên tố hoặc số tổng hợp làm mô đun đều có thể tạo ra các giá trị băm được phân bố đồng đều. Tuy nhiên, khi phân phối của `key` có tính tuần hoàn nhất định, modulo một số tổng hợp có nhiều khả năng dẫn đến phân cụm hơn.

Tóm lại, chúng ta thường chọn một số nguyên tố làm mô đun và số nguyên tố này phải đủ lớn để loại bỏ các mẫu tuần hoàn càng nhiều càng tốt, nâng cao tính mạnh mẽ của thuật toán băm.

## Thuật toán băm phổ biến

Dễ dàng nhận thấy các thuật toán băm đơn giản được giới thiệu ở trên khá “mong manh” và thua xa mục tiêu thiết kế của thuật toán băm. Ví dụ: vì phép cộng và XOR có tính giao hoán nên hàm băm cộng và hàm băm XOR không thể phân biệt các chuỗi có cùng ký tự theo thứ tự khác, điều này có thể làm trầm trọng thêm các xung đột hàm băm và gây ra rủi ro bảo mật.

Trong thực tế, chúng ta thường sử dụng một số thuật toán băm tiêu chuẩn, chẳng hạn như MD5, SHA-1, SHA-2 và SHA-3. Họ có thể ánh xạ dữ liệu đầu vào có độ dài bất kỳ thành giá trị băm có độ dài cố định.

Trong thế kỷ qua, thuật toán băm đã liên tục được nâng cấp và tối ưu hóa. Một số nhà nghiên cứu cố gắng cải thiện hiệu suất của thuật toán băm, trong khi những người khác, bao gồm cả tin tặc, lại chuyên tâm tìm kiếm các vấn đề bảo mật trong thuật toán băm. Bảng dưới đây trình bày các thuật toán băm thường được sử dụng trong các ứng dụng thực tế.

- MD5 và SHA-1 đã bị tấn công thành công nhiều lần và do đó bị loại bỏ trong nhiều ứng dụng bảo mật khác nhau.
- Dòng SHA-2, đặc biệt là SHA-256, là một trong những thuật toán băm an toàn nhất cho đến nay, chưa có cuộc tấn công thành công nào được báo cáo, do đó thường được sử dụng trong các ứng dụng và giao thức bảo mật khác nhau.
- SHA-3 có chi phí triển khai thấp hơn và hiệu quả tính toán cao hơn so với SHA-2, nhưng phạm vi sử dụng hiện tại của nó không rộng như dòng SHA-2.

<p align="center"> Bảng <id> &nbsp; Các thuật toán băm phổ biến </p>

|                 | MD5 | SHA-1 | SHA-2 | SHA-3 |
| --------------- | ----------------------------------------------- | ----------------------------------- | ------------------------------------------------------------------ | ---------------------------- |
| Năm phát hành | 1992 | 1995 | 2002 | 2008 |
| Độ dài đầu ra | 128 bit | 160bit | 256/512 bit | 224/256/384/512 bit |
| Va chạm băm | Thường xuyên | Thường xuyên | Hiếm | Hiếm |
| Cấp độ bảo mật | Thấp, đã bị tấn công thành công | Thấp, đã bị tấn công thành công | Cao | Cao |
| Ứng dụng | Bị bỏ rơi, vẫn được sử dụng để kiểm tra tính toàn vẹn dữ liệu | Bị bỏ rơi | Xác minh giao dịch tiền điện tử, chữ ký số, v.v. | Có thể dùng để thay thế SHA-2 |

## Giá trị băm trong cấu trúc dữ liệu

Chúng tôi biết rằng các khóa của bảng băm có thể là số nguyên, số dấu phẩy động, chuỗi và các loại dữ liệu khác. Các ngôn ngữ lập trình thường cung cấp thuật toán băm tích hợp cho các loại này để tính toán các chỉ số nhóm trong bảng băm. Lấy Python làm ví dụ, chúng ta có thể gọi hàm `hash()` để tính giá trị băm cho nhiều loại dữ liệu khác nhau.

- Giá trị băm của số nguyên và boolean là giá trị riêng của chúng.
- Việc tính toán các giá trị băm cho các số và chuỗi dấu phẩy động phức tạp hơn và những độc giả quan tâm được khuyến khích tự mình nghiên cứu vấn đề này.
- Giá trị băm của một bộ dữ liệu có được bằng cách băm từng phần tử của nó và kết hợp các kết quả đó thành một giá trị băm duy nhất.
- Giá trị băm của một đối tượng thường được tạo từ địa chỉ bộ nhớ của nó. Bằng cách ghi đè phương thức băm của đối tượng, thay vào đó, nó có thể được tạo từ nội dung của đối tượng.

!!! mẹo

    Xin lưu ý rằng định nghĩa và phương pháp của các hàm tính toán giá trị băm tích hợp trong các ngôn ngữ lập trình khác nhau sẽ khác nhau.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # Hash value of integer 3 is 3

    bol = True
    hash_bol = hash(bol)
    # Hash value of boolean True is 1

    dec = 3.14159
    hash_dec = hash(dec)
    # Hash value of decimal 3.14159 is 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    # Hash value of string "Hello 算法" is 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    # Hash value of tuple (12836, '小哈') is 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # Hash value of ListNode object at 0x1058fd810 is 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    // Hash value of integer 3 is 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    // Hash value of boolean 1 is 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    // Hash value of decimal 3.14159 is 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    // Hash value of string "Hello 算法" is 15466937326284535026

    // In C++, built-in std::hash() only provides hash values for basic data types
    // Hash values for arrays and objects need to be implemented separately
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    // Hash value of integer 3 is 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    // Hash value of boolean true is 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    // Hash value of decimal 3.14159 is -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    // Hash value of string "Hello 算法" is -727081396

    Object[] arr = { 12836, "小哈" };
    int hashTup = Arrays.hashCode(arr);
    // Hash value of array [12836, 小哈] is 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    // Hash value of ListNode object utils.ListNode@7dc5e7b4 is 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    // Hash value of integer 3 is 3;

    bool bol = true;
    int hashBol = bol.GetHashCode();
    // Hash value of boolean true is 1;

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    // Hash value of decimal 3.14159 is -1340954729;

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    // Hash value of string "Hello 算法" is -586107568;

    object[] arr = [12836, "小哈"];
    int hashTup = arr.GetHashCode();
    // Hash value of array [12836, 小哈] is 42931033;

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    // Hash value of ListNode object 0 is 39053774;
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go does not provide built-in hash code functions
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    // Hash value of integer 3 is 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    // Hash value of boolean true is -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    // Hash value of decimal 3.14159 is -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    // Hash value of string "Hello 算法" is -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashTup = arr.hashValue
    // Hash value of array [AnyHashable(12836), AnyHashable("小哈")] is -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    // Hash value of ListNode object utils.ListNode is -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript does not provide built-in hash code functions
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript does not provide built-in hash code functions
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    // Hash value of integer 3 is 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    // Hash value of boolean true is 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    // Hash value of decimal 3.14159 is 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    // Hash value of string "Hello 算法" is 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    // Hash value of array [12836, 小哈] is 976512528

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode;
    // Hash value of ListNode object Instance of 'ListNode' is 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    // Hash value of integer 3 is 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    // Hash value of boolean true is 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    // Hash value of decimal 3.14159 is 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    // Hash value of string "Hello 算法" is 16092673739211250988

    let arr = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    // Hash value of tuple (12836, "小哈") is 1885128010422702749

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    // Hash value of ListNode object RefCell { value: ListNode { val: 42, next: None } } is 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C does not provide built-in hash code functions
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    // Hash value of integer 3 is 3

    val bol = true
    val hashBol = bol.hashCode()
    // Hash value of boolean true is 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    // Hash value of decimal 3.14159 is -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    // Hash value of string "Hello 算法" is -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.hashCode()
    // Hash value of array [12836, 小哈] is 189568618

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    // Hash value of ListNode object utils.ListNode@1d81eb93 is 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    # Hash value of integer 3 is -4385856518450339636

    bol = true
    hash_bol = bol.hash
    # Hash value of boolean true is -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    # Hash value of decimal 3.14159 is -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    # Hash value of string "Hello 算法" is -4075943250025831763

    tup = [12836, '小哈']
    hash_tup = tup.hash
    # Hash value of tuple (12836, '小哈') is 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    # Hash value of ListNode object #<ListNode:0x000078133140ab70> is 4302940560806366381
    ```

??? pythontutor "Thực thi trực quan"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7% B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%2 0val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%2 0%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%2 0%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20%E6%95%B4%E6 %95%B0%203%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3 D%20hash%28bol%29%0A%20%20%20%20%23%20%E5%B8%83%E5%B0%94%E9%87%8F%20True%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201 %0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203 .14159%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%2032648 4311674566659%0A%0A%20%20%20%20str%20%3D%20%22Xin chào%20%E7%AE%9 7%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9CXin chào%20% E7%AE%97%E6%B3%95%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC %E4%B8%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20% 2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup% 20%3D%20hash%28tup%29%0A%20%20%20%20%23%20%E5%85%83%E7%BB%84%20 %2812836,%20'%E5%B0%8F%E5%93%88'%29%20%E7%9A%84%E5%93%88%E5%B8 %8C%E5%80%BC%E4%B8%BA%201029005403108185979%0A%0A%20%20%20%20o bj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1 %A1%20%3CListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20274267521&tích lũy=fals e&curInstr=19&heapPrimitives=neverest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

Trong nhiều ngôn ngữ lập trình, **chỉ các đối tượng bất biến mới có thể đóng vai trò là `key` trong bảng băm**. Nếu chúng tôi sử dụng danh sách (mảng động) làm `key`, khi nội dung của danh sách thay đổi, giá trị băm của nó cũng thay đổi và chúng tôi sẽ không thể tìm thấy `value` ban đầu trong bảng băm nữa.

Mặc dù các biến thành viên của một đối tượng tùy chỉnh (chẳng hạn như nút danh sách liên kết) có thể thay đổi được nhưng nó có thể băm được. **Điều này là do giá trị băm của một đối tượng thường được tạo dựa trên địa chỉ bộ nhớ của nó** và ngay cả khi nội dung của đối tượng thay đổi thì địa chỉ bộ nhớ vẫn giữ nguyên nên giá trị băm không thay đổi.

Bạn có thể nhận thấy rằng kết quả đầu ra của giá trị băm trong các bảng điều khiển khác nhau là khác nhau. **Điều này là do trình thông dịch Python thêm một muối ngẫu nhiên vào hàm băm chuỗi mỗi khi nó khởi động**. Cách tiếp cận này ngăn chặn hiệu quả các cuộc tấn công HashDoS và tăng cường tính bảo mật của thuật toán băm.
