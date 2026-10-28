---
comments: true
---

# 11.9 &nbsp; 계수 정렬

<u>계수 정렬(counting sort)</u>은 원소의 개수를 세어 정렬하며, 주로 정수 배열에 사용한다.

## 11.9.1 &nbsp; 간단한 구현

먼저 간단한 예를 보자. 길이가 $n$인 배열 `nums`의 모든 원소가 '음이 아닌 정수'라고 하자. 계수 정렬의 전체 과정은 아래 그림(11-16)과 같다.

1. 배열을 순회하여 가장 큰 수 $m$을 찾고, 길이가 $m + 1$인 보조 배열 `counter`를 만든다.
2. **`counter`를 이용하여 `nums`에서 각 수가 나타나는 횟수를 센다**. `counter[num]`은 수 `num`의 등장 횟수다. 세는 방법은 간단하다. `nums`를 순회하면서 현재 수를 `num`이라고 할 때 `counter[num]`을 $1$씩 늘리면 된다.
3. **`counter`의 인덱스는 본래 순서대로 배열되어 있으므로, 모든 수가 이미 정렬된 셈이다**. 이어서 `counter`를 순회하며 각 수의 등장 횟수만큼 작은 수부터 큰 수 순서로 `nums`에 채우면 된다.

![계수 정렬 과정](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> 그림 11-16 &nbsp; 계수 정렬 과정 </p>

코드는 다음과 같다.

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """계수 정렬"""
        # 간단한 구현이며, 객체 정렬에는 사용할 수 없다
        # 1. 배열의 최댓값 m을 구한다
        m = max(nums)
        # 2. 각 숫자의 등장 횟수를 센다
        # counter[num]은 num의 등장 횟수를 나타낸다
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    void countingSortNaive(vector<int> &nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    void countingSortNaive(int[] nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    void CountingSortNaive(int[] nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    func countingSortNaive(nums []int) {
        // 1. 배열의 최댓값 m을 구한다
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        for i, num := 0, 0; num < m+1; num++ {
            for j := 0; j < counter[num]; j++ {
                nums[i] = num
                i++
            }
        }
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    func countingSortNaive(nums: inout [Int]) {
        // 1. 배열의 최댓값 m을 구한다
        let m = nums.max()!
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        var i = 0
        for num in 0 ..< m + 1 {
            for _ in 0 ..< counter[num] {
                nums[i] = num
                i += 1
            }
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    function countingSortNaive(nums) {
        // 1. 배열의 최댓값 m을 구한다
        let m = Math.max(...nums);
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    function countingSortNaive(nums: number[]): void {
        // 1. 배열의 최댓값 m을 구한다
        let m: number = Math.max(...nums);
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    void countingSortNaive(List<int> nums) {
      // 1. 배열의 최댓값 m을 구한다
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. 각 숫자의 등장 횟수를 센다
      // counter[_num]은 _num의 등장 횟수를 나타낸다
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
      int i = 0;
      for (int _num = 0; _num < m + 1; _num++) {
        for (int j = 0; j < counter[_num]; j++, i++) {
          nums[i] = _num;
        }
      }
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    fn counting_sort_naive(nums: &mut [i32]) {
        // 1. 배열의 최댓값 m을 구한다
        let m = *nums.iter().max().unwrap();
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        let mut counter = vec![0; m as usize + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        let mut i = 0;
        for num in 0..m + 1 {
            for _ in 0..counter[num as usize] {
                nums[i] = num;
                i += 1;
            }
        }
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    void countingSortNaive(int nums[], int size) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
        // 4. 메모리를 해제한다
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* 계수 정렬 */
    // 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    fun countingSortNaive(nums: IntArray) {
        // 1. 배열의 최댓값 m을 구한다
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
        var i = 0
        for (num in 0..<m + 1) {
            var j = 0
            while (j < counter[num]) {
                nums[i] = num
                j++
                i++
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### 계수 정렬 ###
    def counting_sort_naive(nums)
      # 간단한 구현이며, 객체 정렬에는 사용할 수 없다
      # 1. 배열의 최댓값 m을 구한다
      m = 0
      nums.each { |num| m = [m, num].max }
      # 2. 각 숫자의 등장 횟수를 센다
      # counter[num]은 num의 등장 횟수를 나타낸다
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
      i = 0
      for num in 0...(m + 1)
        (0...counter[num]).each do
          nums[i] = num
          i += 1
        end
      end
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EA%B0%84%EB%8B%A8%ED%95%9C%20%EA%B5%AC%ED%98%84%EC%9D%B4%EB%A9%B0,%20%EA%B0%9D%EC%B2%B4%20%EC%A0%95%EB%A0%AC%EC%97%90%EB%8A%94%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EC%88%98%20%EC%97%86%EB%8B%A4%0A%20%20%20%20%23%201.%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B5%9C%EB%8C%93%EA%B0%92%20m%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%EA%B0%81%20%EC%88%AB%EC%9E%90%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EC%84%BC%EB%8B%A4%0A%20%20%20%20%23%20counter%5Bnum%5D%EC%9D%80%20num%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EB%82%98%ED%83%80%EB%82%B8%EB%8B%A4%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%98%EB%A9%B0%20%EA%B0%81%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9B%90%EB%9E%98%20%EB%B0%B0%EC%97%B4%20nums%EC%97%90%20%EC%B1%84%EC%9A%B4%EB%8B%A4%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%28%EA%B0%9D%EC%B2%B4%20%EC%A0%95%EB%A0%AC%20%EB%B6%88%EA%B0%80%29%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EA%B0%84%EB%8B%A8%ED%95%9C%20%EA%B5%AC%ED%98%84%EC%9D%B4%EB%A9%B0,%20%EA%B0%9D%EC%B2%B4%20%EC%A0%95%EB%A0%AC%EC%97%90%EB%8A%94%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EC%88%98%20%EC%97%86%EB%8B%A4%0A%20%20%20%20%23%201.%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B5%9C%EB%8C%93%EA%B0%92%20m%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%EA%B0%81%20%EC%88%AB%EC%9E%90%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EC%84%BC%EB%8B%A4%0A%20%20%20%20%23%20counter%5Bnum%5D%EC%9D%80%20num%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EB%82%98%ED%83%80%EB%82%B8%EB%8B%A4%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%EB%A5%BC%20%EC%88%9C%ED%9A%8C%ED%95%98%EB%A9%B0%20%EA%B0%81%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%9B%90%EB%9E%98%20%EB%B0%B0%EC%97%B4%20nums%EC%97%90%20%EC%B1%84%EC%9A%B4%EB%8B%A4%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%28%EA%B0%9D%EC%B2%B4%20%EC%A0%95%EB%A0%AC%20%EB%B6%88%EA%B0%80%29%EC%9D%84%20%EB%A7%88%EC%B9%9C%20%ED%9B%84%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

!!! note "계수 정렬과 버킷 정렬의 관계"

    버킷 정렬의 관점에서는 계수 배열 `counter`의 각 인덱스를 하나의 버킷으로, 개수를 세는 과정을 원소를 해당 버킷에 분배하는 과정으로 볼 수 있다. 본질적으로 계수 정렬은 정수 데이터에 적용되는 버킷 정렬의 특수한 경우다.

## 11.9.2 &nbsp; 완전한 구현

주의 깊게 읽었다면 **입력 데이터가 객체일 때 위의 `3.` 단계가 작동하지 않는다는 것**을 알아차렸을 것이다. 입력이 상품 객체이고 상품 가격(클래스의 멤버 변수)에 따라 정렬하려 한다고 하자. 위 알고리즘으로는 가격의 정렬 결과만 얻을 수 있다.

그렇다면 원래 데이터의 정렬 결과는 어떻게 얻을까? 먼저 `counter`의 '접두 합'을 계산한다. 이름 그대로 인덱스 `i`의 접두 합 `prefix[i]`는 배열의 앞 `i` 개 원소를 더한 값이다.

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**접두 합은 명확한 의미를 가진다. `prefix[num] - 1`은 결과 배열 `res`에서 원소 `num`이 마지막으로 나타나는 인덱스다**. 이는 각 원소가 결과 배열의 어디에 놓여야 하는지 알려 주는 핵심 정보다. 이어서 원래 배열 `nums`의 각 원소 `num`을 역순으로 순회하며 매번 다음 두 단계를 수행한다.

1. 배열 `res`의 인덱스 `prefix[num] - 1`에 `num`을 넣는다.
2. 접두 합 `prefix[num]`을 $1$ 줄여 다음에 `num`을 넣을 인덱스를 얻는다.

순회를 마치면 배열 `res`에 정렬된 결과가 들어 있다. 마지막으로 `res`를 원래 배열 `nums`에 덮어쓰면 된다. 아래 그림(11-17)은 계수 정렬의 전체 과정을 보여 준다.

=== "<1>"
    ![계수 정렬 단계](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![계수 정렬 2단계](counting_sort.assets/counting_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![계수 정렬 3단계](counting_sort.assets/counting_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![계수 정렬 4단계](counting_sort.assets/counting_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![계수 정렬 5단계](counting_sort.assets/counting_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![계수 정렬 6단계](counting_sort.assets/counting_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![계수 정렬 7단계](counting_sort.assets/counting_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![계수 정렬 8단계](counting_sort.assets/counting_sort_step8.png){ class="animation-figure" }

<p align="center"> 그림 11-17 &nbsp; 계수 정렬 단계 </p>

계수 정렬의 구현 코드는 다음과 같다.

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """계수 정렬"""
        # 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
        # 1. 배열의 최댓값 m을 구한다
        m = max(nums)
        # 2. 각 숫자의 등장 횟수를 센다
        # counter[num]은 num의 등장 횟수를 나타낸다
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        # 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        # 결과를 기록할 배열 res를 초기화한다
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # num을 해당 인덱스에 배치한다
            counter[num] -= 1  # 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        # 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    void countingSort(vector<int> &nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--;              // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    void countingSort(int[] nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    void CountingSort(int[] nums) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    func countingSort(nums []int) {
        // 1. 배열의 최댓값 m을 구한다
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for i := 0; i < m; i++ {
            counter[i+1] += counter[i]
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        n := len(nums)
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            num := nums[i]
            // num을 해당 인덱스에 배치한다
            res[counter[num]-1] = num
            // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
            counter[num]--
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        copy(nums, res)
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    func countingSort(nums: inout [Int]) {
        // 1. 배열의 최댓값 m을 구한다
        let m = nums.max()!
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for i in 0 ..< m {
            counter[i + 1] += counter[i]
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let num = nums[i]
            res[counter[num] - 1] = num // num을 해당 인덱스에 배치한다
            counter[num] -= 1 // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for i in nums.indices {
            nums[i] = res[i]
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    function countingSort(nums) {
        // 1. 배열의 최댓값 m을 구한다
        let m = Math.max(...nums);
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        const n = nums.length;
        const res = new Array(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    function countingSort(nums: number[]): void {
        // 1. 배열의 최댓값 m을 구한다
        let m: number = Math.max(...nums);
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        const n = nums.length;
        const res: number[] = new Array<number>(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    void countingSort(List<int> nums) {
      // 1. 배열의 최댓값 m을 구한다
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. 각 숫자의 등장 횟수를 센다
      // counter[_num]은 _num의 등장 횟수를 나타낸다
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
      // 즉, counter[_num]-1은 res에서 _num이 마지막으로 등장하는 인덱스이다
      for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
      }
      // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
      // 결과를 기록할 배열 res를 초기화한다
      int n = nums.length;
      List<int> res = List.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int _num = nums[i];
        res[counter[_num] - 1] = _num; // _num을 해당 인덱스에 배치한다
        counter[_num]--; // 접두 합을 1 감소시켜 다음에 _num을 배치할 인덱스를 구한다
      }
      // 결과 배열 res로 원래 배열 nums를 덮어쓴다
      nums.setAll(0, res);
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    fn counting_sort(nums: &mut [i32]) {
        // 1. 배열의 최댓값 m을 구한다
        let m = *nums.iter().max().unwrap() as usize;
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        let mut counter = vec![0; m + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for i in 0..m {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        let n = nums.len();
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let num = nums[i];
            res[counter[num as usize] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num as usize] -= 1; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        nums.copy_from_slice(&res)
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    void countingSort(int nums[], int size) {
        // 1. 배열의 최댓값 m을 구한다
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        int *counter = calloc(m, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        int *res = malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num을 해당 인덱스에 배치한다
            counter[num]--;              // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        memcpy(nums, res, size * sizeof(int));
        // 5. 메모리를 해제한다
        free(res);
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* 계수 정렬 */
    // 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    fun countingSort(nums: IntArray) {
        // 1. 배열의 최댓값 m을 구한다
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. 각 숫자의 등장 횟수를 센다
        // counter[num]은 num의 등장 횟수를 나타낸다
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
        // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
        for (i in 0..<m) {
            counter[i + 1] += counter[i]
        }
        // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
        // 결과를 기록할 배열 res를 초기화한다
        val n = nums.size
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val num = nums[i]
            res[counter[num] - 1] = num // num을 해당 인덱스에 배치한다
            counter[num]-- // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
        }
        // 결과 배열 res로 원래 배열 nums를 덮어쓴다
        for (i in 0..<n) {
            nums[i] = res[i]
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### 계수 정렬 ###
    def counting_sort(nums)
      # 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
      # 1. 배열의 최댓값 m을 구한다
      m = nums.max
      # 2. 각 숫자의 등장 횟수를 센다
      # counter[num]은 num의 등장 횟수를 나타낸다
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
      # 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
      (0...m).each { |i| counter[i + 1] += counter[i] }
      # 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
      # 결과를 기록할 배열 res를 초기화한다
      n = nums.length
      res = Array.new(n, 0)
      (n - 1).downto(0).each do |i|
        num = nums[i]
        res[counter[num] - 1] = num # num을 해당 인덱스에 배치한다
        counter[num] -= 1 # 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
      end
      # 결과 배열 res로 원래 배열 nums를 덮어쓴다
      (0...n).each { |i| nums[i] = res[i] }
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EC%99%84%EC%A0%84%ED%95%9C%20%EA%B5%AC%ED%98%84%EC%9D%B4%EB%A9%B0,%20%EA%B0%9D%EC%B2%B4%EB%A5%BC%20%EC%A0%95%EB%A0%AC%ED%95%A0%20%EC%88%98%20%EC%9E%88%EA%B3%A0%20%EC%95%88%EC%A0%95%20%EC%A0%95%EB%A0%AC%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%23%201.%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B5%9C%EB%8C%93%EA%B0%92%20m%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%EA%B0%81%20%EC%88%AB%EC%9E%90%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EC%84%BC%EB%8B%A4%0A%20%20%20%20%23%20counter%5Bnum%5D%EC%9D%80%20num%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EB%82%98%ED%83%80%EB%82%B8%EB%8B%A4%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%EC%9D%98%20%EC%A0%91%EB%91%90%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%98%EC%97%AC%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A1%9C%20%EB%B3%80%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EC%A6%89,%20counter%5Bnum%5D-1%EC%9D%80%20res%EC%97%90%EC%84%9C%20num%EC%9D%B4%20%EB%A7%88%EC%A7%80%EB%A7%89%EC%9C%BC%EB%A1%9C%20%EB%93%B1%EC%9E%A5%ED%95%98%EB%8A%94%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20nums%EB%A5%BC%20%EC%97%AD%EC%88%9C%EC%9C%BC%EB%A1%9C%20%EC%88%9C%ED%9A%8C%ED%95%98%EB%A9%B0%20%EA%B0%81%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B2%B0%EA%B3%BC%20%EB%B0%B0%EC%97%B4%20res%EC%97%90%20%EC%B1%84%EC%9A%B4%EB%8B%A4%0A%20%20%20%20%23%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%A0%20%EB%B0%B0%EC%97%B4%20res%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20num%EC%9D%84%20%ED%95%B4%EB%8B%B9%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%97%90%20%EB%B0%B0%EC%B9%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%EC%A0%91%EB%91%90%20%ED%95%A9%EC%9D%84%201%20%EA%B0%90%EC%86%8C%EC%8B%9C%EC%BC%9C%20%EB%8B%A4%EC%9D%8C%EC%97%90%20num%EC%9D%84%20%EB%B0%B0%EC%B9%98%ED%95%A0%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%B0%B0%EC%97%B4%20res%EB%A1%9C%20%EC%9B%90%EB%9E%98%20%EB%B0%B0%EC%97%B4%20nums%EB%A5%BC%20%EB%8D%AE%EC%96%B4%EC%93%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EC%99%84%EC%A0%84%ED%95%9C%20%EA%B5%AC%ED%98%84%EC%9D%B4%EB%A9%B0,%20%EA%B0%9D%EC%B2%B4%EB%A5%BC%20%EC%A0%95%EB%A0%AC%ED%95%A0%20%EC%88%98%20%EC%9E%88%EA%B3%A0%20%EC%95%88%EC%A0%95%20%EC%A0%95%EB%A0%AC%EC%9D%B4%EB%8B%A4%0A%20%20%20%20%23%201.%20%EB%B0%B0%EC%97%B4%EC%9D%98%20%EC%B5%9C%EB%8C%93%EA%B0%92%20m%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%EA%B0%81%20%EC%88%AB%EC%9E%90%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EC%84%BC%EB%8B%A4%0A%20%20%20%20%23%20counter%5Bnum%5D%EC%9D%80%20num%EC%9D%98%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EB%82%98%ED%83%80%EB%82%B8%EB%8B%A4%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20counter%EC%9D%98%20%EC%A0%91%EB%91%90%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%98%EC%97%AC%20%EB%93%B1%EC%9E%A5%20%ED%9A%9F%EC%88%98%EB%A5%BC%20%EB%A7%88%EC%A7%80%EB%A7%89%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A1%9C%20%EB%B3%80%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EC%A6%89,%20counter%5Bnum%5D-1%EC%9D%80%20res%EC%97%90%EC%84%9C%20num%EC%9D%B4%20%EB%A7%88%EC%A7%80%EB%A7%89%EC%9C%BC%EB%A1%9C%20%EB%93%B1%EC%9E%A5%ED%95%98%EB%8A%94%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%9D%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20nums%EB%A5%BC%20%EC%97%AD%EC%88%9C%EC%9C%BC%EB%A1%9C%20%EC%88%9C%ED%9A%8C%ED%95%98%EB%A9%B0%20%EA%B0%81%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B2%B0%EA%B3%BC%20%EB%B0%B0%EC%97%B4%20res%EC%97%90%20%EC%B1%84%EC%9A%B4%EB%8B%A4%0A%20%20%20%20%23%20%EA%B2%B0%EA%B3%BC%EB%A5%BC%20%EA%B8%B0%EB%A1%9D%ED%95%A0%20%EB%B0%B0%EC%97%B4%20res%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20num%EC%9D%84%20%ED%95%B4%EB%8B%B9%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%97%90%20%EB%B0%B0%EC%B9%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%EC%A0%91%EB%91%90%20%ED%95%A9%EC%9D%84%201%20%EA%B0%90%EC%86%8C%EC%8B%9C%EC%BC%9C%20%EB%8B%A4%EC%9D%8C%EC%97%90%20num%EC%9D%84%20%EB%B0%B0%EC%B9%98%ED%95%A0%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A5%BC%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EA%B2%B0%EA%B3%BC%20%EB%B0%B0%EC%97%B4%20res%EB%A1%9C%20%EC%9B%90%EB%9E%98%20%EB%B0%B0%EC%97%B4%20nums%EB%A5%BC%20%EB%8D%AE%EC%96%B4%EC%93%B4%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%EA%B3%84%EC%88%98%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 11.9.3 &nbsp; 알고리즘 특성

- **시간 복잡도 $O(n + m)$, 비적응형 정렬**: `nums`와 `counter`를 순회하며, 각각 선형 시간이 걸린다. 보통 $n \gg m$이므로 시간 복잡도는 $O(n)$에 가까워진다.
- **공간 복잡도 $O(n + m)$, 제자리 정렬이 아님**: 길이가 각각 $n$과 $m$인 배열 `res`와 `counter`를 사용한다.
- **안정 정렬**: `res`에는 '오른쪽에서 왼쪽으로' 원소를 채우므로, `nums`를 역순으로 순회하면 값이 같은 원소의 상대적 위치가 바뀌지 않아 안정 정렬이 된다. 정방향으로 순회해도 정렬 결과 자체는 올바르지만 안정적이지 않다.

## 11.9.4 &nbsp; 한계

여기까지 보면 계수 정렬이 매우 기발하다고 느낄 수 있다. 개수만 세어도 효율적으로 정렬할 수 있기 때문이다. 하지만 계수 정렬을 사용하기 위한 전제 조건은 비교적 엄격하다.

**계수 정렬은 음이 아닌 정수에만 적합하다**. 다른 타입에 적용하려면 해당 데이터를 음이 아닌 정수로 바꿀 수 있어야 하며, 변환 과정에서 원소 간 대소 관계가 바뀌면 안 된다. 예를 들어 음수가 포함된 정수 배열은 모든 수에 일정한 상수를 더해 양수로 바꾼 뒤, 정렬 후 다시 원래 값으로 돌릴 수 있다.

**계수 정렬은 데이터 수는 많지만 값의 범위는 작은 경우에 적합하다**. 위 예시에서 $m$이 너무 크면 공간을 지나치게 많이 차지한다. 또한 $n \ll m$이면 계수 정렬에 $O(m)$ 시간이 걸리므로 $O(n \log n)$ 정렬 알고리즘보다 느릴 수도 있다.
