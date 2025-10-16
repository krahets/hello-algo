# リスト

<u>リスト</u>は、要素へのアクセス、変更、追加、削除、走査などの操作をサポートする、順序付けられた要素のコレクションを表す抽象的なデータ構造の概念であり、ユーザーが容量制限を考慮する必要がありません。リストは連結リストまたは配列に基づいて実装できます。

- 連結リストは本質的にリストとして機能し、要素の追加、削除、検索、変更の操作をサポートし、サイズを動的に調整する柔軟性があります。
- 配列もこれらの操作をサポートしますが、長さが不変であるため、長さ制限のあるリストと考えることができます。

配列を使用してリストを実装する場合、**長さの不変性によりリストの実用性が低下します**。これは、事前に格納するデータ量を予測することが困難な場合が多く、適切なリスト長を選択することが困難であるためです。長さが小さすぎると要件を満たさない可能性があり、大きすぎるとメモリ空間を無駄にする可能性があります。

この問題を解決するために、<u>動的配列</u>を使用してリストを実装できます。これは配列の利点を継承し、プログラム実行中に動的に拡張できます。

実際、**多くのプログラミング言語の標準ライブラリは動的配列を使用してリストを実装しています**。例えば、Pythonの`list`、Javaの`ArrayList`、C++の`vector`、C#の`List`などです。以下の議論では、「リスト」と「動的配列」を同義の概念として扱います。

## リストの一般的な操作

### リストの初期化

通常、「初期値なし」と「初期値あり」の2つの初期化方法を使用します。

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
    // 注意: C++では、vectorがここで説明されているnumsに相当します
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
    // 初期値あり（要素型はint[]のラッパークラスInteger[]である必要があります）
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
    // Cは組み込みの動的配列を提供していません
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // リストを初期化
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    ```

### 要素へのアクセス

リストは本質的に配列であるため、$O(1)$時間で要素にアクセスし更新することができ、非常に効率的です。

=== "Python"

    ```python title="list.py"
    # 要素にアクセス
    num: int = nums[1]  # インデックス1の要素にアクセス

    # 要素を更新
    nums[1] = 0    # インデックス1の要素を0に更新
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 要素にアクセス */
    int num = nums[1];  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス1の要素を0に更新
    ```

=== "Java"

    ```java title="list.java"
    /* 要素にアクセス */
    int num = nums.get(1);  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums.set(1, 0);  // インデックス1の要素を0に更新
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 要素にアクセス */
    int num = nums[1];  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス1の要素を0に更新
    ```

=== "Go"

    ```go title="list_test.go"
    /* 要素にアクセス */
    num := nums[1]  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0     // インデックス1の要素を0に更新
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 要素にアクセス */
    let num = nums[1] // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0 // インデックス1の要素を0に更新
    ```

=== "JS"

    ```javascript title="list.js"
    /* 要素にアクセス */
    const num = nums[1];  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス1の要素を0に更新
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 要素にアクセス */
    const num: number = nums[1];  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス1の要素を0に更新
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 要素にアクセス */
    int num = nums[1];  // インデックス1の要素にアクセス

    /* 要素を更新 */
    nums[1] = 0;  // インデックス1の要素を0に更新
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 要素にアクセス */
    let num: i32 = nums[1];  // インデックス1の要素にアクセス
    /* 要素を更新 */
    nums[1] = 0;             // インデックス1の要素を0に更新
    ```

=== "C"

    ```c title="list.c"
    // Cは組み込みの動的配列を提供していません
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // 要素にアクセス
    var num = nums.items[1]; // インデックス1の要素にアクセス

    // 要素を更新
    nums.items[1] = 0; // インデックス1の要素を0に更新
    ```

### 要素の挿入と削除

配列と比較して、リストは要素の追加と削除においてより柔軟性を提供します。リストの末尾への要素追加は$O(1)$操作ですが、リストの他の場所での要素の挿入と削除の効率は配列と同じままで、時間計算量は$O(n)$です。

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

    # 中間に要素を挿入
    nums.insert(3, 6)  # インデックス3に数値6を挿入

    # 要素を削除
    nums.pop(3)        # インデックス3の要素を削除
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

    /* 中間に要素を挿入 */
    nums.insert(nums.begin() + 3, 6);  // インデックス3に数値6を挿入

    /* 要素を削除 */
    nums.erase(nums.begin() + 3);      // インデックス3の要素を削除
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

    /* 中間に要素を挿入 */
    nums.add(3, 6);  // インデックス3に数値6を挿入

    /* 要素を削除 */
    nums.remove(3);  // インデックス3の要素を削除
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

    /* 中間に要素を挿入 */
    nums.Insert(3, 6);

    /* 要素を削除 */
    nums.RemoveAt(3);
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

    /* 中間に要素を挿入 */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // インデックス3に数値6を挿入

    /* 要素を削除 */
    nums = append(nums[:3], nums[4:]...) // インデックス3の要素を削除
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

    /* 中間に要素を挿入 */
    nums.insert(6, at: 3) // インデックス3に数値6を挿入

    /* 要素を削除 */
    nums.remove(at: 3) // インデックス3の要素を削除
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

    /* 中間に要素を挿入 */
    nums.splice(3, 0, 6);

    /* 要素を削除 */
    nums.splice(3, 1);
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

    /* 中間に要素を挿入 */
    nums.splice(3, 0, 6);

    /* 要素を削除 */
    nums.splice(3, 1);
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

    /* 中間に要素を挿入 */
    nums.insert(3, 6); // インデックス3に数値6を挿入

    /* 要素を削除 */
    nums.removeAt(3); // インデックス3の要素を削除
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

    /* 中間に要素を挿入 */
    nums.insert(3, 6);  // インデックス3に数値6を挿入

    /* 要素を削除 */
    nums.remove(3);    // インデックス3の要素を削除
    ```

=== "C"

    ```c title="list.c"
    // Cは組み込みの動的配列を提供していません
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // リストをクリア
    nums.clearRetainingCapacity();

    // 末尾に要素を追加
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);

    // 中間に要素を挿入
    try nums.insert(3, 6); // インデックス3に数値6を挿入

    // 要素を削除
    _ = nums.orderedRemove(3); // インデックス3の要素を削除
    ```

### リストの反復

配列と同様に、リストはインデックスを使用して反復することも、各要素を直接反復することもできます。

=== "Python"

    ```python title="list.py"
    # インデックスでリストを反復
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # リスト要素を直接反復
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* インデックスでリストを反復 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* リスト要素を直接反復 */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* インデックスでリストを反復 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* リスト要素を直接反復 */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* インデックスでリストを反復 */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* リスト要素を直接反復 */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* インデックスでリストを反復 */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* リスト要素を直接反復 */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* インデックスでリストを反復 */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* リスト要素を直接反復 */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* インデックスでリストを反復 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* リスト要素を直接反復 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* インデックスでリストを反復 */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* リスト要素を直接反復 */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* インデックスでリストを反復 */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* リスト要素を直接反復 */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // インデックスでリストを反復
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // リスト要素を直接反復
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // Cは組み込みの動的配列を提供していません
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // インデックスでリストを反復
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums[i];
    }

    // リスト要素を直接反復
    count = 0;
    for (nums.items) |num| {
        count += num;
    }
    ```

### リストの連結

新しいリスト`nums1`が与えられたとき、それを元のリストの末尾に追加できます。

=== "Python"

    ```python title="list.py"
    # 2つのリストを連結
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # nums1をnumsの末尾に連結
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 2つのリストを連結 */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // nums1をnumsの末尾に連結
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 2つのリストを連結 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // nums1をnumsの末尾に連結
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 2つのリストを連結 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // nums1をnumsの末尾に連結
    ```

=== "Go"

    ```go title="list_test.go"
    /* 2つのリストを連結 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // nums1をnumsの末尾に連結
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 2つのリストを連結 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // nums1をnumsの末尾に連結
    ```

=== "JS"

    ```javascript title="list.js"
    /* 2つのリストを連結 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // nums1をnumsの末尾に連結
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 2つのリストを連結 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // nums1をnumsの末尾に連結
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 2つのリストを連結 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // nums1をnumsの末尾に連結
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 2つのリストを連結 */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // Cは組み込みの動的配列を提供していません
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // 2つのリストを連結
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items); // nums1をnumsの末尾に連結
    ```

### リストのソート

リストがソートされると、「二分探索」や「双ポインタ」アルゴリズムなど、配列関連のアルゴリズム問題でよく使用されるアルゴリズムを使用できます。

=== "Python"

    ```python title="list.py"
    # リストをソート
    nums.sort()  # ソート後、リスト要素は昇順になります
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* リストをソート */
    sort(nums.begin(), nums.end());  // ソート後、リスト要素は昇順になります
    ```

=== "Java"

    ```java title="list.java"
    /* リストをソート */
    Collections.sort(nums);  // ソート後、リスト要素は昇順になります
    ```

=== "C#"

    ```csharp title="list.cs"
    /* リストをソート */
    nums.Sort(); // ソート後、リスト要素は昇順になります
    ```

=== "Go"

    ```go title="list_test.go"
    /* リストをソート */
    sort.Ints(nums)  // ソート後、リスト要素は昇順になります
    ```

=== "Swift"

    ```swift title="list.swift"
    /* リストをソート */
    nums.sort() // ソート後、リスト要素は昇順になります
    ```

=== "JS"

    ```javascript title="list.js"
    /* リストをソート */
    nums.sort((a, b) => a - b);  // ソート後、リスト要素は昇順になります
    ```

=== "TS"

    ```typescript title="list.ts"
    /* リストをソート */
    nums.sort((a, b) => a - b);  // ソート後、リスト要素は昇順になります
    ```

=== "Dart"

    ```dart title="list.dart"
    /* リストをソート */
    nums.sort(); // ソート後、リスト要素は昇順になります
    ```

=== "Rust"

    ```rust title="list.rs"
    /* リストをソート */
    nums.sort(); // ソート後、リスト要素は昇順になります
    ```

=== "C"

    ```c title="list.c"
    // Cは組み込みの動的配列を提供していません
    ```

=== "Kotlin"

    ```kotlin title="list.kt"

    ```

=== "Zig"

    ```zig title="list.zig"
    // リストをソート
    std.sort.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    ```

## リストの実装

多くのプログラミング言語には、Java、C++、Pythonなどを含む組み込みリストが付属しています。それらの実装は、初期容量や拡張係数などの様々なパラメータを慎重に考慮した設定で、複雑になりがちです。興味のある読者は、さらなる学習のためにソースコードを調べることができます。

リストがどのように動作するかの理解を深めるために、3つの重要な設計側面に焦点を当てて、簡略化されたリストの実装を試みます：

- **初期容量**：配列に合理的な初期容量を選択します。この例では、初期容量として10を選択します。
- **サイズ記録**：リスト内の現在の要素数を記録する変数`size`を宣言し、要素の挿入と削除でリアルタイムに更新します。この変数により、リストの末尾を特定し、拡張が必要かどうかを判断できます。
- **拡張メカニズム**：要素挿入時にリストが満杯に達した場合、拡張プロセスが必要です。これには拡張係数に基づいてより大きな配列を作成し、現在の配列からすべての要素を新しい配列に転送することが含まれます。この例では、拡張のたびに配列サイズを2倍にすることを規定します。

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
