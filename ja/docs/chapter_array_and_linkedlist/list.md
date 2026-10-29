# リスト

<u>リスト（list）</u>は抽象的なデータ構造の概念で、順序を持つ要素の集合を表します。要素へのアクセス、更新、追加、削除、走査などの操作をサポートし、利用者は容量の制限を気にする必要がありません。リストは連結リストや配列を使って実装できます。

- 連結リストは、要素の追加・削除・検索・更新をサポートし、動的に柔軟に拡張できるため、そのままリストとみなせます。
- 配列も要素の追加・削除・検索・更新をサポートしますが、長さを変えられないため、長さに制限のあるリストとしかみなせません。

配列でリストを実装すると、**長さを変えられない性質が実用性を下げてしまいます**。通常、保存するデータ量を事前に確定できず、適切な長さを選ぶのが難しいためです。短すぎれば必要な量を格納できず、長すぎればメモリが無駄になります。

この問題を解決するため、<u>動的配列（dynamic array）</u>でリストを実装できます。動的配列は配列の利点を受け継ぎ、プログラムの実行中に容量を動的に拡張できます。

実際、**多くのプログラミング言語の標準ライブラリで提供されるリストは、動的配列で実装されています**。Python の `list`、Java の `ArrayList`、C++ の `vector`、C# の `List` などがその例です。以下では、「リスト」と「動的配列」を同じ概念として扱います。

## リストの主な操作

### リストの初期化

通常は、「初期値なし」と「初期値あり」の二つの方法で初期化します。

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
    // C++ の vector が、本節で扱う nums に相当することに注意
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
    // 初期値あり（配列には、int[] に対応するラッパー型の配列 Integer[] を使う必要がある）
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

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AA%E3%81%97%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 要素へのアクセス

リストの実体は配列なので、要素へのアクセスと更新を $O(1)$ 時間で行え、非常に効率的です。

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

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%200%20%E3%81%AB%E6%9B%B4%E6%96%B0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 要素の挿入と削除

配列と比べて、リストは自由に要素を追加・削除できます。末尾への追加の時間計算量は $O(1)$ ですが、要素の挿入と削除の効率は配列と同じで、時間計算量は $O(n)$ です。

=== "Python"

    ```python title="list.py"
    # リストを空にする
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    /* リストを空にする */
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
    # リストを空にする
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

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E7%A9%BA%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20nums.clear()%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20nums.append(1)%0A%20%20%20%20nums.append(3)%0A%20%20%20%20nums.append(2)%0A%20%20%20%20nums.append(5)%0A%20%20%20%20nums.append(4)%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20nums.insert(3%2C%206)%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AB%E6%95%B0%E5%80%A4%206%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20nums.pop(3)%20%20%20%20%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### リストの走査

配列と同様に、インデックスを使って走査することも、各要素を直接取り出して走査することもできます。

=== "Python"

    ```python title="list.py"
    # インデックスを使ってリストを走査
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # リストの要素を直接走査
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    /* インデックスを使ってリストを走査 */
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
    // インデックスを使ってリストを走査
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
    /* インデックスを使ってリストを走査 */
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
    # インデックスを使ってリストを走査
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

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range(len(nums))%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%9B%B4%E6%8E%A5%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### リストの連結

新しいリスト `nums1` を、元のリストの末尾につなげられます。

=== "Python"

    ```python title="list.py"
    # 二つのリストを連結
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # リスト nums1 を nums の後ろに連結
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* 二つのリストを連結 */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // リスト nums1 を nums の後ろに連結
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* 二つのリストを連結 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "C#"

    ```csharp title="list.cs"
    /* 二つのリストを連結 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "Go"

    ```go title="list_test.go"
    /* 二つのリストを連結 */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // リスト nums1 を nums の後ろに連結
    ```

=== "Swift"

    ```swift title="list.swift"
    /* 二つのリストを連結 */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // リスト nums1 を nums の後ろに連結
    ```

=== "JS"

    ```javascript title="list.js"
    /* 二つのリストを連結 */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "TS"

    ```typescript title="list.ts"
    /* 二つのリストを連結 */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "Dart"

    ```dart title="list.dart"
    /* 二つのリストを連結 */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // リスト nums1 を nums の後ろに連結
    ```

=== "Rust"

    ```rust title="list.rs"
    /* 二つのリストを連結 */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* 二つのリストを連結 */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // リスト nums1 を nums の後ろに連結
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # 二つのリストを連結
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BA%8C%E3%81%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E9%80%A3%E7%B5%90%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%20nums1%20%E3%82%92%20nums%20%E3%81%AE%E5%BE%8C%E3%82%8D%E3%81%AB%E9%80%A3%E7%B5%90&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### リストのソート

リストをソートすると、配列を扱うアルゴリズムの問題でよく問われる「二分探索」や「二つのポインタを使う」アルゴリズムを利用できます。

=== "Python"

    ```python title="list.py"
    # リストをソート
    nums.sort()  # ソート後、リストの要素は昇順に並ぶ
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* リストをソート */
    sort(nums.begin(), nums.end());  // ソート後、リストの要素は昇順に並ぶ
    ```

=== "Java"

    ```java title="list.java"
    /* リストをソート */
    Collections.sort(nums);  // ソート後、リストの要素は昇順に並ぶ
    ```

=== "C#"

    ```csharp title="list.cs"
    /* リストをソート */
    nums.Sort(); // ソート後、リストの要素は昇順に並ぶ
    ```

=== "Go"

    ```go title="list_test.go"
    /* リストをソート */
    sort.Ints(nums)  // ソート後、リストの要素は昇順に並ぶ
    ```

=== "Swift"

    ```swift title="list.swift"
    /* リストをソート */
    nums.sort() // ソート後、リストの要素は昇順に並ぶ
    ```

=== "JS"

    ```javascript title="list.js"
    /* リストをソート */
    nums.sort((a, b) => a - b);  // ソート後、リストの要素は昇順に並ぶ
    ```

=== "TS"

    ```typescript title="list.ts"
    /* リストをソート */
    nums.sort((a, b) => a - b);  // ソート後、リストの要素は昇順に並ぶ
    ```

=== "Dart"

    ```dart title="list.dart"
    /* リストをソート */
    nums.sort(); // ソート後、リストの要素は昇順に並ぶ
    ```

=== "Rust"

    ```rust title="list.rs"
    /* リストをソート */
    nums.sort(); // ソート後、リストの要素は昇順に並ぶ
    ```

=== "C"

    ```c title="list.c"
    // C には組み込みの動的配列がない
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* リストをソート */
    nums.sort() // ソート後、リストの要素は昇順に並ぶ
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # リストをソート
    nums = nums.sort { |a, b| a <=> b } # ソート後、リストの要素は昇順に並ぶ
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums.sort()%20%20%23%20%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AF%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%98%87%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B6&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## リストの実装

Java、C++、Python など、多くのプログラミング言語にはリストが用意されています。その実装は比較的複雑で、初期容量や拡張倍率などのパラメータも慎重に設計されています。興味があれば、ソースコードを読んで学んでみてください。

リストの仕組みをより深く理解するため、次の三つを設計の要点とする簡単なリストを実装してみましょう。

- **初期容量**：配列の初期容量を適切に設定します。この例では 10 とします。
- **要素数の記録**：現在の要素数を記録する変数 `size` を用意し、挿入と削除のたびに更新します。この変数からリストの末尾を特定し、容量拡張が必要かどうか判断できます。
- **容量拡張の仕組み**：挿入時に容量がいっぱいなら、拡張する必要があります。まず拡張倍率に従って大きな配列を作り、現在の配列の全要素を順に移します。この例では、毎回、容量を元の 2 倍にします。

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
