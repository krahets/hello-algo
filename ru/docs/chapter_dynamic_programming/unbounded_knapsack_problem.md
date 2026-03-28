---
comments: true
---

# 14.5 &nbsp; Задача о полном рюкзаке

В этом разделе сначала решим еще один распространенный вариант задачи о рюкзаке - полный рюкзак, а затем рассмотрим одну из его типичных специальных форм: задачу о размене монет.

## 14.5.1 &nbsp; Задача о полном рюкзаке

!!! question

    Даны $n$ предметов. Вес $i$-го предмета равен $wgt[i-1]$ , стоимость равна $val[i-1]$ . Также дан рюкзак вместимости $cap$ . **Каждый предмет можно выбирать многократно**. Найдите максимальную суммарную стоимость, которую можно поместить в рюкзак при заданной вместимости. Пример показан на рисунке 14-22.

![Пример данных для задачи о полном рюкзаке](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-22 &nbsp; Пример данных для задачи о полном рюкзаке </p>

### 1. &nbsp; Идея динамического программирования

Задача о полном рюкзаке очень похожа на задачу о рюкзаке 0-1; **разница состоит только в том, что число выборов каждого предмета не ограничено**.

- В задаче о рюкзаке 0-1 каждого предмета существует только один экземпляр, поэтому после того как предмет $i$ помещен в рюкзак, выбирать можно только из первых $i-1$ предметов.
- В задаче о полном рюкзаке число экземпляров каждого предмета бесконечно, поэтому после того как предмет $i$ помещен в рюкзак, **выбирать все еще можно из первых $i$ предметов**.

При этом состояние $[i, c]$ в задаче о полном рюкзаке может изменяться двумя способами.

- **Не брать предмет $i$** : как и в задаче о рюкзаке 0-1, переход осуществляется в $[i-1, c]$ .
- **Взять предмет $i$** : в отличие от рюкзака 0-1 переход происходит в $[i, c-wgt[i-1]]$ .

Следовательно, уравнение перехода состояния принимает вид:

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; Реализация кода

Если сравнить код этой задачи с кодом задачи о рюкзаке 0-1, то окажется, что в переходе состояний меняется только одна деталь: вместо $i-1$ появляется $i$ ; все остальное остается таким же:

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """Полный рюкзак: динамическое программирование"""
        n = len(wgt)
        # Инициализация таблицы dp
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # Переход состояний
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c]
                else:
                    # Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* Полный рюкзак: динамическое программирование */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Инициализация таблицы dp
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* Полный рюкзак: динамическое программирование */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[][] dp = new int[n + 1][cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* Полный рюкзак: динамическое программирование */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* Полный рюкзак: динамическое программирование */
    func unboundedKnapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // Инициализация таблицы dp
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // Переход состояний
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i-1][c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* Полный рюкзак: динамическое программирование */
    func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Инициализация таблицы dp
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // Переход состояний
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* Полный рюкзак: динамическое программирование */
    function unboundedKnapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* Полный рюкзак: динамическое программирование */
    function unboundedKnapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* Полный рюкзак: динамическое программирование */
    int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Инициализация таблицы dp
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // Если вместимость рюкзака превышена, предмет i не выбирать
            dp[i][c] = dp[i - 1][c];
          } else {
            // Большее из двух решений: не брать или взять предмет i
            dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* Полный рюкзак: динамическое программирование */
    fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Инициализация таблицы dp
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // Переход состояний
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* Полный рюкзак: динамическое программирование */
    int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Инициализация таблицы dp
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // Освободить память
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* Полный рюкзак: динамическое программирование */
    fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // Инициализация таблицы dp
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // Переход состояний
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### Полный рюкзак: динамическое программирование ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # Инициализация таблицы dp
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # Переход состояний
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # Если вместимость рюкзака превышена, предмет i не выбирать
            dp[i][c] = dp[i - 1][c]
          else
            # Большее из двух решений: не брать или взять предмет i
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1%2C%202%2C%203%5D%0A%20%20%20%20val%20%3D%20%5B5%2C%2011%2C%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1%2C%202%2C%203%5D%0A%20%20%20%20val%20%3D%20%5B5%2C%2011%2C%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 3. &nbsp; Оптимизация пространства

Поскольку текущее состояние переходит из состояния слева и состояния сверху, **после оптимизации памяти каждую строку таблицы $dp$ нужно обходить слева направо**.

Этот порядок обхода как раз противоположен задаче о рюкзаке 0-1. Разницу удобно понять по рисунку ниже.

=== "<1>"
    ![Процесс динамического программирования после оптимизации памяти для полного рюкзака](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> Рисунок 14-23 &nbsp; Процесс динамического программирования после оптимизации памяти для полного рюкзака </p>

Код реализации здесь довольно прост: достаточно просто убрать первое измерение массива `dp` :

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """Полный рюкзак: динамическое программирование с оптимизацией памяти"""
        n = len(wgt)
        # Инициализация таблицы dp
        dp = [0] * (cap + 1)
        # Переход состояний
        for i in range(1, n + 1):
            # Прямой обход
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c]
                else:
                    # Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // Инициализация таблицы dp
        vector<int> dp(cap + 1, 0);
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // Инициализация таблицы dp
        dp := make([]int, cap+1)
        // Переход состояний
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // Инициализация таблицы dp
        var dp = Array(repeating: 0, count: cap + 1)
        // Переход состояний
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    function unboundedKnapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    function unboundedKnapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // Инициализация таблицы dp
      List<int> dp = List.filled(cap + 1, 0);
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // Если вместимость рюкзака превышена, предмет i не выбирать
            dp[c] = dp[c];
          } else {
            // Большее из двух решений: не брать или взять предмет i
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // Инициализация таблицы dp
        let mut dp = vec![0; cap + 1];
        // Переход состояний
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // Инициализация таблицы dp
        int *dp = calloc(cap + 1, sizeof(int));
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // Освободить память
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    fun unboundedKnapsackDPComp(
        wgt: IntArray,
        _val: IntArray,
        cap: Int
    ): Int {
        val n = wgt.size
        // Инициализация таблицы dp
        val dp = IntArray(cap + 1)
        // Переход состояний
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c]
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### Полный рюкзак: динамическое программирование ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # Инициализация таблицы dp
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # Переход состояний
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # Если вместимость рюкзака превышена, предмет i не выбирать
            dp[i][c] = dp[i - 1][c]
          else
            # Большее из двух решений: не брать или взять предмет i
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end

    ### Полный рюкзак: динамическое программирование с оптимизацией памяти ##3
    def unbounded_knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # Инициализация таблицы dp
      dp = Array.new(cap + 1, 0)
      # Переход состояний
      for i in 1...(n + 1)
        # Прямой обход
        for c in 1...(cap + 1)
          if wgt[i -1] > c
            # Если вместимость рюкзака превышена, предмет i не выбирать
            dp[c] = dp[c]
          else
            # Большее из двух решений: не брать или взять предмет i
            dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[cap]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1%2C%202%2C%203%5D%0A%20%20%20%20val%20%3D%20%5B5%2C%2011%2C%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%91%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1%2C%202%2C%203%5D%0A%20%20%20%20val%20%3D%20%5B5%2C%2011%2C%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D1%81%D1%82%D0%BE%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BC%D0%B5%D1%82%D0%BE%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D0%B8%20%D1%80%D1%8E%D0%BA%D0%B7%D0%B0%D0%BA%D0%B0%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 14.5.2 &nbsp; Задача о размене монет

Задача о рюкзаке представляет собой целый класс задач динамического программирования, у которого есть множество вариантов, и одной из таких вариаций является задача о размене монет.

!!! question

    Даны $n$ видов монет, номинал монеты $i$ равен $coins[i - 1]$ , а целевая сумма равна $amt$ . **Монеты каждого вида можно брать многократно**. Требуется найти минимальное число монет, которыми можно набрать целевую сумму. Если набрать сумму невозможно, верните $-1$ . Пример показан на рисунке 14-24.

![Пример данных для задачи о размене монет](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-24 &nbsp; Пример данных для задачи о размене монет </p>

### 1. &nbsp; Идея динамического программирования

**Задачу о размене монет можно рассматривать как частный случай задачи о полном рюкзаке** ; между ними существует следующая связь и следующие различия.

- Эти две задачи можно взаимно переводить друг в друга: "предмет" соответствует "монете", "вес предмета" соответствует "номиналу монеты", а "вместимость рюкзака" соответствует "целевой сумме".
- Цель оптимизации противоположна: в задаче о полном рюкзаке нужно максимизировать стоимость предметов, а в задаче о размене монет - минимизировать число монет.
- В задаче о полном рюкзаке ищется решение, не превышающее вместимость, а в задаче о размене монет требуется **ровно** набрать целевую сумму.

**Шаг 1: продумать решения на каждом раунде, определить состояние и тем самым получить таблицу $dp$**

Подзадача, соответствующая состоянию $[i, a]$ , выглядит так: **минимальное число монет из первых $i$ видов, которыми можно набрать сумму $a$**. Решение этой подзадачи обозначается как $dp[i, a]$ .

Размер двумерной таблицы $dp$ равен $(n+1) \times (amt+1)$ .

**Шаг 2: найти оптимальную подструктуру и на ее основе вывести уравнение перехода состояния**

По сравнению с задачей о полном рюкзаке здесь есть два отличия в уравнении перехода состояния.

- Нужно искать минимум, а не максимум, поэтому оператор $\max()$ заменяется на $\min()$ .
- Оптимизируемое значение - это число монет, а не суммарная стоимость, поэтому при выборе монеты нужно просто прибавить $1$ .

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**Шаг 3: определить граничные условия и порядок переходов**

Когда целевая сумма равна $0$ , минимальное число монет для ее набора равно $0$ , то есть весь первый столбец $dp[i, 0]$ заполняется нулями.

Когда монет нет, **невозможно набрать никакую целевую сумму $> 0$** ; это и есть недопустимое решение. Чтобы функция $\min()$ в уравнении перехода состояния могла распознавать и отбрасывать такие недопустимые решения, удобно использовать значение $+ \infty$ ; то есть всю первую строку $dp[0, a]$ нужно инициализировать значением $+ \infty$ .

### 2. &nbsp; Реализация кода

Большинство языков программирования не предоставляет готовую переменную $+ \infty$ для целых чисел, поэтому обычно приходится заменять ее на максимальное значение типа `int` . Но тогда возникает риск переполнения: операция $+ 1$ в уравнении перехода может переполнить большое число.

Поэтому здесь мы используем число $amt + 1$ как обозначение недопустимого решения, потому что для набора суммы $amt$ максимум нужно не больше чем $amt$ монет. Перед возвратом результата проверяем, равно ли $dp[n, amt]$ значению $amt + 1$ ; если да, то возвращаем $-1$ , что означает невозможность набрать целевую сумму. Код приведен ниже:

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """Размен монет: динамическое программирование"""
        n = len(coins)
        MAX = amt + 1
        # Инициализация таблицы dp
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # Переход состояний: первая строка и первый столбец
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # Переход состояний: остальные строки и столбцы
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a]
                else:
                    # Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* Размен монет: динамическое программирование */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // Инициализация таблицы dp
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // Переход состояний: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* Размен монет: динамическое программирование */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int[][] dp = new int[n + 1][amt + 1];
        // Переход состояний: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* Размен монет: динамическое программирование */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, amt + 1];
        // Переход состояний: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* Размен монет: динамическое программирование */
    func coinChangeDP(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // Инициализация таблицы dp
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // Переход состояний: первая строка и первый столбец
        for a := 1; a <= amt; a++ {
            dp[0][a] = max
        }
        // Переход состояний: остальные строки и столбцы
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i-1][a]
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
                }
            }
        }
        if dp[n][amt] != max {
            return dp[n][amt]
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    /* Размен монет: динамическое программирование */
    func coinChangeDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // Инициализация таблицы dp
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // Переход состояний: первая строка и первый столбец
        for a in 1 ... amt {
            dp[0][a] = MAX
        }
        // Переход состояний: остальные строки и столбцы
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* Размен монет: динамическое программирование */
    function coinChangeDP(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // Переход состояний: первая строка и первый столбец
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* Размен монет: динамическое программирование */
    function coinChangeDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // Переход состояний: первая строка и первый столбец
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* Размен монет: динамическое программирование */
    int coinChangeDP(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // Инициализация таблицы dp
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // Переход состояний: первая строка и первый столбец
      for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
      }
      // Переход состояний: остальные строки и столбцы
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // Если целевая сумма превышена, монету i не выбирать
            dp[i][a] = dp[i - 1][a];
          } else {
            // Меньшее из двух решений: не брать или взять монету i
            dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* Размен монет: динамическое программирование */
    fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // Инициализация таблицы dp
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // Переход состояний: первая строка и первый столбец
        for a in 1..=amt {
            dp[0][a] = max;
        }
        // Переход состояний: остальные строки и столбцы
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = std::cmp::min(dp[i - 1][a], dp[i][a - coins[i - 1] as usize] + 1);
                }
            }
        }
        if dp[n][amt] != max {
            return dp[n][amt] as i32;
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change.c"
    /* Размен монет: динамическое программирование */
    int coinChangeDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // Переход состояний: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
        // Освободить память
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* Размен монет: динамическое программирование */
    fun coinChangeDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // Инициализация таблицы dp
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // Переход состояний: первая строка и первый столбец
        for (a in 1..amt) {
            dp[0][a] = MAX
        }
        // Переход состояний: остальные строки и столбцы
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[n][amt] != MAX) dp[n][amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### Размен монет: динамическое программирование ###
    def coin_change_dp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # Инициализация таблицы dp
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # Переход состояний: первая строка и первый столбец
      (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
      # Переход состояний: остальные строки и столбцы
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # Если целевая сумма превышена, монету i не выбирать
            dp[i][a] = dp[i - 1][a]
          else
            # Меньшее из двух решений: не брать или взять монету i
            dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[n][amt] != _MAX ? dp[n][amt] : -1
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%B5%D1%80%D0%B2%D0%B0%D1%8F%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B0%20%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D0%B5%D1%86%0A%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%D0%B8%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D1%86%D1%8B%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D%2C%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BF%D0%B5%D1%80%D0%B2%D0%B0%D1%8F%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B0%20%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D0%B5%D1%86%0A%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%3A%20%D0%BE%D1%81%D1%82%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%D0%B8%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D1%86%D1%8B%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D%2C%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Как показано на рисунке 14-25, процесс динамического программирования для задачи о размене монет очень похож на задачу о полном рюкзаке.

=== "<1>"
    ![Процесс динамического программирования для задачи о размене монет](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png){ class="animation-figure" }

<p align="center"> Рисунок 14-25 &nbsp; Процесс динамического программирования для задачи о размене монет </p>

### 3. &nbsp; Оптимизация пространства

Оптимизация пространства для задачи о размене монет выполняется так же, как и для полного рюкзака:

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """Размен монет: динамическое программирование с оптимизацией памяти"""
        n = len(coins)
        MAX = amt + 1
        # Инициализация таблицы dp
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # Переход состояний
        for i in range(1, n + 1):
            # Прямой обход
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                else:
                    # Меньшее из двух решений: не брать или взять монету i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // Инициализация таблицы dp
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* Размен монет: динамическое программирование */
    func coinChangeDPComp(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // Инициализация таблицы dp
        dp := make([]int, amt+1)
        for i := 1; i <= amt; i++ {
            dp[i] = max
        }
        // Переход состояний
        for i := 1; i <= n; i++ {
            // Прямой обход
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
                }
            }
        }
        if dp[amt] != max {
            return dp[amt]
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // Инициализация таблицы dp
        var dp = Array(repeating: MAX, count: amt + 1)
        dp[0] = 0
        // Переход состояний
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    function coinChangeDPComp(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // Инициализация таблицы dp
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    function coinChangeDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // Инициализация таблицы dp
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    int coinChangeDPComp(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // Инициализация таблицы dp
      List<int> dp = List.filled(amt + 1, MAX);
      dp[0] = 0;
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // Если целевая сумма превышена, монету i не выбирать
            dp[a] = dp[a];
          } else {
            // Меньшее из двух решений: не брать или взять монету i
            dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // Инициализация таблицы dp
        let mut dp = vec![0; amt + 1];
        dp.fill(max);
        dp[0] = 0;
        // Переход состояний
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = std::cmp::min(dp[a], dp[a - coins[i - 1] as usize] + 1);
                }
            }
        }
        if dp[amt] != max {
            return dp[amt] as i32;
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change.c"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    int coinChangeDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int *dp = malloc((amt + 1) * sizeof(int));
        for (int j = 1; j <= amt; j++) {
            dp[j] = MAX;
        } 
        dp[0] = 0;

        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[amt] != MAX ? dp[amt] : -1;
        // Освободить память
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* Размен монет: динамическое программирование с оптимизацией памяти */
    fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // Инициализация таблицы dp
        val dp = IntArray(amt + 1)
        dp.fill(MAX)
        dp[0] = 0
        // Переход состояний
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[amt] != MAX) dp[amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### Размен монет: динамическое программирование с оптимизацией памяти ###
    def coin_change_dp_comp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # Инициализация таблицы dp
      dp = Array.new(amt + 1, _MAX)
      dp[0] = 0
      # Переход состояний
      for i in 1...(n + 1)
        # Прямой обход
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # Если целевая сумма превышена, монету i не выбирать
            dp[a] = dp[a]
          else
            # Меньшее из двух решений: не брать или взять монету i
            dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[amt] != _MAX ? dp[amt] : -1
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D%2C%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%B5%20%D0%B8%D0%B7%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D%2C%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9C%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 14.5.3 &nbsp; Задача о размене монет II

!!! question

    Даны $n$ видов монет, номинал монеты $i$ равен $coins[i - 1]$ , а целевая сумма равна $amt$ . Монеты каждого вида можно брать многократно. **Найдите число различных комбинаций монет, которыми можно набрать целевую сумму**. Пример показан на рисунке 14-26.

![Пример данных для задачи о размене монет II](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> Рисунок 14-26 &nbsp; Пример данных для задачи о размене монет II </p>

### 1. &nbsp; Идея динамического программирования

По сравнению с предыдущей задачей теперь целью является число комбинаций. Поэтому подзадача меняется на следующую: **число комбинаций из первых $i$ видов монет, которыми можно набрать сумму $a$**. При этом таблица $dp$ по-прежнему остается двумерной матрицей размера $(n+1) \times (amt + 1)$ .

Число комбинаций для текущего состояния равно сумме числа комбинаций для двух решений: не брать текущую монету и брать текущую монету. Поэтому уравнение перехода состояния принимает вид:

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

Когда целевая сумма равна $0$ , ее можно набрать, не выбирая ни одной монеты, поэтому весь первый столбец $dp[i, 0]$ нужно инициализировать единицами. Когда монет нет, невозможно набрать никакую сумму $>0$ , поэтому вся первая строка $dp[0, a]$ должна быть заполнена нулями.

### 2. &nbsp; Реализация кода

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """Размен монет II: динамическое программирование"""
        n = len(coins)
        # Инициализация таблицы dp
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # Инициализация первого столбца
        for i in range(n + 1):
            dp[i][0] = 1
        # Переход состояний
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a]
                else:
                    # Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* Размен монет II: динамическое программирование */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // Инициализация таблицы dp
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // Инициализация первого столбца
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* Размен монет II: динамическое программирование */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // Инициализация таблицы dp
        int[][] dp = new int[n + 1][amt + 1];
        // Инициализация первого столбца
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* Размен монет II: динамическое программирование */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, amt + 1];
        // Инициализация первого столбца
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* Размен монет II: динамическое программирование */
    func coinChangeIIDP(coins []int, amt int) int {
        n := len(coins)
        // Инициализация таблицы dp
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // Инициализация первого столбца
        for i := 0; i <= n; i++ {
            dp[i][0] = 1
        }
        // Переход состояний: остальные строки и столбцы
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i-1][a]
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* Размен монет II: динамическое программирование */
    func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // Инициализация таблицы dp
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // Инициализация первого столбца
        for i in 0 ... n {
            dp[i][0] = 1
        }
        // Переход состояний
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* Размен монет II: динамическое программирование */
    function coinChangeIIDP(coins, amt) {
        const n = coins.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // Инициализация первого столбца
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* Размен монет II: динамическое программирование */
    function coinChangeIIDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // Инициализация первого столбца
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* Размен монет II: динамическое программирование */
    int coinChangeIIDP(List<int> coins, int amt) {
      int n = coins.length;
      // Инициализация таблицы dp
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // Инициализация первого столбца
      for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
      }
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // Если целевая сумма превышена, монету i не выбирать
            dp[i][a] = dp[i - 1][a];
          } else {
            // Сумма двух решений: не брать или взять монету i
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
          }
        }
      }
      return dp[n][amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* Размен монет II: динамическое программирование */
    fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // Инициализация таблицы dp
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // Инициализация первого столбца
        for i in 0..=n {
            dp[i][0] = 1;
        }
        // Переход состояний
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
                }
            }
        }
        dp[n][amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* Размен монет II: динамическое программирование */
    int coinChangeIIDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // Инициализация таблицы dp
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // Инициализация первого столбца
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        int res = dp[n][amt];
        // Освободить память
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* Размен монет II: динамическое программирование */
    fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // Инициализация таблицы dp
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // Инициализация первого столбца
        for (i in 0..n) {
            dp[i][0] = 1
        }
        // Переход состояний
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### Размен монет II: динамическое программирование ###
    def coin_change_ii_dp(coins, amt)
      n = coins.length
      # Инициализация таблицы dp
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # Инициализация первого столбца
      (0...(n + 1)).each { |i| dp[i][0] = 1 }
      # Переход состояний
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # Если целевая сумма превышена, монету i не выбирать
            dp[i][a] = dp[i - 1][a]
          else
            # Сумма двух решений: не брать или взять монету i
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
          end
        end
      end
      dp[n][amt]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20II%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D1%86%D0%B0%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D1%83%D0%BC%D0%BC%D0%B0%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D0%BA%D0%BE%D0%BC%D0%B1%D0%B8%D0%BD%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20II%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%81%D1%82%D0%BE%D0%BB%D0%B1%D1%86%D0%B0%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D1%83%D0%BC%D0%BC%D0%B0%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D0%BA%D0%BE%D0%BC%D0%B1%D0%B8%D0%BD%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 3. &nbsp; Оптимизация пространства

При оптимизации памяти способ остается тем же самым: достаточно убрать измерение, отвечающее за виды монет:

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """Размен монет II: динамическое программирование с оптимизацией памяти"""
        n = len(coins)
        # Инициализация таблицы dp
        dp = [0] * (amt + 1)
        dp[0] = 1
        # Переход состояний
        for i in range(1, n + 1):
            # Прямой обход
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                else:
                    # Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // Инициализация таблицы dp
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // Инициализация таблицы dp
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // Инициализация таблицы dp
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    func coinChangeIIDPComp(coins []int, amt int) int {
        n := len(coins)
        // Инициализация таблицы dp
        dp := make([]int, amt+1)
        dp[0] = 1
        // Переход состояний
        for i := 1; i <= n; i++ {
            // Прямой обход
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a-coins[i-1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // Инициализация таблицы dp
        var dp = Array(repeating: 0, count: amt + 1)
        dp[0] = 1
        // Переход состояний
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    function coinChangeIIDPComp(coins, amt) {
        const n = coins.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // Инициализация таблицы dp
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // Переход состояний
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int coinChangeIIDPComp(List<int> coins, int amt) {
      int n = coins.length;
      // Инициализация таблицы dp
      List<int> dp = List.filled(amt + 1, 0);
      dp[0] = 1;
      // Переход состояний
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // Если целевая сумма превышена, монету i не выбирать
            dp[a] = dp[a];
          } else {
            // Сумма двух решений: не брать или взять монету i
            dp[a] = dp[a] + dp[a - coins[i - 1]];
          }
        }
      }
      return dp[amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // Инициализация таблицы dp
        let mut dp = vec![0; amt + 1];
        dp[0] = 1;
        // Переход состояний
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
                }
            }
        }
        dp[amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // Инициализация таблицы dp
        int *dp = calloc(amt + 1, sizeof(int));
        dp[0] = 1;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        int res = dp[amt];
        // Освободить память
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // Инициализация таблицы dp
        val dp = IntArray(amt + 1)
        dp[0] = 1
        // Переход состояний
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a]
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### Размен монет II: динамическое программирование с оптимизацией памяти ###
    def coin_change_ii_dp_comp(coins, amt)
      n = coins.length
      # Инициализация таблицы dp
      dp = Array.new(amt + 1, 0)
      dp[0] = 1
      # Переход состояний
      for i in 1...(n + 1)
        # Прямой обход
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # Если целевая сумма превышена, монету i не выбирать
            dp[a] = dp[a]
          else
            # Сумма двух решений: не брать или взять монету i
            dp[a] = dp[a] + dp[a - coins[i - 1]]
          end
        end
      end
      dp[amt]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20II%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D1%83%D0%BC%D0%BC%D0%B0%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D0%BA%D0%BE%D0%BC%D0%B1%D0%B8%D0%BD%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D%2C%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20II%3A%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%8B%20dp%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D1%85%D0%BE%D0%B4%20%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B9%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281%2C%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%B0%D1%8F%20%D1%81%D1%83%D0%BC%D0%BC%D0%B0%20%D0%BF%D1%80%D0%B5%D0%B2%D1%8B%D1%88%D0%B5%D0%BD%D0%B0%2C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%20%D0%BD%D0%B5%20%D0%B2%D1%8B%D0%B1%D0%B8%D1%80%D0%B0%D1%82%D1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%A1%D1%83%D0%BC%D0%BC%D0%B0%20%D0%B4%D0%B2%D1%83%D1%85%20%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D0%B9%3A%20%D0%BD%D0%B5%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%B8%D0%BB%D0%B8%20%D0%B2%D0%B7%D1%8F%D1%82%D1%8C%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%D1%83%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1%2C%202%2C%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B5%D0%B9%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins%2C%20amt%29%0A%20%20%20%20print%28f%22%D0%9A%D0%BE%D0%BB%D0%B8%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%BE%20%D0%BA%D0%BE%D0%BC%D0%B1%D0%B8%D0%BD%D0%B0%D1%86%D0%B8%D0%B9%20%D0%BC%D0%BE%D0%BD%D0%B5%D1%82%20%D0%B4%D0%BB%D1%8F%20%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>
