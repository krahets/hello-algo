---
comments: true
---

# 15.1 &nbsp; 貪欲アルゴリズム

<u>貪欲アルゴリズム（greedy algorithm）</u>は、最適化問題を解くためによく使われるアルゴリズムです。各段階で、その時点で最もよいと思われる選択、つまり局所的に最適な判断を貪欲に行い、全体の最適解を目指します。簡潔で効率的なため、さまざまな実際の問題に広く使われています。

貪欲アルゴリズムと動的計画法は、どちらも最適化問題でよく使われます。最適部分構造を利用する点などは似ていますが、動作原理は異なります。

- 動的計画法は、それまでの段階のすべての判断を踏まえて現在の判断を考え、過去の部分問題の解から現在の部分問題の解を組み立てます。
- 貪欲アルゴリズムは過去の判断を振り返らず、前に進みながら貪欲な選択を続け、問題の範囲を縮めて解決に至ります。

まず「硬貨の両替」を例に、貪欲アルゴリズムの仕組みを見てみましょう。「個数制限なしナップサック問題」の節で取り上げたので、覚えているかもしれません。

!!! question "問題"

    $n$ 種類の硬貨があり、$i$ 番目の硬貨の額面は $coins[i - 1]$ です。目標金額は $amt$ で、各種類の硬貨は繰り返し選べます。目標金額を作るために必要な硬貨の最小枚数を求めてください。作れない場合は $-1$ を返します。

この問題で使う貪欲戦略を図 15-1 に示します。目標金額に対し、**それを超えない範囲で最も近い額面の硬貨を貪欲に選び**、目標金額を作るまで繰り返します。

![硬貨の両替における貪欲戦略](greedy_algorithm.assets/coin_change_greedy_strategy.png){ class="animation-figure" }

<p align="center"> 図 15-1 &nbsp; 硬貨の両替における貪欲戦略 </p>

実装は次のとおりです。

=== "Python"

    ```python title="coin_change_greedy.py"
    def coin_change_greedy(coins: list[int], amt: int) -> int:
        """硬貨の両替：貪欲法"""
        # coins リストはソート済みと仮定する
        i = len(coins) - 1
        count = 0
        # 残額がなくなるまで貪欲な選択を繰り返す
        while amt > 0:
            # 残額より小さく、残額に最も近い硬貨を探す
            while i > 0 and coins[i] > amt:
                i -= 1
            # coins[i] を選ぶ
            amt -= coins[i]
            count += 1
        # 実行可能な方法が見つからなかった場合、-1 を返す
        return count if amt == 0 else -1
    ```

=== "C++"

    ```cpp title="coin_change_greedy.cpp"
    /* 硬貨の両替：貪欲法 */
    int coinChangeGreedy(vector<int> &coins, int amt) {
        // coins リストはソート済みと仮定する
        int i = coins.size() - 1;
        int count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt == 0 ? count : -1;
    }
    ```

=== "Java"

    ```java title="coin_change_greedy.java"
    /* 硬貨の両替：貪欲法 */
    int coinChangeGreedy(int[] coins, int amt) {
        // coins リストはソート済みと仮定する
        int i = coins.length - 1;
        int count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt == 0 ? count : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change_greedy.cs"
    /* 硬貨の両替：貪欲法 */
    int CoinChangeGreedy(int[] coins, int amt) {
        // coins リストはソート済みと仮定する
        int i = coins.Length - 1;
        int count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt == 0 ? count : -1;
    }
    ```

=== "Go"

    ```go title="coin_change_greedy.go"
    /* 硬貨の両替：貪欲法 */
    func coinChangeGreedy(coins []int, amt int) int {
        // coins リストはソート済みと仮定する
        i := len(coins) - 1
        count := 0
        // 残額がなくなるまで貪欲な選択を繰り返す
        for amt > 0 {
            // 残額より小さく、残額に最も近い硬貨を探す
            for i > 0 && coins[i] > amt {
                i--
            }
            // coins[i] を選ぶ
            amt -= coins[i]
            count++
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        if amt != 0 {
            return -1
        }
        return count
    }
    ```

=== "Swift"

    ```swift title="coin_change_greedy.swift"
    /* 硬貨の両替：貪欲法 */
    func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
        // coins リストはソート済みと仮定する
        var i = coins.count - 1
        var count = 0
        var amt = amt
        // 残額がなくなるまで貪欲な選択を繰り返す
        while amt > 0 {
            // 残額より小さく、残額に最も近い硬貨を探す
            while i > 0 && coins[i] > amt {
                i -= 1
            }
            // coins[i] を選ぶ
            amt -= coins[i]
            count += 1
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt == 0 ? count : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change_greedy.js"
    /* 硬貨の両替：貪欲法 */
    function coinChangeGreedy(coins, amt) {
        // coins 配列はソート済みと仮定する
        let i = coins.length - 1;
        let count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt === 0 ? count : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change_greedy.ts"
    /* 硬貨の両替：貪欲法 */
    function coinChangeGreedy(coins: number[], amt: number): number {
        // coins 配列はソート済みと仮定する
        let i = coins.length - 1;
        let count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt === 0 ? count : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change_greedy.dart"
    /* 硬貨の両替：貪欲法 */
    int coinChangeGreedy(List<int> coins, int amt) {
      // coins リストはソート済みと仮定する
      int i = coins.length - 1;
      int count = 0;
      // 残額がなくなるまで貪欲な選択を繰り返す
      while (amt > 0) {
        // 残額より小さく、残額に最も近い硬貨を探す
        while (i > 0 && coins[i] > amt) {
          i--;
        }
        // coins[i] を選ぶ
        amt -= coins[i];
        count++;
      }
      // 実行可能な方法が見つからなかった場合、-1 を返す
      return amt == 0 ? count : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change_greedy.rs"
    /* 硬貨の両替：貪欲法 */
    fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
        // coins リストはソート済みと仮定する
        let mut i = coins.len() - 1;
        let mut count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while amt > 0 {
            // 残額より小さく、残額に最も近い硬貨を探す
            while i > 0 && coins[i] > amt {
                i -= 1;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count += 1;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        if amt == 0 {
            count
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change_greedy.c"
    /* 硬貨の両替：貪欲法 */
    int coinChangeGreedy(int *coins, int size, int amt) {
        // coins リストはソート済みと仮定する
        int i = size - 1;
        int count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt == 0 ? count : -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_greedy.kt"
    /* 硬貨の両替：貪欲法 */
    fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
        // coins リストはソート済みと仮定する
        var am = amt
        var i = coins.size - 1
        var count = 0
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (am > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > am) {
                i--
            }
            // coins[i] を選ぶ
            am -= coins[i]
            count++
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return if (am == 0) count else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_greedy.rb"
    ### 硬貨の両替：貪欲法 ###
    def coin_change_greedy(coins, amt)
      # coins リストはソート済みと仮定する
      i = coins.length - 1
      count = 0
      # 残額がなくなるまで貪欲な選択を繰り返す
      while amt > 0
        # 残額より小さく、残額に最も近い硬貨を探す
        while i > 0 && coins[i] > amt
          i -= 1
        end
        # coins[i] を選ぶ
        amt -= coins[i]
        count += 1
      end
      # 実行可能な方法が見つからなかった場合、-1 を返す
      amt == 0 ? count : -1
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_greedy%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20coins%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%E3%82%BD%E3%83%BC%E3%83%88%E6%B8%88%E3%81%BF%E3%81%A8%E4%BB%AE%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%20len%28coins%29%20-%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E6%AE%8B%E9%A1%8D%E3%81%8C%E3%81%AA%E3%81%8F%E3%81%AA%E3%82%8B%E3%81%BE%E3%81%A7%E8%B2%AA%E6%AC%B2%E3%81%AA%E9%81%B8%E6%8A%9E%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20amt%20%3E%200%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AE%8B%E9%A1%8D%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%8F%E3%80%81%E6%AE%8B%E9%A1%8D%E3%81%AB%E6%9C%80%E3%82%82%E8%BF%91%E3%81%84%E7%A1%AC%E8%B2%A8%E3%82%92%E6%8E%A2%E3%81%99%0A%20%20%20%20%20%20%20%20while%20i%20%3E%200%20and%20coins%5Bi%5D%20%3E%20amt%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20-%3D%201%0A%20%20%20%20%20%20%20%20%23%20coins%5Bi%5D%20%E3%82%92%E9%81%B8%E3%81%B6%0A%20%20%20%20%20%20%20%20amt%20-%3D%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%23%20%E5%AE%9F%E8%A1%8C%E5%8F%AF%E8%83%BD%E3%81%AA%E6%96%B9%E6%B3%95%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E5%A0%B4%E5%90%88%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20count%20if%20amt%20%3D%3D%200%20else%20-1%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%EF%BC%9A%E5%A4%A7%E5%9F%9F%E7%9A%84%E6%9C%80%E9%81%A9%E8%A7%A3%E3%81%8C%E5%BE%97%E3%82%89%E3%82%8C%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E4%BF%9D%E8%A8%BC%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20coins%20%3D%20%5B1,%205,%2010,%2020,%2050,%20100%5D%0A%20%20%20%20amt%20%3D%20186%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22%7Bamt%7D%20%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%EF%BC%9A%E5%A4%A7%E5%9F%9F%E7%9A%84%E6%9C%80%E9%81%A9%E8%A7%A3%E3%81%8C%E5%BE%97%E3%82%89%E3%82%8C%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E4%BF%9D%E8%A8%BC%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%0A%20%20%20%20coins%20%3D%20%5B1,%2020,%2050%5D%0A%20%20%20%20amt%20%3D%2060%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22%7Bamt%7D%20%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%E5%AE%9F%E9%9A%9B%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%203%20%E3%80%81%E3%81%99%E3%81%AA%E3%82%8F%E3%81%A1%2020%20%2B%2020%20%2B%2020%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_greedy%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20coins%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%E3%82%BD%E3%83%BC%E3%83%88%E6%B8%88%E3%81%BF%E3%81%A8%E4%BB%AE%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20i%20%3D%20len%28coins%29%20-%201%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%E6%AE%8B%E9%A1%8D%E3%81%8C%E3%81%AA%E3%81%8F%E3%81%AA%E3%82%8B%E3%81%BE%E3%81%A7%E8%B2%AA%E6%AC%B2%E3%81%AA%E9%81%B8%E6%8A%9E%E3%82%92%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%99%0A%20%20%20%20while%20amt%20%3E%200%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AE%8B%E9%A1%8D%E3%82%88%E3%82%8A%E5%B0%8F%E3%81%95%E3%81%8F%E3%80%81%E6%AE%8B%E9%A1%8D%E3%81%AB%E6%9C%80%E3%82%82%E8%BF%91%E3%81%84%E7%A1%AC%E8%B2%A8%E3%82%92%E6%8E%A2%E3%81%99%0A%20%20%20%20%20%20%20%20while%20i%20%3E%200%20and%20coins%5Bi%5D%20%3E%20amt%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20-%3D%201%0A%20%20%20%20%20%20%20%20%23%20coins%5Bi%5D%20%E3%82%92%E9%81%B8%E3%81%B6%0A%20%20%20%20%20%20%20%20amt%20-%3D%20coins%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%201%0A%20%20%20%20%23%20%E5%AE%9F%E8%A1%8C%E5%8F%AF%E8%83%BD%E3%81%AA%E6%96%B9%E6%B3%95%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E5%A0%B4%E5%90%88%E3%80%81-1%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20count%20if%20amt%20%3D%3D%200%20else%20-1%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%EF%BC%9A%E5%A4%A7%E5%9F%9F%E7%9A%84%E6%9C%80%E9%81%A9%E8%A7%A3%E3%81%8C%E5%BE%97%E3%82%89%E3%82%8C%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E4%BF%9D%E8%A8%BC%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20coins%20%3D%20%5B1,%205,%2010,%2020,%2050,%20100%5D%0A%20%20%20%20amt%20%3D%20186%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22%7Bamt%7D%20%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%EF%BC%9A%E5%A4%A7%E5%9F%9F%E7%9A%84%E6%9C%80%E9%81%A9%E8%A7%A3%E3%81%8C%E5%BE%97%E3%82%89%E3%82%8C%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E4%BF%9D%E8%A8%BC%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%0A%20%20%20%20coins%20%3D%20%5B1,%2020,%2050%5D%0A%20%20%20%20amt%20%3D%2060%0A%20%20%20%20res%20%3D%20coin_change_greedy%28coins,%20amt%29%0A%20%20%20%20print%28f%22%5Cncoins%20%3D%20%7Bcoins%7D,%20amt%20%3D%20%7Bamt%7D%22%29%0A%20%20%20%20print%28f%22%7Bamt%7D%20%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%E5%AE%9F%E9%9A%9B%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%203%20%E3%80%81%E3%81%99%E3%81%AA%E3%82%8F%E3%81%A1%2020%20%2B%2020%20%2B%2020%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

「なんてすっきりしたコードだろう！」と思うかもしれません。貪欲アルゴリズムなら、わずか 10 行ほどで硬貨の両替問題を解けます。

## 15.1.1 &nbsp; 貪欲アルゴリズムの利点と制約

**貪欲アルゴリズムは操作が直接的で実装が簡単なうえ、通常は効率も高くなります**。上のコードで最小の額面を $\min(coins)$ とすると、貪欲な選択は最大 $amt / \min(coins)$ 回繰り返されるため、時間計算量は $O(amt / \min(coins))$ です。これは、動的計画法の時間計算量 $O(n \times amt)$ より一つのオーダー分小さくなっています。

ただし、**硬貨の額面の組み合わせによっては、貪欲アルゴリズムで最適解を見つけられません**。図 15-2 に二つの例を示します。

- **うまくいく例 $coins = [1, 5, 10, 20, 50, 100]$**：この硬貨の組み合わせでは、どのような $amt$ に対しても、貪欲アルゴリズムで最適解を見つけられます。
- **反例 $coins = [1, 20, 50]$**：$amt = 60$ とすると、貪欲アルゴリズムが得るのは $50 + 1 \times 10$ で、硬貨は計 $11$ 枚です。一方、動的計画法なら最適解 $20 + 20 + 20$ が見つかり、$3$ 枚で済みます。
- **反例 $coins = [1, 49, 50]$**：$amt = 98$ とすると、貪欲アルゴリズムが得るのは $50 + 1 \times 48$ で、硬貨は計 $49$ 枚です。一方、動的計画法なら最適解 $49 + 49$ が見つかり、$2$ 枚で済みます。

![貪欲アルゴリズムで最適解を見つけられない例](greedy_algorithm.assets/coin_change_greedy_vs_dp.png){ class="animation-figure" }

<p align="center"> 図 15-2 &nbsp; 貪欲アルゴリズムで最適解を見つけられない例 </p>

つまり、硬貨の両替問題では、貪欲アルゴリズムで全体の最適解を得られる保証はなく、非常に悪い解を得る可能性もあります。この問題には動的計画法の方が適しています。

一般に、貪欲アルゴリズムが適するのは次の二つの場合です。

1. **最適解を得られる保証がある場合**：バックトラッキングや動的計画法より効率的であることが多く、貪欲アルゴリズムが最良の選択になりやすい場合です。
2. **最適解に近い解を得られる場合**：この場合にも貪欲アルゴリズムを使えます。複雑な問題では全体の最適解を探すのが非常に難しく、最適には及ばなくてもよい解を効率的に得られれば、十分に有用です。

## 15.1.2 &nbsp; 貪欲アルゴリズムの性質

では、どのような問題が貪欲アルゴリズムに適しているのでしょうか。言い換えると、どのような場合に最適解を得られる保証があるのでしょうか。

動的計画法と比べると、貪欲アルゴリズムを使える条件は厳しく、主に次の二つの性質に注目します。

- **貪欲選択性**：局所的に最適な選択が常に全体の最適解につながる場合に限り、貪欲アルゴリズムで最適解を得られることが保証されます。
- **最適部分構造**：元の問題の最適解の中に、部分問題の最適解が含まれています。

最適部分構造は「動的計画法」の章で説明したため、ここでは繰り返しません。なお、最適部分構造が明らかでなくても、貪欲アルゴリズムで解ける問題があります。

ここでは主に、貪欲選択性をどう判断するかを考えます。定義は簡単に見えますが、**多くの問題で貪欲選択性を証明するのは容易ではありません**。

たとえば硬貨の両替問題では、反例を挙げて貪欲選択性を否定するのは簡単ですが、成り立つことを証明するのは難しくなります。**どのような条件を満たす硬貨の組み合わせなら、貪欲アルゴリズムで解けるのでしょうか**。直感や具体例から曖昧な答えを出せても、厳密に数学的証明を与えるのは難しいものです。

!!! quote "引用"

    ある論文では、硬貨の組み合わせが、任意の金額に対して貪欲アルゴリズムで最適解を求められるかどうかを判定する、時間計算量 $O(n^3)$ のアルゴリズムが示されています。

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## 15.1.3 &nbsp; 貪欲アルゴリズムで問題を解く手順

貪欲法で問題を解く流れは、大きく次の 3 段階に分けられます。

1. **問題の分析**：状態の定義、最適化の目標、制約条件など、問題の性質を整理して理解します。これはバックトラッキングや動的計画法でも行う段階です。
2. **貪欲戦略の決定**：各段階でどのように貪欲な選択をするかを決めます。その戦略によって問題を少しずつ小さくし、最終的に全体を解決します。
3. **正しさの証明**：通常は、貪欲選択性と最適部分構造が成り立つことを示す必要があります。帰納法や背理法などの数学的証明が必要になることがあります。

貪欲戦略を決めることが解法の中心ですが、必ずしも容易ではありません。主な理由は次のとおりです。

- **問題によって貪欲戦略が大きく異なります**。少し考えて試せば戦略が見つかる問題も多い一方、複雑な問題では戦略が見えにくいこともあります。そのような場合は、問題を解いた経験やアルゴリズムの力が問われます。
- **一見正しそうでも誤った貪欲戦略があります**。自信を持って戦略を立て、コードを書いて提出しても、一部のテストに通らないことがあります。戦略が「一部の場合にしか正しくない」ためです。先ほどの硬貨の両替は、その典型例です。

正しさを保証するには、貪欲戦略を厳密に数学的に証明する必要があり、**通常は背理法や数学的帰納法を使います**。

ただし、正しさの証明自体も難しいことがあります。糸口がつかめない場合は、テストケースを使ってコードをデバッグし、貪欲戦略を少しずつ修正・検証していくことが多いです。

## 15.1.4 &nbsp; 貪欲アルゴリズムの代表的な問題

貪欲アルゴリズムは、貪欲選択性と最適部分構造を持つ最適化問題でよく使われます。代表的な問題を次に挙げます。

- **硬貨の両替問題**：特定の硬貨の組み合わせでは、貪欲アルゴリズムで常に最適解を得られます。
- **区間スケジューリング問題**：それぞれ一定の時間区間で行う複数の作業があり、できるだけ多くを完了したいとします。毎回、終了時刻が最も早い作業を選べば、貪欲アルゴリズムで最適解を得られます。
- **分割可能ナップサック問題**：品物の集合と積載可能な重さが与えられ、総重量が制限を超えず、総価値が最大になるよう品物を選びます。毎回、価値と重さの比（価値 / 重さ）が最も高い品物を選ぶと、場合によっては貪欲アルゴリズムで最適解を得られます。
- **株式の売買問題**：株価の履歴が与えられ、売買を何度も行えます。ただし、株式を保有している間は、売るまで次の購入はできません。利益を最大にすることが目標です。
- **ハフマン符号化**：可逆データ圧縮に使う貪欲アルゴリズムです。出現頻度が最も低い二つのノードを毎回統合してハフマン木を作ると、重み付き経路長（符号長）が最小になります。
- **Dijkstra 法**：すべての辺の重みが非負のグラフで、指定した始点からほかの各頂点への最短経路を求める貪欲アルゴリズムです。
