---
comments: true
---

# 11.3 &nbsp; バブルソート

<u>バブルソート（bubble sort）</u>は、隣接する要素を繰り返し比較して交換することで整列を行います。この過程が泡のように下から上へ浮かび上がることから、バブルソートと呼ばれます。

次の図に示すように、バブル処理は要素の交換操作によってシミュレートできます。配列の最も左の端から右へ走査し、隣接する要素の大小を順に比較して、「左要素 > 右要素」であれば両者を交換します。走査が終わると、最大の要素は配列の最も右端へ移動します。

=== "<1>"
    ![要素の交換操作でバブル処理をシミュレート](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png){ class="animation-figure" }

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png){ class="animation-figure" }

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png){ class="animation-figure" }

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png){ class="animation-figure" }

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png){ class="animation-figure" }

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png){ class="animation-figure" }

<p align="center"> 図 11-4 &nbsp; 要素の交換操作でバブル処理をシミュレート </p>

## 11.3.1 &nbsp; アルゴリズムの流れ

配列の長さを $n$ とすると、バブルソートの手順は次の図のとおりです。

1. まず、$n$ 個の要素に対して「バブル処理」を行い、**配列中の最大要素を正しい位置へ交換します**。
2. 次に、残りの $n - 1$ 個の要素に対して「バブル処理」を行い、**2 番目に大きい要素を正しい位置へ交換します**。
3. このようにして、$n - 1$ 回の「バブル処理」を終えると、**大きいほうから $n - 1$ 個の要素がすべて正しい位置へ交換されます**。
4. 残った 1 つの要素は必ず最小要素なので、並べ替える必要はなく、これで配列のソートが完了します。

![バブルソートの流れ](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-5 &nbsp; バブルソートの流れ </p>

コード例は次のとおりです。

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """バブルソート"""
        n = len(nums)
        # 外側のループ：未ソート区間は [0, i]
        for i in range(n - 1, 0, -1):
            # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # nums[j] と nums[j + 1] を交換
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* バブルソート */
    void bubbleSort(vector<int> &nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    // ここでは std::swap() 関数を使用する
                    swap(nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* バブルソート */
    void bubbleSort(int[] nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* バブルソート */
    void BubbleSort(int[] nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* バブルソート */
    func bubbleSort(nums []int) {
        // 外側のループ：未ソート区間は [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // nums[j] と nums[j + 1] を交換
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                }
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* バブルソート */
    func bubbleSort(nums: inout [Int]) {
        // 外側のループ：未ソート区間は [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // nums[j] と nums[j + 1] を交換
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* バブルソート */
    function bubbleSort(nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* バブルソート */
    function bubbleSort(nums: number[]): void {
        // 外側のループ：未ソート区間は [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* バブルソート */
    void bubbleSort(List<int> nums) {
      // 外側のループ：未ソート区間は [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // nums[j] と nums[j + 1] を交換
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
          }
        }
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* バブルソート */
    fn bubble_sort(nums: &mut [i32]) {
        // 外側のループ：未ソート区間は [0, i]
        for i in (1..nums.len()).rev() {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // nums[j] と nums[j + 1] を交換
                    nums.swap(j, j + 1);
                }
            }
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* バブルソート */
    void bubbleSort(int nums[], int size) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = size - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                }
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* バブルソート */
    fun bubbleSort(nums: IntArray) {
        // 外側のループ：未ソート区間は [0, i]
        for (i in nums.size - 1 downTo 1) {
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                }
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### バブルソート ###
    def bubble_sort(nums)
      n = nums.length
      # 外側のループ：未ソート区間は [0, i]
      for i in (n - 1).downto(1)
        # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0...i
          if nums[j] > nums[j + 1]
            # nums[j] と nums[j + 1] を交換
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%20%5B0%2C%20i%5D%20%E3%81%AE%E6%9C%80%E5%A4%A7%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AE%E6%9C%80%E5%8F%B3%E7%AB%AF%E3%81%B8%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20nums%5Bj%5D%20%E3%81%A8%20nums%5Bj%20%2B%201%5D%20%E3%82%92%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%20%5B0%2C%20i%5D%20%E3%81%AE%E6%9C%80%E5%A4%A7%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AE%E6%9C%80%E5%8F%B3%E7%AB%AF%E3%81%B8%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20nums%5Bj%5D%20%E3%81%A8%20nums%5Bj%20%2B%201%5D%20%E3%82%92%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 11.3.2 &nbsp; 効率の最適化

ある回の「バブル処理」で交換操作が一度も行われなければ、配列はすでにソート済みであり、結果をそのまま返せることがわかります。したがって、この状況を検出するためのフラグ `flag` を追加し、発生した時点で直ちに返すようにできます。

最適化後も、バブルソートの最悪時間計算量と平均時間計算量は依然として $O(n^2)$ です。ただし、入力配列が完全に整列済みであれば、最良時間計算量は $O(n)$ に達します。

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """バブルソート（フラグ最適化）"""
        n = len(nums)
        # 外側のループ：未ソート区間は [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # フラグを初期化する
            # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # nums[j] と nums[j + 1] を交換
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # 交換する要素を記録
            if not flag:
                break  # このバブル処理で要素交換が一度もなければそのまま終了
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* バブルソート（フラグ最適化） */
    void bubbleSortWithFlag(vector<int> &nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    // ここでは std::swap() 関数を使用する
                    swap(nums[j], nums[j + 1]);
                    flag = true; // 交換する要素を記録
                }
            }
            if (!flag)
                break; // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* バブルソート（フラグ最適化） */
    void bubbleSortWithFlag(int[] nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 交換する要素を記録
                }
            }
            if (!flag)
                break; // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* バブルソート（フラグ最適化） */
    void BubbleSortWithFlag(int[] nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // 交換する要素を記録
                }
            }
            if (!flag) break;     // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* バブルソート（フラグ最適化） */
    func bubbleSortWithFlag(nums []int) {
        // 外側のループ：未ソート区間は [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            flag := false // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // nums[j] と nums[j + 1] を交換
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                    flag = true // 交換する要素を記録
                }
            }
            if flag == false { // このバブル処理で要素交換が一度もなければそのまま終了
                break
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* バブルソート（フラグ最適化） */
    func bubbleSortWithFlag(nums: inout [Int]) {
        // 外側のループ：未ソート区間は [0, i]
        for i in nums.indices.dropFirst().reversed() {
            var flag = false // フラグを初期化する
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // nums[j] と nums[j + 1] を交換
                    nums.swapAt(j, j + 1)
                    flag = true // 交換する要素を記録
                }
            }
            if !flag { // このバブル処理で要素交換が一度もなければそのまま終了
                break
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* バブルソート（フラグ最適化） */
    function bubbleSortWithFlag(nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 交換する要素を記録
                }
            }
            if (!flag) break; // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* バブルソート（フラグ最適化） */
    function bubbleSortWithFlag(nums: number[]): void {
        // 外側のループ：未ソート区間は [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 交換する要素を記録
                }
            }
            if (!flag) break; // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* バブルソート（フラグ最適化） */
    void bubbleSortWithFlag(List<int> nums) {
      // 外側のループ：未ソート区間は [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        bool flag = false; // フラグを初期化する
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // nums[j] と nums[j + 1] を交換
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            flag = true; // 交換する要素を記録
          }
        }
        if (!flag) break; // このバブル処理で要素交換が一度もなければそのまま終了
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* バブルソート（フラグ最適化） */
    fn bubble_sort_with_flag(nums: &mut [i32]) {
        // 外側のループ：未ソート区間は [0, i]
        for i in (1..nums.len()).rev() {
            let mut flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // nums[j] と nums[j + 1] を交換
                    nums.swap(j, j + 1);
                    flag = true; // 交換する要素を記録
                }
            }
            if !flag {
                break; // このバブル処理で要素交換が一度もなければそのまま終了
            };
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* バブルソート（フラグ最適化） */
    void bubbleSortWithFlag(int nums[], int size) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = size - 1; i > 0; i--) {
            bool flag = false;
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                    flag = true;
                }
            }
            if (!flag)
                break;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* バブルソート（フラグ最適化） */
    fun bubbleSortWithFlag(nums: IntArray) {
        // 外側のループ：未ソート区間は [0, i]
        for (i in nums.size - 1 downTo 1) {
            var flag = false // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    flag = true // 交換する要素を記録
                }
            }
            if (!flag) break // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### バブルソート ###
    def bubble_sort(nums)
      n = nums.length
      # 外側のループ：未ソート区間は [0, i]
      for i in (n - 1).downto(1)
        # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0...i
          if nums[j] > nums[j + 1]
            # nums[j] と nums[j + 1] を交換
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end

    # ## バブルソート（フラグ最適化）###
    def bubble_sort_with_flag(nums)
      n = nums.length
      # 外側のループ：未ソート区間は [0, i]
      for i in (n - 1).downto(1)
        flag = false # フラグを初期化する

        # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0...i
          if nums[j] > nums[j + 1]
            # nums[j] と nums[j + 1] を交換
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
            flag = true # 交換する要素を記録
          end
        end

        break unless flag # このバブル処理で要素交換が一度もなければそのまま終了
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%88%E3%83%95%E3%83%A9%E3%82%B0%E6%9C%80%E9%81%A9%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E3%83%95%E3%83%A9%E3%82%B0%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%20%5B0%2C%20i%5D%20%E3%81%AE%E6%9C%80%E5%A4%A7%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AE%E6%9C%80%E5%8F%B3%E7%AB%AF%E3%81%B8%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20nums%5Bj%5D%20%E3%81%A8%20nums%5Bj%20%2B%201%5D%20%E3%82%92%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%E8%A6%81%E7%B4%A0%E3%82%92%E8%A8%98%E9%8C%B2%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E3%81%93%E3%81%AE%E3%83%90%E3%83%96%E3%83%AB%E5%87%A6%E7%90%86%E3%81%A7%E8%A6%81%E7%B4%A0%E4%BA%A4%E6%8F%9B%E3%81%8C%E4%B8%80%E5%BA%A6%E3%82%82%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E7%B5%82%E4%BA%86%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%88%E3%83%95%E3%83%A9%E3%82%B0%E6%9C%80%E9%81%A9%E5%8C%96%EF%BC%89%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E5%A4%96%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%E3%81%AF%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%E3%83%95%E3%83%A9%E3%82%B0%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%23%20%E5%86%85%E5%81%B4%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%9A%E6%9C%AA%E3%82%BD%E3%83%BC%E3%83%88%E5%8C%BA%E9%96%93%20%5B0%2C%20i%5D%20%E3%81%AE%E6%9C%80%E5%A4%A7%E8%A6%81%E7%B4%A0%E3%82%92%E3%81%9D%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AE%E6%9C%80%E5%8F%B3%E7%AB%AF%E3%81%B8%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20nums%5Bj%5D%20%E3%81%A8%20nums%5Bj%20%2B%201%5D%20%E3%82%92%E4%BA%A4%E6%8F%9B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%E4%BA%A4%E6%8F%9B%E3%81%99%E3%82%8B%E8%A6%81%E7%B4%A0%E3%82%92%E8%A8%98%E9%8C%B2%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%E3%81%93%E3%81%AE%E3%83%90%E3%83%96%E3%83%AB%E5%87%A6%E7%90%86%E3%81%A7%E8%A6%81%E7%B4%A0%E4%BA%A4%E6%8F%9B%E3%81%8C%E4%B8%80%E5%BA%A6%E3%82%82%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E7%B5%82%E4%BA%86%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%E3%83%90%E3%83%96%E3%83%AB%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 11.3.3 &nbsp; アルゴリズムの特徴

- **時間計算量は $O(n^2)$、適応的ソート**：各回の「バブル処理」で走査する配列の長さは順に $n - 1$、$n - 2$、$\dots$、$2$、$1$ であり、その総和は $(n - 1) n / 2$ です。`flag` による最適化を導入すると、最良時間計算量は $O(n)$ に達します。
- **空間計算量は $O(1)$、インプレースソート**：ポインタ $i$ と $j$ は定数サイズの追加領域しか使用しません。
- **安定ソート**：「バブル処理」では等しい要素に出会っても交換しないためです。
