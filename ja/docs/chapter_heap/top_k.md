---
comments: true
---

# 8.3 &nbsp; Top-k問題

!!! question

    長さ$n$の順序付けられていない配列`nums`が与えられたとき、配列内の最大$k$個の要素を返してください。

この問題について、まず2つの直接的な解法を紹介し、次により効率的なヒープベースの方法を説明します。

## 8.3.1 &nbsp; 方法1：反復選択

下図に示すように、$k$回の反復を実行し、各回で$1$番目、$2$番目、$\dots$、$k$番目に大きい要素を抽出できます。時間計算量は$O(nk)$です。

この方法は$k \ll n$の場合にのみ適しています。$k$が$n$に近い場合、時間計算量は$O(n^2)$に近づき、非常に時間がかかります。

![最大k個の要素を反復的に見つける](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> 図 8-6 &nbsp; 最大k個の要素を反復的に見つける </p>

!!! tip

    $k = n$の場合、完全に順序付けられたシーケンスを得ることができ、これは「選択ソート」アルゴリズムと同等です。

## 8.3.2 &nbsp; 方法2：ソート

下図に示すように、まず配列`nums`をソートし、次に最後の$k$個の要素を返すことができます。時間計算量は$O(n \log n)$です。

明らかに、この方法はタスクを「やりすぎ」ています。最大$k$個の要素を見つけるだけでよく、他の要素をソートする必要はありません。

![ソートによる最大k個の要素の発見](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> 図 8-7 &nbsp; ソートによる最大k個の要素の発見 </p>

## 8.3.3 &nbsp; 方法3：ヒープ

以下のプロセスに示すように、ヒープに基づいてTop-k問題をより効率的に解決できます。

1. 最小ヒープを初期化します。先頭要素が最小になります。
2. まず、配列の最初の$k$個の要素をヒープに挿入します。
3. $k + 1$番目の要素から開始し、現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに挿入します。
4. 走査を完了した後、ヒープには最大$k$個の要素が含まれています。

=== "<1>"
    ![ヒープに基づく最大k個の要素の発見](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

=== "<2>"
    ![top_k_heap_step2](top_k.assets/top_k_heap_step2.png){ class="animation-figure" }

=== "<3>"
    ![top_k_heap_step3](top_k.assets/top_k_heap_step3.png){ class="animation-figure" }

=== "<4>"
    ![top_k_heap_step4](top_k.assets/top_k_heap_step4.png){ class="animation-figure" }

=== "<5>"
    ![top_k_heap_step5](top_k.assets/top_k_heap_step5.png){ class="animation-figure" }

=== "<6>"
    ![top_k_heap_step6](top_k.assets/top_k_heap_step6.png){ class="animation-figure" }

=== "<7>"
    ![top_k_heap_step7](top_k.assets/top_k_heap_step7.png){ class="animation-figure" }

=== "<8>"
    ![top_k_heap_step8](top_k.assets/top_k_heap_step8.png){ class="animation-figure" }

=== "<9>"
    ![top_k_heap_step9](top_k.assets/top_k_heap_step9.png){ class="animation-figure" }

<p align="center"> 図 8-8 &nbsp; ヒープに基づく最大k個の要素の発見 </p>

サンプルコードは以下の通りです：

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """ヒープを使用して配列内の最大k個の要素を見つける"""
        # 最小ヒープを初期化
        heap = []
        # 配列の最初のk個の要素をヒープに入力
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # k+1番目の要素から、ヒープの長さをkに保つ
        for i in range(k, len(nums)):
            # 現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに入力
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* ヒープを使用して配列内の最大k個の要素を見つける */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // 最小ヒープを初期化
        priority_queue<int, vector<int>, greater<int>> heap;
        // 配列の最初のk個の要素をヒープに入力
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // k+1番目の要素から、ヒープの長さをkに保つ
        for (int i = k; i < nums.size(); i++) {
            // 現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに入力
            if (nums[i] > heap.top()) {
                heap.pop();
                heap.push(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Java"

    ```java title="top_k.java"
    /* ヒープを使用して配列内の最大 k 個の要素を検索 */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // 最小ヒープを初期化
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // 配列の最初の k 個の要素をヒープに入力
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // k+1 番目の要素から、ヒープの長さを k に保つ
        for (int i = k; i < nums.length; i++) {
            // 現在の要素がヒープの先頭要素より大きい場合、ヒープの先頭要素を削除し、現在の要素をヒープに入力
            if (nums[i] > heap.peek()) {
                heap.poll();
                heap.offer(nums[i]);
            }
        }
        return heap;
    }
    ```

=== "C#"

    ```csharp title="top_k.cs"
    [class]{top_k}-[func]{TopKHeap}
    ```

=== "Go"

    ```go title="top_k.go"
    [class]{}-[func]{topKHeap}
    ```

=== "Swift"

    ```swift title="top_k.swift"
    [class]{}-[func]{topKHeap}
    ```

=== "JS"

    ```javascript title="top_k.js"
    [class]{}-[func]{pushMinHeap}

    [class]{}-[func]{popMinHeap}

    [class]{}-[func]{peekMinHeap}

    [class]{}-[func]{getMinHeap}

    [class]{}-[func]{topKHeap}
    ```

=== "TS"

    ```typescript title="top_k.ts"
    [class]{}-[func]{pushMinHeap}

    [class]{}-[func]{popMinHeap}

    [class]{}-[func]{peekMinHeap}

    [class]{}-[func]{getMinHeap}

    [class]{}-[func]{topKHeap}
    ```

=== "Dart"

    ```dart title="top_k.dart"
    [class]{}-[func]{topKHeap}
    ```

=== "Rust"

    ```rust title="top_k.rs"
    [class]{}-[func]{top_k_heap}
    ```

=== "C"

    ```c title="top_k.c"
    [class]{}-[func]{pushMinHeap}

    [class]{}-[func]{popMinHeap}

    [class]{}-[func]{peekMinHeap}

    [class]{}-[func]{getMinHeap}

    [class]{}-[func]{topKHeap}
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    [class]{}-[func]{topKHeap}
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    [class]{}-[func]{top_k_heap}
    ```

合計$n$回のヒープ挿入と削除が実行され、最大ヒープサイズが$k$であるため、時間計算量は$O(n \log k)$です。この方法は非常に効率的で、$k$が小さい場合、時間計算量は$O(n)$に近づき、$k$が大きい場合でも、時間計算量は$O(n \log n)$を超えません。

さらに、この方法は動的データストリームのシナリオに適しています。データを継続的に追加することで、ヒープ内の要素を維持し、最大$k$個の要素の動的更新を実現できます。
