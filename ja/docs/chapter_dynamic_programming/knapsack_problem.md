---
comments: true
---

# 14.4 &nbsp; 0-1 ナップサック問題

ナップサック問題は、動的計画法の入門として非常に適した問題であり、動的計画法で最もよく見られる問題形式の1つです。これには 0-1 ナップサック問題、完全ナップサック問題、多重ナップサック問題など、多くの派生があります。

本節では、まず最も一般的な 0-1 ナップサック問題を解いていきます。

!!! question

    $n$ 個の品物が与えられ、$i$ 番目の品物の重さは $wgt[i-1]$、価値は $val[i-1]$ であり、容量 $cap$ のナップサックがあります。各品物は1回しか選べないとき、ナップサック容量の制約下で入れられる品物の最大価値を求めてください。

以下の図を見てみましょう。品物番号 $i$ は $1$ から始まり、配列のインデックスは $0$ から始まるため、品物 $i$ は重さ $wgt[i-1]$、価値 $val[i-1]$ に対応します。

![0-1 ナップサックのサンプルデータ](knapsack_problem.assets/knapsack_example.png){ class="animation-figure" }

<p align="center"> 図 14-17 &nbsp; 0-1 ナップサックのサンプルデータ </p>

0-1 ナップサック問題は、$n$ 回の意思決定からなる過程とみなせます。各品物について「入れない」「入れる」という2つの選択肢があるため、この問題は決定木モデルを満たします。

この問題の目的は「ナップサック容量の制約下で入れられる品物の最大価値」を求めることなので、動的計画法の問題である可能性が高いです。

**ステップ1：各ラウンドの選択を考え、状態を定義して、$dp$ テーブルを得る**

各品物について、ナップサックに入れなければ容量は変わらず、入れれば容量は減少します。ここから状態を、現在の品物番号 $i$ とナップサック容量 $c$ として定義し、$[i, c]$ と表せます。

状態 $[i, c]$ に対応する部分問題は、**先頭 $i$ 個の品物を容量 $c$ のナップサックに入れるときの最大価値** であり、これを $dp[i, c]$ と記します。

求めるべきものは $dp[n, cap]$ なので、サイズ $(n+1) \times (cap+1)$ の2次元 $dp$ テーブルが必要です。

**ステップ2：最適部分構造を見つけ、状態遷移方程式を導く**

品物 $i$ に対する選択を行った後に残るのは、先頭 $i-1$ 個の品物に対する部分問題であり、次の2つのケースに分けられます。

- **品物 $i$ を入れない** ：ナップサック容量は変わらず、状態は $[i-1, c]$ に変化します。
- **品物 $i$ を入れる** ：ナップサック容量は $wgt[i-1]$ だけ減少し、価値は $val[i-1]$ だけ増加して、状態は $[i-1, c-wgt[i-1]]$ に変化します。

以上の分析から、この問題の最適部分構造が分かります。すなわち、**最大価値 $dp[i, c]$ は、品物 $i$ を入れない場合と入れる場合のうち、より価値の大きい方に等しい** ということです。これにより、次の状態遷移方程式を導けます。

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

注意すべき点として、現在の品物の重さ $wgt[i - 1]$ が残りのナップサック容量 $c$ を超える場合は、入れない選択しかできません。

**ステップ3：境界条件と状態遷移の順序を決める**

品物がない場合、またはナップサック容量が $0$ の場合、最大価値は $0$ です。すなわち、先頭列 $dp[i, 0]$ と先頭行 $dp[0, c]$ はいずれも $0$ になります。

現在の状態 $[i, c]$ は、上側の状態 $[i-1, c]$ と左上の状態 $[i-1, c-wgt[i-1]]$ から遷移してくるため、2重ループで $dp$ テーブル全体を順方向に走査すれば十分です。

以上の分析に基づき、次に全探索、メモ化探索、動的計画法の順で実装していきます。

### 1. &nbsp; 方法1：全探索

探索コードには次の要素が含まれます。

- **再帰引数**：状態 $[i, c]$ です。
- **戻り値**：部分問題の解 $dp[i, c]$ です。
- **終了条件**：品物番号が範囲外である $i = 0$、またはナップサックの残り容量が $0$ のとき、再帰を終了して価値 $0$ を返します。
- **枝刈り**：現在の品物の重さがナップサックの残り容量を超える場合、入れない選択しかできません。

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
        """0-1 ナップサック：総当たり探索"""
        # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 or c == 0:
            return 0
        # ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i - 1] > c:
            return knapsack_dfs(wgt, val, i - 1, c)
        # 品物 i を入れない場合と入れる場合の最大価値を計算する
        no = knapsack_dfs(wgt, val, i - 1, c)
        yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
        # 2つの案のうち価値が大きいほうを返す
        return max(no, yes)
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 ナップサック：総当たり探索 */
    int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return max(no, yes);
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 ナップサック：総当たり探索 */
    int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return Math.max(no, yes);
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 ナップサック：総当たり探索 */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return Math.Max(no, yes);
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 ナップサック：総当たり探索 */
    func knapsackDFS(wgt, val []int, i, c int) int {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 || c == 0 {
            return 0
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i-1] > c {
            return knapsackDFS(wgt, val, i-1, c)
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        no := knapsackDFS(wgt, val, i-1, c)
        yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
        // 2つの案のうち価値が大きいほうを返す
        return int(math.Max(float64(no), float64(yes)))
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 ナップサック：総当たり探索 */
    func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 || c == 0 {
            return 0
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i - 1] > c {
            return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // 2つの案のうち価値が大きいほうを返す
        return max(no, yes)
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 ナップサック：総当たり探索 */
    function knapsackDFS(wgt, val, i, c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i === 0 || c === 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return Math.max(no, yes);
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 ナップサック：総当たり探索 */
    function knapsackDFS(
        wgt: Array<number>,
        val: Array<number>,
        i: number,
        c: number
    ): number {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i === 0 || c === 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return Math.max(no, yes);
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 ナップサック：総当たり探索 */
    int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
      // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
      if (i == 0 || c == 0) {
        return 0;
      }
      // ナップサック容量を超える場合は、入れない選択しかできない
      if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
      }
      // 品物 i を入れない場合と入れる場合の最大価値を計算する
      int no = knapsackDFS(wgt, val, i - 1, c);
      int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
      // 2つの案のうち価値が大きいほうを返す
      return max(no, yes);
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 ナップサック：総当たり探索 */
    fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 || c == 0 {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        let no = knapsack_dfs(wgt, val, i - 1, c);
        let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        std::cmp::max(no, yes)
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 ナップサック：総当たり探索 */
    int knapsackDFS(int wgt[], int val[], int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2つの案のうち価値が大きいほうを返す
        return myMax(no, yes);
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 ナップサック：総当たり探索 */
    fun knapsackDFS(
        wgt: IntArray,
        _val: IntArray,
        i: Int,
        c: Int
    ): Int {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, _val, i - 1, c)
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        val no = knapsackDFS(wgt, _val, i - 1, c)
        val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // 2つの案のうち価値が大きいほうを返す
        return max(no, yes)
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 ナップサック: 全探索 ###
    def knapsack_dfs(wgt, val, i, c)
      # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
      return 0 if i == 0 || c == 0
      # ナップサック容量を超える場合は、入れない選択しかできない
      return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
      # 品物 i を入れない場合と入れる場合の最大価値を計算する
      no = knapsack_dfs(wgt, val, i - 1, c)
      yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
      # 2つの案のうち価値が大きいほうを返す
      [no, yes].max
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20i%3A%20int%2C%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E7%B7%8F%E5%BD%93%E3%81%9F%E3%82%8A%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E5%93%81%E7%89%A9%E3%82%92%E9%81%B8%E3%81%B3%E7%B5%82%E3%81%88%E3%81%9F%E3%81%8B%E3%80%81%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AB%E6%AE%8B%E3%82%8A%E5%AE%B9%E9%87%8F%E3%81%8C%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81%E4%BE%A1%E5%80%A4%200%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AF%E3%80%81%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E9%81%B8%E6%8A%9E%E3%81%97%E3%81%8B%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E5%85%A5%E3%82%8C%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%202%E3%81%A4%E3%81%AE%E6%A1%88%E3%81%AE%E3%81%86%E3%81%A1%E4%BE%A1%E5%80%A4%E3%81%8C%E5%A4%A7%E3%81%8D%E3%81%84%E3%81%BB%E3%81%86%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20max%28no%2C%20yes%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20i%3A%20int%2C%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E7%B7%8F%E5%BD%93%E3%81%9F%E3%82%8A%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E5%93%81%E7%89%A9%E3%82%92%E9%81%B8%E3%81%B3%E7%B5%82%E3%81%88%E3%81%9F%E3%81%8B%E3%80%81%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AB%E6%AE%8B%E3%82%8A%E5%AE%B9%E9%87%8F%E3%81%8C%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81%E4%BE%A1%E5%80%A4%200%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AF%E3%80%81%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E9%81%B8%E6%8A%9E%E3%81%97%E3%81%8B%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E5%85%A5%E3%82%8C%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%202%E3%81%A4%E3%81%AE%E6%A1%88%E3%81%AE%E3%81%86%E3%81%A1%E4%BE%A1%E5%80%A4%E3%81%8C%E5%A4%A7%E3%81%8D%E3%81%84%E3%81%BB%E3%81%86%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20max%28no%2C%20yes%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

以下の図のように、各品物ごとに「選ばない」「選ぶ」の2つの探索分岐が生じるため、時間計算量は $O(2^n)$ です。

再帰木を観察すると、$dp[1, 10]$ などの重複部分問題が存在することが分かります。品物数が多く、ナップサック容量が大きく、特に同じ重さの品物が多い場合には、重複部分問題の数は大幅に増加します。

![0-1 ナップサック問題の全探索の再帰木](knapsack_problem.assets/knapsack_dfs.png){ class="animation-figure" }

<p align="center"> 図 14-18 &nbsp; 0-1 ナップサック問題の全探索の再帰木 </p>

### 2. &nbsp; 方法2：メモ化探索

重複部分問題が一度だけ計算されるようにするため、メモ配列 `mem` を用いて部分問題の解を記録します。ここで `mem[i][c]` は $dp[i, c]$ に対応します。

メモ化を導入すると、**時間計算量は部分問題の数に依存し**、すなわち $O(n \times cap)$ になります。実装コードは次のとおりです。

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs_mem(
        wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
    ) -> int:
        """0-1 ナップサック：メモ化探索"""
        # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 or c == 0:
            return 0
        # 既に記録があればそのまま返す
        if mem[i][c] != -1:
            return mem[i][c]
        # ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i - 1] > c:
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        # 品物 i を入れない場合と入れる場合の最大価値を計算する
        no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
        # 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = max(no, yes)
        return mem[i][c]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 ナップサック：メモ化探索 */
    int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = max(no, yes);
        return mem[i][c];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 ナップサック：メモ化探索 */
    int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 ナップサック：メモ化探索 */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 ナップサック：メモ化探索 */
    func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 || c == 0 {
            return 0
        }
        // 既に記録があればそのまま返す
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i-1] > c {
            return knapsackDFSMem(wgt, val, mem, i-1, c)
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        no := knapsackDFSMem(wgt, val, mem, i-1, c)
        yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
        // 2つの案のうち価値が大きいほうを返す
        mem[i][c] = int(math.Max(float64(no), float64(yes)))
        return mem[i][c]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 ナップサック：メモ化探索 */
    func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 || c == 0 {
            return 0
        }
        // 既に記録があればそのまま返す
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i - 1] > c {
            return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 ナップサック：メモ化探索 */
    function knapsackDFSMem(wgt, val, mem, i, c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i === 0 || c === 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 ナップサック：メモ化探索 */
    function knapsackDFSMem(
        wgt: Array<number>,
        val: Array<number>,
        mem: Array<Array<number>>,
        i: number,
        c: number
    ): number {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i === 0 || c === 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 ナップサック：メモ化探索 */
    int knapsackDFSMem(
      List<int> wgt,
      List<int> val,
      List<List<int>> mem,
      int i,
      int c,
    ) {
      // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
      if (i == 0 || c == 0) {
        return 0;
      }
      // 既に記録があればそのまま返す
      if (mem[i][c] != -1) {
        return mem[i][c];
      }
      // ナップサック容量を超える場合は、入れない選択しかできない
      if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
      }
      // 品物 i を入れない場合と入れる場合の最大価値を計算する
      int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
      int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
      // 2 つの案のうち価値が大きい方を記録して返す
      mem[i][c] = max(no, yes);
      return mem[i][c];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 ナップサック：メモ化探索 */
    fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if i == 0 || c == 0 {
            return 0;
        }
        // 既に記録があればそのまま返す
        if mem[i][c] != -1 {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = std::cmp::max(no, yes);
        mem[i][c]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 ナップサック：メモ化探索 */
    int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0;
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = myMax(no, yes);
        return mem[i][c];
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 ナップサック：メモ化探索 */
    fun knapsackDFSMem(
        wgt: IntArray,
        _val: IntArray,
        mem: Array<IntArray>,
        i: Int,
        c: Int
    ): Int {
        // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
        if (i == 0 || c == 0) {
            return 0
        }
        // 既に記録があればそのまま返す
        if (mem[i][c] != -1) {
            return mem[i][c]
        }
        // ナップサック容量を超える場合は、入れない選択しかできない
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, _val, mem, i - 1, c)
        }
        // 品物 i を入れない場合と入れる場合の最大価値を計算する
        val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
        val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // 2 つの案のうち価値が大きい方を記録して返す
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 ナップサック: メモ化探索 ###
    def knapsack_dfs_mem(wgt, val, mem, i, c)
      # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
      return 0 if i == 0 || c == 0
      # 既に記録があればそのまま返す
      return mem[i][c] if mem[i][c] != -1
      # ナップサック容量を超える場合は、入れない選択しかできない
      return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
      # 品物 i を入れない場合と入れる場合の最大価値を計算する
      no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
      yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
      # 2 つの案のうち価値が大きい方を記録して返す
      mem[i][c] = [no, yes].max
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E5%93%81%E7%89%A9%E3%82%92%E9%81%B8%E3%81%B3%E7%B5%82%E3%81%88%E3%81%9F%E3%81%8B%E3%80%81%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AB%E6%AE%8B%E3%82%8A%E5%AE%B9%E9%87%8F%E3%81%8C%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81%E4%BE%A1%E5%80%A4%200%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E6%97%A2%E3%81%AB%E8%A8%98%E9%8C%B2%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AF%E3%80%81%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E9%81%B8%E6%8A%9E%E3%81%97%E3%81%8B%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E5%85%A5%E3%82%8C%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E6%A1%88%E3%81%AE%E3%81%86%E3%81%A1%E4%BE%A1%E5%80%A4%E3%81%8C%E5%A4%A7%E3%81%8D%E3%81%84%E6%96%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no%2C%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E5%93%81%E7%89%A9%E3%82%92%E9%81%B8%E3%81%B3%E7%B5%82%E3%81%88%E3%81%9F%E3%81%8B%E3%80%81%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AB%E6%AE%8B%E3%82%8A%E5%AE%B9%E9%87%8F%E3%81%8C%E3%81%AA%E3%81%91%E3%82%8C%E3%81%B0%E3%80%81%E4%BE%A1%E5%80%A4%200%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E6%97%A2%E3%81%AB%E8%A8%98%E9%8C%B2%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AF%E3%80%81%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E9%81%B8%E6%8A%9E%E3%81%97%E3%81%8B%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E5%85%A5%E3%82%8C%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E5%85%A5%E3%82%8C%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%202%20%E3%81%A4%E3%81%AE%E6%A1%88%E3%81%AE%E3%81%86%E3%81%A1%E4%BE%A1%E5%80%A4%E3%81%8C%E5%A4%A7%E3%81%8D%E3%81%84%E6%96%B9%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no%2C%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図は、メモ化探索で剪定された探索分岐を示しています。

![0-1 ナップサック問題のメモ化探索の再帰木](knapsack_problem.assets/knapsack_dfs_mem.png){ class="animation-figure" }

<p align="center"> 図 14-19 &nbsp; 0-1 ナップサック問題のメモ化探索の再帰木 </p>

### 3. &nbsp; 方法3：動的計画法

動的計画法の本質は、状態遷移に従って $dp$ テーブルを埋めていく過程です。コードは次のようになります。

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 ナップサック：動的計画法"""
        n = len(wgt)
        # dp テーブルを初期化
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # 状態遷移
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c]
                else:
                    # 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 ナップサック：動的計画法 */
    int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // dp テーブルを初期化
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 ナップサック：動的計画法 */
    int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp テーブルを初期化
        int[][] dp = new int[n + 1][cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 ナップサック：動的計画法 */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // dp テーブルを初期化
        int[,] dp = new int[n + 1, cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 ナップサック：動的計画法 */
    func knapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // dp テーブルを初期化
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // 状態遷移
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i-1][c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 ナップサック：動的計画法 */
    func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // dp テーブルを初期化
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // 状態遷移
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 ナップサック：動的計画法 */
    function knapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // dp テーブルを初期化
        const dp = Array(n + 1)
            .fill(0)
            .map(() => Array(cap + 1).fill(0));
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 ナップサック：動的計画法 */
    function knapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // dp テーブルを初期化
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 ナップサック：動的計画法 */
    int knapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // dp テーブルを初期化
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // ナップサック容量を超えるなら品物 i は選ばない
            dp[i][c] = dp[i - 1][c];
          } else {
            // 品物 i を選ばない場合と選ぶ場合の大きい方
            dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 ナップサック：動的計画法 */
    fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // dp テーブルを初期化
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // 状態遷移
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = std::cmp::max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                    );
                }
            }
        }
        dp[n][cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 ナップサック：動的計画法 */
    int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // dp テーブルを初期化
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // メモリを解放する
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 ナップサック：動的計画法 */
    fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // dp テーブルを初期化
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // 状態遷移
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 ナップサック: 動的計画法 ###
    def knapsack_dp(wgt, val, cap)
      n = wgt.length
      # dp テーブルを初期化
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # 状態遷移
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # ナップサック容量を超えるなら品物 i は選ばない
            dp[i][c] = dp[i - 1][c]
          else
            # 品物 i を選ばない場合と選ぶ場合の大きい方
            dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%AA%E3%82%89%E5%93%81%E7%89%A9%20i%20%E3%81%AF%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E6%96%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%AA%E3%82%89%E5%93%81%E7%89%A9%20i%20%E3%81%AF%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E6%96%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

以下の図のように、時間計算量と空間計算量はいずれも配列 `dp` のサイズによって決まり、$O(n \times cap)$ です。

=== "<1>"
    ![0-1 ナップサック問題の動的計画法の過程](knapsack_problem.assets/knapsack_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png){ class="animation-figure" }

<p align="center"> 図 14-20 &nbsp; 0-1 ナップサック問題の動的計画法の過程 </p>

### 4. &nbsp; 空間最適化

各状態は直前の行の状態にしか依存しないため、2つの配列をローテーションして用いることで、空間計算量を $O(n^2)$ から $O(n)$ に削減できます。

さらに考えると、1つの配列だけで空間最適化を実現できるでしょうか。観察すると、各状態は真上または左上のマスから遷移してきます。配列が1つしかないと仮定すると、$i$ 行目の走査を開始した時点では、その配列にはまだ $i-1$ 行目の状態が格納されています。

- 順方向に走査すると、$dp[i, j]$ に到達した時点で、左上にある $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ の値がすでに上書きされている可能性があり、正しい状態遷移結果を得られません。
- 逆方向に走査すれば、上書きの問題は発生せず、状態遷移を正しく行えます。

次の図は、単一配列のもとで $i = 1$ 行目から $i = 2$ 行目へ変換する過程を示しています。順方向走査と逆方向走査の違いを考えてみてください。

=== "<1>"
    ![0-1 ナップサックの空間最適化後の動的計画法の過程](knapsack_problem.assets/knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> 図 14-21 &nbsp; 0-1 ナップサックの空間最適化後の動的計画法の過程 </p>

コード実装では、配列 `dp` の第1次元 $i$ をそのまま削除し、内側のループを逆方向走査に変更するだけで済みます。

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 ナップサック：空間最適化後の動的計画法"""
        n = len(wgt)
        # dp テーブルを初期化
        dp = [0] * (cap + 1)
        # 状態遷移
        for i in range(1, n + 1):
            # 逆順に走査する
            for c in range(cap, 0, -1):
                if wgt[i - 1] > c:
                    # ナップサック容量を超えるなら品物 i は選ばない
                    dp[c] = dp[c]
                else:
                    # 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // dp テーブルを初期化
        vector<int> dp(cap + 1, 0);
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順に走査する
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp テーブルを初期化
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順に走査する
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // dp テーブルを初期化
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順に走査する
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // ナップサック容量を超えるなら品物 i は選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    func knapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // dp テーブルを初期化
        dp := make([]int, cap+1)
        // 状態遷移
        for i := 1; i <= n; i++ {
            // 逆順に走査する
            for c := cap; c >= 1; c-- {
                if wgt[i-1] <= c {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // dp テーブルを初期化
        var dp = Array(repeating: 0, count: cap + 1)
        // 状態遷移
        for i in 1 ... n {
            // 逆順に走査する
            for c in (1 ... cap).reversed() {
                if wgt[i - 1] <= c {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    function knapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // dp テーブルを初期化
        const dp = Array(cap + 1).fill(0);
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            // 逆順に走査する
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    function knapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // dp テーブルを初期化
        const dp = Array(cap + 1).fill(0);
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            // 逆順に走査する
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // dp テーブルを初期化
      List<int> dp = List.filled(cap + 1, 0);
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        // 逆順に走査する
        for (int c = cap; c >= 1; c--) {
          if (wgt[i - 1] <= c) {
            // 品物 i を選ばない場合と選ぶ場合の大きい方
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // dp テーブルを初期化
        let mut dp = vec![0; cap + 1];
        // 状態遷移
        for i in 1..=n {
            // 逆順に走査する
            for c in (1..=cap).rev() {
                if wgt[i - 1] <= c as i32 {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // dp テーブルを初期化
        int *dp = calloc(cap + 1, sizeof(int));
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            // 逆順に走査する
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // メモリを解放する
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 ナップサック：空間最適化後の動的計画法 */
    fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // dp テーブルを初期化
        val dp = IntArray(cap + 1)
        // 状態遷移
        for (i in 1..n) {
            // 逆順に走査する
            for (c in cap downTo 1) {
                if (wgt[i - 1] <= c) {
                    // 品物 i を選ばない場合と選ぶ場合の大きい方
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    ### 0-1 ナップサック: 空間最適化後の動的計画法 ###
    def knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # dp テーブルを初期化
      dp = Array.new(cap + 1, 0)
      # 状態遷移
      for i in 1...(n + 1)
        # 逆順に走査する
        for c in cap.downto(1)
          if wgt[i - 1] > c
            # ナップサック容量を超えるなら品物 i は選ばない
            dp[c] = dp[c]
          else
            # 品物 i を選ばない場合と選ぶ場合の大きい方
            dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[cap]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%86%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%AA%E3%82%89%E5%93%81%E7%89%A9%20i%20%E3%81%AF%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E6%96%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%80%86%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%AA%E3%82%89%E5%93%81%E7%89%A9%20i%20%E3%81%AF%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E6%96%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>
