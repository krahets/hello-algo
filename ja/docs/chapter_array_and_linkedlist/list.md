# リスト

<u>リスト（list）</u>は抽象的なデータ構造の概念であり、要素の順序付き集合を表す。要素のアクセス、更新、追加、削除、走査などの操作をサポートし、利用者は容量制限の問題を考慮する必要がない。リストは連結リストまたは配列に基づいて実装できる。

- 連結リストは本質的にリストと見なすことができ、要素の追加・削除・参照・更新をサポートし、柔軟に動的拡張できる。
- 配列も要素の追加・削除・参照・更新をサポートするが、長さが不変であるため、長さ制限のあるリストとしか見なせない。

配列でリストを実装する場合、**長さが不変である性質によってリストの実用性が低下する**。これは、通常は事前にどれだけのデータを格納する必要があるかを決められず、適切なリスト長を選びにくいためである。長さが小さすぎると利用要件を満たせない可能性が高く、大きすぎるとメモリ空間の浪費を招く。

この問題を解決するために、<u>動的配列（dynamic array）</u>を用いてリストを実装できる。これは配列の各種利点を引き継ぎつつ、プログラム実行中に動的な拡張を行える。

実際には、**多くのプログラミング言語の標準ライブラリが提供するリストは動的配列に基づいて実装されている**。たとえば、Python の `list` 、Java の `ArrayList` 、C++ の `vector` 、C# の `List` などである。以降の議論では、「リスト」と「動的配列」を同じ概念として扱う。

## リストの基本操作

### リストの初期化

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

### 要素へのアクセス

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

### 要素の挿入と削除

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

### リストの走査

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

### リストの連結

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

### リストをソート

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

## リストの実装

多くのプログラミング言語にはリストが組み込まれており、たとえば Java、C++、Python などがある。それらの実装は比較的複雑で、初期容量や拡張倍率など各種パラメータの設定もよく考えられている。興味があればソースコードを参照して学べる。

リストの動作原理への理解を深めるため、ここでは簡易版のリストを実装し、以下の 3 つの設計ポイントを含める。

- **初期容量**：妥当な配列の初期容量を選ぶ。この例では 10 を初期容量として選ぶ。
- **要素数の記録**：`size` という変数を宣言して、現在のリスト要素数を記録し、要素の挿入と削除に応じてリアルタイムに更新する。この変数により、リスト末尾の位置を特定し、拡張が必要かどうかを判断できる。
- **拡張機構**：要素を挿入する時点でリスト容量がいっぱいなら、拡張が必要になる。まず拡張倍率に応じてより大きな配列を作成し、次に現在の配列の全要素を順に新しい配列へ移す。この例では、配列を毎回以前の 2 倍に拡張する。

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
