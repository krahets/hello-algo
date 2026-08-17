# Danh sách

<u>danh sách</u> là một khái niệm cấu trúc dữ liệu trừu tượng thể hiện một tập hợp các phần tử có thứ tự, hỗ trợ các hoạt động như truy cập phần tử, sửa đổi, chèn, xóa và truyền tải mà không yêu cầu người dùng xem xét các giới hạn dung lượng. Danh sách có thể được triển khai dựa trên danh sách hoặc mảng được liên kết.

- Danh sách liên kết có thể được xem một cách tự nhiên dưới dạng danh sách: nó hỗ trợ chèn, xóa, tìm kiếm và cập nhật và có thể phát triển linh hoạt khi cần.
- Mảng cũng hỗ trợ chèn, xóa, tìm kiếm và cập nhật nhưng vì độ dài của nó là cố định nên chỉ có thể coi là một danh sách có giới hạn dung lượng.

Khi một danh sách được triển khai bằng một mảng, **độ dài cố định của nó sẽ khiến nó ít thực tế hơn**. Điều này là do chúng ta thường không thể xác định trước lượng dữ liệu cần lưu trữ, gây khó khăn cho việc lựa chọn dung lượng phù hợp. Nếu công suất quá nhỏ có thể không đáp ứng được nhu cầu của chúng ta; nếu nó quá lớn, dung lượng bộ nhớ sẽ bị lãng phí.

Để giải quyết vấn đề này, chúng ta có thể sử dụng <u>mảng động</u> để triển khai danh sách. Nó kế thừa tất cả các ưu điểm của mảng đồng thời hỗ trợ thay đổi kích thước động trong quá trình thực hiện chương trình.

Trên thực tế, **các loại danh sách do thư viện chuẩn của nhiều ngôn ngữ lập trình cung cấp được triển khai bằng mảng động**, chẳng hạn như `list` trong Python, `ArrayList` trong Java, `vector` trong C++ và `List` trong C#. Trong phần thảo luận sau đây, chúng ta sẽ coi "danh sách" và "mảng động" là các khái niệm tương đương.

## Các thao tác danh sách chung

### Khởi tạo một danh sách

Chúng tôi thường khởi tạo danh sách theo một trong hai cách: trống hoặc với các giá trị được xác định trước:

=== "Python"

    ```python title="list.py"
    # Initialize a list
    # Without initial values
    nums1: list[int] = []
    # With initial values
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Initialize a list */
    // Note that vector in C++ is equivalent to nums as described in this article
    // Without initial values
    vector<int> nums1;
    // With initial values
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* Initialize a list */
    // Without initial values
    List<Integer> nums1 = new ArrayList<>();
    // With initial values (note that array elements should use the wrapper class Integer[] instead of int[])
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Initialize a list */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Initialize a list */
    // Without initial values
    nums1 := []int{}
    // With initial values
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Initialize a list */
    // Without initial values
    let nums1: [Int] = []
    // With initial values
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Initialize a list */
    // Without initial values
    const nums1 = [];
    // With initial values
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Initialize a list */
    // Without initial values
    const nums1: number[] = [];
    // With initial values
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Initialize a list */
    // Without initial values
    List<int> nums1 = [];
    // With initial values
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Initialize a list */
    // Without initial values
    let nums1: Vec<i32> = Vec::new();
    // With initial values
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Initialize a list */
    // Without initial values
    var nums1 = listOf<Int>()
    // With initial values
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Initialize a list
    # Without initial values
    nums1 = []
    # With initial values
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%2 0%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%2 0%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20 %3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80 %BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&tích lũy ive=false&curInstr=4&heapPrimitives=neverrest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Các phần tử truy cập

Vì danh sách về cơ bản là một mảng nên chúng ta có thể truy cập và cập nhật các phần tử với độ phức tạp về thời gian $O(1)$, điều này rất hiệu quả.

=== "Python"

    ```python title="list.py"
    # Access an element
    num: int = nums[1]  # Access element at index 1

    # Update an element
    nums[1] = 0    # Update element at index 1 to 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Access an element */
    int num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Java"

    ```java title="list.java"
    /* Access an element */
    int num = nums.get(1);  // Access element at index 1

    /* Update an element */
    nums.set(1, 0);  // Update element at index 1 to 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Access an element */
    int num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Access an element */
    num := nums[1]  // Access element at index 1

    /* Update an element */
    nums[1] = 0     // Update element at index 1 to 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Access an element */
    let num = nums[1] // Access element at index 1

    /* Update an element */
    nums[1] = 0 // Update element at index 1 to 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* Access an element */
    const num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Access an element */
    const num: number = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Access an element */
    int num = nums[1];  // Access element at index 1

    /* Update an element */
    nums[1] = 0;  // Update element at index 1 to 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Access an element */
    let num: i32 = nums[1];  // Access element at index 1
    /* Update an element */
    nums[1] = 0;             // Update element at index 1 to 0
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Access an element */
    val num = nums[1]       // Access element at index 1
    /* Update an element */
    nums[1] = 0             // Update element at index 1 to 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Access an element
    num = nums[1] # Access element at index 1
    # Update an element
    nums[1] = 0 # Update element at index 1 to 0
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D %20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20 %20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7% B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20 %E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0% 0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E 7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&cumulative=false&curInstr=3&heapPrimitive s=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Chèn và xóa các phần tử

So với mảng, danh sách có thể tự do thêm và xóa các phần tử. Việc thêm một phần tử vào cuối danh sách có độ phức tạp về thời gian là $O(1)$, nhưng việc chèn và xóa các phần tử vẫn có hiệu quả tương tự như mảng, với độ phức tạp về thời gian là $O(n)$.

=== "Python"

    ```python title="list.py"
    # Clear the list
    nums.clear()

    # Add elements at the end
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insert an element in the middle
    nums.insert(3, 6)  # Insert number 6 at index 3

    # Delete an element
    nums.pop(3)        # Delete element at index 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Insert an element in the middle */
    nums.insert(nums.begin() + 3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.erase(nums.begin() + 3);      // Delete element at index 3
    ```

=== "Java"

    ```java title="list.java"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(3);  // Delete element at index 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Clear the list */
    nums.Clear();

    /* Add elements at the end */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Insert an element in the middle */
    nums.Insert(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.RemoveAt(3);  // Delete element at index 3
    ```

=== "Go"

    ```go title="list_test.go"
    /* Clear the list */
    nums = nil

    /* Add elements at the end */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Insert an element in the middle */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert number 6 at index 3

    /* Delete an element */
    nums = append(nums[:3], nums[4:]...) // Delete element at index 3
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Clear the list */
    nums.removeAll()

    /* Add elements at the end */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Insert an element in the middle */
    nums.insert(6, at: 3) // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(at: 3) // Delete element at index 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Clear the list */
    nums.length = 0;

    /* Add elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert number 6 at index 3

    /* Delete an element */
    nums.splice(3, 1);  // Delete element at index 3
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Clear the list */
    nums.length = 0;

    /* Add elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.splice(3, 0, 6); // Insert number 6 at index 3

    /* Delete an element */
    nums.splice(3, 1);  // Delete element at index 3
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.insert(3, 6); // Insert number 6 at index 3

    /* Delete an element */
    nums.removeAt(3); // Delete element at index 3
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Insert an element in the middle */
    nums.insert(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(3);    // Delete element at index 3
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Clear the list */
    nums.clear();

    /* Add elements at the end */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Insert an element in the middle */
    nums.add(3, 6);  // Insert number 6 at index 3

    /* Delete an element */
    nums.remove(3);  // Delete element at index 3
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Clear the list
    nums.clear

    # Add elements at the end
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # Insert an element in the middle
    nums.insert(3, 6) # Insert number 6 at index 3

    # Delete an element
    nums.delete_at(3) # Delete element at index 3
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89 %E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%20 5,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E 8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%2 0%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20% 20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20num s.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append %284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6 %8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20 %20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6% 95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E 5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23 %20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83% E7%B4%A0&cumulative=false&curInstr=3&heapPrimitives=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Duyệt qua danh sách

Giống như mảng, danh sách có thể được duyệt theo chỉ mục hoặc bằng cách duyệt trực tiếp qua các phần tử.

=== "Python"

    ```python title="list.py"
    # Traverse the list by index
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Traverse list elements directly
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* Traverse list elements directly */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Traverse the list by index */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Traverse the list by index */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* Traverse list elements directly */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Traverse the list by index */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* Traverse list elements directly */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Traverse the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Traverse the list by index */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Traverse the list by index */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Traverse list elements directly */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // Traverse the list by index
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Traverse list elements directly
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Traverse the list by index */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Traverse list elements directly */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Traverse the list by index
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # Traverse list elements directly
    count = 0
    for num in nums
        count += num
    end
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20% 22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums %20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E 5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%2 0phạm vi%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20 %23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20nu m%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimi tives=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Danh sách nối

Đưa ra một danh sách mới `nums1`, chúng ta có thể nối nó vào cuối danh sách ban đầu.

=== "Python"

    ```python title="list.py"
    # Concatenate two lists
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # Concatenate list nums1 to the end of nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Concatenate two lists */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // Concatenate list nums1 to the end of nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Concatenate two lists */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Concatenate two lists */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // Concatenate list nums1 to the end of nums
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Concatenate two lists */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // Concatenate list nums1 to the end of nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Concatenate two lists */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Concatenate two lists */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Concatenate two lists */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // Concatenate list nums1 to the end of nums
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Concatenate two lists */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Concatenate two lists */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // Concatenate list nums1 to the end of nums
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__n ame__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96% E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%2 0%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%2 0%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20 số1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0% 20nums%20%E4%B9%8B%E5%90%8E&cumulative=false&curInstr=3&heapPrimitives=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Sắp xếp một danh sách

Sau khi sắp xếp danh sách, chúng ta có thể sử dụng thuật toán "tìm kiếm nhị phân" và "hai con trỏ", những thuật toán này thường được kiểm tra trong các bài toán thuật toán mảng.

=== "Python"

    ```python title="list.py"
    # Sort a list
    nums.sort()  # After sorting, list elements are arranged from smallest to largest
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Sort a list */
    sort(nums.begin(), nums.end());  // After sorting, list elements are arranged from smallest to largest
    ```

=== "Java"

    ```java title="list.java"
    /* Sort a list */
    Collections.sort(nums);  // After sorting, list elements are arranged from smallest to largest
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Sort a list */
    nums.Sort(); // After sorting, list elements are arranged from smallest to largest
    ```

=== "Go"

    ```go title="list_test.go"
    /* Sort a list */
    sort.Ints(nums)  // After sorting, list elements are arranged from smallest to largest
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Sort a list */
    nums.sort() // After sorting, list elements are arranged from smallest to largest
    ```

=== "JS"

    ```javascript title="list.js"
    /* Sort a list */
    nums.sort((a, b) => a - b);  // After sorting, list elements are arranged from smallest to largest
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Sort a list */
    nums.sort((a, b) => a - b);  // After sorting, list elements are arranged from smallest to largest
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Sort a list */
    nums.sort(); // After sorting, list elements are arranged from smallest to largest
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Sort a list */
    nums.sort(); // After sorting, list elements are arranged from smallest to largest
    ```

=== "C"

    ```c title="list.c"
    // C does not provide built-in dynamic arrays
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Sort a list */
    nums.sort() // After sorting, list elements are arranged from smallest to largest
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Sort a list
    nums = nums.sort { |a, b| a <=> b } # After sorting, list elements are arranged from smallest to largest
    ```

??? pythontutor "Trực quan hóa mã"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7% 8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205, %204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A 8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC% 8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6 %8E%92%E5%88%97&cumulative=false&curInstr=3&heapPrimitives=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Thực hiện danh sách

Nhiều ngôn ngữ lập trình có sẵn danh sách, chẳng hạn như Java, C++ và Python. Việc triển khai chúng khá phức tạp và các tham số được xem xét cẩn thận, chẳng hạn như công suất ban đầu, bội số mở rộng, v.v. Bạn đọc quan tâm có thể tham khảo mã nguồn để tìm hiểu thêm.

Để hiểu sâu hơn về cách hoạt động của danh sách, chúng tôi cố gắng triển khai một danh sách đơn giản với ba cân nhắc thiết kế chính:

- **Dung lượng ban đầu**: Chọn dung lượng ban đầu hợp lý cho mảng cơ bản. Trong ví dụ này, chúng tôi chọn 10 làm công suất ban đầu.
- **Theo dõi kích thước**: Khai báo một biến `size` để ghi lại số phần tử hiện tại trong danh sách và cập nhật nó theo thời gian thực khi các phần tử được chèn và xóa. Dựa trên biến này, chúng tôi có thể xác định vị trí cuối danh sách và xác định xem có cần mở rộng hay không.
- **Cơ chế mở rộng**: Khi chèn một phần tử vào đã đầy dung lượng danh sách, chúng ta cần mở rộng. Chúng tôi tạo một mảng lớn hơn dựa trên bội số mở rộng và sau đó di chuyển tất cả các phần tử từ mảng hiện tại sang mảng mới theo thứ tự. Trong ví dụ này, chúng tôi chỉ định rằng mảng sẽ được mở rộng gấp 2 lần kích thước trước đó của nó mỗi lần.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
