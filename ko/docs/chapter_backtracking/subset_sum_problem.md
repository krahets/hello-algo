---
comments: true
---

# 13.3 &nbsp; 부분 집합 합 문제

## 13.3.1 &nbsp; 중복 원소가 없는 경우

!!! question "문제"

    양의 정수 배열 `nums`와 목표 양의 정수 `target`이 주어진다. 원소의 합이 `target`인 모든 조합을 찾아라. 배열에는 중복 원소가 없고, 각 원소는 여러 번 선택할 수 있다. 조합들을 리스트로 반환하되 중복 조합이 없어야 한다.

예를 들어 입력 집합이 $\{3, 4, 5\}$이고 목표 정수가 $9$이면 해는 $\{3, 3, 3\}, \{4, 5\}$다. 다음 두 가지에 주의하자.

- 입력 집합의 원소는 횟수 제한 없이 반복 선택할 수 있다.
- 부분 집합에서는 원소의 순서를 구분하지 않는다. 예를 들어 $\{4, 5\}$와 $\{5, 4\}$는 같은 부분 집합이다.

### 1. &nbsp; 모든 순열 풀이 참고

모든 순열 문제처럼 부분 집합을 만드는 과정을 연속된 선택의 결과로 볼 수 있다. 선택할 때마다 '원소의 합'을 갱신하고, 합이 `target`이 되면 해당 부분 집합을 결과 리스트에 기록한다.

모든 순열 문제와 달리 **이 문제에서는 집합의 원소를 횟수 제한 없이 선택할 수 있다**. 따라서 선택 여부를 기록하는 불리언 리스트 `selected`가 필요하지 않다. 모든 순열 코드를 조금 수정하면 다음과 같은 첫 풀이를 얻는다.

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """백트래킹 알고리즘: 부분 집합 합 I"""
        # 부분 집합의 합이 target과 같으면 해를 기록한다
        if total == target:
            res.append(list(state))
            return
        # 모든 선택지를 순회한다
        for i in range(len(choices)):
            # 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if total + choices[i] > target:
                continue
            # 시도: 선택하고 원소의 합 total을 갱신한다
            state.append(choices[i])
            # 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res)
            # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """부분 집합 합 I 풀기(중복 부분 집합 포함)"""
        state = []  # 상태(부분 집합)
        total = 0  # 부분 집합의 합
        res = []  # 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            res.push_back(state);
            return;
        }
        // 모든 선택지를 순회한다
        for (size_t i = 0; i < choices.size(); i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.push_back(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop_back();
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
        vector<int> state;       // 상태(부분 집합)
        int total = 0;           // 부분 집합의 합
        vector<vector<int>> res; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < choices.length; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.add(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.remove(state.size() - 1);
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 상태(부분 집합)
        int total = 0; // 부분 집합의 합
        List<List<Integer>> res = new ArrayList<>(); // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < choices.Length; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.Add(choices[i]);
            // 다음 선택을 진행한다
            Backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 상태(부분 집합)
        int total = 0; // 부분 집합의 합
        List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
        Backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == total {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 모든 선택지를 순회한다
        for i := 0; i < len(*choices); i++ {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if total+(*choices)[i] > target {
                continue
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            *state = append(*state, (*choices)[i])
            // 다음 선택을 진행한다
            backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    func subsetSumINaive(nums []int, target int) [][]int {
        state := make([]int, 0) // 상태(부분 집합)
        total := 0              // 부분 집합의 합
        res := make([][]int, 0) // 결과 리스트(부분 집합 리스트)
        backtrackSubsetSumINaive(total, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if total == target {
            res.append(state)
            return
        }
        // 모든 선택지를 순회한다
        for i in choices.indices {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if total + choices[i] > target {
                continue
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.append(choices[i])
            // 다음 선택을 진행한다
            backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.removeLast()
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 상태(부분 집합)
        let total = 0 // 부분 집합의 합
        var res: [[Int]] = [] // 결과 리스트(부분 집합 리스트)
        backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    function backtrack(state, target, total, choices, res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total === target) {
            res.push([...state]);
            return;
        }
        // 모든 선택지를 순회한다
        for (let i = 0; i < choices.length; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    function subsetSumINaive(nums, target) {
        const state = []; // 상태(부분 집합)
        const total = 0; // 부분 집합의 합
        const res = []; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    function backtrack(
        state: number[],
        target: number,
        total: number,
        choices: number[],
        res: number[][]
    ): void {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total === target) {
            res.push([...state]);
            return;
        }
        // 모든 선택지를 순회한다
        for (let i = 0; i < choices.length; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    function subsetSumINaive(nums: number[], target: number): number[][] {
        const state = []; // 상태(부분 집합)
        const total = 0; // 부분 집합의 합
        const res = []; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(
      List<int> state,
      int target,
      int total,
      List<int> choices,
      List<List<int>> res,
    ) {
      // 부분 집합의 합이 target과 같으면 해를 기록한다
      if (total == target) {
        res.add(List.from(state));
        return;
      }
      // 모든 선택지를 순회한다
      for (int i = 0; i < choices.length; i++) {
        // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
        if (total + choices[i] > target) {
          continue;
        }
        // 시도: 선택하고 원소의 합 total을 갱신한다
        state.add(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target, total + choices[i], choices, res);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.removeLast();
      }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    List<List<int>> subsetSumINaive(List<int> nums, int target) {
      List<int> state = []; // 상태(부분 집합)
      int total = 0; // 원소의 합
      List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
      backtrack(state, target, total, nums, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        total: i32,
        choices: &[i32],
        res: &mut Vec<Vec<i32>>,
    ) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if total == target {
            res.push(state.clone());
            return;
        }
        // 모든 선택지를 순회한다
        for i in 0..choices.len() {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if total + choices[i] > target {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // 상태(부분 집합)
        let total = 0; // 부분 집합의 합
        let mut res = Vec::new(); // 결과 리스트(부분 집합 리스트)
        backtrack(&mut state, target, total, nums, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(int target, int total, int *choices, int choicesSize) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < choicesSize; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state[stateSize++] = choices[i];
            // 다음 선택을 진행한다
            backtrack(target, total + choices[i], choices, choicesSize);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            stateSize--;
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    void subsetSumINaive(int *nums, int numsSize, int target) {
        resSize = 0; // 해의 개수를 0으로 초기화
        backtrack(target, 0, nums, numsSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        total: Int,
        choices: IntArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            res.add(state.toMutableList())
            return
        }
        // 모든 선택지를 순회한다
        for (i in choices.indices) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.add(choices[i])
            // 다음 선택을 진행한다
            backtrack(state, target, total + choices[i], choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.removeAt(state.size - 1)
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 상태(부분 집합)
        val total = 0 // 부분 집합의 합
        val res = mutableListOf<MutableList<Int>?>() // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, total, nums, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    ### 백트래킹 알고리즘: 부분 집합 합 I ###
    def backtrack(state, target, total, choices, res)
      # 부분 집합의 합이 target과 같으면 해를 기록한다
      if total == target
        res << state.dup
        return
      end

      # 모든 선택지를 순회한다
      for i in 0...choices.length
        # 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
        next if total + choices[i] > target
        # 시도: 선택하고 원소의 합 total을 갱신한다
        state << choices[i]
        # 다음 선택을 진행한다
        backtrack(state, target, total + choices[i], choices, res)
        # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop
      end
    end

    ### 부분 집합 합 I 풀기(중복 부분 집합 포함)###
    def subset_sum_i_naive(nums, target)
      state = [] # 상태(부분 집합)
      total = 0 # 부분 집합의 합
      res = [] # 결과 리스트(부분 집합 리스트)
      backtrack(state, target, total, nums, res)
      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%0A%20%20%20%20target%3A%20int,%0A%20%20%20%20total%3A%20int,%0A%20%20%20%20choices%3A%20list%5Bint%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EA%B3%BC%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%ED%95%B4%EB%8B%B9%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20%EC%9B%90%EC%86%8C%EC%9D%98%20%ED%95%A9%20total%EC%9D%84%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target,%20total%20%2B%20choices%5Bi%5D,%20choices,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%20%ED%92%80%EA%B8%B0%28%EC%A4%91%EB%B3%B5%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%8F%AC%ED%95%A8%29%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%EC%83%81%ED%83%9C%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%29%0A%20%20%20%20total%20%3D%200%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%29%0A%20%20%20%20backtrack%28state,%20target,%20total,%20nums,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%ED%95%A9%EC%9D%B4%20%7Btarget%7D%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%EC%9D%B4%20%EB%B0%A9%EB%B2%95%EC%9D%98%20%EC%B6%9C%EB%A0%A5%20%EA%B2%B0%EA%B3%BC%EC%97%90%EB%8A%94%20%EC%A4%91%EB%B3%B5%20%EC%A7%91%ED%95%A9%EC%9D%B4%20%ED%8F%AC%ED%95%A8%EB%90%9C%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%0A%20%20%20%20target%3A%20int,%0A%20%20%20%20total%3A%20int,%0A%20%20%20%20choices%3A%20list%5Bint%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EA%B3%BC%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%ED%95%B4%EB%8B%B9%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20%EC%9B%90%EC%86%8C%EC%9D%98%20%ED%95%A9%20total%EC%9D%84%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target,%20total%20%2B%20choices%5Bi%5D,%20choices,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%20%ED%92%80%EA%B8%B0%28%EC%A4%91%EB%B3%B5%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%8F%AC%ED%95%A8%29%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%EC%83%81%ED%83%9C%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%29%0A%20%20%20%20total%20%3D%200%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%29%0A%20%20%20%20backtrack%28state,%20target,%20total,%20nums,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%ED%95%A9%EC%9D%B4%20%7Btarget%7D%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%EC%9D%B4%20%EB%B0%A9%EB%B2%95%EC%9D%98%20%EC%B6%9C%EB%A0%A5%20%EA%B2%B0%EA%B3%BC%EC%97%90%EB%8A%94%20%EC%A4%91%EB%B3%B5%20%EC%A7%91%ED%95%A9%EC%9D%B4%20%ED%8F%AC%ED%95%A8%EB%90%9C%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

위 코드에 배열 $[3, 4, 5]$와 목표 원소 $9$를 넣으면 $[3, 3, 3], [4, 5], [5, 4]$가 나온다. **합이 $9$인 모든 부분 집합을 찾았지만 $[4, 5]$와 $[5, 4]$는 중복이다**.

탐색 과정에서는 선택 순서를 구분하지만 부분 집합에서는 구분하지 않기 때문이다. 아래 그림(13-10)에서 $4$ 다음 $5$를 고르는 것과 $5$ 다음 $4$를 고르는 것은 서로 다른 가지이지만 같은 부분 집합에 대응한다.

![부분 집합 탐색과 범위 초과 가지치기](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> 그림 13-10 &nbsp; 부분 집합 탐색과 범위 초과 가지치기 </p>

중복 부분 집합을 제거하는 **직접적인 방법은 결과 리스트에서 중복을 제거하는 것**이다. 하지만 다음 두 이유로 매우 비효율적이다.

- 배열 원소가 많고 특히 `target`이 크면 탐색 과정에서 중복 부분 집합이 매우 많이 생긴다.
- 부분 집합(배열)이 같은지 비교하는 데 시간이 많이 든다. 먼저 배열을 정렬한 뒤 원소를 하나씩 비교해야 한다.

### 2. &nbsp; 중복 부분 집합 가지치기

**탐색 중 가지치기로 중복을 제거해 보자**. 아래 그림(13-11)에서 중복 부분 집합은 배열 원소를 서로 다른 순서로 선택할 때 생긴다. 예를 들면 다음과 같다.

1. 첫 번째와 두 번째에 각각 $3$과 $4$를 선택하면 이 두 원소를 포함하는 모든 부분 집합 $[3, 4, \dots]$가 만들어진다.
2. 이후 첫 번째에 $4$를 선택하면 **두 번째에서는 $3$을 건너뛰어야 한다**. 이 선택으로 만드는 $[4, 3, \dots]$는 `1.` 단계에서 만든 부분 집합과 완전히 중복되기 때문이다.

탐색에서 각 레벨의 선택은 왼쪽부터 오른쪽 순서로 시도하므로, 오른쪽으로 갈수록 잘라 내는 가지가 많아진다.

1. 첫 두 차례에 $3$과 $5$를 선택하여 부분 집합 $[3, 5, \dots]$를 만든다.
2. 첫 두 차례에 $4$와 $5$를 선택하여 부분 집합 $[4, 5, \dots]$를 만든다.
3. 첫 번째에 $5$를 선택한다면 **두 번째에서는 $3$과 $4$를 건너뛰어야 한다**. $[5, 3, \dots]$와 $[5, 4, \dots]$는 `1.` 단계와 `2.` 단계의 부분 집합과 완전히 중복되기 때문이다.

![선택 순서의 차이로 생기는 중복 부분 집합](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> 그림 13-11 &nbsp; 선택 순서의 차이로 생기는 중복 부분 집합 </p>

정리하면 입력 배열이 $[x_1, x_2, \dots, x_n]$일 때 선택 순서 $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$는 $i_1 \leq i_2 \leq \dots \leq i_m$을 만족해야 한다. **이 조건을 만족하지 않는 선택 순서는 중복을 만들므로 가지치기해야 한다**.

### 3. &nbsp; 코드 구현

이 가지치기를 위해 순회 시작점을 나타내는 변수 `start`를 초기화한다. **$x_{i}$를 선택한 뒤 다음 차례는 인덱스 $i$부터 순회하도록 설정한다**. 그러면 선택 순서가 $i_1 \leq i_2 \leq \dots \leq i_m$을 만족하여 부분 집합의 유일성을 보장한다.

이 밖에도 다음 두 가지를 최적화했다.

- 탐색을 시작하기 전에 배열 `nums`를 정렬한다. 선택지를 순회하다가 **부분 집합의 합이 `target`을 넘으면 반복문을 바로 종료한다**. 뒤의 원소들은 더 크므로 합도 반드시 `target`을 넘기 때문이다.
- 원소 합 변수 `total`을 없애고 **`target`에서 값을 빼는 방식으로 합을 추적한다**. `target`이 $0$이 되면 해를 기록한다.

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """백트래킹 알고리즘: 부분 집합 합 I"""
        # 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0:
            res.append(list(state))
            return
        # 모든 선택지를 순회한다
        # 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for i in range(start, len(choices)):
            # 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            # 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target - choices[i] < 0:
                break
            # 시도: 선택하고 target, start를 갱신한다
            state.append(choices[i])
            # 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res)
            # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """부분 집합 합 I 풀기"""
        state = []  # 상태(부분 집합)
        nums.sort()  # nums를 정렬한다
        start = 0  # 순회 시작 위치
        res = []  # 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (int i = start; i < choices.size(); i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push_back(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop_back();
        }
    }

    /* 부분 집합 합 I 풀기 */
    vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
        vector<int> state;              // 상태(부분 집합)
        sort(nums.begin(), nums.end()); // nums를 정렬한다
        int start = 0;                  // 순회 시작 위치
        vector<vector<int>> res;        // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (int i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.add(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.remove(state.size() - 1);
        }
    }

    /* 부분 집합 합 I 풀기 */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 상태(부분 집합)
        Arrays.sort(nums); // nums를 정렬한다
        int start = 0; // 순회 시작 위치
        List<List<Integer>> res = new ArrayList<>(); // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (int i = start; i < choices.Length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.Add(choices[i]);
            // 다음 선택을 진행한다
            Backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 부분 집합 합 I 풀기 */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // 상태(부분 집합)
        Array.Sort(nums); // nums를 정렬한다
        int start = 0; // 순회 시작 위치
        List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for i := start; i < len(*choices); i++ {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target-(*choices)[i] < 0 {
                break
            }
            // 시도: 선택하고 target, start를 갱신한다
            *state = append(*state, (*choices)[i])
            // 다음 선택을 진행한다
            backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 부분 집합 합 I 풀기 */
    func subsetSumI(nums []int, target int) [][]int {
        state := make([]int, 0) // 상태(부분 집합)
        sort.Ints(nums)         // nums를 정렬한다
        start := 0              // 순회 시작 위치
        res := make([][]int, 0) // 결과 리스트(부분 집합 리스트)
        backtrackSubsetSumI(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0 {
            res.append(state)
            return
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for i in choices.indices.dropFirst(start) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target - choices[i] < 0 {
                break
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.append(choices[i])
            // 다음 선택을 진행한다
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.removeLast()
        }
    }

    /* 부분 집합 합 I 풀기 */
    func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 상태(부분 집합)
        let nums = nums.sorted() // nums를 정렬한다
        let start = 0 // 순회 시작 위치
        var res: [[Int]] = [] // 결과 리스트(부분 집합 리스트)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    function backtrack(state, target, choices, start, res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (let i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 I 풀기 */
    function subsetSumI(nums, target) {
        const state = []; // 상태(부분 집합)
        nums.sort((a, b) => a - b); // nums를 정렬한다
        const start = 0; // 순회 시작 위치
        const res = []; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (let i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 I 풀기 */
    function subsetSumI(nums: number[], target: number): number[][] {
        const state = []; // 상태(부분 집합)
        nums.sort((a, b) => a - b); // nums를 정렬한다
        const start = 0; // 순회 시작 위치
        const res = []; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // 부분 집합의 합이 target과 같으면 해를 기록한다
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // 모든 선택지를 순회한다
      // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
      for (int i = start; i < choices.length; i++) {
        // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if (target - choices[i] < 0) {
          break;
        }
        // 시도: 선택하고 target, start를 갱신한다
        state.add(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i, res);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.removeLast();
      }
    }

    /* 부분 집합 합 I 풀기 */
    List<List<int>> subsetSumI(List<int> nums, int target) {
      List<int> state = []; // 상태(부분 집합)
      nums.sort(); // nums를 정렬한다
      int start = 0; // 순회 시작 위치
      List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for i in start..choices.len() {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target - choices[i] < 0 {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 I 풀기 */
    fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // 상태(부분 집합)
        nums.sort(); // nums를 정렬한다
        let start = 0; // 순회 시작 위치
        let mut res = Vec::new(); // 결과 리스트(부분 집합 리스트)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i.c"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            for (int i = 0; i < stateSize; ++i) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (int i = start; i < choicesSize; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state[stateSize] = choices[i];
            stateSize++;
            // 다음 선택을 진행한다
            backtrack(target - choices[i], choices, choicesSize, i);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            stateSize--;
        }
    }

    /* 부분 집합 합 I 풀기 */
    void subsetSumI(int *nums, int numsSize, int target) {
        qsort(nums, numsSize, sizeof(int), cmp); // nums를 정렬한다
        int start = 0;                           // 순회 시작 위치
        backtrack(target, nums, numsSize, start);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        for (i in start..<choices.size) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.add(choices[i])
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.removeAt(state.size - 1)
        }
    }

    /* 부분 집합 합 I 풀기 */
    fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 상태(부분 집합)
        nums.sort() // nums를 정렬한다
        val start = 0 // 순회 시작 위치
        val res = mutableListOf<MutableList<Int>?>() // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    ### 백트래킹 알고리즘: 부분 집합 합 I ###
    def backtrack(state, target, choices, start, res)
      # 부분 집합의 합이 target과 같으면 해를 기록한다
      if target.zero?
        res << state.dup
        return
      end
      # 모든 선택지를 순회한다
      # 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
      for i in start...choices.length
        # 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        # 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        break if target - choices[i] < 0
        # 시도: 선택하고 target, start를 갱신한다
        state << choices[i]
        # 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i, res)
        # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop
      end
    end

    ### 부분 집합 합 I 풀기 ###
    def subset_sum_i(nums, target)
      state = [] # 상태(부분 집합)
      nums.sort! # nums를 정렬한다
      start = 0 # 순회 시작 위치
      res = [] # 결과 리스트(부분 집합 리스트)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EA%B3%BC%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%202%3A%20start%EB%B6%80%ED%84%B0%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EC%A4%91%EB%B3%B5%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EC%83%9D%EC%84%B1%EC%9D%84%20%EB%B0%A9%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%201%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EC%A6%89%EC%8B%9C%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%B4%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%96%B4%20%EC%9E%88%EC%96%B4%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EB%8D%94%20%ED%81%AC%EB%AF%80%EB%A1%9C,%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20%EB%B0%98%EB%93%9C%EC%8B%9C%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EA%B8%B0%20%EB%95%8C%EB%AC%B8%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20target,%20start%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%20%ED%92%80%EA%B8%B0%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%EC%83%81%ED%83%9C%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20nums%EB%A5%BC%20%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20start%20%3D%200%20%20%23%20%EC%88%9C%ED%9A%8C%20%EC%8B%9C%EC%9E%91%20%EC%9C%84%EC%B9%98%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%ED%95%A9%EC%9D%B4%20%7Btarget%7D%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EA%B3%BC%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%202%3A%20start%EB%B6%80%ED%84%B0%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EC%A4%91%EB%B3%B5%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EC%83%9D%EC%84%B1%EC%9D%84%20%EB%B0%A9%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%201%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EC%A6%89%EC%8B%9C%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%B4%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%96%B4%20%EC%9E%88%EC%96%B4%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EB%8D%94%20%ED%81%AC%EB%AF%80%EB%A1%9C,%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20%EB%B0%98%EB%93%9C%EC%8B%9C%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EA%B8%B0%20%EB%95%8C%EB%AC%B8%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20target,%20start%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20I%20%ED%92%80%EA%B8%B0%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%EC%83%81%ED%83%9C%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20nums%EB%A5%BC%20%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20start%20%3D%200%20%20%23%20%EC%88%9C%ED%9A%8C%20%EC%8B%9C%EC%9E%91%20%EC%9C%84%EC%B9%98%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%ED%95%A9%EC%9D%B4%20%7Btarget%7D%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(13-12)은 배열 $[3, 4, 5]$와 목표 원소 $9$를 위 코드에 넣었을 때의 전체 백트래킹 과정이다.

![부분 집합 합 I의 백트래킹 과정](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> 그림 13-12 &nbsp; 부분 집합 합 I의 백트래킹 과정 </p>

## 13.3.2 &nbsp; 중복 원소가 있는 경우

!!! question "문제"

    양의 정수 배열 `nums`와 목표 양의 정수 `target`이 주어진다. 원소의 합이 `target`인 모든 조합을 찾아라. **배열에는 중복 원소가 있을 수 있고, 각 원소는 한 번만 선택할 수 있다**. 조합들을 리스트로 반환하되 중복 조합이 없어야 한다.

앞 문제와 달리 **입력 배열에 중복 원소가 있을 수 있어** 새로운 문제가 생긴다. 예를 들어 배열 $[4, \hat{4}, 5]$와 목표 원소 $9$를 기존 코드에 넣으면 $[4, 5], [\hat{4}, 5]$가 나와 부분 집합이 중복된다.

**중복의 원인은 값이 같은 원소를 한 차례의 선택에서 여러 번 고르기 때문이다**. 아래 그림(13-13)에서 첫 차례의 세 선택지 중 두 개가 $4$여서 중복된 두 탐색 가지가 만들어지고, 같은 부분 집합을 출력한다. 마찬가지로 두 번째 차례의 두 $4$도 중복을 만든다.

![같은 값의 원소로 생기는 중복 부분 집합](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> 그림 13-13 &nbsp; 같은 값의 원소로 생기는 중복 부분 집합 </p>

### 1. &nbsp; 같은 값의 원소 가지치기

이를 해결하려면 **각 차례에서 같은 값의 원소를 한 번만 선택하도록 제한해야 한다**. 구현 방법은 간단하면서도 기발하다. 배열이 정렬되어 있으므로 같은 원소끼리는 인접한다. 따라서 한 차례의 선택에서 현재 원소가 왼쪽 원소와 같다면 이미 선택한 값이라는 뜻이므로 바로 건너뛴다.

또한 **이 문제에서는 각 배열 원소를 한 번만 선택할 수 있다**. 다행히 `start`로 이 제약도 만족시킬 수 있다. $x_{i}$를 선택한 뒤 다음 차례는 인덱스 $i + 1$부터 배열의 끝을 향해 순회하도록 설정한다. 그러면 중복 부분 집합과 같은 원소의 반복 선택을 모두 막을 수 있다.

### 2. &nbsp; 코드 구현

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """백트래킹 알고리즘: 부분 집합 합 II"""
        # 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0:
            res.append(list(state))
            return
        # 모든 선택지를 순회한다
        # 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        # 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for i in range(start, len(choices)):
            # 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            # 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target - choices[i] < 0:
                break
            # 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if i > start and choices[i] == choices[i - 1]:
                continue
            # 시도: 선택하고 target, start를 갱신한다
            state.append(choices[i])
            # 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res)
            # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """부분 집합 합 II 풀기"""
        state = []  # 상태(부분 집합)
        nums.sort()  # nums를 정렬한다
        start = 0  # 순회 시작 위치
        res = []  # 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (int i = start; i < choices.size(); i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push_back(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop_back();
        }
    }

    /* 부분 집합 합 II 풀기 */
    vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
        vector<int> state;              // 상태(부분 집합)
        sort(nums.begin(), nums.end()); // nums를 정렬한다
        int start = 0;                  // 순회 시작 위치
        vector<vector<int>> res;        // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (int i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.add(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.remove(state.size() - 1);
        }
    }

    /* 부분 집합 합 II 풀기 */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 상태(부분 집합)
        Arrays.sort(nums); // nums를 정렬한다
        int start = 0; // 순회 시작 위치
        List<List<Integer>> res = new ArrayList<>(); // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (int i = start; i < choices.Length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.Add(choices[i]);
            // 다음 선택을 진행한다
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 부분 집합 합 II 풀기 */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // 상태(부분 집합)
        Array.Sort(nums); // nums를 정렬한다
        int start = 0; // 순회 시작 위치
        List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for i := start; i < len(*choices); i++ {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target-(*choices)[i] < 0 {
                break
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if i > start && (*choices)[i] == (*choices)[i-1] {
                continue
            }
            // 시도: 선택하고 target, start를 갱신한다
            *state = append(*state, (*choices)[i])
            // 다음 선택을 진행한다
            backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 부분 집합 합 II 풀기 */
    func subsetSumII(nums []int, target int) [][]int {
        state := make([]int, 0) // 상태(부분 집합)
        sort.Ints(nums)         // nums를 정렬한다
        start := 0              // 순회 시작 위치
        res := make([][]int, 0) // 결과 리스트(부분 집합 리스트)
        backtrackSubsetSumII(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0 {
            res.append(state)
            return
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for i in choices.indices.dropFirst(start) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target - choices[i] < 0 {
                break
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if i > start, choices[i] == choices[i - 1] {
                continue
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.append(choices[i])
            // 다음 선택을 진행한다
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.removeLast()
        }
    }

    /* 부분 집합 합 II 풀기 */
    func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 상태(부분 집합)
        let nums = nums.sorted() // nums를 정렬한다
        let start = 0 // 순회 시작 위치
        var res: [[Int]] = [] // 결과 리스트(부분 집합 리스트)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    function backtrack(state, target, choices, start, res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (let i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 II 풀기 */
    function subsetSumII(nums, target) {
        const state = []; // 상태(부분 집합)
        nums.sort((a, b) => a - b); // nums를 정렬한다
        const start = 0; // 순회 시작 위치
        const res = []; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (let i = start; i < choices.length; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 II 풀기 */
    function subsetSumII(nums: number[], target: number): number[][] {
        const state = []; // 상태(부분 집합)
        nums.sort((a, b) => a - b); // nums를 정렬한다
        const start = 0; // 순회 시작 위치
        const res = []; // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // 부분 집합의 합이 target과 같으면 해를 기록한다
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // 모든 선택지를 순회한다
      // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
      // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
      for (int i = start; i < choices.length; i++) {
        // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if (target - choices[i] < 0) {
          break;
        }
        // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
        if (i > start && choices[i] == choices[i - 1]) {
          continue;
        }
        // 시도: 선택하고 target, start를 갱신한다
        state.add(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.removeLast();
      }
    }

    /* 부분 집합 합 II 풀기 */
    List<List<int>> subsetSumII(List<int> nums, int target) {
      List<int> state = []; // 상태(부분 집합)
      nums.sort(); // nums를 정렬한다
      int start = 0; // 순회 시작 위치
      List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for i in start..choices.len() {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if target - choices[i] < 0 {
                break;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if i > start && choices[i] == choices[i - 1] {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.push(choices[i]);
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.pop();
        }
    }

    /* 부분 집합 합 II 풀기 */
    fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // 상태(부분 집합)
        nums.sort(); // nums를 정렬한다
        let start = 0; // 순회 시작 위치
        let mut res = Vec::new(); // 결과 리스트(부분 집합 리스트)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (int i = start; i < choicesSize; i++) {
            // 가지치기 1: 부분 집합의 합이 target을 넘으면 바로 건너뛴다
            if (target - choices[i] < 0) {
                continue;
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 시도: 선택하고 target, start를 갱신한다
            state[stateSize] = choices[i];
            stateSize++;
            // 다음 선택을 진행한다
            backtrack(target - choices[i], choices, choicesSize, i + 1);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            stateSize--;
        }
    }

    /* 부분 집합 합 II 풀기 */
    void subsetSumII(int *nums, int numsSize, int target) {
        // nums를 정렬한다
        qsort(nums, numsSize, sizeof(int), cmp);
        // 백트래킹 시작
        backtrack(target, nums, numsSize, 0);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    /* 백트래킹 알고리즘: 부분 집합 합 II */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // 모든 선택지를 순회한다
        // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
        // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
        for (i in start..<choices.size) {
            // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
            // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
            if (target - choices[i] < 0) {
                break
            }
            // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
            if (i > start && choices[i] == choices[i - 1]) {
                continue
            }
            // 시도: 선택하고 target, start를 갱신한다
            state.add(choices[i])
            // 다음 선택을 진행한다
            backtrack(state, target - choices[i], choices, i + 1, res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.removeAt(state.size - 1)
        }
    }

    /* 부분 집합 합 II 풀기 */
    fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 상태(부분 집합)
        nums.sort() // nums를 정렬한다
        val start = 0 // 순회 시작 위치
        val res = mutableListOf<MutableList<Int>?>() // 결과 리스트(부분 집합 리스트)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    ### 백트래킹 알고리즘: 부분 집합 합 II ###
    def backtrack(state, target, choices, start, res)
      # 부분 집합의 합이 target과 같으면 해를 기록한다
      if target.zero?
        res << state.dup
        return
      end

      # 모든 선택지를 순회한다
      # 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
      # 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
      for i in start...choices.length
        # 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        # 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        break if target - choices[i] < 0
        # 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
        next if i > start && choices[i] == choices[i - 1]
        # 시도: 선택하고 target, start를 갱신한다
        state << choices[i]
        # 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i + 1, res)
        # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop
      end
    end

    ### 부분 집합 합 II 풀기 ###
    def subset_sum_ii(nums, target)
      state = [] # 상태(부분 집합)
      nums.sort! # nums를 정렬한다
      start = 0 # 순회 시작 위치
      res = [] # 결과 리스트(부분 집합 리스트)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20II%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EA%B3%BC%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%202%3A%20start%EB%B6%80%ED%84%B0%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EC%A4%91%EB%B3%B5%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EC%83%9D%EC%84%B1%EC%9D%84%20%EB%B0%A9%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%203%3A%20start%EB%B6%80%ED%84%B0%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EA%B0%99%EC%9D%80%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EC%A4%91%EB%B3%B5%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EB%B0%A9%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%201%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EC%A6%89%EC%8B%9C%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%B4%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%96%B4%20%EC%9E%88%EC%96%B4%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EB%8D%94%20%ED%81%AC%EB%AF%80%EB%A1%9C,%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20%EB%B0%98%EB%93%9C%EC%8B%9C%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EA%B8%B0%20%EB%95%8C%EB%AC%B8%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%204%3A%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%99%BC%EC%AA%BD%20%EC%9B%90%EC%86%8C%EC%99%80%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%83%90%EC%83%89%20%EB%B6%84%EA%B8%B0%EA%B0%80%20%EC%A4%91%EB%B3%B5%EB%90%98%EB%AF%80%EB%A1%9C%20%EB%B0%94%EB%A1%9C%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20target,%20start%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i%20%2B%201,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20II%20%ED%92%80%EA%B8%B0%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%EC%83%81%ED%83%9C%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20nums%EB%A5%BC%20%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20start%20%3D%200%20%20%23%20%EC%88%9C%ED%9A%8C%20%EC%8B%9C%EC%9E%91%20%EC%9C%84%EC%B9%98%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%ED%95%A9%EC%9D%B4%20%7Btarget%7D%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%EB%B0%B1%ED%8A%B8%EB%9E%98%ED%82%B9%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20II%22%22%22%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EA%B3%BC%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%95%B4%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%EB%AA%A8%EB%93%A0%20%EC%84%A0%ED%83%9D%EC%A7%80%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%202%3A%20start%EB%B6%80%ED%84%B0%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EC%A4%91%EB%B3%B5%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EC%83%9D%EC%84%B1%EC%9D%84%20%EB%B0%A9%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%203%3A%20start%EB%B6%80%ED%84%B0%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EA%B0%99%EC%9D%80%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EC%A4%91%EB%B3%B5%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EB%B0%A9%EC%A7%80%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%201%3A%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EC%A6%89%EC%8B%9C%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EC%97%B4%EC%9D%B4%20%EC%A0%95%EB%A0%AC%EB%90%98%EC%96%B4%20%EC%9E%88%EC%96%B4%20%EB%92%A4%EC%9D%98%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EB%8D%94%20%ED%81%AC%EB%AF%80%EB%A1%9C,%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%EC%9D%98%20%ED%95%A9%EC%9D%B4%20%EB%B0%98%EB%93%9C%EC%8B%9C%20target%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EA%B8%B0%20%EB%95%8C%EB%AC%B8%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%EA%B0%80%EC%A7%80%EC%B9%98%EA%B8%B0%204%3A%20%ED%95%B4%EB%8B%B9%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%99%BC%EC%AA%BD%20%EC%9B%90%EC%86%8C%EC%99%80%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%ED%83%90%EC%83%89%20%EB%B6%84%EA%B8%B0%EA%B0%80%20%EC%A4%91%EB%B3%B5%EB%90%98%EB%AF%80%EB%A1%9C%20%EB%B0%94%EB%A1%9C%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%EC%8B%9C%EB%8F%84%3A%20%EC%84%A0%ED%83%9D%ED%95%98%EA%B3%A0%20target,%20start%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%A7%84%ED%96%89%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i%20%2B%201,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%EB%90%98%EB%8F%8C%EB%A6%AC%EA%B8%B0%3A%20%EC%84%A0%ED%83%9D%EC%9D%84%20%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0%20%EC%9D%B4%EC%A0%84%20%EC%83%81%ED%83%9C%EB%A1%9C%20%EB%90%98%EB%8F%8C%EB%A6%B0%EB%8B%A4%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%ED%95%A9%20II%20%ED%92%80%EA%B8%B0%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%EC%83%81%ED%83%9C%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20nums%EB%A5%BC%20%EC%A0%95%EB%A0%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20start%20%3D%200%20%20%23%20%EC%88%9C%ED%9A%8C%20%EC%8B%9C%EC%9E%91%20%EC%9C%84%EC%B9%98%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%28%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%20%EB%B0%B0%EC%97%B4%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%ED%95%A9%EC%9D%B4%20%7Btarget%7D%EC%9D%B8%20%EB%AA%A8%EB%93%A0%20%EB%B6%80%EB%B6%84%20%EC%A7%91%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(13-14)은 배열 $[4, 4, 5]$와 목표 원소 $9$의 백트래킹 과정으로, 네 가지 가지치기를 포함한다. 그림과 코드 주석을 함께 보면서 전체 탐색 과정과 각 가지치기가 어떻게 작동하는지 이해해 보자.

![부분 집합 합 II의 백트래킹 과정](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> 그림 13-14 &nbsp; 부분 집합 합 II의 백트래킹 과정 </p>
