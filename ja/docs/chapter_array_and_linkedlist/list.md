---
comments: true
---

# 4.3 &nbsp; リスト

<u>リスト（list）</u>は抽象的なデータ構造の概念で、順序を持つ要素の集合を表します。要素へのアクセス、更新、追加、削除、走査などの操作をサポートし、利用者は容量の制限を気にする必要がありません。リストは連結リストや配列を使って実装できます。

- 連結リストは、要素の追加・削除・検索・更新をサポートし、動的に柔軟に拡張できるため、そのままリストとみなせます。
- 配列も要素の追加・削除・検索・更新をサポートしますが、長さを変えられないため、長さに制限のあるリストとしかみなせません。

配列でリストを実装すると、**長さを変えられない性質が実用性を下げてしまいます**。通常、保存するデータ量を事前に確定できず、適切な長さを選ぶのが難しいためです。短すぎれば必要な量を格納できず、長すぎればメモリが無駄になります。

この問題を解決するため、<u>動的配列（dynamic array）</u>でリストを実装できます。動的配列は配列の利点を受け継ぎ、プログラムの実行中に容量を動的に拡張できます。

実際、**多くのプログラミング言語の標準ライブラリで提供されるリストは、動的配列で実装されています**。Python の `list`、Java の `ArrayList`、C++ の `vector`、C# の `List` などがその例です。以下では、「リスト」と「動的配列」を同じ概念として扱います。

## 4.3.1 &nbsp; リストの主な操作

### 1. &nbsp; リストの初期化

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

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AA%E3%81%97%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AA%E3%81%97%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; 要素へのアクセス

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

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%200%20%E3%81%AB%E6%9B%B4%E6%96%B0&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%200%20%E3%81%AB%E6%9B%B4%E6%96%B0&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 3. &nbsp; 要素の挿入と削除

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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E7%A9%BA%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20nums.clear()%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20nums.append(1)%0A%20%20%20%20nums.append(3)%0A%20%20%20%20nums.append(2)%0A%20%20%20%20nums.append(5)%0A%20%20%20%20nums.append(4)%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20nums.insert(3%2C%206)%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AB%E6%95%B0%E5%80%A4%206%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20nums.pop(3)%20%20%20%20%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E7%A9%BA%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20nums.clear()%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20nums.append(1)%0A%20%20%20%20nums.append(3)%0A%20%20%20%20nums.append(2)%0A%20%20%20%20nums.append(5)%0A%20%20%20%20nums.append(4)%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20nums.insert(3%2C%206)%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AB%E6%95%B0%E5%80%A4%206%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20nums.pop(3)%20%20%20%20%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 4. &nbsp; リストの走査

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

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range(len(nums))%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%9B%B4%E6%8E%A5%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range(len(nums))%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%9B%B4%E6%8E%A5%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 5. &nbsp; リストの連結

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

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BA%8C%E3%81%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E9%80%A3%E7%B5%90%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%20nums1%20%E3%82%92%20nums%20%E3%81%AE%E5%BE%8C%E3%82%8D%E3%81%AB%E9%80%A3%E7%B5%90&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BA%8C%E3%81%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E9%80%A3%E7%B5%90%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%20nums1%20%E3%82%92%20nums%20%E3%81%AE%E5%BE%8C%E3%82%8D%E3%81%AB%E9%80%A3%E7%B5%90&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 6. &nbsp; リストのソート

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

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums.sort()%20%20%23%20%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AF%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%98%87%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B6&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums.sort()%20%20%23%20%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AF%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%98%87%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B6&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 4.3.2 &nbsp; リストの実装

Java、C++、Python など、多くのプログラミング言語にはリストが用意されています。その実装は比較的複雑で、初期容量や拡張倍率などのパラメータも慎重に設計されています。興味があれば、ソースコードを読んで学んでみてください。

リストの仕組みをより深く理解するため、次の三つを設計の要点とする簡単なリストを実装してみましょう。

- **初期容量**：配列の初期容量を適切に設定します。この例では 10 とします。
- **要素数の記録**：現在の要素数を記録する変数 `size` を用意し、挿入と削除のたびに更新します。この変数からリストの末尾を特定し、容量拡張が必要かどうか判断できます。
- **容量拡張の仕組み**：挿入時に容量がいっぱいなら、拡張する必要があります。まず拡張倍率に従って大きな配列を作り、現在の配列の全要素を順に移します。この例では、毎回、容量を元の 2 倍にします。

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """リストクラス"""

        def __init__(self):
            """コンストラクタ"""
            self._capacity: int = 10  # リストの容量
            self._arr: list[int] = [0] * self._capacity  # 配列（リストの要素を格納する）
            self._size: int = 0  # リストの長さ（現在の要素数）
            self._extend_ratio: int = 2  # リストの容量を拡張する際の倍率

        def size(self) -> int:
            """リストの長さ（現在の要素数）を取得する"""
            return self._size

        def capacity(self) -> int:
            """リストの容量を取得する"""
            return self._capacity

        def get(self, index: int) -> int:
            """要素にアクセスする"""
            # インデックスが範囲外の場合、例外を送出する。以下も同様
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            return self._arr[index]

        def set(self, num: int, index: int):
            """要素を更新する"""
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            self._arr[index] = num

        def add(self, num: int):
            """末尾に要素を追加する"""
            # 要素数が容量を超える場合、容量を拡張する
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """途中に要素を挿入する"""
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            # 要素数が容量を超える場合、容量を拡張する
            if self._size == self.capacity():
                self.extend_capacity()
            # インデックス index 以降の全要素を後ろに 1 つずらす
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # 要素数を更新する
            self._size += 1

        def remove(self, index: int) -> int:
            """要素を削除する"""
            if index < 0 or index >= self._size:
                raise IndexError("インデックスが範囲外です")
            num = self._arr[index]
            # インデックス index より後の全要素を前に 1 つずらす
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # 要素数を更新する
            self._size -= 1
            # 削除した要素を返す
            return num

        def extend_capacity(self):
            """リストの容量を拡張する"""
            # 元の配列の _extend_ratio 倍の長さの配列を新たに作成し、元の配列をコピーする
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # リストの容量を更新する
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """有効な長さのリストを返す"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* リストクラス */
    class MyList {
      private:
        int *arr;             // 配列（リストの要素を格納する）
        int arrCapacity = 10; // リストの容量
        int arrSize = 0;      // リストの長さ（現在の要素数）
        int extendRatio = 2;   // リストの容量を拡張する際の倍率

      public:
        /* コンストラクタ */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* デストラクタ */
        ~MyList() {
            delete[] arr;
        }

        /* リストの長さ（現在の要素数）を取得する*/
        int size() {
            return arrSize;
        }

        /* リストの容量を取得する */
        int capacity() {
            return arrCapacity;
        }

        /* 要素にアクセスする */
        int get(int index) {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外です");
            return arr[index];
        }

        /* 要素を更新する */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外です");
            arr[index] = num;
        }

        /* 末尾に要素を追加する */
        void add(int num) {
            // 要素数が容量を超える場合、容量を拡張する
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // 要素数を更新する
            arrSize++;
        }

        /* 途中に要素を挿入する */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外です");
            // 要素数が容量を超える場合、容量を拡張する
            if (size() == capacity())
                extendCapacity();
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 要素数を更新する
            arrSize++;
        }

        /* 要素を削除する */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("インデックスが範囲外です");
            int num = arr[index];
            // インデックス index より後の全要素を前に 1 つずらす
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 要素数を更新する
            arrSize--;
            // 削除した要素を返す
            return num;
        }

        /* リストの容量を拡張する */
        void extendCapacity() {
            // 元の配列の extendRatio 倍の長さの新しい配列を作成する
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // 元の配列の全要素を新しい配列にコピーする
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // メモリを解放する
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* 表示用にリストを Vector に変換する */
        vector<int> toVector() {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
        private int[] arr; // 配列（リストの要素を格納する）
        private int capacity = 10; // リストの容量
        private int size = 0; // リストの長さ（現在の要素数）
        private int extendRatio = 2; // リストの容量を拡張する際の倍率

        /* コンストラクタ */
        public MyList() {
            arr = new int[capacity];
        }

        /* リストの長さ（現在の要素数）を取得する */
        public int size() {
            return size;
        }

        /* リストの容量を取得する */
        public int capacity() {
            return capacity;
        }

        /* 要素にアクセスする */
        public int get(int index) {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            return arr[index];
        }

        /* 要素を更新する */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            arr[index] = num;
        }

        /* 末尾に要素を追加する */
        public void add(int num) {
            // 要素数が容量を超える場合、容量を拡張する
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // 要素数を更新する
            size++;
        }

        /* 途中に要素を挿入する */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            // 要素数が容量を超える場合、容量を拡張する
            if (size == capacity())
                extendCapacity();
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 要素数を更新する
            size++;
        }

        /* 要素を削除する */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("インデックスが範囲外です");
            int num = arr[index];
            // インデックス index より後の全要素を前に 1 つずらす
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 要素数を更新する
            size--;
            // 削除した要素を返す
            return num;
        }

        /* リストの容量を拡張する */
        public void extendCapacity() {
            // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // リストの容量を更新する
            capacity = arr.length;
        }

        /* リストを配列に変換する */
        public int[] toArray() {
            int size = size();
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
        private int[] arr;           // 配列（リストの要素を格納する）
        private int arrCapacity = 10;    // リストの容量
        private int arrSize = 0;         // リストの長さ（現在の要素数）
        private readonly int extendRatio = 2;  // リストの容量を拡張する際の倍率

        /* コンストラクタ */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* リストの長さ（現在の要素数）を取得する*/
        public int Size() {
            return arrSize;
        }

        /* リストの容量を取得する */
        public int Capacity() {
            return arrCapacity;
        }

        /* 要素にアクセスする */
        public int Get(int index) {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            return arr[index];
        }

        /* 要素を更新する */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            arr[index] = num;
        }

        /* 末尾に要素を追加する */
        public void Add(int num) {
            // 要素数が容量を超える場合、容量を拡張する
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // 要素数を更新する
            arrSize++;
        }

        /* 途中に要素を挿入する */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            // 要素数が容量を超える場合、容量を拡張する
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // 要素数を更新する
            arrSize++;
        }

        /* 要素を削除する */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("インデックスが範囲外です");
            int num = arr[index];
            // インデックス index より後の全要素を前に 1 つずらす
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // 要素数を更新する
            arrSize--;
            // 削除した要素を返す
            return num;
        }

        /* リストの容量を拡張する */
        public void ExtendCapacity() {
            // 長さ arrCapacity * extendRatio の配列を新たに作成し、元の配列をコピーする
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // リストの容量を更新する
            arrCapacity = arr.Length;
        }

        /* リストを配列に変換する */
        public int[] ToArray() {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
            arrCapacity: 10,              // リストの容量
            arr:         make([]int, 10), // 配列（リストの要素を格納する）
            arrSize:     0,               // リストの長さ（現在の要素数）
            extendRatio: 2,               // リストの容量を拡張する際の倍率
        }
    }

    /* リストの長さ（現在の要素数）を取得する */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  リストの容量を取得する */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* 要素にアクセスする */
    func (l *myList) get(index int) int {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        return l.arr[index]
    }

    /* 要素を更新する */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        l.arr[index] = num
    }

    /* 末尾に要素を追加する */
    func (l *myList) add(num int) {
        // 要素数が容量を超える場合、容量を拡張する
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // 要素数を更新する
        l.arrSize++
    }

    /* 途中に要素を挿入する */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        // 要素数が容量を超える場合、容量を拡張する
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // 要素数を更新する
        l.arrSize++
    }

    /* 要素を削除する */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("インデックスが範囲外です")
        }
        num := l.arr[index]
        // インデックス index より後の全要素を前に 1 つずらす
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // 要素数を更新する
        l.arrSize--
        // 削除した要素を返す
        return num
    }

    /* リストの容量を拡張する */
    func (l *myList) extendCapacity() {
        // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // リストの容量を更新する
        l.arrCapacity = len(l.arr)
    }

    /* 有効な長さのリストを返す */
    func (l *myList) toArray() []int {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* リストクラス */
    class MyList {
        private var arr: [Int] // 配列（リストの要素を格納する）
        private var _capacity: Int // リストの容量
        private var _size: Int // リストの長さ（現在の要素数）
        private let extendRatio: Int // リストの容量を拡張する際の倍率

        /* コンストラクタ */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* リストの長さ（現在の要素数）を取得する*/
        func size() -> Int {
            _size
        }

        /* リストの容量を取得する */
        func capacity() -> Int {
            _capacity
        }

        /* 要素にアクセスする */
        func get(index: Int) -> Int {
            // インデックスが範囲外の場合、エラーを送出する。以下も同様
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外です")
            }
            return arr[index]
        }

        /* 要素を更新する */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外です")
            }
            arr[index] = num
        }

        /* 末尾に要素を追加する */
        func add(num: Int) {
            // 要素数が容量を超える場合、容量を拡張する
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // 要素数を更新する
            _size += 1
        }

        /* 途中に要素を挿入する */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外です")
            }
            // 要素数が容量を超える場合、容量を拡張する
            if size() == capacity() {
                extendCapacity()
            }
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // 要素数を更新する
            _size += 1
        }

        /* 要素を削除する */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("インデックスが範囲外です")
            }
            let num = arr[index]
            // インデックス index より後の全要素を前に 1 つずらす
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // 要素数を更新する
            _size -= 1
            // 削除した要素を返す
            return num
        }

        /* リストの容量を拡張する */
        func extendCapacity() {
            // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // リストの容量を更新する
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
        #arr = new Array(); // 配列（リストの要素を格納する）
        #capacity = 10; // リストの容量
        #size = 0; // リストの長さ（現在の要素数）
        #extendRatio = 2; // リストの容量を拡張する際の倍率

        /* コンストラクタ */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* リストの長さ（現在の要素数）を取得する*/
        size() {
            return this.#size;
        }

        /* リストの容量を取得する */
        capacity() {
            return this.#capacity;
        }

        /* 要素にアクセスする */
        get(index) {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            return this.#arr[index];
        }

        /* 要素を更新する */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            this.#arr[index] = num;
        }

        /* 末尾に要素を追加する */
        add(num) {
            // 長さが容量に等しい場合、容量を拡張する必要がある
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // 新しい要素をリストの末尾に追加する
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* 途中に要素を挿入する */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            // 要素数が容量を超える場合、容量を拡張する
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // 要素数を更新する
            this.#arr[index] = num;
            this.#size++;
        }

        /* 要素を削除する */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('インデックスが範囲外です');
            let num = this.#arr[index];
            // インデックス index より後の全要素を前に 1 つずらす
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // 要素数を更新する
            this.#size--;
            // 削除した要素を返す
            return num;
        }

        /* リストの容量を拡張する */
        extendCapacity() {
            // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // リストの容量を更新する
            this.#capacity = this.#arr.length;
        }

        /* リストを配列に変換する */
        toArray() {
            let size = this.size();
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
        private arr: Array<number>; // 配列（リストの要素を格納する）
        private _capacity: number = 10; // リストの容量
        private _size: number = 0; // リストの長さ（現在の要素数）
        private extendRatio: number = 2; // リストの容量を拡張する際の倍率

        /* コンストラクタ */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* リストの長さ（現在の要素数）を取得する*/
        public size(): number {
            return this._size;
        }

        /* リストの容量を取得する */
        public capacity(): number {
            return this._capacity;
        }

        /* 要素にアクセスする */
        public get(index: number): number {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            return this.arr[index];
        }

        /* 要素を更新する */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            this.arr[index] = num;
        }

        /* 末尾に要素を追加する */
        public add(num: number): void {
            // 長さが容量に等しい場合、容量を拡張する必要がある
            if (this._size === this._capacity) this.extendCapacity();
            // 新しい要素をリストの末尾に追加する
            this.arr[this._size] = num;
            this._size++;
        }

        /* 途中に要素を挿入する */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            // 要素数が容量を超える場合、容量を拡張する
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // 要素数を更新する
            this.arr[index] = num;
            this._size++;
        }

        /* 要素を削除する */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('インデックスが範囲外です');
            let num = this.arr[index];
            // インデックス index より後の全要素を前に 1 つずらす
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // 要素数を更新する
            this._size--;
            // 削除した要素を返す
            return num;
        }

        /* リストの容量を拡張する */
        public extendCapacity(): void {
            // 長さ size の配列を新たに作成し、元の配列をコピーする
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // リストの容量を更新する
            this._capacity = this.arr.length;
        }

        /* リストを配列に変換する */
        public toArray(): number[] {
            let size = this.size();
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
      late List<int> _arr; // 配列（リストの要素を格納する）
      int _capacity = 10; // リストの容量
      int _size = 0; // リストの長さ（現在の要素数）
      int _extendRatio = 2; // リストの容量を拡張する際の倍率

      /* コンストラクタ */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* リストの長さ（現在の要素数）を取得する*/
      int size() => _size;

      /* リストの容量を取得する */
      int capacity() => _capacity;

      /* 要素にアクセスする */
      int get(int index) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        return _arr[index];
      }

      /* 要素を更新する */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        _arr[index] = _num;
      }

      /* 末尾に要素を追加する */
      void add(int _num) {
        // 要素数が容量を超える場合、容量を拡張する
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // 要素数を更新する
        _size++;
      }

      /* 途中に要素を挿入する */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        // 要素数が容量を超える場合、容量を拡張する
        if (_size == _capacity) extendCapacity();
        // インデックス index 以降の全要素を後ろに 1 つずらす
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // 要素数を更新する
        _size++;
      }

      /* 要素を削除する */
      int remove(int index) {
        if (index >= _size) throw RangeError('インデックスが範囲外です');
        int _num = _arr[index];
        // インデックス index より後の全要素を前に 1 つずらす
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // 要素数を更新する
        _size--;
        // 削除した要素を返す
        return _num;
      }

      /* リストの容量を拡張する */
      void extendCapacity() {
        // 元の配列の _extendRatio 倍の長さの新しい配列を作成する
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // 元の配列を新しい配列にコピーする
        List.copyRange(_newNums, 0, _arr);
        // _arr の参照を更新する
        _arr = _newNums;
        // リストの容量を更新する
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
        arr: Vec<i32>,       // 配列（リストの要素を格納する）
        capacity: usize,     // リストの容量
        size: usize,         // リストの長さ（現在の要素数）
        extend_ratio: usize, // リストの容量を拡張する際の倍率
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

        /* リストの長さ（現在の要素数）を取得する*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* リストの容量を取得する */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* 要素にアクセスする */
        pub fn get(&self, index: usize) -> i32 {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if index >= self.size {
                panic!("インデックスが範囲外です")
            };
            return self.arr[index];
        }

        /* 要素を更新する */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("インデックスが範囲外です")
            };
            self.arr[index] = num;
        }

        /* 末尾に要素を追加する */
        pub fn add(&mut self, num: i32) {
            // 要素数が容量を超える場合、容量を拡張する
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // 要素数を更新する
            self.size += 1;
        }

        /* 途中に要素を挿入する */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("インデックスが範囲外です")
            };
            // 要素数が容量を超える場合、容量を拡張する
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 要素数を更新する
            self.size += 1;
        }

        /* 要素を削除する */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("インデックスが範囲外です")
            };
            let num = self.arr[index];
            // インデックス index より後の全要素を前に 1 つずらす
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // 要素数を更新する
            self.size -= 1;
            // 削除した要素を返す
            return num;
        }

        /* リストの容量を拡張する */
        pub fn extend_capacity(&mut self) {
            // 元の配列の extend_ratio 倍の長さの配列を新たに作成し、元の配列をコピーする
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // リストの容量を更新する
            self.capacity = new_capacity;
        }

        /* リストを配列に変換する */
        pub fn to_array(&self) -> Vec<i32> {
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
        int *arr;        // 配列（リストの要素を格納する）
        int capacity;    // リストの容量
        int size;        // リストのサイズ
        int extendRatio; // リストを拡張する際の容量の倍率
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

    /* リストの長さを取得する */
    int size(MyList *nums) {
        return nums->size;
    }

    /* リストの容量を取得する */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* 要素にアクセスする */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* 要素を更新する */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* 末尾に要素を追加する */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 容量を拡張する
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* 途中に要素を挿入する */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // 要素数が容量を超える場合、容量を拡張する
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // 容量を拡張する
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* 要素を削除する */
    // 注意：stdio.h で remove という名前が使われている
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* リストの容量を拡張する */
    void extendCapacity(MyList *nums) {
        // 先に領域を確保する
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // 古いデータを新しい領域にコピーする
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // 古いデータの領域を解放する
        free(temp);

        // 新しいデータを参照するよう更新する
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* 表示用にリストを Array に変換する */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* リストクラス */
    class MyList {
        private var arr: IntArray = intArrayOf() // 配列（リストの要素を格納する）
        private var capacity: Int = 10 // リストの容量
        private var size: Int = 0 // リストの長さ（現在の要素数）
        private var extendRatio: Int = 2 // リストの容量を拡張する際の倍率

        /* コンストラクタ */
        init {
            arr = IntArray(capacity)
        }

        /* リストの長さ（現在の要素数）を取得する */
        fun size(): Int {
            return size
        }

        /* リストの容量を取得する */
        fun capacity(): Int {
            return capacity
        }

        /* 要素にアクセスする */
        fun get(index: Int): Int {
            // インデックスが範囲外の場合、例外を送出する。以下も同様
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外です")
            return arr[index]
        }

        /* 要素を更新する */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外です")
            arr[index] = num
        }

        /* 末尾に要素を追加する */
        fun add(num: Int) {
            // 要素数が容量を超える場合、容量を拡張する
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // 要素数を更新する
            size++
        }

        /* 途中に要素を挿入する */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外です")
            // 要素数が容量を超える場合、容量を拡張する
            if (size == capacity())
                extendCapacity()
            // インデックス index 以降の全要素を後ろに 1 つずらす
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // 要素数を更新する
            size++
        }

        /* 要素を削除する */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("インデックスが範囲外です")
            val num = arr[index]
            // インデックス index より後の全要素を前に 1 つずらす
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // 要素数を更新する
            size--
            // 削除した要素を返す
            return num
        }

        /* リストの容量を拡張する */
        fun extendCapacity() {
            // 元の配列の extendRatio 倍の長さの配列を新たに作成し、元の配列をコピーする
            arr = arr.copyOf(capacity() * extendRatio)
            // リストの容量を更新する
            capacity = arr.size
        }

        /* リストを配列に変換する */
        fun toArray(): IntArray {
            val size = size()
            // 有効な長さの範囲内にあるリストの要素だけを変換する
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
      attr_reader :size       # リストの長さ（現在の要素数）を取得する
      attr_reader :capacity   # リストの容量を取得する

      ### コンストラクタ ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### 要素にアクセスする ###
      def get(index)
        # インデックスが範囲外の場合、例外を送出する。以下も同様
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
        @arr[index]
      end

      ### 要素にアクセスする ###
      def set(index, num)
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
        @arr[index] = num
      end

      ### 末尾に要素を追加する ###
      def add(num)
        # 要素数が容量を超える場合、容量を拡張する
        extend_capacity if size == capacity
        @arr[size] = num

        # 要素数を更新する
        @size += 1
      end

      ### 途中に要素を挿入する ###
      def insert(index, num)
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size

        # 要素数が容量を超える場合、容量を拡張する
        extend_capacity if size == capacity

        # インデックス index 以降の全要素を後ろに 1 つずらす
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # 要素数を更新する
        @size += 1
      end

      ### 要素を削除する ###
      def remove(index)
        raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
        num = @arr[index]

        # インデックス index より後の全要素を前に 1 つずらす
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # 要素数を更新する
        @size -= 1

        # 削除した要素を返す
        num
      end

      ### リストの容量を拡張する ###
      def extend_capacity
        # 元の配列の extend_ratio 倍の長さの配列を新たに作成し、元の配列をコピーする
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # リストの容量を更新する
        @capacity = arr.length
      end

      ### リストを配列に変換する ###
      def to_array
        sz = size
        # 有効な長さの範囲内にあるリストの要素だけを変換する
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20def%20__init__%28self%29%3A%0A%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20self._size%3A%20int%20%3D%200%0A%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E9%95%B7%E3%81%95%EF%BC%88%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E6%95%B0%EF%BC%89%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20return%20self._capacity%0A%0A%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20return%20self._arr%5Bindex%5D%0A%0A%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20self.extend_capacity%28%29%0A%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20%20self.extend_capacity%28%29%0A%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20index%20%E4%BB%A5%E9%99%8D%E3%81%AE%E5%85%A8%E8%A6%81%E7%B4%A0%E3%82%92%E5%BE%8C%E3%82%8D%E3%81%AB%201%20%E3%81%A4%E3%81%9A%E3%82%89%E3%81%99%0A%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20i%20%E3%82%88%E3%82%8A%E5%BE%8C%E3%81%AE%E5%85%A8%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8D%E3%81%AB%201%20%E3%81%A4%E3%81%9A%E3%82%89%E3%81%99%0A%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20extend_capacity%28self%29%3A%0A%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E6%8B%A1%E5%BC%B5%E3%81%99%E3%82%8B%22%22%22%0A%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20nums%20%3D%20MyList%28%29%0A%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20nums.add%281%29%0A%20nums.add%283%29%0A%20nums.add%282%29%0A%20nums.add%285%29%0A%20nums.add%284%29%0A%0A%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20nums.insert%286,%20index%3D3%29%0A%0A%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20nums.remove%283%29%0A%0A%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%0A%20num%20%3D%20nums.get%281%29%0A%0A%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20nums.set%280,%201%29%0A%0A%20%23%20%E5%AE%B9%E9%87%8F%E3%81%AE%E6%8B%A1%E5%BC%B5%E3%82%92%E3%83%86%E3%82%B9%E3%83%88%E3%81%99%E3%82%8B%0A%20for%20i%20in%20range%2810%29%3A%0A%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20def%20__init__%28self%29%3A%0A%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20self._size%3A%20int%20%3D%200%0A%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E9%95%B7%E3%81%95%EF%BC%88%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E6%95%B0%EF%BC%89%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%22%22%22%0A%20%20return%20self._capacity%0A%0A%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20return%20self._arr%5Bindex%5D%0A%0A%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20self.extend_capacity%28%29%0A%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20%20self.extend_capacity%28%29%0A%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20index%20%E4%BB%A5%E9%99%8D%E3%81%AE%E5%85%A8%E8%A6%81%E7%B4%A0%E3%82%92%E5%BE%8C%E3%82%8D%E3%81%AB%201%20%E3%81%A4%E3%81%9A%E3%82%89%E3%81%99%0A%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%A7%E3%81%99%22%29%0A%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20i%20%E3%82%88%E3%82%8A%E5%BE%8C%E3%81%AE%E5%85%A8%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8D%E3%81%AB%201%20%E3%81%A4%E3%81%9A%E3%82%89%E3%81%99%0A%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20extend_capacity%28self%29%3A%0A%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E6%8B%A1%E5%BC%B5%E3%81%99%E3%82%8B%22%22%22%0A%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20nums%20%3D%20MyList%28%29%0A%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B%0A%20nums.add%281%29%0A%20nums.add%283%29%0A%20nums.add%282%29%0A%20nums.add%285%29%0A%20nums.add%284%29%0A%0A%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20nums.insert%286,%20index%3D3%29%0A%0A%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20nums.remove%283%29%0A%0A%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%0A%20num%20%3D%20nums.get%281%29%0A%0A%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20nums.set%280,%201%29%0A%0A%20%23%20%E5%AE%B9%E9%87%8F%E3%81%AE%E6%8B%A1%E5%BC%B5%E3%82%92%E3%83%86%E3%82%B9%E3%83%88%E3%81%99%E3%82%8B%0A%20for%20i%20in%20range%2810%29%3A%0A%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
