---
comments: true
---

# 4.3 &nbsp; リスト

<u>リスト（list）</u>は抽象的なデータ構造の概念であり、要素の順序付き集合を表す。要素のアクセス、更新、追加、削除、走査などの操作をサポートし、利用者は容量制限の問題を考慮する必要がない。リストは連結リストまたは配列に基づいて実装できる。

- 連結リストは本質的にリストと見なすことができ、要素の追加・削除・参照・更新をサポートし、柔軟に動的拡張できる。
- 配列も要素の追加・削除・参照・更新をサポートするが、長さが不変であるため、長さ制限のあるリストとしか見なせない。

配列でリストを実装する場合、**長さが不変である性質によってリストの実用性が低下する**。これは、通常は事前にどれだけのデータを格納する必要があるかを決められず、適切なリスト長を選びにくいためである。長さが小さすぎると利用要件を満たせない可能性が高く、大きすぎるとメモリ空間の浪費を招く。

この問題を解決するために、<u>動的配列（dynamic array）</u>を用いてリストを実装できる。これは配列の各種利点を引き継ぎつつ、プログラム実行中に動的な拡張を行える。

実際には、**多くのプログラミング言語の標準ライブラリが提供するリストは動的配列に基づいて実装されている**。たとえば、Python の `list` 、Java の `ArrayList` 、C++ の `vector` 、C# の `List` などである。以降の議論では、「リスト」と「動的配列」を同じ概念として扱う。

## 4.3.1 &nbsp; リストの基本操作

### 1. &nbsp; リストの初期化

通常は「初期値なし」と「初期値あり」の 2 つの初期化方法を用いる。

=== "Python"

    ```python title="list.py"
    # リストを初期化
    # 初期値なし
    nums1: list[int] = []
    # 初期値あり
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* リストを初期化 */
    // なお、C++ では vector が本稿でいう nums に相当する
    // 初期値なし
    vector<int> nums1;
    // 初期値あり
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* リストを初期化 */
    // 初期値なし
    List<Integer> nums1 = new ArrayList<>();
    // 初期値あり（配列の要素型は int[] のラッパークラスである Integer[] である必要があることに注意）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* リストを初期化 */
    // 初期値なし
    List<int> nums1 = [];
    // 初期値あり
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* リストを初期化 */
    // 初期値なし
    nums1 := []int{}
    // 初期値あり
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* リストを初期化 */
    // 初期値なし
    let nums1: [Int] = []
    // 初期値あり
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* リストを初期化 */
    // 初期値なし
    const nums1 = [];
    // 初期値あり
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* リストを初期化 */
    // 初期値なし
    const nums1: number[] = [];
    // 初期値あり
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* リストを初期化 */
    // 初期値なし
    List<int> nums1 = [];
    // 初期値あり
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* リストを初期化 */
    // 初期値なし
    let nums1: Vec<i32> = Vec::new();
    // 初期値あり
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* リストを初期化 */
    // 初期値なし
    var nums1 = listOf<Int>()
    // 初期値あり
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # リストを初期化
    # 初期値なし
    nums1 = []
    # 初期値あり
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20%23%20%E6%97%A0%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 2. &nbsp; 要素へのアクセス

リストの本質は配列であるため、要素へのアクセスと更新は $O(1)$ 時間で行え、効率が高い。

=== "Python"

    ```python title="list.py"
    # 要素にアクセス
    num: int = nums[1]  # インデックス 1 の要素にアクセス

    # 要素を更新
    nums[1] = 0    # インデックス 1 の要素を 0 に更新
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 要素にアクセス */
    int num = nums[1];  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス 1 の要素を 0 に更新
    ```

=== "Java"

    ```java title="list.java"
    /* 要素にアクセス */
    int num = nums.get(1);  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums.set(1, 0);  // インデックス 1 の要素を 0 に更新
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 要素にアクセス */
    int num = nums[1];  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス 1 の要素を 0 に更新
    ```

=== "Go"

    ```go title="list_test.go"
    /* 要素にアクセス */
    num := nums[1]  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0     // インデックス 1 の要素を 0 に更新
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 要素にアクセス */
    let num = nums[1] // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0 // インデックス 1 の要素を 0 に更新
    ```

=== "JS"

    ```javascript title="list.js"
    /* 要素にアクセス */
    const num = nums[1];  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス 1 の要素を 0 に更新
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 要素にアクセス */
    const num: number = nums[1];  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス 1 の要素を 0 に更新
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 要素にアクセス */
    int num = nums[1];  // インデックス 1 の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス 1 の要素を 0 に更新
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 要素にアクセス */
    let num: i32 = nums[1];  // インデックス 1 の要素にアクセス
    /* 要素を更新 */
    nums[1] = 0;             // インデックス 1 の要素を 0 に更新
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 要素にアクセス */
    val num = nums[1]       // インデックス 1 の要素にアクセス
    /* 要素を更新 */
    nums[1] = 0             // インデックス 1 の要素を 0 に更新
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 要素にアクセス
    num = nums[1] # インデックス 1 の要素にアクセス
    # 要素を更新
    nums[1] = 0 # インデックス 1 の要素を 0 に更新
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%BF%E9%97%AE%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%86%E7%B4%A2%E5%BC%95%201%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E4%B8%BA%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 3. &nbsp; 要素の挿入と削除

配列と比べて、リストでは要素を自由に追加・削除できる。リスト末尾への要素追加の時間計算量は $O(1)$ だが、要素の挿入と削除の効率は依然として配列と同じで、時間計算量は $O(n)$ である。

=== "Python"

    ```python title="list.py"
    # リストをクリア
    nums.clear()

    # 末尾に要素を追加
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # 途中に要素を挿入
    nums.insert(3, 6)  # インデックス 3 に数値 6 を挿入

    # 要素を削除
    nums.pop(3)        # インデックス 3 の要素を削除
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* リストをクリア */
    nums.clear();

    /* 末尾に要素を追加 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* 途中に要素を挿入 */
    nums.insert(nums.begin() + 3, 6);  // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.erase(nums.begin() + 3);      // インデックス 3 の要素を削除
    ```

=== "Java"

    ```java title="list.java"
    /* リストをクリア */
    nums.clear();

    /* 末尾に要素を追加 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 途中に要素を挿入 */
    nums.add(3, 6);  // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.remove(3);  // インデックス 3 の要素を削除
    ```

=== "C#"

    ```csharp title="list.cs"
    /* リストをクリア */
    nums.Clear();

    /* 末尾に要素を追加 */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* 途中に要素を挿入 */
    nums.Insert(3, 6);  // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.RemoveAt(3);  // インデックス 3 の要素を削除
    ```

=== "Go"

    ```go title="list_test.go"
    /* リストをクリア */
    nums = nil

    /* 末尾に要素を追加 */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* 途中に要素を挿入 */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums = append(nums[:3], nums[4:]...) // インデックス 3 の要素を削除
    ```

=== "Swift"

    ```swift title="list.swift"
    /* リストをクリア */
    nums.removeAll()

    /* 末尾に要素を追加 */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* 途中に要素を挿入 */
    nums.insert(6, at: 3) // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.remove(at: 3) // インデックス 3 の要素を削除
    ```

=== "JS"

    ```javascript title="list.js"
    /* リストをクリア */
    nums.length = 0;

    /* 末尾に要素を追加 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 途中に要素を挿入 */
    nums.splice(3, 0, 6); // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.splice(3, 1);  // インデックス 3 の要素を削除
    ```

=== "TS"

    ```typescript title="list.ts"
    /* リストをクリア */
    nums.length = 0;

    /* 末尾に要素を追加 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 途中に要素を挿入 */
    nums.splice(3, 0, 6); // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.splice(3, 1);  // インデックス 3 の要素を削除
    ```

=== "Dart"

    ```dart title="list.dart"
    /* リストをクリア */
    nums.clear();

    /* 末尾に要素を追加 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 途中に要素を挿入 */
    nums.insert(3, 6); // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.removeAt(3); // インデックス 3 の要素を削除
    ```

=== "Rust"

    ```rust title="list.rs"
    /* リストをクリア */
    nums.clear();

    /* 末尾に要素を追加 */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* 途中に要素を挿入 */
    nums.insert(3, 6);  // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.remove(3);    // インデックス 3 の要素を削除
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* リストをクリア */
    nums.clear();

    /* 末尾に要素を追加 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 途中に要素を挿入 */
    nums.add(3, 6);  // インデックス 3 に数値 6 を挿入

    /* 要素を削除 */
    nums.remove(3);  // インデックス 3 の要素を削除
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # リストをクリア
    nums.clear

    # 末尾に要素を追加
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # 途中に要素を挿入
    nums.insert(3, 6) # インデックス 3 に数値 6 を挿入

    # 要素を削除
    nums.delete_at(3) # インデックス 3 の要素を削除
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E9%83%A8%E6%B7%BB%E5%8A%A0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%97%B4%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E6%8F%92%E5%85%A5%E6%95%B0%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E5%A4%84%E7%9A%84%E5%85%83%E7%B4%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 4. &nbsp; リストの走査

配列と同様に、リストもインデックスに基づいて走査することも、各要素を直接走査することもできる。

=== "Python"

    ```python title="list.py"
    # インデックスでリストを走査
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # リストの要素を直接走査
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* インデックスでリストを走査 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* リストの要素を直接走査 */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* インデックスでリストを走査 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* リストの要素を直接走査 */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* インデックスでリストを走査 */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* リストの要素を直接走査 */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* インデックスでリストを走査 */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* リストの要素を直接走査 */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* インデックスでリストを走査 */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* リストの要素を直接走査 */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* インデックスでリストを走査 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* リストの要素を直接走査 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* インデックスでリストを走査 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* リストの要素を直接走査 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* インデックスでリストを走査 */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* リストの要素を直接走査 */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // インデックスでリストを走査
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // リストの要素を直接走査
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* インデックスでリストを走査 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* リストの要素を直接走査 */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # インデックスでリストを走査
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # リストの要素を直接走査
    count = 0
    for num in nums
        count += num
    end
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%9A%E8%BF%87%E7%B4%A2%E5%BC%95%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 5. &nbsp; リストの連結

新しいリスト `nums1` が与えられたとき、それを元のリストの末尾に連結できる。

=== "Python"

    ```python title="list.py"
    # 2 つのリストを連結
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # リスト nums1 を nums の後ろに連結
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 2 つのリストを連結 */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // リスト nums1 を nums の後ろに連結
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 2 つのリストを連結 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 2 つのリストを連結 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "Go"

    ```go title="list_test.go"
    /* 2 つのリストを連結 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // リスト nums1 を nums の後ろに連結
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 2 つのリストを連結 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // リスト nums1 を nums の後ろに連結
    ```

=== "JS"

    ```javascript title="list.js"
    /* 2 つのリストを連結 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 2 つのリストを連結 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 2 つのリストを連結 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 2 つのリストを連結 */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 2 つのリストを連結 */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // リスト nums1 を nums の後ろに連結
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 2 つのリストを連結
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8B%BC%E6%8E%A5%E4%B8%A4%E4%B8%AA%E5%88%97%E8%A1%A8%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%86%E5%88%97%E8%A1%A8%20nums1%20%E6%8B%BC%E6%8E%A5%E5%88%B0%20nums%20%E4%B9%8B%E5%90%8E&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 6. &nbsp; リストをソート

リストのソートが完了すると、配列系アルゴリズム問題でよく問われる「二分探索」や「両ポインタ」アルゴリズムを使えるようになる。

=== "Python"

    ```python title="list.py"
    # リストをソート
    nums.sort()  # ソート後、リスト要素は小さい順に並ぶ
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* リストをソート */
    sort(nums.begin(), nums.end());  // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "Java"

    ```java title="list.java"
    /* リストをソート */
    Collections.sort(nums);  // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "C#"

    ```csharp title="list.cs"
    /* リストをソート */
    nums.Sort(); // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "Go"

    ```go title="list_test.go"
    /* リストをソート */
    sort.Ints(nums)  // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "Swift"

    ```swift title="list.swift"
    /* リストをソート */
    nums.sort() // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "JS"

    ```javascript title="list.js"
    /* リストをソート */
    nums.sort((a, b) => a - b);  // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "TS"

    ```typescript title="list.ts"
    /* リストをソート */
    nums.sort((a, b) => a - b);  // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "Dart"

    ```dart title="list.dart"
    /* リストをソート */
    nums.sort(); // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "Rust"

    ```rust title="list.rs"
    /* リストをソート */
    nums.sort(); // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* リストをソート */
    nums.sort() // ソート後、リスト要素は小さい順に並ぶ
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # リストをソート
    nums = nums.sort { |a, b| a <=> b } # ソート後、リスト要素は小さい順に並ぶ
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%8E%92%E5%BA%8F%E5%88%97%E8%A1%A8%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%90%8E%EF%BC%8C%E5%88%97%E8%A1%A8%E5%85%83%E7%B4%A0%E4%BB%8E%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 4.3.2 &nbsp; リストの実装

多くのプログラミング言語にはリストが組み込まれており、たとえば Java、C++、Python などがある。それらの実装は比較的複雑で、初期容量や拡張倍率など各種パラメータの設定もよく考えられている。興味があればソースコードを参照して学べる。

リストの動作原理への理解を深めるため、ここでは簡易版のリストを実装し、以下の 3 つの設計ポイントを含める。

- **初期容量**：妥当な配列の初期容量を選ぶ。この例では 10 を初期容量として選ぶ。
- **要素数の記録**：`size` という変数を宣言して、現在のリスト要素数を記録し、要素の挿入と削除に応じてリアルタイムに更新する。この変数により、リスト末尾の位置を特定し、拡張が必要かどうかを判断できる。
- **拡張機構**：要素を挿入する時点でリスト容量がいっぱいなら、拡張が必要になる。まず拡張倍率に応じてより大きな配列を作成し、次に現在の配列の全要素を順に新しい配列へ移す。この例では、配列を毎回以前の 2 倍に拡張する。

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """リストクラス"""

        def __init__(self):
            """コンストラクタ"""
            self._capacity: int = 10  # リスト容量
            self._arr: list[int] = [0] * self._capacity  # 配列（リスト要素を格納）
            self._size: int = 0  # リストの長さ（現在の要素数）
            self._extend_ratio: int = 2  # リスト拡張時の増加倍率

        def size(self) -> int:
            """リストの長さを取得（現在の要素数）"""
            return self._size

        def capacity(self) -> int:
            """リスト容量を取得する"""
            return self._capacity

        def get(self, index: int) -> int:
            """要素にアクセス"""
            # インデックスが範囲外なら例外を送出する。以下同様
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            return self._arr[index]

        def set(self, num: int, index: int):
            """要素を更新"""
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            self._arr[index] = num

        def add(self, num: int):
            """末尾に要素を追加"""
            # 要素数が容量を超えると、拡張機構が発動する
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """中間に要素を挿入"""
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            # 要素数が容量を超えると、拡張機構が発動する
            if self._size == self.capacity():
                self.extend_capacity()
            # index 以降の要素をすべて 1 つ後ろへずらす
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 要素数を更新
            self._size += 1

        def remove(self, index: int) -> int:
            """要素を削除"""
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            num = self._arr[index]
            # インデックス index より後の要素をすべて 1 つ前に移動する
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 要素数を更新
            self._size -= 1
            # 削除された要素を返す
            return num

        def extend_capacity(self):
            """リストの拡張"""
            # 元の配列の `_extend_ratio` 倍の長さを持つ新しい配列を作成し、元の配列を新しい配列にコピーする
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # リストの容量を更新
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """有効長のリストを返す"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* リストクラス */
    class MyList {
      private:
        int *arr;             // 配列（リスト要素を格納）
        int arrCapacity = 10; // リスト容量
        int arrSize = 0;      // リストの長さ（現在の要素数）
        int extendRatio = 2;   // リスト拡張時の増加倍率

      public:
        /* コンストラクタ */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* デストラクタメソッド */
        ~MyList() {
            delete[] arr;
        }

        /* リストの長さを取得（現在の要素数） */
        int size() {
            return arrSize;
        }

        /* リスト容量を取得する */
        int capacity() {
            return arrCapacity;
        }

        /* 要素にアクセス */
        int get(int index) {
            // インデックスが範囲外なら例外を送出する。以下同様
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外");
            return arr[index];
        }

        /* 要素を更新 */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外");
            arr[index] = num;
        }

        /* 末尾に要素を追加 */
        void add(int num) {
            // 要素数が容量を超えると、拡張機構が発動する
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 要素数を更新
            arrSize++;
        }

        /* 中間に要素を挿入 */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外");
            // 要素数が容量を超えると、拡張機構が発動する
            if (size() == capacity())
                extendCapacity();
            // index 以降の要素をすべて 1 つ後ろへずらす
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 要素数を更新
            arrSize++;
        }

        /* 要素を削除 */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外");
            int num = arr[index];
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 要素数を更新
            arrSize--;
            // 削除された要素を返す
            return num;
        }

        /* リストの拡張 */
        void extendCapacity() {
            // 元の配列の `extendRatio` 倍の長さを持つ新しい配列を作成する
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 元の配列の全要素を新しい配列にコピー
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // メモリを解放する
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 出力用にリストを Vector に変換 */
        vector<int> toVector() {
            // 有効長の範囲内のリスト要素のみを変換
            vector<int> vec(size());
            for (int i = 0; i < size(); i++) {
                vec[i] = arr[i];
            }
            return vec;
        }
    };
    ```

=== "Java"

    ```java title="my_list.java"
    /* リストクラス */
    class MyList {
        private int[] arr; // 配列（リスト要素を格納）
        private int capacity = 10; // リスト容量
        private int size = 0; // リストの長さ（現在の要素数）
        private int extendRatio = 2; // リスト拡張時の増加倍率

        /* コンストラクタ */
        public MyList() {
            arr = new int[capacity];
        }

        /* リストの長さを取得（現在の要素数） */
        public int size() {
            return size;
        }

        /* リスト容量を取得する */
        public int capacity() {
            return capacity;
        }

        /* 要素にアクセス */
        public int get(int index) {
            // インデックスが範囲外なら例外を送出する。以下同様
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            return arr[index];
        }

        /* 要素を更新 */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            arr[index] = num;
        }

        /* 末尾に要素を追加 */
        public void add(int num) {
            // 要素数が容量を超えると、拡張機構が発動する
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 要素数を更新
            size++;
        }

        /* 中間に要素を挿入 */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            // 要素数が容量を超えると、拡張機構が発動する
            if (size == capacity())
                extendCapacity();
            // index 以降の要素をすべて 1 つ後ろへずらす
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 要素数を更新
            size++;
        }

        /* 要素を削除 */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            int num = arr[index];
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 要素数を更新
            size--;
            // 削除された要素を返す
            return num;
        }

        /* リストの拡張 */
        public void extendCapacity() {
            // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // リストの容量を更新
            capacity = arr.length;
        }

        /* リストを配列に変換する */
        public int[] toArray() {
            int size = size();
            // 有効長の範囲内のリスト要素のみを変換
            int[] arr = new int[size];
            for (int i = 0; i < size; i++) {
                arr[i] = get(i);
            }
            return arr;
        }
    }
    ```

=== "C#"

    ```csharp title="my_list.cs"
    /* リストクラス */
    class MyList {
        private int[] arr;           // 配列（リスト要素を格納）
        private int arrCapacity = 10;    // リスト容量
        private int arrSize = 0;         // リストの長さ（現在の要素数）
        private readonly int extendRatio = 2;  // リスト拡張時の増加倍率

        /* コンストラクタ */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* リストの長さを取得（現在の要素数） */
        public int Size() {
            return arrSize;
        }

        /* リスト容量を取得する */
        public int Capacity() {
            return arrCapacity;
        }

        /* 要素にアクセス */
        public int Get(int index) {
            // インデックスが範囲外なら例外を送出する。以下同様
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            return arr[index];
        }

        /* 要素を更新 */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            arr[index] = num;
        }

        /* 末尾に要素を追加 */
        public void Add(int num) {
            // 要素数が容量を超えると、拡張機構が発動する
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 要素数を更新
            arrSize++;
        }

        /* 中間に要素を挿入 */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            // 要素数が容量を超えると、拡張機構が発動する
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // index 以降の要素をすべて 1 つ後ろへずらす
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 要素数を更新
            arrSize++;
        }

        /* 要素を削除 */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            int num = arr[index];
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 要素数を更新
            arrSize--;
            // 削除された要素を返す
            return num;
        }

        /* リストの拡張 */
        public void ExtendCapacity() {
            // `arrCapacity * extendRatio` の長さを持つ配列を新規作成し、元の配列を新しい配列にコピーする
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // リストの容量を更新
            arrCapacity = arr.Length;
        }

        /* リストを配列に変換する */
        public int[] ToArray() {
            // 有効長の範囲内のリスト要素のみを変換
            int[] arr = new int[arrSize];
            for (int i = 0; i < arrSize; i++) {
                arr[i] = Get(i);
            }
            return arr;
        }
    }
    ```

=== "Go"

    ```go title="my_list.go"
    /* リストクラス */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* コンストラクタ */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // リスト容量
            arr:         make([]int, 10), // 配列（リスト要素を格納）
            arrSize:     0,               // リストの長さ（現在の要素数）
            extendRatio: 2,               // リスト拡張時の増加倍率
        }
    }

    /* リストの長さを取得（現在の要素数） */
    func (l *myList) size() int {
        return l.arrSize
    }

    /* リスト容量を取得する */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 要素にアクセス */
    func (l *myList) get(index int) int {
        // インデックスが範囲外なら例外を送出する。以下同様
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        return l.arr[index]
    }

    /* 要素を更新 */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        l.arr[index] = num
    }

    /* 末尾に要素を追加 */
    func (l *myList) add(num int) {
        // 要素数が容量を超えると、拡張機構が発動する
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // 要素数を更新
        l.arrSize++
    }

    /* 中間に要素を挿入 */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        // 要素数が容量を超えると、拡張機構が発動する
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // index 以降の要素をすべて 1 つ後ろへずらす
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // 要素数を更新
        l.arrSize++
    }

    /* 要素を削除 */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        num := l.arr[index]
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 要素数を更新
        l.arrSize--
        // 削除された要素を返す
        return num
    }

    /* リストの拡張 */
    func (l *myList) extendCapacity() {
        // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // リストの容量を更新
        l.arrCapacity = len(l.arr)
    }

    /* 有効長のリストを返す */
    func (l *myList) toArray() []int {
        // 有効長の範囲内のリスト要素のみを変換
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* リストクラス */
    class MyList {
        private var arr: [Int] // 配列（リスト要素を格納）
        private var _capacity: Int // リスト容量
        private var _size: Int // リストの長さ（現在の要素数）
        private let extendRatio: Int // リスト拡張時の増加倍率

        /* コンストラクタ */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* リストの長さを取得（現在の要素数） */
        func size() -> Int {
            _size
        }

        /* リスト容量を取得する */
        func capacity() -> Int {
            _capacity
        }

        /* 要素にアクセス */
        func get(index: Int) -> Int {
            // インデックスが範囲外ならエラーを投げる。以下同様
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外")
            }
            return arr[index]
        }

        /* 要素を更新 */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外")
            }
            arr[index] = num
        }

        /* 末尾に要素を追加 */
        func add(num: Int) {
            // 要素数が容量を超えると、拡張機構が発動する
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // 要素数を更新
            _size += 1
        }

        /* 中間に要素を挿入 */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外")
            }
            // 要素数が容量を超えると、拡張機構が発動する
            if size() == capacity() {
                extendCapacity()
            }
            // index 以降の要素をすべて 1 つ後ろへずらす
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // 要素数を更新
            _size += 1
        }

        /* 要素を削除 */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外")
            }
            let num = arr[index]
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // 要素数を更新
            _size -= 1
            // 削除された要素を返す
            return num
        }

        /* リストの拡張 */
        func extendCapacity() {
            // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // リストの容量を更新
            _capacity = arr.count
        }

        /* リストを配列に変換する */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* リストクラス */
    class MyList {
        #arr = new Array(); // 配列（リスト要素を格納）
        #capacity = 10; // リスト容量
        #size = 0; // リストの長さ（現在の要素数）
        #extendRatio = 2; // リスト拡張時の増加倍率

        /* コンストラクタ */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* リストの長さを取得（現在の要素数） */
        size() {
            return this.#size;
        }

        /* リスト容量を取得する */
        capacity() {
            return this.#capacity;
        }

        /* 要素にアクセス */
        get(index) {
            // インデックスが範囲外なら例外を送出する。以下同様
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            return this.#arr[index];
        }

        /* 要素を更新 */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            this.#arr[index] = num;
        }

        /* 末尾に要素を追加 */
        add(num) {
            // 長さが容量に等しい場合は拡張が必要
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 新しい要素をリストの末尾に追加する
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 中間に要素を挿入 */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            // 要素数が容量を超えると、拡張機構が発動する
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // index 以降の要素をすべて 1 つ後ろへずらす
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 要素数を更新
            this.#arr[index] = num;
            this.#size++;
        }

        /* 要素を削除 */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            let num = this.#arr[index];
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 要素数を更新
            this.#size--;
            // 削除された要素を返す
            return num;
        }

        /* リストの拡張 */
        extendCapacity() {
            // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // リストの容量を更新
            this.#capacity = this.#arr.length;
        }

        /* リストを配列に変換する */
        toArray() {
            let size = this.size();
            // 有効長の範囲内のリスト要素のみを変換
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="my_list.ts"
    /* リストクラス */
    class MyList {
        private arr: Array<number>; // 配列（リスト要素を格納）
        private _capacity: number = 10; // リスト容量
        private _size: number = 0; // リストの長さ（現在の要素数）
        private extendRatio: number = 2; // リスト拡張時の増加倍率

        /* コンストラクタ */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* リストの長さを取得（現在の要素数） */
        public size(): number {
            return this._size;
        }

        /* リスト容量を取得する */
        public capacity(): number {
            return this._capacity;
        }

        /* 要素にアクセス */
        public get(index: number): number {
            // インデックスが範囲外なら例外を送出する。以下同様
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            return this.arr[index];
        }

        /* 要素を更新 */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            this.arr[index] = num;
        }

        /* 末尾に要素を追加 */
        public add(num: number): void {
            // 長さが容量に等しい場合は拡張が必要
            if (this._size === this._capacity) this.extendCapacity();
            // 新しい要素をリストの末尾に追加する
            this.arr[this._size] = num;
            this._size++;
        }

        /* 中間に要素を挿入 */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            // 要素数が容量を超えると、拡張機構が発動する
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // index 以降の要素をすべて 1 つ後ろへずらす
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 要素数を更新
            this.arr[index] = num;
            this._size++;
        }

        /* 要素を削除 */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            let num = this.arr[index];
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 要素数を更新
            this._size--;
            // 削除された要素を返す
            return num;
        }

        /* リストの拡張 */
        public extendCapacity(): void {
            // `size` の長さを持つ配列を新規作成し、元の配列を新しい配列にコピーする
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // リストの容量を更新
            this._capacity = this.arr.length;
        }

        /* リストを配列に変換する */
        public toArray(): number[] {
            let size = this.size();
            // 有効長の範囲内のリスト要素のみを変換
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="my_list.dart"
    /* リストクラス */
    class MyList {
      late List<int> _arr; // 配列（リスト要素を格納）
      int _capacity = 10; // リスト容量
      int _size = 0; // リストの長さ（現在の要素数）
      int _extendRatio = 2; // リスト拡張時の増加倍率

      /* コンストラクタ */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* リストの長さを取得（現在の要素数） */
      int size() => _size;

      /* リスト容量を取得する */
      int capacity() => _capacity;

      /* 要素にアクセス */
      int get(int index) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        return _arr[index];
      }

      /* 要素を更新 */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        _arr[index] = _num;
      }

      /* 末尾に要素を追加 */
      void add(int _num) {
        // 要素数が容量を超えると、拡張機構が発動する
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 要素数を更新
        _size++;
      }

      /* 中間に要素を挿入 */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        // 要素数が容量を超えると、拡張機構が発動する
        if (_size == _capacity) extendCapacity();
        // index 以降の要素をすべて 1 つ後ろへずらす
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 要素数を更新
        _size++;
      }

      /* 要素を削除 */
      int remove(int index) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        int _num = _arr[index];
        // インデックス index より後の要素をすべて 1 つ前に移動する
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 要素数を更新
        _size--;
        // 削除された要素を返す
        return _num;
      }

      /* リストの拡張 */
      void extendCapacity() {
        // 元の配列の `_extendRatio` 倍の長さを持つ新しい配列を作成する
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 元の配列を新しい配列にコピー
        List.copyRange(_newNums, 0, _arr);
        // `_arr` の参照を更新
        _arr = _newNums;
        // リストの容量を更新
        _capacity = _arr.length;
      }

      /* リストを配列に変換する */
      List<int> toArray() {
        List<int> arr = [];
        for (var i = 0; i < _size; i++) {
          arr.add(get(i));
        }
        return arr;
      }
    }
    ```

=== "Rust"

    ```rust title="my_list.rs"
    /* リストクラス */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // 配列（リスト要素を格納）
        capacity: usize,     // リスト容量
        size: usize,         // リストの長さ（現在の要素数）
        extend_ratio: usize, // リスト拡張時の増加倍率
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* コンストラクタ */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* リストの長さを取得（現在の要素数） */
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* リスト容量を取得する */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 要素にアクセス */
        pub fn get(&self, index: usize) -> i32 {
            // インデックスが範囲外なら例外を送出する。以下同様
            if index >= self.size {
                panic!("インデックスが範囲外です")
            };
            return self.arr[index];
        }

        /* 要素を更新 */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("インデックスが範囲外です")
            };
            self.arr[index] = num;
        }

        /* 末尾に要素を追加 */
        pub fn add(&mut self, num: i32) {
            // 要素数が容量を超えると、拡張機構が発動する
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // 要素数を更新
            self.size += 1;
        }

        /* 中間に要素を挿入 */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("インデックスが範囲外です")
            };
            // 要素数が容量を超えると、拡張機構が発動する
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // index 以降の要素をすべて 1 つ後ろへずらす
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 要素数を更新
            self.size += 1;
        }

        /* 要素を削除 */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("インデックスが範囲外です")
            };
            let num = self.arr[index];
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // 要素数を更新
            self.size -= 1;
            // 削除された要素を返す
            return num;
        }

        /* リストの拡張 */
        pub fn extend_capacity(&mut self) {
            // 元の配列の extend_ratio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // リストの容量を更新
            self.capacity = new_capacity;
        }

        /* リストを配列に変換する */
        pub fn to_array(&self) -> Vec<i32> {
            // 有効長の範囲内のリスト要素のみを変換
            let mut arr = Vec::new();
            for i in 0..self.size {
                arr.push(self.get(i));
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="my_list.c"
    /* リストクラス */
    typedef struct {
        int *arr;        // 配列（リスト要素を格納）
        int capacity;    // リスト容量
        int size;        // リストのサイズ
        int extendRatio; // リストが拡張されるたびの倍率
    } MyList;

    /* コンストラクタ */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* デストラクタ */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* リストの長さを取得 */
    int size(MyList *nums) {
        return nums->size;
    }

    /* リスト容量を取得する */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 要素にアクセス */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 要素を更新 */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 末尾に要素を追加 */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 容量を拡張
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 中間に要素を挿入 */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 要素数が容量を超えると、拡張機構が発動する
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 容量を拡張
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 要素を削除 */
    // 注意: stdio.h が remove 識別子を使用している
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* リストの拡張 */
    void extendCapacity(MyList *nums) {
        // 先に領域を確保する
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 古いデータを新しいデータにコピー
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 古いデータを解放する
        free(temp);

        // 新しいデータに更新
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 出力用にリストを Array に変換 */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* リストクラス */
    class MyList {
        private var arr: IntArray = intArrayOf() // 配列（リスト要素を格納）
        private var capacity: Int = 10 // リスト容量
        private var size: Int = 0 // リストの長さ（現在の要素数）
        private var extendRatio: Int = 2 // リスト拡張時の増加倍率

        /* コンストラクタ */
        init {
            arr = IntArray(capacity)
        }

        /* リストの長さを取得（現在の要素数） */
        fun size(): Int {
            return size
        }

        /* リスト容量を取得する */
        fun capacity(): Int {
            return capacity
        }

        /* 要素にアクセス */
        fun get(index: Int): Int {
            // インデックスが範囲外なら例外を送出する。以下同様
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外")
            return arr[index]
        }

        /* 要素を更新 */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外")
            arr[index] = num
        }

        /* 末尾に要素を追加 */
        fun add(num: Int) {
            // 要素数が容量を超えると、拡張機構が発動する
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // 要素数を更新
            size++
        }

        /* 中間に要素を挿入 */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外")
            // 要素数が容量を超えると、拡張機構が発動する
            if (size == capacity())
                extendCapacity()
            // index 以降の要素をすべて 1 つ後ろへずらす
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // 要素数を更新
            size++
        }

        /* 要素を削除 */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外")
            val num = arr[index]
            // インデックス index より後の要素をすべて 1 つ前に移動する
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // 要素数を更新
            size--
            // 削除された要素を返す
            return num
        }

        /* リストの拡張 */
        fun extendCapacity() {
            // 元の配列の extendRatio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
            arr = arr.copyOf(capacity() * extendRatio)
            // リストの容量を更新
            capacity = arr.size
        }

        /* リストを配列に変換する */
        fun toArray(): IntArray {
            val size = size()
            // 有効長の範囲内のリスト要素のみを変換
            val arr = IntArray(size)
            for (i in 0..<size) {
                arr[i] = get(i)
            }
            return arr
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_list.rb"
    ### リストクラス ###
    class MyList
      attr_reader :size       # リストの長さを取得（現在の要素数）
      attr_reader :capacity   # リスト容量を取得する

      ### コンストラクタ ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### 要素にアクセス ###
      def get(index)
        # インデックスが範囲外なら例外を送出する。以下同様
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
        @arr[index]
      end

      ### 要素にアクセス ###
      def set(index, num)
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
        @arr[index] = num
      end

      ### 末尾に要素を追加 ###
      def add(num)
        # 要素数が容量を超えると、拡張機構が発動する
        extend_capacity if size == capacity
        @arr[size] = num

        # 要素数を更新
        @size += 1
      end

      ### 途中に要素を挿入 ###
      def insert(index, num)
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size

        # 要素数が容量を超えると、拡張機構が発動する
        extend_capacity if size == capacity

        # index 以降の要素をすべて 1 つ後ろへずらす
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # 要素数を更新
        @size += 1
      end

      ### 要素の削除 ###
      def remove(index)
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
        num = @arr[index]

        # インデックス index より後の要素をすべて 1 つ前に移動する
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # 要素数を更新
        @size -= 1

        # 削除された要素を返す
        num
      end

      ### リストの容量拡張 ###
      def extend_capacity
        # 元の配列の extend_ratio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # リストの容量を更新
        @capacity = arr.length
      end

      ### リストを配列に変換 ###
      def to_array
        sz = size
        # 有効長の範囲内のリスト要素のみを変換
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201%2C%20index%20-%201%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index%2C%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%20%20%20%20nums.insert%286%2C%20index%3D3%29%0A%20%20%20%20nums.remove%283%29%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%20%20%20%20nums.set%280%2C%201%29%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201%2C%20index%20-%201%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%27%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index%2C%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%20%20%20%20nums.insert%286%2C%20index%3D3%29%0A%20%20%20%20nums.remove%283%29%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%20%20%20%20nums.set%280%2C%201%29%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>
