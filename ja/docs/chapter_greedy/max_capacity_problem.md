---
comments: true
---

# 15.3 &nbsp; 最大容量問題

!!! question "問題"

    配列 $ht$ が与えられ、各要素は垂直な仕切り板の高さを表します。配列から任意の 2 枚を選ぶと、その間の空間と合わせて 1 つの容器になります。
    
    容器の容量は高さと幅の積（面積）です。高さは低いほうの板で決まり、幅は 2 枚の板の配列インデックスの差です。
    
    容量が最大になるように配列から 2 枚の板を選び、その最大容量を返してください。図 15-7 に例を示します。

![最大容量問題のデータ例](max_capacity_problem.assets/max_capacity_example.svg){ class="animation-figure" }

<p align="center"> 図 15-7 &nbsp; 最大容量問題のデータ例 </p>

どの 2 枚の板でも容器を作れるので、**この問題の状態は 2 枚の板のインデックスで表し、$[i, j]$ と書きます**。

容量は高さと幅の積です。高さは低い板で決まり、幅は 2 枚の板の配列インデックスの差です。容量を $cap[i, j]$ と表すと、次の式が得られます。

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

配列の長さを $n$ とすると、2 枚の板の組み合わせ（状態の総数）は $C_n^2 = \frac{n(n - 1)}{2}$ 通りです。最も直接的な方法は、**すべての状態を列挙して**最大容量を求めることです。時間計算量は $O(n^2)$ です。

### 1. &nbsp; 貪欲戦略の決め方

もっと効率のよい解き方があります。図 15-8 のように、インデックスが $i < j$、高さが $ht[i] < ht[j]$ を満たす状態 $[i, j]$ を選びます。つまり $i$ が低い板、$j$ が高い板です。

![初期状態](max_capacity_problem.assets/max_capacity_initial_state.svg){ class="animation-figure" }

<p align="center"> 図 15-8 &nbsp; 初期状態 </p>

図 15-9 のように、**高い板 $j$ を低い板 $i$ に近づけると、容量は必ず小さくなります**。

高い板 $j$ を動かすと、幅 $j-i$ は必ず狭くなります。一方、高さは低い板で決まるため、変わらない（$i$ が依然として低い板）か、小さくなる（移動後の $j$ が低い板になる）かのどちらかです。

![高い板を内側へ動かした後の状態](max_capacity_problem.assets/max_capacity_moving_long_board.svg){ class="animation-figure" }

<p align="center"> 図 15-9 &nbsp; 高い板を内側へ動かした後の状態 </p>

逆に考えると、**容量が大きくなる可能性があるのは、低い板 $i$ を内側へ動かしたときだけです**。幅は必ず狭くなりますが、**高さは大きくなる可能性がある**からです（移動後の $i$ の板は元の板より高いかもしれません）。実際、図 15-10 では低い板を動かすと面積が増えています。

![低い板を内側へ動かした後の状態](max_capacity_problem.assets/max_capacity_moving_short_board.svg){ class="animation-figure" }

<p align="center"> 図 15-10 &nbsp; 低い板を内側へ動かした後の状態 </p>

ここから、この問題の貪欲戦略を導けます。まず 2 本のポインタを容器の両端に置きます。毎回、低い板のポインタを内側へ動かし、2 本のポインタが出会うまで繰り返します。

図 15-11 は、この貪欲戦略を実行する過程を示しています。

1. 初期状態では、ポインタ $i$ と $j$ を配列の両端に置きます。
2. 現在の状態の容量 $cap[i, j]$ を計算し、最大容量を更新します。
3. 板 $i$ と板 $j$ の高さを比べ、低いほうのポインタを内側へ 1 つ動かします。
4. ステップ `2.` と `3.` を繰り返し、$i$ と $j$ が出会ったら終了します。

=== "<1>"
    ![最大容量問題を貪欲法で解く過程](max_capacity_problem.assets/max_capacity_greedy_step1.svg){ class="animation-figure" }

=== "<2>"
    ![max_capacity_greedy_step2](max_capacity_problem.assets/max_capacity_greedy_step2.svg){ class="animation-figure" }

=== "<3>"
    ![max_capacity_greedy_step3](max_capacity_problem.assets/max_capacity_greedy_step3.svg){ class="animation-figure" }

=== "<4>"
    ![max_capacity_greedy_step4](max_capacity_problem.assets/max_capacity_greedy_step4.svg){ class="animation-figure" }

=== "<5>"
    ![max_capacity_greedy_step5](max_capacity_problem.assets/max_capacity_greedy_step5.svg){ class="animation-figure" }

=== "<6>"
    ![max_capacity_greedy_step6](max_capacity_problem.assets/max_capacity_greedy_step6.svg){ class="animation-figure" }

=== "<7>"
    ![max_capacity_greedy_step7](max_capacity_problem.assets/max_capacity_greedy_step7.svg){ class="animation-figure" }

=== "<8>"
    ![max_capacity_greedy_step8](max_capacity_problem.assets/max_capacity_greedy_step8.svg){ class="animation-figure" }

=== "<9>"
    ![max_capacity_greedy_step9](max_capacity_problem.assets/max_capacity_greedy_step9.svg){ class="animation-figure" }

<p align="center"> 図 15-11 &nbsp; 最大容量問題を貪欲法で解く過程 </p>

### 2. &nbsp; コードによる実装

ループは最大 $n$ 回なので、**時間計算量は $O(n)$ です**。

変数 $i$、$j$、$res$ が使う追加領域は一定なので、**空間計算量は $O(1)$ です**。

=== "Python"

    ```python title="max_capacity.py"
    def max_capacity(ht: list[int]) -> int:
        """最大容量（貪欲法）"""
        # i と j を配列の両端に置く
        i, j = 0, len(ht) - 1
        # 最大容量の初期値は 0
        res = 0
        # 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while i < j:
            # 最大容量を更新する
            cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            # 低い板のポインタを内側へ動かす
            if ht[i] < ht[j]:
                i += 1
            else:
                j -= 1
        return res
    ```

=== "C++"

    ```cpp title="max_capacity.cpp"
    /* 最大容量（貪欲法） */
    int maxCapacity(vector<int> &ht) {
        // i と j を配列の両端に置く
        int i = 0, j = ht.size() - 1;
        // 最大容量の初期値は 0
        int res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = min(ht[i], ht[j]) * (j - i);
            res = max(res, cap);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    int maxCapacity(int[] ht) {
        // i と j を配列の両端に置く
        int i = 0, j = ht.length - 1;
        // 最大容量の初期値は 0
        int res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    int MaxCapacity(int[] ht) {
        // i と j を配列の両端に置く
        int i = 0, j = ht.Length - 1;
        // 最大容量の初期値は 0
        int res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    func maxCapacity(ht []int) int {
        // i と j を配列の両端に置く
        i, j := 0, len(ht)-1
        // 最大容量の初期値は 0
        res := 0
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        for i < j {
            // 最大容量を更新する
            capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
            res = int(math.Max(float64(res), float64(capacity)))
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    func maxCapacity(ht: [Int]) -> Int {
        // i と j を配列の両端に置く
        var i = ht.startIndex, j = ht.endIndex - 1
        // 最大容量の初期値は 0
        var res = 0
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while i < j {
            // 最大容量を更新する
            let cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    function maxCapacity(ht) {
        // i と j を配列の両端に置く
        let i = 0,
            j = ht.length - 1;
        // 最大容量の初期値は 0
        let res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            const cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    function maxCapacity(ht: number[]): number {
        // i と j を配列の両端に置く
        let i = 0,
            j = ht.length - 1;
        // 最大容量の初期値は 0
        let res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            const cap: number = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    int maxCapacity(List<int> ht) {
      // i と j を配列の両端に置く
      int i = 0, j = ht.length - 1;
      // 最大容量の初期値は 0
      int res = 0;
      // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
      while (i < j) {
        // 最大容量を更新する
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    fn max_capacity(ht: &[i32]) -> i32 {
        // i と j を配列の両端に置く
        let mut i = 0;
        let mut j = ht.len() - 1;
        // 最大容量の初期値は 0
        let mut res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while i < j {
            // 最大容量を更新する
            let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
            res = std::cmp::max(res, cap);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    int maxCapacity(int ht[], int htLength) {
        // i と j を配列の両端に置く
        int i = 0;
        int j = htLength - 1;
        // 最大容量の初期値は 0
        int res = 0;
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int capacity = myMin(ht[i], ht[j]) * (j - i);
            res = myMax(res, capacity);
            // 低い板のポインタを内側へ動かす
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
    /* 最大容量（貪欲法） */
    fun maxCapacity(ht: IntArray): Int {
        // i と j を配列の両端に置く
        var i = 0
        var j = ht.size - 1
        // 最大容量の初期値は 0
        var res = 0
        // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            val cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // 低い板のポインタを内側へ動かす
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
    ### 最大容量（貪欲法） ###
    def max_capacity(ht)
      # i と j を配列の両端に置く
      i, j = 0, ht.length - 1
      # 最大容量の初期値は 0
      res = 0

      # 両方の板が同じ位置に来るまで貪欲選択を繰り返す
      while i < j
        # 最大容量を更新する
        cap = [ht[i], ht[j]].min * (j - i)
        res = [res, cap].max
        # 低い板のポインタを内側へ動かす
        if ht[i] < ht[j]
          i += 1
        else
          j -= 1
        end
      end

      res
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20max_capacity%28ht%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%EF%BC%88%E8%B2%AA%E6%AC%B2%E6%B3%95%EF%BC%89%22%22%22%0A%20%20%20%20%23%20i%20%E3%81%A8%20j%20%E3%82%92%E9%85%8D%E5%88%97%E3%81%AE%E4%B8%A1%E7%AB%AF%E3%81%AB%E7%BD%AE%E3%81%8F%0A%20%20%20%20i,%20j%20%3D%200,%20len%28ht%29%20-%201%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AE%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AF%200%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E4%B8%A1%E6%96%B9%E3%81%AE%E6%9D%BF%E3%81%8C%E5%90%8C%E3%81%98%E4%BD%8D%E7%BD%AE%E3%81%AB%E6%9D%A5%E3%82%8B%E3%81%BE%E3%81%A7%E8%B2%AA%E6%AC%B2%E9%81%B8%E6%8A%9E%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20cap%20%3D%20min%28ht%5Bi%5D,%20ht%5Bj%5D%29%20%2A%20%28j%20-%20i%29%0A%20%20%20%20%20%20%20%20res%20%3D%20max%28res,%20cap%29%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%8E%E3%81%84%E6%9D%BF%E3%81%AE%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%E3%82%92%E5%86%85%E5%81%B4%E3%81%B8%E5%8B%95%E3%81%8B%E3%81%99%0A%20%20%20%20%20%20%20%20if%20ht%5Bi%5D%20%3C%20ht%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20ht%20%3D%20%5B3,%208,%205,%202,%207,%207,%203,%204%5D%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%0A%20%20%20%20res%20%3D%20max_capacity%28ht%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20max_capacity%28ht%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%EF%BC%88%E8%B2%AA%E6%AC%B2%E6%B3%95%EF%BC%89%22%22%22%0A%20%20%20%20%23%20i%20%E3%81%A8%20j%20%E3%82%92%E9%85%8D%E5%88%97%E3%81%AE%E4%B8%A1%E7%AB%AF%E3%81%AB%E7%BD%AE%E3%81%8F%0A%20%20%20%20i,%20j%20%3D%200,%20len%28ht%29%20-%201%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AE%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AF%200%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E4%B8%A1%E6%96%B9%E3%81%AE%E6%9D%BF%E3%81%8C%E5%90%8C%E3%81%98%E4%BD%8D%E7%BD%AE%E3%81%AB%E6%9D%A5%E3%82%8B%E3%81%BE%E3%81%A7%E8%B2%AA%E6%AC%B2%E9%81%B8%E6%8A%9E%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20cap%20%3D%20min%28ht%5Bi%5D,%20ht%5Bj%5D%29%20%2A%20%28j%20-%20i%29%0A%20%20%20%20%20%20%20%20res%20%3D%20max%28res,%20cap%29%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%8E%E3%81%84%E6%9D%BF%E3%81%AE%E3%83%9D%E3%82%A4%E3%83%B3%E3%82%BF%E3%82%92%E5%86%85%E5%81%B4%E3%81%B8%E5%8B%95%E3%81%8B%E3%81%99%0A%20%20%20%20%20%20%20%20if%20ht%5Bi%5D%20%3C%20ht%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20ht%20%3D%20%5B3,%208,%205,%202,%207,%207,%203,%204%5D%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%0A%20%20%20%20res%20%3D%20max_capacity%28ht%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 3. &nbsp; 正しさの証明

貪欲法が全列挙より速いのは、各回の貪欲選択でいくつかの状態を「飛ばす」ためです。

例えば状態 $cap[i, j]$ で、$i$ が低い板、$j$ が高い板だとします。貪欲に低い板 $i$ を内側へ 1 つ動かすと、図 15-12 の状態を「飛ばす」ことになります。**つまり、この先これらの状態の容量を調べる機会はありません**。

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![低い板を動かすことで飛ばされる状態](max_capacity_problem.assets/max_capacity_skipped_states.svg){ class="animation-figure" }

<p align="center"> 図 15-12 &nbsp; 低い板を動かすことで飛ばされる状態 </p>

図をよく見ると、**飛ばされるのは、高い板 $j$ だけを内側に動かして得られるすべての状態です**。高い板を内側に動かすと容量が必ず小さくなることは、すでに示しました。つまり、飛ばされる状態はいずれも最適解にはなり得ず、**飛ばしても最適解を見落としません**。

以上から、低い板を動かす操作は「安全」であり、この貪欲戦略が有効だとわかります。
