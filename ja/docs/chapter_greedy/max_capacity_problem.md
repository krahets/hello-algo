---
comments: true
---

# 15.3 &nbsp; 最大容量問題

!!! question

    配列 $ht$ が与えられ、各要素は垂直な仕切り板の高さを表します。配列内の任意の 2 枚の仕切り板と、その間の空間で容器を構成できます。
    
    容器の容量は高さと幅の積（面積）に等しく、高さは短い方の仕切り板で決まり、幅は 2 枚の仕切り板の配列インデックスの差です。
    
    配列から 2 枚の仕切り板を選び、構成される容器の容量が最大となるようにしてください。最大容量を返します。例を以下の図に示します。

![最大容量問題のサンプルデータ](max_capacity_problem.assets/max_capacity_example.png){ class="animation-figure" }

<p align="center"> 図 15-7 &nbsp; 最大容量問題のサンプルデータ </p>

容器は任意の 2 枚の仕切り板で囲まれるため、**本問の状態は 2 枚の仕切り板のインデックスで表され、$[i, j]$ と記します**。

問題の条件より、容量は高さと幅の積に等しく、高さは短い板で決まり、幅は 2 枚の仕切り板の配列インデックスの差です。容量を $cap[i, j]$ とすると、計算式は次のようになります。

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

配列の長さを $n$ とすると、2 枚の仕切り板の組合せ数（状態総数）は $C_n^2 = \frac{n(n - 1)}{2}$ 個です。最も直接的には、**すべての状態を総当たりできます**。これにより最大容量を求められ、時間計算量は $O(n^2)$ です。

### 1. &nbsp; 貪欲戦略の決定

この問題にはさらに効率的な解法があります。以下の図のように、状態 $[i, j]$ を 1 つ選び、インデックスが $i < j$ かつ高さが $ht[i] < ht[j]$ を満たすとします。つまり、$i$ が短い板、$j$ が長い板です。

![初期状態](max_capacity_problem.assets/max_capacity_initial_state.png){ class="animation-figure" }

<p align="center"> 図 15-8 &nbsp; 初期状態 </p>

以下の図のように、**このとき長い板 $j$ を短い板 $i$ に近づけると、容量は必ず小さくなります**。

これは、長い板 $j$ を動かした後は幅 $j-i$ が必ず小さくなるためです。また、高さは短い板で決まるので、高さは変わらない（ $i$ が依然として短い板）か、小さくなる（移動後の $j$ が短い板になる）ことしかありません。

![長い板を内側へ動かした後の状態](max_capacity_problem.assets/max_capacity_moving_long_board.png){ class="animation-figure" }

<p align="center"> 図 15-9 &nbsp; 長い板を内側へ動かした後の状態 </p>

逆に考えると、**短い板 $i$ を内側へ縮めた場合にのみ、容量が大きくなる可能性があります**。幅は必ず小さくなりますが、**高さは大きくなる可能性がある**からです（移動後の短い板 $i$ がより長くなる可能性があります）。たとえば次の図では、短い板を動かした後に面積が大きくなっています。

![短い板を内側へ動かした後の状態](max_capacity_problem.assets/max_capacity_moving_short_board.png){ class="animation-figure" }

<p align="center"> 図 15-10 &nbsp; 短い板を内側へ動かした後の状態 </p>

以上から、本問の貪欲戦略を導けます。2 本のポインタを初期化して容器の両端に置き、各ラウンドで短い板に対応するポインタを内側へ縮め、2 本のポインタが出会うまで続けます。

以下の図は、貪欲戦略の実行過程を示しています。

1. 初期状態では、ポインタ $i$ と $j$ は配列の両端にあります。
2. 現在の状態の容量 $cap[i, j]$ を計算し、最大容量を更新します。
3. 板 $i$ と板 $j$ の高さを比較し、短い板を内側へ 1 マス移動します。
4. `2.` と `3.` を繰り返し実行し、$i$ と $j$ が出会ったら終了します。

=== "<1>"
    ![最大容量問題の貪欲な過程](max_capacity_problem.assets/max_capacity_greedy_step1.png){ class="animation-figure" }

=== "<2>"
    ![max_capacity_greedy_step2](max_capacity_problem.assets/max_capacity_greedy_step2.png){ class="animation-figure" }

=== "<3>"
    ![max_capacity_greedy_step3](max_capacity_problem.assets/max_capacity_greedy_step3.png){ class="animation-figure" }

=== "<4>"
    ![max_capacity_greedy_step4](max_capacity_problem.assets/max_capacity_greedy_step4.png){ class="animation-figure" }

=== "<5>"
    ![max_capacity_greedy_step5](max_capacity_problem.assets/max_capacity_greedy_step5.png){ class="animation-figure" }

=== "<6>"
    ![max_capacity_greedy_step6](max_capacity_problem.assets/max_capacity_greedy_step6.png){ class="animation-figure" }

=== "<7>"
    ![max_capacity_greedy_step7](max_capacity_problem.assets/max_capacity_greedy_step7.png){ class="animation-figure" }

=== "<8>"
    ![max_capacity_greedy_step8](max_capacity_problem.assets/max_capacity_greedy_step8.png){ class="animation-figure" }

=== "<9>"
    ![max_capacity_greedy_step9](max_capacity_problem.assets/max_capacity_greedy_step9.png){ class="animation-figure" }

<p align="center"> 図 15-11 &nbsp; 最大容量問題の貪欲な過程 </p>

### 2. &nbsp; コード実装

コードのループ回数は最大でも $n$ 回であるため、**時間計算量は $O(n)$** です。

変数 $i$、$j$、$res$ が使う追加領域は定数サイズなので、**空間計算量は $O(1)$** です。

=== "Python"

    ```python title="max_capacity.py"
    def max_capacity(ht: list[int]) -> int:
        """最大容量：貪欲法"""
        # i, j を初期化し、それぞれ配列の両端に置く
        i, j = 0, len(ht) - 1
        # 初期の最大容量は 0
        res = 0
        # 2 枚の板が出会うまで貪欲選択を繰り返す
        while i < j:
            # 最大容量を更新する
            cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            # 短い方を内側へ動かす
            if ht[i] < ht[j]:
                i += 1
            else:
                j -= 1
        return res
    ```

=== "C++"

    ```cpp title="max_capacity.cpp"
    /* 最大容量：貪欲法 */
    int maxCapacity(vector<int> &ht) {
        // i, j を初期化し、それぞれ配列の両端に置く
        int i = 0, j = ht.size() - 1;
        // 初期の最大容量は 0
        int res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = min(ht[i], ht[j]) * (j - i);
            res = max(res, cap);
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }
    ```

=== "Java"

    ```java title="max_capacity.java"
    /* 最大容量：貪欲法 */
    int maxCapacity(int[] ht) {
        // i, j を初期化し、それぞれ配列の両端に置く
        int i = 0, j = ht.length - 1;
        // 初期の最大容量は 0
        int res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="max_capacity.cs"
    /* 最大容量：貪欲法 */
    int MaxCapacity(int[] ht) {
        // i, j を初期化し、それぞれ配列の両端に置く
        int i = 0, j = ht.Length - 1;
        // 初期の最大容量は 0
        int res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }
    ```

=== "Go"

    ```go title="max_capacity.go"
    /* 最大容量：貪欲法 */
    func maxCapacity(ht []int) int {
        // i, j を初期化し、それぞれ配列の両端に置く
        i, j := 0, len(ht)-1
        // 初期の最大容量は 0
        res := 0
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        for i < j {
            // 最大容量を更新する
            capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
            res = int(math.Max(float64(res), float64(capacity)))
            // 短い方を内側へ動かす
            if ht[i] < ht[j] {
                i++
            } else {
                j--
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="max_capacity.swift"
    /* 最大容量：貪欲法 */
    func maxCapacity(ht: [Int]) -> Int {
        // i, j を初期化し、それぞれ配列の両端に置く
        var i = ht.startIndex, j = ht.endIndex - 1
        // 初期の最大容量は 0
        var res = 0
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while i < j {
            // 最大容量を更新する
            let cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // 短い方を内側へ動かす
            if ht[i] < ht[j] {
                i += 1
            } else {
                j -= 1
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="max_capacity.js"
    /* 最大容量：貪欲法 */
    function maxCapacity(ht) {
        // i, j を初期化し、それぞれ配列の両端に置く
        let i = 0,
            j = ht.length - 1;
        // 初期の最大容量は 0
        let res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            const cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i += 1;
            } else {
                j -= 1;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="max_capacity.ts"
    /* 最大容量：貪欲法 */
    function maxCapacity(ht: number[]): number {
        // i, j を初期化し、それぞれ配列の両端に置く
        let i = 0,
            j = ht.length - 1;
        // 初期の最大容量は 0
        let res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            const cap: number = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i += 1;
            } else {
                j -= 1;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="max_capacity.dart"
    /* 最大容量：貪欲法 */
    int maxCapacity(List<int> ht) {
      // i, j を初期化し、それぞれ配列の両端に置く
      int i = 0, j = ht.length - 1;
      // 初期の最大容量は 0
      int res = 0;
      // 2 枚の板が出会うまで貪欲選択を繰り返す
      while (i < j) {
        // 最大容量を更新する
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // 短い方を内側へ動かす
        if (ht[i] < ht[j]) {
          i++;
        } else {
          j--;
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="max_capacity.rs"
    /* 最大容量：貪欲法 */
    fn max_capacity(ht: &[i32]) -> i32 {
        // i, j を初期化し、それぞれ配列の両端に置く
        let mut i = 0;
        let mut j = ht.len() - 1;
        // 初期の最大容量は 0
        let mut res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while i < j {
            // 最大容量を更新する
            let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
            res = std::cmp::max(res, cap);
            // 短い方を内側へ動かす
            if ht[i] < ht[j] {
                i += 1;
            } else {
                j -= 1;
            }
        }
        res
    }
    ```

=== "C"

    ```c title="max_capacity.c"
    /* 最大容量：貪欲法 */
    int maxCapacity(int ht[], int htLength) {
        // i, j を初期化し、それぞれ配列の両端に置く
        int i = 0;
        int j = htLength - 1;
        // 初期の最大容量は 0
        int res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int capacity = myMin(ht[i], ht[j]) * (j - i);
            res = myMax(res, capacity);
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="max_capacity.kt"
    /* 最大容量：貪欲法 */
    fun maxCapacity(ht: IntArray): Int {
        // i, j を初期化し、それぞれ配列の両端に置く
        var i = 0
        var j = ht.size - 1
        // 初期の最大容量は 0
        var res = 0
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            val cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // 短い方を内側へ動かす
            if (ht[i] < ht[j]) {
                i++
            } else {
                j--
            }
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="max_capacity.rb"
    ### 最大容量：貪欲法 ###
    def max_capacity(ht)
      # i, j を初期化し、それぞれ配列の両端に置く
      i, j = 0, ht.length - 1
      # 初期の最大容量は 0
      res = 0

      # 2 枚の板が出会うまで貪欲選択を繰り返す
      while i < j
        # 最大容量を更新する
        cap = [ht[i], ht[j]].min * (j - i)
        res = [res, cap].max
        # 短い方を内側へ動かす
        if ht[i] < ht[j]
          i += 1
        else
          j -= 1
        end
      end

      res
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20max_capacity%28ht%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20i%2C%20j%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81%E3%81%9D%E3%82%8C%E3%81%9E%E3%82%8C%E9%85%8D%E5%88%97%E3%81%AE%E4%B8%A1%E7%AB%AF%E3%81%AB%E7%BD%AE%E3%81%8F%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28ht%29%20-%201%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E3%81%AE%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AF%200%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%202%20%E6%9E%9A%E3%81%AE%E6%9D%BF%E3%81%8C%E5%87%BA%E4%BC%9A%E3%81%86%E3%81%BE%E3%81%A7%E8%B2%AA%E6%AC%B2%E9%81%B8%E6%8A%9E%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20cap%20%3D%20min%28ht%5Bi%5D%2C%20ht%5Bj%5D%29%20%2A%20%28j%20-%20i%29%0A%20%20%20%20%20%20%20%20res%20%3D%20max%28res%2C%20cap%29%0A%20%20%20%20%20%20%20%20%23%20%E7%9F%AD%E3%81%84%E6%96%B9%E3%82%92%E5%86%85%E5%81%B4%E3%81%B8%E5%8B%95%E3%81%8B%E3%81%99%0A%20%20%20%20%20%20%20%20if%20ht%5Bi%5D%20%3C%20ht%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20return%20res%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20ht%20%3D%20%5B3%2C%208%2C%205%2C%202%2C%207%2C%207%2C%203%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%0A%20%20%20%20res%20%3D%20max_capacity%28ht%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20max_capacity%28ht%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20i%2C%20j%20%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%97%E3%80%81%E3%81%9D%E3%82%8C%E3%81%9E%E3%82%8C%E9%85%8D%E5%88%97%E3%81%AE%E4%B8%A1%E7%AB%AF%E3%81%AB%E7%BD%AE%E3%81%8F%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28ht%29%20-%201%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E3%81%AE%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AF%200%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%202%20%E6%9E%9A%E3%81%AE%E6%9D%BF%E3%81%8C%E5%87%BA%E4%BC%9A%E3%81%86%E3%81%BE%E3%81%A7%E8%B2%AA%E6%AC%B2%E9%81%B8%E6%8A%9E%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20cap%20%3D%20min%28ht%5Bi%5D%2C%20ht%5Bj%5D%29%20%2A%20%28j%20-%20i%29%0A%20%20%20%20%20%20%20%20res%20%3D%20max%28res%2C%20cap%29%0A%20%20%20%20%20%20%20%20%23%20%E7%9F%AD%E3%81%84%E6%96%B9%E3%82%92%E5%86%85%E5%81%B4%E3%81%B8%E5%8B%95%E3%81%8B%E3%81%99%0A%20%20%20%20%20%20%20%20if%20ht%5Bi%5D%20%3C%20ht%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20return%20res%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20ht%20%3D%20%5B3%2C%208%2C%205%2C%202%2C%207%2C%207%2C%203%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%0A%20%20%20%20res%20%3D%20max_capacity%28ht%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 3. &nbsp; 正しさの証明

貪欲法が総当たりより速いのは、各ラウンドの貪欲な選択がいくつかの状態を「スキップ」するためです。

たとえば状態 $cap[i, j]$ において、$i$ が短い板、$j$ が長い板だとします。貪欲に短い板 $i$ を内側へ 1 マス動かすと、次の図に示す状態が「スキップ」されます。**これは、その後それらの状態の容量を検証できないことを意味します**。

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![短い板の移動によってスキップされる状態](max_capacity_problem.assets/max_capacity_skipped_states.png){ class="animation-figure" }

<p align="center"> 図 15-12 &nbsp; 短い板の移動によってスキップされる状態 </p>

観察すると、**これらのスキップされた状態は、実際には長い板 $j$ を内側へ動かしたすべての状態そのものです**。前述のとおり、長い板を内側へ動かすと容量は必ず小さくなります。つまり、スキップされた状態はいずれも最適解にはなりえず、**それらを飛ばしても最適解を逃すことはありません**。

以上の分析から、短い板を動かす操作は「安全」であり、貪欲戦略は有効であると分かります。
