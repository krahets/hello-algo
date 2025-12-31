# Heap

A <u>heap</u> is a complete binary tree that satisfies specific conditions and can be mainly categorized into two types, as shown in the figure below.

- <u>min heap</u>: The value of any node $\leq$ the values of its child nodes.
- <u>max heap</u>: The value of any node $\geq$ the values of its child nodes.

![Min heap and max heap](heap.assets/min_heap_and_max_heap.png)

As a special case of a complete binary tree, heaps have the following characteristics.

- The bottom layer nodes are filled from left to right, and nodes in other layers are fully filled.
- We call the root node of the binary tree the "heap top" and the bottom-rightmost node the "heap bottom."
- For max heaps (min heaps), the value of the heap top element (root node) is the largest (smallest).

## Common Heap Operations

It should be noted that many programming languages provide a <u>priority queue</u>, which is an abstract data structure defined as a queue with priority sorting.

In fact, **heaps are typically used to implement priority queues, with max heaps corresponding to priority queues where elements are dequeued in descending order**. From a usage perspective, we can regard "priority queue" and "heap" as equivalent data structures. Therefore, this book does not make a special distinction between the two and uniformly refers to them as "heap."

Common heap operations are shown in the table below, and method names need to be determined based on the programming language.

<p align="center"> Table <id> &nbsp; Efficiency of Heap Operations </p>

| Method name | Description                                                       | Time complexity |
| ----------- | ----------------------------------------------------------------- | --------------- |
| `push()`    | Insert an element into the heap                                   | $O(\log n)$     |
| `pop()`     | Remove the heap top element                                       | $O(\log n)$     |
| `peek()`    | Access the heap top element (max/min value for max/min heap)     | $O(1)$          |
| `size()`    | Get the number of elements in the heap                            | $O(1)$          |
| `isEmpty()` | Check if the heap is empty                                        | $O(1)$          |

In practical applications, we can directly use the heap class (or priority queue class) provided by programming languages.

Similar to "ascending order" and "descending order" in sorting algorithms, we can implement conversion between "min heap" and "max heap" by setting a `flag` or modifying the `Comparator`. The code is as follows:

=== "Python"

    ```python title="heap.py"
    # Initialize a min heap
    min_heap, flag = [], 1
    # Initialize a max heap
    max_heap, flag = [], -1

    # Python's heapq module implements a min heap by default
    # Consider negating elements before pushing them to the heap, which inverts the size relationship and thus implements a max heap
    # In this example, flag = 1 corresponds to a min heap, flag = -1 corresponds to a max heap

    # Push elements into the heap
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # Get the heap top element
    peek: int = flag * max_heap[0] # 5

    # Remove the heap top element
    # The removed elements will form a descending sequence
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # Get the heap size
    size: int = len(max_heap)

    # Check if the heap is empty
    is_empty: bool = not max_heap

    # Build a heap from an input list
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    ```

=== "C++"

    ```cpp title="heap.cpp"
    /* Initialize a heap */
    // Initialize a min heap
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // Initialize a max heap
    priority_queue<int, vector<int>, less<int>> maxHeap;

    /* Push elements into the heap */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);

    /* Get the heap top element */
    int peek = maxHeap.top(); // 5

    /* Remove the heap top element */
    // The removed elements will form a descending sequence
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* Get the heap size */
    int size = maxHeap.size();

    /* Check if the heap is empty */
    bool isEmpty = maxHeap.empty();

    /* Build a heap from an input list */
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    ```

=== "Java"

    ```java title="heap.java"
    /* Initialize a heap */
    // Initialize a min heap
    Queue<Integer> minHeap = new PriorityQueue<>();
    // Initialize a max heap (use lambda expression to modify Comparator)
    Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

    /* Push elements into the heap */
    maxHeap.offer(1);
    maxHeap.offer(3);
    maxHeap.offer(2);
    maxHeap.offer(5);
    maxHeap.offer(4);

    /* Get the heap top element */
    int peek = maxHeap.peek(); // 5

    /* Remove the heap top element */
    // The removed elements will form a descending sequence
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1

    /* Get the heap size */
    int size = maxHeap.size();

    /* Check if the heap is empty */
    boolean isEmpty = maxHeap.isEmpty();

    /* Build a heap from an input list */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C#"

    ```csharp title="heap.cs"
    /* Initialize a heap */
    // Initialize a min heap
    PriorityQueue<int, int> minHeap = new();
    // Initialize a max heap (use lambda expression to modify Comparer)
    PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    /* Push elements into the heap */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* Get the heap top element */
    int peek = maxHeap.Peek();//5

    /* Remove the heap top element */
    // The removed elements will form a descending sequence
    peek = maxHeap.Dequeue();  // 5
    peek = maxHeap.Dequeue();  // 4
    peek = maxHeap.Dequeue();  // 3
    peek = maxHeap.Dequeue();  // 2
    peek = maxHeap.Dequeue();  // 1

    /* Get the heap size */
    int size = maxHeap.Count;

    /* Check if the heap is empty */
    bool isEmpty = maxHeap.Count == 0;

    /* Build a heap from an input list */
    minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
    ```

=== "Go"

    ```go title="heap.go"
    // In Go, we can construct a max heap of integers by implementing heap.Interface
    // Implementing heap.Interface also requires implementing sort.Interface
    type intHeap []any

    // Push implements the heap.Interface method for pushing an element into the heap
    func (h *intHeap) Push(x any) {
        // Push and Pop use pointer receiver as parameters
        // because they not only adjust the slice contents but also modify the slice length
        *h = append(*h, x.(int))
    }

    // Pop implements the heap.Interface method for popping the heap top element
    func (h *intHeap) Pop() any {
        // The element to be removed is stored at the end
        last := (*h)[len(*h)-1]
        *h = (*h)[:len(*h)-1]
        return last
    }

    // Len is a sort.Interface method
    func (h *intHeap) Len() int {
        return len(*h)
    }

    // Less is a sort.Interface method
    func (h *intHeap) Less(i, j int) bool {
        // To implement a min heap, change this to a less-than sign
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap is a sort.Interface method
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top gets the heap top element
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    /* Driver Code */
    func TestHeap(t *testing.T) {
        /* Initialize a heap */
        // Initialize a max heap
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* Push elements into the heap */
        // Call heap.Interface methods to add elements
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 4)
        heap.Push(maxHeap, 5)

        /* Get the heap top element */
        top := maxHeap.Top()
        fmt.Printf("Heap top element is %d\n", top)

        /* Remove the heap top element */
        // Call heap.Interface methods to remove elements
        heap.Pop(maxHeap) // 5
        heap.Pop(maxHeap) // 4
        heap.Pop(maxHeap) // 3
        heap.Pop(maxHeap) // 2
        heap.Pop(maxHeap) // 1

        /* Get the heap size */
        size := len(*maxHeap)
        fmt.Printf("Number of heap elements is %d\n", size)

        /* Check if the heap is empty */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("Is the heap empty? %t\n", isEmpty)
    }
    ```

=== "Swift"

    ```swift title="heap.swift"
    /* Initialize a heap */
    // Swift's Heap type supports both max heaps and min heaps, and requires importing swift-collections
    var heap = Heap<Int>()

    /* Push elements into the heap */
    heap.insert(1)
    heap.insert(3)
    heap.insert(2)
    heap.insert(5)
    heap.insert(4)

    /* Get the heap top element */
    var peek = heap.max()!

    /* Remove the heap top element */
    peek = heap.removeMax() // 5
    peek = heap.removeMax() // 4
    peek = heap.removeMax() // 3
    peek = heap.removeMax() // 2
    peek = heap.removeMax() // 1

    /* Get the heap size */
    let size = heap.count

    /* Check if the heap is empty */
    let isEmpty = heap.isEmpty

    /* Build a heap from an input list */
    let heap2 = Heap([1, 3, 2, 5, 4])
    ```

=== "JS"

    ```javascript title="heap.js"
    // JavaScript does not provide a built-in Heap class
    ```

=== "TS"

    ```typescript title="heap.ts"
    // TypeScript does not provide a built-in Heap class
    ```

=== "Dart"

    ```dart title="heap.dart"
    // Dart does not provide a built-in Heap class
    ```

=== "Rust"

    ```rust title="heap.rs"
    use std::collections::BinaryHeap;
    use std::cmp::Reverse;

    /* Initialize a heap */
    // Initialize a min heap
    let mut min_heap = BinaryHeap::<Reverse<i32>>::new();
    // Initialize a max heap
    let mut max_heap = BinaryHeap::new();

    /* Push elements into the heap */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);

    /* Get the heap top element */
    let peek = max_heap.peek().unwrap();  // 5

    /* Remove the heap top element */
    // The removed elements will form a descending sequence
    let peek = max_heap.pop().unwrap();   // 5
    let peek = max_heap.pop().unwrap();   // 4
    let peek = max_heap.pop().unwrap();   // 3
    let peek = max_heap.pop().unwrap();   // 2
    let peek = max_heap.pop().unwrap();   // 1

    /* Get the heap size */
    let size = max_heap.len();

    /* Check if the heap is empty */
    let is_empty = max_heap.is_empty();

    /* Build a heap from an input list */
    let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    ```

=== "C"

    ```c title="heap.c"
    // C does not provide a built-in Heap class
    ```

=== "Kotlin"

    ```kotlin title="heap.kt"
    /* Initialize a heap */
    // Initialize a min heap
    var minHeap = PriorityQueue<Int>()
    // Initialize a max heap (use lambda expression to modify Comparator)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    /* Push elements into the heap */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)

    /* Get the heap top element */
    var peek = maxHeap.peek() // 5

    /* Remove the heap top element */
    // The removed elements will form a descending sequence
    peek = maxHeap.poll() // 5
    peek = maxHeap.poll() // 4
    peek = maxHeap.poll() // 3
    peek = maxHeap.poll() // 2
    peek = maxHeap.poll() // 1

    /* Get the heap size */
    val size = maxHeap.size

    /* Check if the heap is empty */
    val isEmpty = maxHeap.isEmpty()

    /* Build a heap from an input list */
    minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
    ```

=== "Ruby"

    ```ruby title="heap.rb"
    # Ruby does not provide a built-in Heap class
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B0%8F%E9%A1%B6%E5%A0%86%0A%20%20%20%20min_heap,%20flag%20%3D%20%5B%5D,%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A4%A7%E9%A1%B6%E5%A0%86%0A%20%20%20%20max_heap,%20flag%20%3D%20%5B%5D,%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E5%9D%97%E9%BB%98%E8%AE%A4%E5%AE%9E%E7%8E%B0%E5%B0%8F%E9%A1%B6%E5%A0%86%0A%20%20%20%20%23%20%E8%80%83%E8%99%91%E5%B0%86%E2%80%9C%E5%85%83%E7%B4%A0%E5%8F%96%E8%B4%9F%E2%80%9D%E5%90%8E%E5%86%8D%E5%85%A5%E5%A0%86%EF%BC%8C%E8%BF%99%E6%A0%B7%E5%B0%B1%E5%8F%AF%E4%BB%A5%E5%B0%86%E5%A4%A7%E5%B0%8F%E5%85%B3%E7%B3%BB%E9%A2%A0%E5%80%92%EF%BC%8C%E4%BB%8E%E8%80%8C%E5%AE%9E%E7%8E%B0%E5%A4%A7%E9%A1%B6%E5%A0%86%0A%20%20%20%20%23%20%E5%9C%A8%E6%9C%AC%E7%A4%BA%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E6%97%B6%E5%AF%B9%E5%BA%94%E5%B0%8F%E9%A1%B6%E5%A0%86%EF%BC%8Cflag%20%3D%20-1%20%E6%97%B6%E5%AF%B9%E5%BA%94%E5%A4%A7%E9%A1%B6%E5%A0%86%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%201%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%203%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%202%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%205%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20*%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20*%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%A0%86%E9%A1%B6%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%0A%20%20%20%20%23%20%E5%87%BA%E5%A0%86%E5%85%83%E7%B4%A0%E4%BC%9A%E5%BD%A2%E6%88%90%E4%B8%80%E4%B8%AA%E4%BB%8E%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E5%BA%8F%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%A0%86%E5%A4%A7%E5%B0%8F%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E5%A0%86%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BE%93%E5%85%A5%E5%88%97%E8%A1%A8%E5%B9%B6%E5%BB%BA%E5%A0%86%0A%20%20%20%20min_heap%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Implementation of the Heap

The following implementation is of a max heap. To convert it to a min heap, simply invert all size logic comparisons (for example, replace $\geq$ with $\leq$). Interested readers are encouraged to implement this on their own.

### Heap Storage and Representation

As mentioned in the "Binary Tree" chapter, complete binary trees are well-suited for array representation. Since heaps are a type of complete binary tree, **we will use arrays to store heaps**.

When representing a binary tree with an array, elements represent node values, and indexes represent node positions in the binary tree. **Node pointers are implemented through index mapping formulas**.

As shown in the figure below, given an index $i$, the index of its left child is $2i + 1$, the index of its right child is $2i + 2$, and the index of its parent is $(i - 1) / 2$ (floor division). When an index is out of bounds, it indicates a null node or that the node does not exist.

![Representation and storage of heaps](heap.assets/representation_of_heap.png)

We can encapsulate the index mapping formula into functions for convenient subsequent use:

```src
[file]{my_heap}-[class]{max_heap}-[func]{parent}
```

### Accessing the Heap Top Element

The heap top element is the root node of the binary tree, which is also the first element of the list:

```src
[file]{my_heap}-[class]{max_heap}-[func]{peek}
```

### Inserting an Element Into the Heap

Given an element `val`, we first add it to the bottom of the heap. After addition, since `val` may be larger than other elements in the heap, the heap's property may be violated. **Therefore, it's necessary to repair the path from the inserted node to the root node**. This operation is called <u>heapify</u>.

Starting from the inserted node, **perform heapify from bottom to top**. As shown in the figure below, we compare the inserted node with its parent node, and if the inserted node is larger, swap them. Then continue this operation, repairing nodes in the heap from bottom to top until we pass the root node or encounter a node that does not need swapping.

=== "<1>"
    ![Steps of inserting an element into the heap](heap.assets/heap_push_step1.png)

=== "<2>"
    ![heap_push_step2](heap.assets/heap_push_step2.png)

=== "<3>"
    ![heap_push_step3](heap.assets/heap_push_step3.png)

=== "<4>"
    ![heap_push_step4](heap.assets/heap_push_step4.png)

=== "<5>"
    ![heap_push_step5](heap.assets/heap_push_step5.png)

=== "<6>"
    ![heap_push_step6](heap.assets/heap_push_step6.png)

=== "<7>"
    ![heap_push_step7](heap.assets/heap_push_step7.png)

=== "<8>"
    ![heap_push_step8](heap.assets/heap_push_step8.png)

=== "<9>"
    ![heap_push_step9](heap.assets/heap_push_step9.png)

Given a total of $n$ nodes, the tree height is $O(\log n)$. Thus, the number of loop iterations in the heapify operation is at most $O(\log n)$, **making the time complexity of the element insertion operation $O(\log n)$**. The code is as follows:

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_up}
```

### Removing the Heap Top Element

The heap top element is the root node of the binary tree, which is the first element of the list. If we directly remove the first element from the list, all node indexes in the binary tree would change, making subsequent repair with heapify difficult. To minimize changes in element indexes, we use the following steps.

1. Swap the heap top element with the heap bottom element (swap the root node with the rightmost leaf node).
2. After swapping, remove the heap bottom from the list (note that since we've swapped, we're actually removing the original heap top element).
3. Starting from the root node, **perform heapify from top to bottom**.

As shown in the figure below, **the direction of "top-to-bottom heapify" is opposite to "bottom-to-top heapify"**. We compare the root node's value with its two children and swap it with the largest child. Then loop this operation until we pass a leaf node or encounter a node that doesn't need swapping.

=== "<1>"
    ![Steps of removing the heap top element](heap.assets/heap_pop_step1.png)

=== "<2>"
    ![heap_pop_step2](heap.assets/heap_pop_step2.png)

=== "<3>"
    ![heap_pop_step3](heap.assets/heap_pop_step3.png)

=== "<4>"
    ![heap_pop_step4](heap.assets/heap_pop_step4.png)

=== "<5>"
    ![heap_pop_step5](heap.assets/heap_pop_step5.png)

=== "<6>"
    ![heap_pop_step6](heap.assets/heap_pop_step6.png)

=== "<7>"
    ![heap_pop_step7](heap.assets/heap_pop_step7.png)

=== "<8>"
    ![heap_pop_step8](heap.assets/heap_pop_step8.png)

=== "<9>"
    ![heap_pop_step9](heap.assets/heap_pop_step9.png)

=== "<10>"
    ![heap_pop_step10](heap.assets/heap_pop_step10.png)

Similar to the element insertion operation, the time complexity of the heap top element removal operation is also $O(\log n)$. The code is as follows:

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_down}
```

## Common Applications of Heaps

- **Priority queue**: Heaps are typically the preferred data structure for implementing priority queues, with both enqueue and dequeue operations having a time complexity of $O(\log n)$, and the heap construction operation having $O(n)$, all of which are highly efficient.
- **Heap sort**: Given a set of data, we can build a heap with them and then continuously perform element removal operations to obtain sorted data. However, we usually use a more elegant approach to implement heap sort, as detailed in the "Heap Sort" chapter.
- **Getting the largest $k$ elements**: This is a classic algorithm problem and also a typical application, such as selecting the top 10 trending news for Weibo hot search, selecting the top 10 best-selling products, etc.
