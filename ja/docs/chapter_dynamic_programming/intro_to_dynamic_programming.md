---
comments: true
---

# 14.1 &nbsp; 動的計画法入門

<u>動的計画法（dynamic programming）</u>は重要なアルゴリズムパラダイムであり、問題をより小さな部分問題の列に分解し、それらの解を保存して重複計算を避けることで、時間効率を大幅に向上させます。

本節では、古典的な例題から始めて、まずその力任せのバックトラッキング解法を示し、そこに含まれる重複部分問題を観察したうえで、より効率的な動的計画法の解法を段階的に導きます。

!!! question "階段を上る"

    全体で $n$ 段ある階段が与えられ、各ステップで $1$ 段または $2$ 段上ることができます。頂上まで到達する方法は何通りあるでしょうか？

次の図に示すように、$3$ 段の階段では、頂上まで到達する方法は全部で $3$ 通りあります。

![3 段の階段を上る方法の数](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> 図 14-1 &nbsp; 3 段の階段を上る方法の数 </p>

この問題の目的は方法の総数を求めることです。**考えられるすべての可能性をバックトラッキングで総当たりすることができます**。具体的には、階段を上ることを複数ラウンドの選択過程とみなし、地面から出発して各ラウンドで $1$ 段または $2$ 段上ります。階段の頂上に到達するたびに方法数を $1$ 増やし、頂上を越えた場合は枝刈りします。コードは次のとおりです：

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """バックトラッキング"""
        # 第 n 段に到達したら、方法数を 1 増やす
        if state == n:
            res[0] += 1
        # すべての選択肢を走査
        for choice in choices:
            # 枝刈り: 第 n 段を超えないようにする
            if state + choice > n:
                continue
            # 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res)
            # バックトラック

    def climbing_stairs_backtrack(n: int) -> int:
        """階段登り：バックトラッキング"""
        choices = [1, 2]  # 1 段または 2 段上ることを選べる
        state = 0  # 第 0 段から上り始める
        res = [0]  # res[0] を使って方法数を記録する
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    /* バックトラッキング */
    void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res[0]++;
        // すべての選択肢を走査
        for (auto &choice : choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n)
                continue;
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    int climbingStairsBacktrack(int n) {
        vector<int> choices = {1, 2}; // 1 段または 2 段上ることを選べる
        int state = 0;                // 第 0 段から上り始める
        vector<int> res = {0};        // res[0] を使って方法数を記録する
        backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* バックトラッキング */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res.set(0, res.get(0) + 1);
        // すべての選択肢を走査
        for (Integer choice : choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n)
                continue;
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 1 段または 2 段上ることを選べる
        int state = 0; // 第 0 段から上り始める
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0] を使って方法数を記録する
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
    /* バックトラッキング */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res[0]++;
        // すべての選択肢を走査
        foreach (int choice in choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n)
                continue;
            // 試行: 選択を行い、状態を更新
            Backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 1 段または 2 段上ることを選べる
        int state = 0; // 第 0 段から上り始める
        List<int> res = [0]; // res[0] を使って方法数を記録する
        Backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    /* バックトラッキング */
    func backtrack(choices []int, state, n int, res []int) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if state == n {
            res[0] = res[0] + 1
        }
        // すべての選択肢を走査
        for _, choice := range choices {
            // 枝刈り: 第 n 段を超えないようにする
            if state+choice > n {
                continue
            }
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state+choice, n, res)
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    func climbingStairsBacktrack(n int) int {
        // 1 段または 2 段上ることを選べる
        choices := []int{1, 2}
        // 第 0 段から上り始める
        state := 0
        res := make([]int, 1)
        // res[0] を使って方法数を記録する
        res[0] = 0
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    /* バックトラッキング */
    func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if state == n {
            res[0] += 1
        }
        // すべての選択肢を走査
        for choice in choices {
            // 枝刈り: 第 n 段を超えないようにする
            if state + choice > n {
                continue
            }
            // 試行: 選択を行い、状態を更新
            backtrack(choices: choices, state: state + choice, n: n, res: &res)
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    func climbingStairsBacktrack(n: Int) -> Int {
        let choices = [1, 2] // 1 段または 2 段上ることを選べる
        let state = 0 // 第 0 段から上り始める
        var res: [Int] = []
        res.append(0) // res[0] を使って方法数を記録する
        backtrack(choices: choices, state: state, n: n, res: &res)
        return res[0]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    /* バックトラッキング */
    function backtrack(choices, state, n, res) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state === n) res.set(0, res.get(0) + 1);
        // すべての選択肢を走査
        for (const choice of choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n) continue;
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    function climbingStairsBacktrack(n) {
        const choices = [1, 2]; // 1 段または 2 段上ることを選べる
        const state = 0; // 第 0 段から上り始める
        const res = new Map();
        res.set(0, 0); // res[0] を使って方法数を記録する
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_backtrack.ts"
    /* バックトラッキング */
    function backtrack(
        choices: number[],
        state: number,
        n: number,
        res: Map<0, any>
    ): void {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state === n) res.set(0, res.get(0) + 1);
        // すべての選択肢を走査
        for (const choice of choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n) continue;
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    function climbingStairsBacktrack(n: number): number {
        const choices = [1, 2]; // 1 段または 2 段上ることを選べる
        const state = 0; // 第 0 段から上り始める
        const res = new Map();
        res.set(0, 0); // res[0] を使って方法数を記録する
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    /* バックトラッキング */
    void backtrack(List<int> choices, int state, int n, List<int> res) {
      // 第 n 段に到達したら、方法数を 1 増やす
      if (state == n) {
        res[0]++;
      }
      // すべての選択肢を走査
      for (int choice in choices) {
        // 枝刈り: 第 n 段を超えないようにする
        if (state + choice > n) continue;
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res);
        // バックトラック
      }
    }

    /* 階段登り：バックトラッキング */
    int climbingStairsBacktrack(int n) {
      List<int> choices = [1, 2]; // 1 段または 2 段上ることを選べる
      int state = 0; // 第 0 段から上り始める
      List<int> res = [];
      res.add(0); // res[0] を使って方法数を記録する
      backtrack(choices, state, n, res);
      return res[0];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    /* バックトラッキング */
    fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if state == n {
            res[0] = res[0] + 1;
        }
        // すべての選択肢を走査
        for &choice in choices {
            // 枝刈り: 第 n 段を超えないようにする
            if state + choice > n {
                continue;
            }
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    fn climbing_stairs_backtrack(n: usize) -> i32 {
        let choices = vec![1, 2]; // 1 段または 2 段上ることを選べる
        let state = 0; // 第 0 段から上り始める
        let mut res = Vec::new();
        res.push(0); // res[0] を使って方法数を記録する
        backtrack(&choices, state, n as i32, &mut res);
        res[0]
    }
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    /* バックトラッキング */
    void backtrack(int *choices, int state, int n, int *res, int len) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res[0]++;
        // すべての選択肢を走査
        for (int i = 0; i < len; i++) {
            int choice = choices[i];
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n)
                continue;
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res, len);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    int climbingStairsBacktrack(int n) {
        int choices[2] = {1, 2}; // 1 段または 2 段上ることを選べる
        int state = 0;           // 第 0 段から上り始める
        int *res = (int *)malloc(sizeof(int));
        *res = 0; // res[0] を使って方法数を記録する
        int len = sizeof(choices) / sizeof(int);
        backtrack(choices, state, n, res, len);
        int result = *res;
        free(res);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_backtrack.kt"
    /* バックトラッキング */
    fun backtrack(
        choices: MutableList<Int>,
        state: Int,
        n: Int,
        res: MutableList<Int>
    ) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res[0] = res[0] + 1
        // すべての選択肢を走査
        for (choice in choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n) continue
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res)
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    fun climbingStairsBacktrack(n: Int): Int {
        val choices = mutableListOf(1, 2) // 1 段または 2 段上ることを選べる
        val state = 0 // 第 0 段から上り始める
        val res = mutableListOf<Int>()
        res.add(0) // res[0] を使って方法数を記録する
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    ### バックトラッキング ###
    def backtrack(choices, state, n, res)
      # 第 n 段に到達したら、方法数を 1 増やす
      res[0] += 1 if state == n
      # すべての選択肢を走査
      for choice in choices
        # 枝刈り: 第 n 段を超えないようにする
        next if state + choice > n

        # 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res)
      end
      # バックトラック
    end

    ### 階段登り：バックトラッキング ###
    def climbing_stairs_backtrack(n)
      choices = [1, 2] # 1 段または 2 段上ることを選べる
      state = 0 # 第 0 段から上り始める
      res = [0] # res[0] を使って方法数を記録する
      backtrack(choices, state, n, res)
      res.first
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D%2C%20state%3A%20int%2C%20n%3A%20int%2C%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%22%22%22%0A%20%20%20%20%23%20%E7%AC%AC%20n%20%E6%AE%B5%E3%81%AB%E5%88%B0%E9%81%94%E3%81%97%E3%81%9F%E3%82%89%E3%80%81%E6%96%B9%E6%B3%95%E6%95%B0%E3%82%92%201%20%E5%A2%97%E3%82%84%E3%81%99%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%81%B8%E6%8A%9E%E8%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9E%9D%E5%88%88%E3%82%8A%3A%20%E7%AC%AC%20n%20%E6%AE%B5%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E8%A9%A6%E8%A1%8C%3A%20%E9%81%B8%E6%8A%9E%E3%82%92%E8%A1%8C%E3%81%84%E3%80%81%E7%8A%B6%E6%85%8B%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20%20%20%20%20backtrack%28choices%2C%20state%20%2B%20choice%2C%20n%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AF%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1%2C%202%5D%20%20%23%201%20%E6%AE%B5%E3%81%BE%E3%81%9F%E3%81%AF%202%20%E6%AE%B5%E4%B8%8A%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E9%81%B8%E3%81%B9%E3%82%8B%0A%20%20%20%20state%20%3D%200%20%20%23%20%E7%AC%AC%200%20%E6%AE%B5%E3%81%8B%E3%82%89%E4%B8%8A%E3%82%8A%E5%A7%8B%E3%82%81%E3%82%8B%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20res%5B0%5D%20%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E6%96%B9%E6%B3%95%E6%95%B0%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20backtrack%28choices%2C%20state%2C%20n%2C%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D%2C%20state%3A%20int%2C%20n%3A%20int%2C%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%22%22%22%0A%20%20%20%20%23%20%E7%AC%AC%20n%20%E6%AE%B5%E3%81%AB%E5%88%B0%E9%81%94%E3%81%97%E3%81%9F%E3%82%89%E3%80%81%E6%96%B9%E6%B3%95%E6%95%B0%E3%82%92%201%20%E5%A2%97%E3%82%84%E3%81%99%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%81%B8%E6%8A%9E%E8%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9E%9D%E5%88%88%E3%82%8A%3A%20%E7%AC%AC%20n%20%E6%AE%B5%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E8%A9%A6%E8%A1%8C%3A%20%E9%81%B8%E6%8A%9E%E3%82%92%E8%A1%8C%E3%81%84%E3%80%81%E7%8A%B6%E6%85%8B%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20%20%20%20%20backtrack%28choices%2C%20state%20%2B%20choice%2C%20n%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AF%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1%2C%202%5D%20%20%23%201%20%E6%AE%B5%E3%81%BE%E3%81%9F%E3%81%AF%202%20%E6%AE%B5%E4%B8%8A%E3%82%8B%E3%81%93%E3%81%A8%E3%82%92%E9%81%B8%E3%81%B9%E3%82%8B%0A%20%20%20%20state%20%3D%200%20%20%23%20%E7%AC%AC%200%20%E6%AE%B5%E3%81%8B%E3%82%89%E4%B8%8A%E3%82%8A%E5%A7%8B%E3%82%81%E3%82%8B%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20res%5B0%5D%20%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E6%96%B9%E6%B3%95%E6%95%B0%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20backtrack%28choices%2C%20state%2C%20n%2C%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

## 14.1.1 &nbsp; 方法 1：総当たり探索

バックトラッキング法は通常、問題を明示的に分解するのではなく、問題解決を一連の意思決定ステップとみなし、試行と枝刈りによってあらゆる可能な解を探索します。

この問題を問題分解の観点から分析してみましょう。$i$ 段目まで上る方法が全部で $dp[i]$ 通りあるとすると、$dp[i]$ が元の問題であり、その部分問題には次が含まれます：

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

各ラウンドでは $1$ 段または $2$ 段しか上れないため、$i$ 段目の階段に立っているとき、直前のラウンドでは $i - 1$ 段目または $i - 2$ 段目にしか立てません。言い換えると、$i -1$ 段目または $i - 2$ 段目からしか $i$ 段目へ進めません。

ここから重要な帰結が得られます。**$i - 1$ 段目まで上る方法数と $i - 2$ 段目まで上る方法数の和が、$i$ 段目まで上る方法数に等しい**のです。式は次のとおりです：

$$
dp[i] = dp[i-1] + dp[i-2]
$$

これは、階段を上る問題では各部分問題の間に漸化関係があり、**元の問題の解は部分問題の解から構築できる**ことを意味します。次の図はこの漸化関係を示しています。

![方法数の漸化関係](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> 図 14-2 &nbsp; 方法数の漸化関係 </p>

漸化式に基づいて総当たり探索の解法を得ることができます。$dp[n]$ を出発点とし、**より大きな問題を再帰的に 2 つのより小さな問題の和へ分解**していき、最小部分問題 $dp[1]$ と $dp[2]$ に到達したら返します。ここで最小部分問題の解は既知であり、$dp[1] = 1$、$dp[2] = 2$ です。これは、第 $1$ 段目と第 $2$ 段目まで上る方法がそれぞれ $1$ 通り、$2$ 通りであることを表します。

次のコードを見ると、標準的なバックトラッキングコードと同じく深さ優先探索に属しますが、より簡潔です：

=== "Python"

    ```python title="climbing_stairs_dfs.py"
    def dfs(i: int) -> int:
        """検索"""
        # dp[1] と dp[2] は既知なので返す
        if i == 1 or i == 2:
            return i
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1) + dfs(i - 2)
        return count

    def climbing_stairs_dfs(n: int) -> int:
        """階段登り：探索"""
        return dfs(n)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs.cpp"
    /* 検索 */
    int dfs(int i) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs.java"
    /* 検索 */
    int dfs(int i) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs.cs"
    /* 検索 */
    int DFS(int i) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    /* 検索 */
    func dfs(i int) int {
        // dp[1] と dp[2] は既知なので返す
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfs(i-1) + dfs(i-2)
        return count
    }

    /* 階段登り：探索 */
    func climbingStairsDFS(n int) int {
        return dfs(n)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    /* 検索 */
    func dfs(i: Int) -> Int {
        // dp[1] と dp[2] は既知なので返す
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1) + dfs(i: i - 2)
        return count
    }

    /* 階段登り：探索 */
    func climbingStairsDFS(n: Int) -> Int {
        dfs(i: n)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    /* 検索 */
    function dfs(i) {
        // dp[1] と dp[2] は既知なので返す
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    function climbingStairsDFS(n) {
        return dfs(n);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    /* 検索 */
    function dfs(i: number): number {
        // dp[1] と dp[2] は既知なので返す
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    function climbingStairsDFS(n: number): number {
        return dfs(n);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    /* 検索 */
    int dfs(int i) {
      // dp[1] と dp[2] は既知なので返す
      if (i == 1 || i == 2) return i;
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1) + dfs(i - 2);
      return count;
    }

    /* 階段登り：探索 */
    int climbingStairsDFS(int n) {
      return dfs(n);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    /* 検索 */
    fn dfs(i: usize) -> i32 {
        // dp[1] と dp[2] は既知なので返す
        if i == 1 || i == 2 {
            return i as i32;
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1) + dfs(i - 2);
        count
    }

    /* 階段登り：探索 */
    fn climbing_stairs_dfs(n: usize) -> i32 {
        dfs(n)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
    /* 検索 */
    int dfs(int i) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    /* 検索 */
    fun dfs(i: Int): Int {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2) return i
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1) + dfs(i - 2)
        return count
    }

    /* 階段登り：探索 */
    fun climbingStairsDFS(n: Int): Int {
        return dfs(n)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    ### 探索 ###
    def dfs(i)
      # dp[1] と dp[2] は既知なので返す
      return i if i == 1 || i == 2
      # dp[i] = dp[i-1] + dp[i-2]
      dfs(i - 1) + dfs(i - 2)
    end

    ### 階段登り：探索 ###
    def climbing_stairs_dfs(n)
      dfs(n)
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%A4%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%E3%81%A8%20dp%5B2%5D%20%E3%81%AF%E6%97%A2%E7%9F%A5%E3%81%AA%E3%81%AE%E3%81%A7%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%A4%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%E3%81%A8%20dp%5B2%5D%20%E3%81%AF%E6%97%A2%E7%9F%A5%E3%81%AA%E3%81%AE%E3%81%A7%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図は総当たり探索によって形成される再帰木を示しています。問題 $dp[n]$ に対して、その再帰木の深さは $n$、時間計算量は $O(2^n)$ です。指数オーダーは爆発的に増加するため、比較的大きな $n$ を入力すると長時間待たされることになります。

![階段上りに対応する再帰木](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> 図 14-3 &nbsp; 階段上りに対応する再帰木 </p>

上の図を見ると、**指数オーダーの時間計算量は「重複部分問題」によって生じています**。たとえば $dp[9]$ は $dp[8]$ と $dp[7]$ に分解され、$dp[8]$ は $dp[7]$ と $dp[6]$ に分解されるため、どちらにも部分問題 $dp[7]$ が含まれています。

このように、部分問題の中にはさらに小さな重複部分問題が含まれ、それが際限なく続いていきます。計算資源の大部分は、こうした重複部分問題に浪費されています。

## 14.1.2 &nbsp; 方法 2：メモ化探索

アルゴリズム効率を高めるため、**すべての重複部分問題を 1 回だけ計算したい**と考えます。そのために、各部分問題の解を記録する配列 `mem` を宣言し、探索の過程で重複部分問題を枝刈りします。

1. $dp[i]$ を初めて計算したとき、その結果を `mem[i]` に記録して後で使えるようにします。
2. 再び $dp[i]$ を計算する必要が生じたときは、`mem[i]` から直接結果を取得し、その部分問題の重複計算を避けます。

コードは次のとおりです：

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """メモ化探索"""
        # dp[1] と dp[2] は既知なので返す
        if i == 1 or i == 2:
            return i
        # dp[i] の記録があれば、それをそのまま返す
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # dp[i] を記録する
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """階段登り：メモ化探索"""
        # mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    /* メモ化探索 */
    int dfs(int i, vector<int> &mem) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        vector<int> mem(n + 1, -1);
        return dfs(n, mem);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* メモ化探索 */
    int dfs(int i, int[] mem) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    /* メモ化探索 */
    int DFS(int i, int[] mem) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    /* メモ化探索 */
    func dfsMem(i int, mem []int) int {
        // dp[1] と dp[2] は既知なので返す
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] の記録があれば、それをそのまま返す
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
        // dp[i] を記録する
        mem[i] = count
        return count
    }

    /* 階段登り：メモ化探索 */
    func climbingStairsDFSMem(n int) int {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        mem := make([]int, n+1)
        for i := range mem {
            mem[i] = -1
        }
        return dfsMem(n, mem)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    /* メモ化探索 */
    func dfs(i: Int, mem: inout [Int]) -> Int {
        // dp[1] と dp[2] は既知なので返す
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] の記録があれば、それをそのまま返す
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
        // dp[i] を記録する
        mem[i] = count
        return count
    }

    /* 階段登り：メモ化探索 */
    func climbingStairsDFSMem(n: Int) -> Int {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        var mem = Array(repeating: -1, count: n + 1)
        return dfs(i: n, mem: &mem)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    /* メモ化探索 */
    function dfs(i, mem) {
        // dp[1] と dp[2] は既知なので返す
        if (i === 1 || i === 2) return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    function climbingStairsDFSMem(n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    /* メモ化探索 */
    function dfs(i: number, mem: number[]): number {
        // dp[1] と dp[2] は既知なので返す
        if (i === 1 || i === 2) return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    function climbingStairsDFSMem(n: number): number {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    /* メモ化探索 */
    int dfs(int i, List<int> mem) {
      // dp[1] と dp[2] は既知なので返す
      if (i == 1 || i == 2) return i;
      // dp[i] の記録があれば、それをそのまま返す
      if (mem[i] != -1) return mem[i];
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1, mem) + dfs(i - 2, mem);
      // dp[i] を記録する
      mem[i] = count;
      return count;
    }

    /* 階段登り：メモ化探索 */
    int climbingStairsDFSMem(int n) {
      // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
      List<int> mem = List.filled(n + 1, -1);
      return dfs(n, mem);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    /* メモ化探索 */
    fn dfs(i: usize, mem: &mut [i32]) -> i32 {
        // dp[1] と dp[2] は既知なので返す
        if i == 1 || i == 2 {
            return i as i32;
        }
        // dp[i] の記録があれば、それをそのまま返す
        if mem[i] != -1 {
            return mem[i];
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        count
    }

    /* 階段登り：メモ化探索 */
    fn climbing_stairs_dfs_mem(n: usize) -> i32 {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        let mut mem = vec![-1; n + 1];
        dfs(n, &mut mem)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    /* メモ化探索 */
    int dfs(int i, int *mem) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        int *mem = (int *)malloc((n + 1) * sizeof(int));
        for (int i = 0; i <= n; i++) {
            mem[i] = -1;
        }
        int result = dfs(n, mem);
        free(mem);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs_mem.kt"
    /* メモ化探索 */
    fun dfs(i: Int, mem: IntArray): Int {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2) return i
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1) return mem[i]
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1, mem) + dfs(i - 2, mem)
        // dp[i] を記録する
        mem[i] = count
        return count
    }

    /* 階段登り：メモ化探索 */
    fun climbingStairsDFSMem(n: Int): Int {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        val mem = IntArray(n + 1)
        mem.fill(-1)
        return dfs(n, mem)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    ### メモ化探索 ###
    def dfs(i, mem)
      # dp[1] と dp[2] は既知なので返す
      return i if i == 1 || i == 2
      # dp[i] の記録があれば、それをそのまま返す
      return mem[i] if mem[i] != -1

      # dp[i] = dp[i-1] + dp[i-2]
      count = dfs(i - 1, mem) + dfs(i - 2, mem)
      # dp[i] を記録する
      mem[i] = count
    end

    ### 階段登り：メモ化探索 ###
    def climbing_stairs_dfs_mem(n)
      # mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
      mem = Array.new(n + 1, -1)
      dfs(n, mem)
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%2C%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%E3%81%A8%20dp%5B2%5D%20%E3%81%AF%E6%97%A2%E7%9F%A5%E3%81%AA%E3%81%AE%E3%81%A7%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%E3%81%AE%E8%A8%98%E9%8C%B2%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E3%80%81%E3%81%9D%E3%82%8C%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%2C%20mem%29%20%2B%20dfs%28i%20-%202%2C%20mem%29%0A%20%20%20%20%23%20dp%5Bi%5D%20%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%E3%81%AF%E7%AC%AC%20i%20%E6%AE%B5%E3%81%BE%E3%81%A7%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AE%E7%B7%8F%E6%95%B0%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%80%81-1%20%E3%81%AF%E6%9C%AA%E8%A8%98%E9%8C%B2%E3%82%92%E8%A1%A8%E3%81%99%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n%2C%20mem%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%2C%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%20%E3%81%A8%20dp%5B2%5D%20%E3%81%AF%E6%97%A2%E7%9F%A5%E3%81%AA%E3%81%AE%E3%81%A7%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%E3%81%AE%E8%A8%98%E9%8C%B2%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E3%80%81%E3%81%9D%E3%82%8C%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%2C%20mem%29%20%2B%20dfs%28i%20-%202%2C%20mem%29%0A%20%20%20%20%23%20dp%5Bi%5D%20%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%E3%81%AF%E7%AC%AC%20i%20%E6%AE%B5%E3%81%BE%E3%81%A7%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AE%E7%B7%8F%E6%95%B0%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%80%81-1%20%E3%81%AF%E6%9C%AA%E8%A8%98%E9%8C%B2%E3%82%92%E8%A1%A8%E3%81%99%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n%2C%20mem%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図を見ると、**メモ化を行うことで、すべての重複部分問題は 1 回だけ計算すればよくなり、時間計算量は $O(n)$ まで改善されます**。これは大きな飛躍です。

![メモ化探索に対応する再帰木](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> 図 14-4 &nbsp; メモ化探索に対応する再帰木 </p>

## 14.1.3 &nbsp; 方法 3：動的計画法

**メモ化探索は「トップダウン」の方法**です。元の問題（根ノード）から始めて、より大きな部分問題を再帰的により小さな部分問題へ分解し、解が既知である最小部分問題（葉ノード）に至ります。その後、バックトラックしながら各層で部分問題の解を集め、元の問題の解を構築します。

これとは対照的に、**動的計画法は「ボトムアップ」の方法**です。最小部分問題の解から始めて、より大きな部分問題の解を反復的に構築し、最終的に元の問題の解を得ます。

動的計画法にはバックトラックの過程が含まれないため、再帰を使う必要はなく、ループによる反復だけで実装できます。次のコードでは、部分問題の解を保存する配列 `dp` を初期化しており、これはメモ化探索における配列 `mem` と同じ記録の役割を果たします：

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """階段登り：動的計画法"""
        if n == 1 or n == 2:
            return n
        # 部分問題の解を保存するために dp テーブルを初期化
        dp = [0] * (n + 1)
        # 初期状態：最小部分問題の解をあらかじめ設定
        dp[1], dp[2] = 1, 2
        # 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 階段登り：動的計画法 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        vector<int> dp(n + 1);
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 階段登り：動的計画法 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        int[] dp = new int[n + 1];
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* 階段登り：動的計画法 */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        int[] dp = new int[n + 1];
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* 階段登り：動的計画法 */
    func climbingStairsDP(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        // 部分問題の解を保存するために dp テーブルを初期化
        dp := make([]int, n+1)
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1
        dp[2] = 2
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for i := 3; i <= n; i++ {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* 階段登り：動的計画法 */
    func climbingStairsDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        // 部分問題の解を保存するために dp テーブルを初期化
        var dp = Array(repeating: 0, count: n + 1)
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1
        dp[2] = 2
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for i in 3 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* 階段登り：動的計画法 */
    function climbingStairsDP(n) {
        if (n === 1 || n === 2) return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        const dp = new Array(n + 1).fill(-1);
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* 階段登り：動的計画法 */
    function climbingStairsDP(n: number): number {
        if (n === 1 || n === 2) return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        const dp = new Array(n + 1).fill(-1);
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* 階段登り：動的計画法 */
    int climbingStairsDP(int n) {
      if (n == 1 || n == 2) return n;
      // 部分問題の解を保存するために dp テーブルを初期化
      List<int> dp = List.filled(n + 1, 0);
      // 初期状態：最小部分問題の解をあらかじめ設定
      dp[1] = 1;
      dp[2] = 2;
      // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
      for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* 階段登り：動的計画法 */
    fn climbing_stairs_dp(n: usize) -> i32 {
        // dp[1] と dp[2] は既知なので返す
        if n == 1 || n == 2 {
            return n as i32;
        }
        // 部分問題の解を保存するために dp テーブルを初期化
        let mut dp = vec![-1; n + 1];
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for i in 3..=n {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* 階段登り：動的計画法 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        int *dp = (int *)malloc((n + 1) * sizeof(int));
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        int result = dp[n];
        free(dp);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* 階段登り：動的計画法 */
    fun climbingStairsDP(n: Int): Int {
        if (n == 1 || n == 2) return n
        // 部分問題の解を保存するために dp テーブルを初期化
        val dp = IntArray(n + 1)
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1
        dp[2] = 2
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (i in 3..n) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### 階段登り：動的計画法 ###
    def climbing_stairs_dp(n)
      return n  if n == 1 || n == 2

      # 部分問題の解を保存するために dp テーブルを初期化
      dp = Array.new(n + 1, 0)
      # 初期状態：最小部分問題の解をあらかじめ設定
      dp[1], dp[2] = 1, 2
      # 状態遷移：小さい部分問題から大きい部分問題へ順に解く
      (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

      dp[n]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E4%BF%9D%E5%AD%98%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%EF%BC%9A%E6%9C%80%E5%B0%8F%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E3%81%82%E3%82%89%E3%81%8B%E3%81%98%E3%82%81%E8%A8%AD%E5%AE%9A%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%201%2C%202%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%B0%8F%E3%81%95%E3%81%84%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%8B%E3%82%89%E5%A4%A7%E3%81%8D%E3%81%84%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%B8%E9%A0%86%E3%81%AB%E8%A7%A3%E3%81%8F%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E4%BF%9D%E5%AD%98%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%EF%BC%9A%E6%9C%80%E5%B0%8F%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E3%81%82%E3%82%89%E3%81%8B%E3%81%98%E3%82%81%E8%A8%AD%E5%AE%9A%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%201%2C%202%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%B0%8F%E3%81%95%E3%81%84%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%8B%E3%82%89%E5%A4%A7%E3%81%8D%E3%81%84%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%B8%E9%A0%86%E3%81%AB%E8%A7%A3%E3%81%8F%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図は、以上のコードの実行過程をシミュレートしたものです。

![階段上りの動的計画法の過程](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> 図 14-5 &nbsp; 階段上りの動的計画法の過程 </p>

バックトラッキング法と同様に、動的計画法でも問題解決の特定段階を表すために「状態」という概念を用います。各状態は 1 つの部分問題と、それに対応する局所最適解に対応します。たとえば、階段を上る問題では、状態は現在いる階段の段数 $i$ と定義されます。

以上を踏まえると、動的計画法のよく使われる用語を次のようにまとめられます。

- 配列 `dp` を <u>dp テーブル</u> と呼び、$dp[i]$ は状態 $i$ に対応する部分問題の解を表します。
- 最小部分問題に対応する状態（第 $1$ 段目と第 $2$ 段目の階段）を<u>初期状態</u>と呼びます。
- 漸化式 $dp[i] = dp[i-1] + dp[i-2]$ を<u>状態遷移方程式</u>と呼びます。

## 14.1.4 &nbsp; 空間最適化

注意深い読者は気づいたかもしれません。**$dp[i]$ は $dp[i-1]$ と $dp[i-2]$ にしか依存しないため、すべての部分問題の解を保存するために配列 `dp` を使う必要はありません**。2 つの変数を順に更新していくだけで十分です。コードは次のとおりです：

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp_comp(n: int) -> int:
        """階段登り：空間最適化した動的計画法"""
        if n == 1 or n == 2:
            return n
        a, b = 1, 2
        for _ in range(3, n + 1):
            a, b = b, a + b
        return b
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 階段登り：空間最適化した動的計画法 */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 階段登り：空間最適化した動的計画法 */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* 階段登り：空間最適化した動的計画法 */
    int ClimbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* 階段登り：空間最適化した動的計画法 */
    func climbingStairsDPComp(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        a, b := 1, 2
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for i := 3; i <= n; i++ {
            a, b = b, a+b
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* 階段登り：空間最適化した動的計画法 */
    func climbingStairsDPComp(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        var a = 1
        var b = 2
        for _ in 3 ... n {
            (a, b) = (b, a + b)
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* 階段登り：空間最適化した動的計画法 */
    function climbingStairsDPComp(n) {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* 階段登り：空間最適化した動的計画法 */
    function climbingStairsDPComp(n: number): number {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* 階段登り：空間最適化した動的計画法 */
    int climbingStairsDPComp(int n) {
      if (n == 1 || n == 2) return n;
      int a = 1, b = 2;
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* 階段登り：空間最適化した動的計画法 */
    fn climbing_stairs_dp_comp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return n as i32;
        }
        let (mut a, mut b) = (1, 2);
        for _ in 3..=n {
            let tmp = b;
            b = a + b;
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* 階段登り：空間最適化した動的計画法 */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* 階段登り：空間最適化した動的計画法 */
    fun climbingStairsDPComp(n: Int): Int {
        if (n == 1 || n == 2) return n
        var a = 1
        var b = 2
        for (i in 3..n) {
            val temp = b
            b += a
            a = temp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### 階段登り：空間最適化後の動的計画法 ###
    def climbing_stairs_dp_comp(n)
      return n if n == 1 || n == 2

      a, b = 1, 2
      (3...(n + 1)).each { a, b = b, a + b }

      b
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a%2C%20b%20%3D%201%2C%202%0A%20%20%20%20for%20_%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E7%99%BB%E3%82%8A%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a%2C%20b%20%3D%201%2C%202%0A%20%20%20%20for%20_%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%E3%81%A7%E3%81%99%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

上のコードを見ると、配列 `dp` が占めていた領域を省けるため、空間計算量は $O(n)$ から $O(1)$ へと下がります。

動的計画法の問題では、現在の状態はしばしば直前の限られた個数の状態にしか関係しません。このような場合は、必要な状態だけを保持し、「次元削減」によってメモリ空間を節約できます。**この空間最適化の技巧は「ローリング変数」または「ローリング配列」と呼ばれます**。
