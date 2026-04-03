---
comments: true
---

# 8.3 &nbsp; Задача Top-k

!!! question

    Дан неупорядоченный массив `nums` длины $n$ . Требуется вернуть наибольшие $k$ элементов массива.

Для этой задачи мы сначала покажем два относительно прямолинейных способа решения, а затем более эффективный способ на основе кучи.

## 8.3.1 &nbsp; Метод 1: выбор через обход

Как показано на рисунке 8-6, можно выполнить $k$ проходов по массиву и на каждом проходе извлекать соответственно $1$-й, $2$-й, $\dots$ , $k$-й по величине элемент; временная сложность такого подхода равна $O(nk)$ .

Этот метод подходит только для случая $k \ll n$ , потому что когда $k$ приближается к $n$ , его временная сложность стремится к $O(n^2)$ , а это уже очень затратно.

![Поиск наибольших k элементов через обход](top_k.assets/top_k_traversal.png){ class="animation-figure" }

<p align="center"> Рисунок 8-6 &nbsp; Поиск наибольших k элементов через обход </p>

!!! tip

    Когда $k = n$ , мы получаем полную упорядоченную последовательность, и в этот момент задача становится эквивалентной алгоритму "сортировка выбором".

## 8.3.2 &nbsp; Метод 2: сортировка

Как показано на рисунке 8-7, можно сначала отсортировать массив `nums` , а затем вернуть его крайние правые $k$ элементов; временная сложность такого метода равна $O(n \log n)$ .

Очевидно, что этот способ делает слишком много, потому что нам нужно только найти наибольшие $k$ элементов, а сортировать остальные элементы совсем не обязательно.

![Поиск наибольших k элементов через сортировку](top_k.assets/top_k_sorting.png){ class="animation-figure" }

<p align="center"> Рисунок 8-7 &nbsp; Поиск наибольших k элементов через сортировку </p>

## 8.3.3 &nbsp; Метод 3: куча

Задачу Top-k можно решить гораздо эффективнее с помощью кучи, как показано на рисунках ниже.

1. Инициализировать минимальную кучу, у которой вершина содержит наименьший элемент.
2. Сначала по очереди поместить в кучу первые $k$ элементов массива.
3. Начиная с элемента номер $k + 1$ , если текущий элемент больше элемента на вершине кучи, то извлечь вершину кучи и поместить в кучу текущий элемент.
4. После завершения обхода в куче будут храниться как раз наибольшие $k$ элементов.

=== "<1>"
    ![Поиск наибольших k элементов с помощью кучи](top_k.assets/top_k_heap_step1.png){ class="animation-figure" }

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

<p align="center"> Рисунок 8-8 &nbsp; Поиск наибольших k элементов с помощью кучи </p>

Пример кода приведен ниже:

=== "Python"

    ```python title="top_k.py"
    def top_k_heap(nums: list[int], k: int) -> list[int]:
        """Найти k наибольших элементов массива с помощью кучи"""
        # Инициализация минимальной кучи
        heap = []
        # Поместить первые k элементов массива в кучу
        for i in range(k):
            heapq.heappush(heap, nums[i])
        # Начиная с элемента k+1, поддерживать длину кучи равной k
        for i in range(k, len(nums)):
            # Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        return heap
    ```

=== "C++"

    ```cpp title="top_k.cpp"
    /* Найти k наибольших элементов массива с помощью кучи */
    priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
        // Инициализация минимальной кучи
        priority_queue<int, vector<int>, greater<int>> heap;
        // Поместить первые k элементов массива в кучу
        for (int i = 0; i < k; i++) {
            heap.push(nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (int i = k; i < nums.size(); i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
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
    /* Найти k наибольших элементов массива с помощью кучи */
    Queue<Integer> topKHeap(int[] nums, int k) {
        // Инициализация минимальной кучи
        Queue<Integer> heap = new PriorityQueue<Integer>();
        // Поместить первые k элементов массива в кучу
        for (int i = 0; i < k; i++) {
            heap.offer(nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (int i = k; i < nums.length; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
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
    /* Найти k наибольших элементов массива с помощью кучи */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Инициализация минимальной кучи
        PriorityQueue<int, int> heap = new();
        // Поместить первые k элементов массива в кучу
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (int i = k; i < nums.Length; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if (nums[i] > heap.Peek()) {
                heap.Dequeue();
                heap.Enqueue(nums[i], nums[i]);
            }
        }
        return heap;
    }
    ```

=== "Go"

    ```go title="top_k.go"
    /* Найти k наибольших элементов массива с помощью кучи */
    func topKHeap(nums []int, k int) *minHeap {
        // Инициализация минимальной кучи
        h := &minHeap{}
        heap.Init(h)
        // Поместить первые k элементов массива в кучу
        for i := 0; i < k; i++ {
            heap.Push(h, nums[i])
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for i := k; i < len(nums); i++ {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if nums[i] > h.Top().(int) {
                heap.Pop(h)
                heap.Push(h, nums[i])
            }
        }
        return h
    }
    ```

=== "Swift"

    ```swift title="top_k.swift"
    /* Найти k наибольших элементов массива с помощью кучи */
    func topKHeap(nums: [Int], k: Int) -> [Int] {
        // Инициализировать минимальную кучу и построить ее по первым k элементам
        var heap = Heap(nums.prefix(k))
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for i in nums.indices.dropFirst(k) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if nums[i] > heap.min()! {
                _ = heap.removeMin()
                heap.insert(nums[i])
            }
        }
        return heap.unordered
    }
    ```

=== "JS"

    ```javascript title="top_k.js"
    /* Добавление элемента в кучу */
    function pushMinHeap(maxHeap, val) {
        // Инвертировать знак элемента
        maxHeap.push(-val);
    }

    /* Извлечение элемента из кучи */
    function popMinHeap(maxHeap) {
        // Инвертировать знак элемента
        return -maxHeap.pop();
    }

    /* Доступ к элементу на вершине кучи */
    function peekMinHeap(maxHeap) {
        // Инвертировать знак элемента
        return -maxHeap.peek();
    }

    /* Извлечь элементы из кучи */
    function getMinHeap(maxHeap) {
        // Инвертировать знак элемента
        return maxHeap.getMaxHeap().map((num) => -num);
    }

    /* Найти k наибольших элементов массива с помощью кучи */
    function topKHeap(nums, k) {
        // Инициализация минимальной кучи
        // Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
        const maxHeap = new MaxHeap([]);
        // Поместить первые k элементов массива в кучу
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (let i = k; i < nums.length; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // Вернуть элементы кучи
        return getMinHeap(maxHeap);
    }
    ```

=== "TS"

    ```typescript title="top_k.ts"
    /* Добавление элемента в кучу */
    function pushMinHeap(maxHeap: MaxHeap, val: number): void {
        // Инвертировать знак элемента
        maxHeap.push(-val);
    }

    /* Извлечение элемента из кучи */
    function popMinHeap(maxHeap: MaxHeap): number {
        // Инвертировать знак элемента
        return -maxHeap.pop();
    }

    /* Доступ к элементу на вершине кучи */
    function peekMinHeap(maxHeap: MaxHeap): number {
        // Инвертировать знак элемента
        return -maxHeap.peek();
    }

    /* Извлечь элементы из кучи */
    function getMinHeap(maxHeap: MaxHeap): number[] {
        // Инвертировать знак элемента
        return maxHeap.getMaxHeap().map((num: number) => -num);
    }

    /* Найти k наибольших элементов массива с помощью кучи */
    function topKHeap(nums: number[], k: number): number[] {
        // Инициализация минимальной кучи
        // Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
        const maxHeap = new MaxHeap([]);
        // Поместить первые k элементов массива в кучу
        for (let i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (let i = k; i < nums.length; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        // Вернуть элементы кучи
        return getMinHeap(maxHeap);
    }
    ```

=== "Dart"

    ```dart title="top_k.dart"
    /* Найти k наибольших элементов массива с помощью кучи */
    MinHeap topKHeap(List<int> nums, int k) {
      // Инициализировать минимальную кучу, поместив в нее первые k элементов массива
      MinHeap heap = MinHeap(nums.sublist(0, k));
      // Начиная с элемента k+1, поддерживать длину кучи равной k
      for (int i = k; i < nums.length; i++) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if (nums[i] > heap.peek()) {
          heap.pop();
          heap.push(nums[i]);
        }
      }
      return heap;
    }
    ```

=== "Rust"

    ```rust title="top_k.rs"
    /* Найти k наибольших элементов массива с помощью кучи */
    fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
        // BinaryHeap — это максимальная куча; с помощью Reverse элементы инвертируются, чтобы реализовать минимальную кучу
        let mut heap = BinaryHeap::<Reverse<i32>>::new();
        // Поместить первые k элементов массива в кучу
        for &num in nums.iter().take(k) {
            heap.push(Reverse(num));
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for &num in nums.iter().skip(k) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if num > heap.peek().unwrap().0 {
                heap.pop();
                heap.push(Reverse(num));
            }
        }
        heap
    }
    ```

=== "C"

    ```c title="top_k.c"
    /* Добавление элемента в кучу */
    void pushMinHeap(MaxHeap *maxHeap, int val) {
        // Инвертировать знак элемента
        push(maxHeap, -val);
    }

    /* Извлечение элемента из кучи */
    int popMinHeap(MaxHeap *maxHeap) {
        // Инвертировать знак элемента
        return -pop(maxHeap);
    }

    /* Доступ к элементу на вершине кучи */
    int peekMinHeap(MaxHeap *maxHeap) {
        // Инвертировать знак элемента
        return -peek(maxHeap);
    }

    /* Извлечь элементы из кучи */
    int *getMinHeap(MaxHeap *maxHeap) {
        // Инвертировать все элементы кучи и записать их в массив res
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    /* Извлечь элементы из кучи */
    int *getMinHeap(MaxHeap *maxHeap) {
        // Инвертировать все элементы кучи и записать их в массив res
        int *res = (int *)malloc(maxHeap->size * sizeof(int));
        for (int i = 0; i < maxHeap->size; i++) {
            res[i] = -maxHeap->data[i];
        }
        return res;
    }

    // Функция поиска k наибольших элементов массива на основе кучи
    int *topKHeap(int *nums, int sizeNums, int k) {
        // Инициализация минимальной кучи
        // Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
        int *empty = (int *)malloc(0);
        MaxHeap *maxHeap = newMaxHeap(empty, 0);
        // Поместить первые k элементов массива в кучу
        for (int i = 0; i < k; i++) {
            pushMinHeap(maxHeap, nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (int i = k; i < sizeNums; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if (nums[i] > peekMinHeap(maxHeap)) {
                popMinHeap(maxHeap);
                pushMinHeap(maxHeap, nums[i]);
            }
        }
        int *res = getMinHeap(maxHeap);
        // Освободить память
        delMaxHeap(maxHeap);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="top_k.kt"
    /* Найти k наибольших элементов массива с помощью кучи */
    fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
        // Инициализация минимальной кучи
        val heap = PriorityQueue<Int>()
        // Поместить первые k элементов массива в кучу
        for (i in 0..<k) {
            heap.offer(nums[i])
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (i in k..<nums.size) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
            if (nums[i] > heap.peek()) {
                heap.poll()
                heap.offer(nums[i])
            }
        }
        return heap
    }
    ```

=== "Ruby"

    ```ruby title="top_k.rb"
    ### Поиск k наибольших элементов массива с помощью кучи ###
    def top_k_heap(nums, k)
      # Инициализация минимальной кучи
      # Обратите внимание: мы инвертируем все элементы кучи, чтобы с помощью максимальной кучи имитировать минимальную
      max_heap = MaxHeap.new([])

      # Поместить первые k элементов массива в кучу
      for i in 0...k
        push_min_heap(max_heap, nums[i])
      end

      # Начиная с элемента k+1, поддерживать длину кучи равной k
      for i in k...nums.length
        # Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if nums[i] > peek_min_heap(max_heap)
          pop_min_heap(max_heap)
          push_min_heap(max_heap, nums[i])
        end
      end

      get_min_heap(max_heap)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D%2C%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20k%20%D0%BD%D0%B0%D0%B8%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BA%D1%83%D1%87%D0%B8%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B5%20k%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap%2C%20nums%5Bi%5D%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B8%D0%BD%D0%B0%D1%8F%20%D1%81%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20k%2B1%2C%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BA%D1%83%D1%87%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D0%BE%D0%B9%20k%0A%20%20%20%20for%20i%20in%20range%28k%2C%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B5%20%D0%BA%D1%83%D1%87%D0%B8%2C%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%20%D0%BA%D1%83%D1%87%D0%B8%20%D0%B8%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap%2C%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%207%2C%206%2C%203%2C%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums%2C%20k%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20heapq%0A%0Adef%20top_k_heap%28nums%3A%20list%5Bint%5D%2C%20k%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20k%20%D0%BD%D0%B0%D0%B8%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B8%D1%85%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BA%D1%83%D1%87%D0%B8%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B8%D0%BD%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20heap%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B5%20k%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20for%20i%20in%20range%28k%29%3A%0A%20%20%20%20%20%20%20%20heapq.heappush%28heap%2C%20nums%5Bi%5D%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D1%87%D0%B8%D0%BD%D0%B0%D1%8F%20%D1%81%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20k%2B1%2C%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BA%D1%83%D1%87%D0%B8%20%D1%80%D0%B0%D0%B2%D0%BD%D0%BE%D0%B9%20k%0A%20%20%20%20for%20i%20in%20range%28k%2C%20len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B5%20%D0%BA%D1%83%D1%87%D0%B8%2C%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D1%83%20%D0%BA%D1%83%D1%87%D0%B8%20%D0%B8%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%82%D0%B5%D0%BA%D1%83%D1%89%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3E%20heap%5B0%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappop%28heap%29%0A%20%20%20%20%20%20%20%20%20%20%20%20heapq.heappush%28heap%2C%20nums%5Bi%5D%29%0A%20%20%20%20return%20heap%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%207%2C%206%2C%203%2C%202%5D%0A%20%20%20%20k%20%3D%203%0A%0A%20%20%20%20res%20%3D%20top_k_heap%28nums%2C%20k%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Всего выполняется $n$ операций добавления и извлечения из кучи, а максимальная длина кучи равна $k$ , поэтому временная сложность равна $O(n \log k)$ . Этот метод очень эффективен: когда $k$ мало, временная сложность стремится к $O(n)$ ; когда $k$ велико, она все равно не превышает $O(n \log n)$ .

Кроме того, этот метод подходит и для сценариев с динамическим потоком данных. При непрерывном поступлении новых данных мы можем продолжать поддерживать содержимое кучи, тем самым динамически обновляя наибольшие $k$ элементов.
