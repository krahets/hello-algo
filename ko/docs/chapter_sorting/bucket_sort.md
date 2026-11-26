---
comments: true
---

# 11.8 &nbsp; 버킷 정렬

앞에서 살펴본 알고리즘은 모두 원소의 크기를 비교해 순서를 정하는 ‘비교 기반 정렬 알고리즘’이다. 이런 알고리즘의 최악 시간 복잡도에는 $\Omega(n \log n)$이라는 하한이 있다. 이제 시간 복잡도가 선형에 이를 수 있는 ‘비교를 사용하지 않는 정렬 알고리즘’을 몇 가지 살펴보자.

<u>버킷 정렬(bucket sort)</u>은 분할 정복 전략의 대표적인 응용이다. 값의 범위별로 순서가 정해진 여러 버킷을 마련하고 데이터를 각 버킷에 고르게 나눈다. 그런 다음 버킷마다 따로 정렬하고 버킷 순서대로 모든 데이터를 합친다.

## 11.8.1 &nbsp; 알고리즘의 동작 과정

길이가 $n$이고 원소가 $[0, 1)$ 범위의 부동 소수점 수인 배열을 생각해 보자. 버킷 정렬의 과정은 아래 그림(11-13)과 같다.

1. 버킷 $k$개를 초기화하고 원소 $n$개를 버킷 $k$개에 나눈다.
2. 각 버킷을 따로 정렬한다(여기서는 언어의 내장 정렬 함수를 사용한다).
3. 값의 범위가 작은 버킷부터 차례로 결과를 합친다.

![버킷 정렬 과정](bucket_sort.assets/bucket_sort_overview.svg){ class="animation-figure" }

<p align="center"> 그림 11-13 &nbsp; 버킷 정렬 과정 </p>

코드는 다음과 같다.

=== "Python"

    ```python title="bucket_sort.py"
    def bucket_sort(nums: list[float]):
        """버킷 정렬"""
        # 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        k = len(nums) // 2
        buckets = [[] for _ in range(k)]
        # 1. 배열 원소를 각 버킷에 배분
        for num in nums:
            # 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            i = int(num * k)
            # num을 버킷 i에 추가
            buckets[i].append(num)
        # 2. 각 버킷을 정렬
        for bucket in buckets:
            # 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.sort()
        # 3. 버킷을 순회하여 결과 병합
        i = 0
        for bucket in buckets:
            for num in bucket:
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="bucket_sort.cpp"
    /* 버킷 정렬 */
    void bucketSort(vector<float> &nums) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        int k = nums.size() / 2;
        vector<vector<float>> buckets(k);
        // 1. 배열 원소를 각 버킷에 배분
        for (float num : nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            int i = num * k;
            // num을 버킷 bucket_idx에 추가
            buckets[i].push_back(num);
        }
        // 2. 각 버킷을 정렬
        for (vector<float> &bucket : buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            sort(bucket.begin(), bucket.end());
        }
        // 3. 버킷을 순회하여 결과 병합
        int i = 0;
        for (vector<float> &bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="bucket_sort.java"
    /* 버킷 정렬 */
    void bucketSort(float[] nums) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 배열 원소를 각 버킷에 배분
        for (float num : nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            int i = (int) (num * k);
            // num을 버킷 i에 추가
            buckets.get(i).add(num);
        }
        // 2. 각 버킷을 정렬
        for (List<Float> bucket : buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            Collections.sort(bucket);
        }
        // 3. 버킷을 순회하여 결과 병합
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="bucket_sort.cs"
    /* 버킷 정렬 */
    void BucketSort(float[] nums) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 배열 원소를 각 버킷에 배분
        foreach (float num in nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            int i = (int)(num * k);
            // num을 버킷 i에 추가
            buckets[i].Add(num);
        }
        // 2. 각 버킷을 정렬
        foreach (List<float> bucket in buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.Sort();
        }
        // 3. 버킷을 순회하여 결과 병합
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }
    ```

=== "Go"

    ```go title="bucket_sort.go"
    /* 버킷 정렬 */
    func bucketSort(nums []float64) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        k := len(nums) / 2
        buckets := make([][]float64, k)
        for i := 0; i < k; i++ {
            buckets[i] = make([]float64, 0)
        }
        // 1. 배열 원소를 각 버킷에 배분
        for _, num := range nums {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            i := int(num * float64(k))
            // num을 버킷 i에 추가
            buckets[i] = append(buckets[i], num)
        }
        // 2. 각 버킷을 정렬
        for i := 0; i < k; i++ {
            // 내장 슬라이스 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            sort.Float64s(buckets[i])
        }
        // 3. 버킷을 순회하여 결과 병합
        i := 0
        for _, bucket := range buckets {
            for _, num := range bucket {
                nums[i] = num
                i++
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bucket_sort.swift"
    /* 버킷 정렬 */
    func bucketSort(nums: inout [Double]) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        let k = nums.count / 2
        var buckets = (0 ..< k).map { _ in [Double]() }
        // 1. 배열 원소를 각 버킷에 배분
        for num in nums {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            let i = Int(num * Double(k))
            // num을 버킷 i에 추가
            buckets[i].append(num)
        }
        // 2. 각 버킷을 정렬
        for i in buckets.indices {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            buckets[i].sort()
        }
        // 3. 버킷을 순회하여 결과 병합
        var i = nums.startIndex
        for bucket in buckets {
            for num in bucket {
                nums[i] = num
                i += 1
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bucket_sort.js"
    /* 버킷 정렬 */
    function bucketSort(nums) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        const k = nums.length / 2;
        const buckets = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 배열 원소를 각 버킷에 배분
        for (const num of nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            const i = Math.floor(num * k);
            // num을 버킷 i에 추가
            buckets[i].push(num);
        }
        // 2. 각 버킷을 정렬
        for (const bucket of buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.sort((a, b) => a - b);
        }
        // 3. 버킷을 순회하여 결과 병합
        let i = 0;
        for (const bucket of buckets) {
            for (const num of bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "TS"

    ```typescript title="bucket_sort.ts"
    /* 버킷 정렬 */
    function bucketSort(nums: number[]): void {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        const k = nums.length / 2;
        const buckets: number[][] = [];
        for (let i = 0; i < k; i++) {
            buckets.push([]);
        }
        // 1. 배열 원소를 각 버킷에 배분
        for (const num of nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            const i = Math.floor(num * k);
            // num을 버킷 i에 추가
            buckets[i].push(num);
        }
        // 2. 각 버킷을 정렬
        for (const bucket of buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.sort((a, b) => a - b);
        }
        // 3. 버킷을 순회하여 결과 병합
        let i = 0;
        for (const bucket of buckets) {
            for (const num of bucket) {
                nums[i++] = num;
            }
        }
    }
    ```

=== "Dart"

    ```dart title="bucket_sort.dart"
    /* 버킷 정렬 */
    void bucketSort(List<double> nums) {
      // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
      int k = nums.length ~/ 2;
      List<List<double>> buckets = List.generate(k, (index) => []);

      // 1. 배열 원소를 각 버킷에 배분
      for (double _num in nums) {
        // 입력 범위는 [0, 1)이며 _num * k로 인덱스 범위 [0, k-1]에 대응시킴
        int i = (_num * k).toInt();
        // _num을 버킷 bucket_idx에 추가
        buckets[i].add(_num);
      }
      // 2. 각 버킷을 정렬
      for (List<double> bucket in buckets) {
        bucket.sort();
      }
      // 3. 버킷을 순회하여 결과 병합
      int i = 0;
      for (List<double> bucket in buckets) {
        for (double _num in bucket) {
          nums[i++] = _num;
        }
      }
    }
    ```

=== "Rust"

    ```rust title="bucket_sort.rs"
    /* 버킷 정렬 */
    fn bucket_sort(nums: &mut [f64]) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        let k = nums.len() / 2;
        let mut buckets = vec![vec![]; k];
        // 1. 배열 원소를 각 버킷에 배분
        for &num in nums.iter() {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            let i = (num * k as f64) as usize;
            // num을 버킷 i에 추가
            buckets[i].push(num);
        }
        // 2. 각 버킷을 정렬
        for bucket in &mut buckets {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
        }
        // 3. 버킷을 순회하여 결과 병합
        let mut i = 0;
        for bucket in buckets.iter() {
            for &num in bucket.iter() {
                nums[i] = num;
                i += 1;
            }
        }
    }
    ```

=== "C"

    ```c title="bucket_sort.c"
    /* 버킷 정렬 */
    void bucketSort(float nums[], int n) {
        int k = n / 2;                                 // 버킷 k = n/2개 초기화
        int *sizes = malloc(k * sizeof(int));          // 각 버킷의 크기 기록
        float **buckets = malloc(k * sizeof(float *)); // 동적 배열(버킷)로 이루어진 배열
        // 각 버킷에 충분한 공간을 미리 할당
        for (int i = 0; i < k; ++i) {
            buckets[i] = (float *)malloc(n * sizeof(float));
            sizes[i] = 0;
        }
        // 1. 배열 원소를 각 버킷에 배분
        for (int i = 0; i < n; ++i) {
            int idx = (int)(nums[i] * k);
            buckets[idx][sizes[idx]++] = nums[i];
        }
        // 2. 각 버킷을 정렬
        for (int i = 0; i < k; ++i) {
            qsort(buckets[i], sizes[i], sizeof(float), compare);
        }
        // 3. 정렬된 버킷을 병합
        int idx = 0;
        for (int i = 0; i < k; ++i) {
            for (int j = 0; j < sizes[i]; ++j) {
                nums[idx++] = buckets[i][j];
            }
            // 메모리 해제
            free(buckets[i]);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bucket_sort.kt"
    /* 버킷 정렬 */
    fun bucketSort(nums: FloatArray) {
        // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
        val k = nums.size / 2
        val buckets = mutableListOf<MutableList<Float>>()
        for (i in 0..<k) {
            buckets.add(mutableListOf())
        }
        // 1. 배열 원소를 각 버킷에 배분
        for (num in nums) {
            // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
            val i = (num * k).toInt()
            // num을 버킷 i에 추가
            buckets[i].add(num)
        }
        // 2. 각 버킷을 정렬
        for (bucket in buckets) {
            // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
            bucket.sort()
        }
        // 3. 버킷을 순회하여 결과 병합
        var i = 0
        for (bucket in buckets) {
            for (num in bucket) {
                nums[i++] = num
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="bucket_sort.rb"
    ### 버킷 정렬 ###
    def bucket_sort(nums)
      # 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
      k = nums.length / 2
      buckets = Array.new(k) { [] }
      
      # 1. 배열 원소를 각 버킷에 배분
      nums.each do |num|
        # 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
        i = (num * k).to_i
        # num을 버킷 i에 추가
        buckets[i] << num
      end

      # 2. 각 버킷을 정렬
      buckets.each do |bucket|
        # 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
        bucket.sort!
      end

      # 3. 버킷을 순회하여 결과 병합
      i = 0
      buckets.each do |bucket|
        bucket.each do |num|
          nums[i] = num
          i += 1
        end
      end
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%EB%B2%84%ED%82%B7%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EB%B2%84%ED%82%B7%20k%20%3D%20n/2%EA%B0%9C%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%98%EC%97%AC%20%EB%B2%84%ED%82%B7%EB%8B%B9%20%ED%8F%89%EA%B7%A0%20%EB%91%90%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%B0%B0%EB%B6%84%ED%95%A0%20%EA%B2%83%EC%9C%BC%EB%A1%9C%20%EC%98%88%EC%83%81%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%EB%B0%B0%EC%97%B4%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B0%81%20%EB%B2%84%ED%82%B7%EC%97%90%20%EB%B0%B0%EB%B6%84%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B2%94%EC%9C%84%EB%8A%94%20%5B0,%201%29%EC%9D%B4%EB%A9%B0%20num%20%2A%20k%EB%A1%9C%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B2%94%EC%9C%84%20%5B0,%20k-1%5D%EC%97%90%20%EB%8C%80%EC%9D%91%EC%8B%9C%ED%82%B4%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20%2A%20k%29%0A%20%20%20%20%20%20%20%20%23%20num%EC%9D%84%20%EB%B2%84%ED%82%B7%20i%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%EA%B0%81%20%EB%B2%84%ED%82%B7%EC%9D%84%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%EB%82%B4%EC%9E%A5%20%EC%A0%95%EB%A0%AC%20%ED%95%A8%EC%88%98%EB%A5%BC%20%EC%82%AC%EC%9A%A9%ED%95%98%EB%A9%B0%20%EB%8B%A4%EB%A5%B8%20%EC%A0%95%EB%A0%AC%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%EC%9C%BC%EB%A1%9C%20%EB%8C%80%EC%B2%B4%20%EA%B0%80%EB%8A%A5%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%EB%B2%84%ED%82%B7%EC%9D%84%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EA%B2%B0%EA%B3%BC%20%EB%B3%91%ED%95%A9%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%EC%9D%80%20%5B0,%201%29%20%EB%B2%94%EC%9C%84%EC%9D%98%20%EB%B6%80%EB%8F%99%20%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%EB%A1%9C%20%EA%B0%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B0.49,%200.96,%200.82,%200.09,%200.57,%200.43,%200.91,%200.75,%200.15,%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%EB%B2%84%ED%82%B7%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bucket_sort%28nums%3A%20list%5Bfloat%5D%29%3A%0A%20%20%20%20%22%22%22%EB%B2%84%ED%82%B7%20%EC%A0%95%EB%A0%AC%22%22%22%0A%20%20%20%20%23%20%EB%B2%84%ED%82%B7%20k%20%3D%20n/2%EA%B0%9C%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%98%EC%97%AC%20%EB%B2%84%ED%82%B7%EB%8B%B9%20%ED%8F%89%EA%B7%A0%20%EB%91%90%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EB%B0%B0%EB%B6%84%ED%95%A0%20%EA%B2%83%EC%9C%BC%EB%A1%9C%20%EC%98%88%EC%83%81%0A%20%20%20%20k%20%3D%20len%28nums%29%20//%202%0A%20%20%20%20buckets%20%3D%20%5B%5B%5D%20for%20_%20in%20range%28k%29%5D%0A%20%20%20%20%23%201.%20%EB%B0%B0%EC%97%B4%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%B0%81%20%EB%B2%84%ED%82%B7%EC%97%90%20%EB%B0%B0%EB%B6%84%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%20%EB%B2%94%EC%9C%84%EB%8A%94%20%5B0,%201%29%EC%9D%B4%EB%A9%B0%20num%20%2A%20k%EB%A1%9C%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EB%B2%94%EC%9C%84%20%5B0,%20k-1%5D%EC%97%90%20%EB%8C%80%EC%9D%91%EC%8B%9C%ED%82%B4%0A%20%20%20%20%20%20%20%20i%20%3D%20int%28num%20%2A%20k%29%0A%20%20%20%20%20%20%20%20%23%20num%EC%9D%84%20%EB%B2%84%ED%82%B7%20i%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20%20%20%20%20buckets%5Bi%5D.append%28num%29%0A%20%20%20%20%23%202.%20%EA%B0%81%20%EB%B2%84%ED%82%B7%EC%9D%84%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20%23%20%EB%82%B4%EC%9E%A5%20%EC%A0%95%EB%A0%AC%20%ED%95%A8%EC%88%98%EB%A5%BC%20%EC%82%AC%EC%9A%A9%ED%95%98%EB%A9%B0%20%EB%8B%A4%EB%A5%B8%20%EC%A0%95%EB%A0%AC%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%EC%9C%BC%EB%A1%9C%20%EB%8C%80%EC%B2%B4%20%EA%B0%80%EB%8A%A5%0A%20%20%20%20%20%20%20%20bucket.sort%28%29%0A%20%20%20%20%23%203.%20%EB%B2%84%ED%82%B7%EC%9D%84%20%EC%88%9C%ED%9A%8C%ED%95%98%EC%97%AC%20%EA%B2%B0%EA%B3%BC%20%EB%B3%91%ED%95%A9%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20bucket%20in%20buckets%3A%0A%20%20%20%20%20%20%20%20for%20num%20in%20bucket%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%9E%85%EB%A0%A5%EC%9D%80%20%5B0,%201%29%20%EB%B2%94%EC%9C%84%EC%9D%98%20%EB%B6%80%EB%8F%99%20%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%EB%A1%9C%20%EA%B0%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B0.49,%200.96,%200.82,%200.09,%200.57,%200.43,%200.91,%200.75,%200.15,%200.37%5D%0A%20%20%20%20bucket_sort%28nums%29%0A%20%20%20%20print%28%22%EB%B2%84%ED%82%B7%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

## 11.8.2 &nbsp; 알고리즘의 특성

버킷 정렬은 대용량 데이터를 처리하기에 적합하다. 예를 들어 입력에 원소가 100만 개 있고 메모리 용량이 부족해 한꺼번에 불러올 수 없다고 하자. 이때 데이터를 버킷 1000개에 나누어 버킷별로 정렬한 뒤 결과를 합칠 수 있다.

- **시간 복잡도 $O(n + k)$**: 원소가 고르게 분포한다면 버킷 하나에 원소가 $\frac{n}{k}$개씩 들어간다. 버킷 하나를 정렬하는 데 $O(\frac{n}{k} \log\frac{n}{k})$의 시간이 걸린다면 모든 버킷을 정렬하는 데는 $O(n \log\frac{n}{k})$의 시간이 걸린다. **버킷 수 $k$가 충분히 크면 시간 복잡도는 $O(n)$에 가까워진다**. 결과를 합칠 때는 모든 버킷과 원소를 순회하므로 $O(n + k)$의 시간이 걸린다. 최악의 경우 데이터가 한 버킷에 몰려 그 버킷을 정렬하는 데 $O(n^2)$의 시간이 걸린다.
- **공간 복잡도 $O(n + k)$, 비제자리 정렬**: 버킷 $k$개와 원소 총 $n$개를 위한 추가 공간이 필요하다.
- 버킷 정렬의 안정성은 버킷 내부를 정렬하는 알고리즘이 안정적인지에 달려 있다.

## 11.8.3 &nbsp; 데이터를 고르게 나누는 방법

버킷 정렬의 시간 복잡도는 이론적으로 $O(n)$에 이를 수 있다. **관건은 원소를 버킷에 고르게 나누는 것이다**. 실제 데이터는 균일하게 분포하지 않는 경우가 많다. 예를 들어 타오바오의 모든 상품을 가격 범위에 따라 버킷 10개에 고르게 나누려고 한다고 하자. 100위안 미만인 상품은 매우 많고 1000위안을 넘는 상품은 매우 적다. 가격 범위를 같은 폭으로 열 등분하면 버킷별 상품 수에 큰 차이가 생긴다.

고르게 배분하려면 먼저 대략적인 경계를 정해 데이터를 버킷 3개로 크게 나눈다. **그런 다음 상품이 많은 버킷을 다시 3개로 나누는 일을 모든 버킷의 원소 수가 비슷해질 때까지 반복한다**.

아래 그림(11-14)처럼 이 방법은 본질적으로 재귀 트리를 만드는 과정이다. 목표는 리프 노드의 값을 최대한 고르게 만드는 것이다. 매번 버킷 3개로 나눌 필요는 없으며 데이터 특성에 맞게 나누는 방법을 선택할 수 있다.

![버킷 재귀 분할](bucket_sort.assets/scatter_in_buckets_recursively.svg){ class="animation-figure" }

<p align="center"> 그림 11-14 &nbsp; 버킷 재귀 분할 </p>

상품 가격의 확률 분포를 미리 알면 **그 분포에 따라 버킷별 가격 경계를 정할 수 있다**. 분포를 반드시 따로 집계할 필요는 없다. 데이터의 특성에 맞는 확률 모형으로 근사해도 된다.

아래 그림(11-15)에서는 상품 가격이 정규 분포를 따른다고 가정한다. 그러면 적절한 가격 구간을 정해 상품을 각 버킷에 고르게 배분할 수 있다.

![확률 분포에 따른 버킷 분할](bucket_sort.assets/scatter_in_buckets_distribution.svg){ class="animation-figure" }

<p align="center"> 그림 11-15 &nbsp; 확률 분포에 따른 버킷 분할 </p>
