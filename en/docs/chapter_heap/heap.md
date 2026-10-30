# Heaps

A <u>heap</u> is a complete binary tree that satisfies a particular ordering condition. There are two main types, shown below.

- <u>Min heap</u>: every node's value is $\leq$ the values of its children.
- <u>Max heap</u>: every node's value is $\geq$ the values of its children.

![A min heap and a max heap](heap.assets/min_heap_and_max_heap.png)

As a special kind of complete binary tree, a heap has the following properties.

- The lowest level is filled from left to right, and all other levels are full.
- The root is the “top” of the heap, while the rightmost node on the lowest level is its “last” node.
- In a max heap or min heap, the root holds the largest or smallest value, respectively.

## Common heap operations

Many programming languages provide a <u>priority queue</u>, an abstract data structure whose elements are removed according to priority.

**Heaps are commonly used to implement priority queues. A max heap corresponds to a priority queue that removes elements from largest to smallest**. From the user's perspective, the two can be treated as equivalent. This book therefore does not distinguish them strictly and uses the term “heap” for both.

The table below lists common operations. Method names depend on the programming language.

<p align="center"> Table <id> &nbsp; Efficiency of heap operations </p>

| Method      | Description                                             | Time complexity  |
| ----------- | ------------------------------------------------ | ----------- |
| `push()`    | Insert an element                                         | $O(\log n)$ |
| `pop()`     | Remove the root element                                     | $O(\log n)$ |
| `peek()`    | Access the root: the maximum in a max heap or minimum in a min heap | $O(1)$      |
| `size()`    | Get the number of elements                                 | $O(1)$      |
| `isEmpty()` | Check whether the heap is empty                                   | $O(1)$      |

In practice, use the heap or priority-queue class provided by the language.

Just as a sorting algorithm can order values in ascending or descending order, we can switch between min heaps and max heaps by setting a `flag` or changing the `Comparator`:

=== "Python"

    ```python title="heap.py"
    # Initialize a min heap
    min_heap, flag = [], 1
    # Initialize a max heap
    max_heap, flag = [], -1

    # Python's heapq module implements a min heap by default
    # Negate elements before insertion to reverse their order and implement a max heap
    # Here, flag = 1 gives a min heap and flag = -1 gives a max heap

    # Insert elements into the heap
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # Access the root element
    peek: int = flag * max_heap[0] # 5

    # Remove root elements
    # Removed elements form a descending sequence
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # Get the heap size
    size: int = len(max_heap)

    # Check whether the heap is empty
    is_empty: bool = not max_heap

    # Build a heap from a list
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

    /* Insert elements into the heap */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);

    /* Access the root element */
    int peek = maxHeap.top(); // 5

    /* Remove root elements */
    // Removed elements form a descending sequence
    maxHeap.pop(); // 5
    maxHeap.pop(); // 4
    maxHeap.pop(); // 3
    maxHeap.pop(); // 2
    maxHeap.pop(); // 1

    /* Get the heap size */
    int size = maxHeap.size();

    /* Check whether the heap is empty */
    bool isEmpty = maxHeap.empty();

    /* Build a heap from a list */
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    ```

=== "Java"

    ```java title="heap.java"
    /* Initialize a heap */
    // Initialize a min heap
    Queue<Integer> minHeap = new PriorityQueue<>();
    // Initialize a max heap by changing the Comparator with a lambda expression
    Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

    /* Insert elements into the heap */
    maxHeap.offer(1);
    maxHeap.offer(3);
    maxHeap.offer(2);
    maxHeap.offer(5);
    maxHeap.offer(4);

    /* Access the root element */
    int peek = maxHeap.peek(); // 5

    /* Remove root elements */
    // Removed elements form a descending sequence
    peek = maxHeap.poll(); // 5
    peek = maxHeap.poll(); // 4
    peek = maxHeap.poll(); // 3
    peek = maxHeap.poll(); // 2
    peek = maxHeap.poll(); // 1

    /* Get the heap size */
    int size = maxHeap.size();

    /* Check whether the heap is empty */
    boolean isEmpty = maxHeap.isEmpty();

    /* Build a heap from a list */
    minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
    ```

=== "C#"

    ```csharp title="heap.cs"
    /* Initialize a heap */
    // Initialize a min heap
    PriorityQueue<int, int> minHeap = new();
    // Initialize a max heap by changing the Comparer with a lambda expression
    PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

    /* Insert elements into the heap */
    maxHeap.Enqueue(1, 1);
    maxHeap.Enqueue(3, 3);
    maxHeap.Enqueue(2, 2);
    maxHeap.Enqueue(5, 5);
    maxHeap.Enqueue(4, 4);

    /* Access the root element */
    int peek = maxHeap.Peek();//5

    /* Remove root elements */
    // Removed elements form a descending sequence
    peek = maxHeap.Dequeue();  // 5
    peek = maxHeap.Dequeue();  // 4
    peek = maxHeap.Dequeue();  // 3
    peek = maxHeap.Dequeue();  // 2
    peek = maxHeap.Dequeue();  // 1

    /* Get the heap size */
    int size = maxHeap.Count;

    /* Check whether the heap is empty */
    bool isEmpty = maxHeap.Count == 0;

    /* Build a heap from a list */
    minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
    ```

=== "Go"

    ```go title="heap.go"
    // In Go, implement heap.Interface to build an integer max heap
    // Implementing heap.Interface also requires implementing sort.Interface
    type intHeap []any

    // Push implements the heap.Interface method for inserting an element
    func (h *intHeap) Push(x any) {
        // Push and Pop use pointer receivers
        // because they change the slice length as well as its contents.
        *h = append(*h, x.(int))
    }

    // Pop implements the heap.Interface method used to remove the root element
    func (h *intHeap) Pop() any {
        // The element to remove has been placed at the end
        last := (*h)[len(*h)-1]
        *h = (*h)[:len(*h)-1]
        return last
    }

    // Len implements a sort.Interface method
    func (h *intHeap) Len() int {
        return len(*h)
    }

    // Less implements a sort.Interface method
    func (h *intHeap) Less(i, j int) bool {
        // For a min heap, change this to a less-than comparison
        return (*h)[i].(int) > (*h)[j].(int)
    }

    // Swap implements a sort.Interface method
    func (h *intHeap) Swap(i, j int) {
        (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
    }

    // Top returns the root element
    func (h *intHeap) Top() any {
        return (*h)[0]
    }

    /* Driver Code */
    func TestHeap(t *testing.T) {
        /* Initialize a heap */
        // Initialize a max heap
        maxHeap := &intHeap{}
        heap.Init(maxHeap)
        /* Insert elements into the heap */
        // Call the heap.Interface methods to add elements
        heap.Push(maxHeap, 1)
        heap.Push(maxHeap, 3)
        heap.Push(maxHeap, 2)
        heap.Push(maxHeap, 4)
        heap.Push(maxHeap, 5)

        /* Access the root element */
        top := maxHeap.Top()
        fmt.Printf("The root element is %d\n", top)

        /* Remove root elements */
        // Call the heap.Interface methods to remove elements
        heap.Pop(maxHeap) // 5
        heap.Pop(maxHeap) // 4
        heap.Pop(maxHeap) // 3
        heap.Pop(maxHeap) // 2
        heap.Pop(maxHeap) // 1

        /* Get the heap size */
        size := len(*maxHeap)
        fmt.Printf("The heap contains %d elements\n", size)

        /* Check whether the heap is empty */
        isEmpty := len(*maxHeap) == 0
        fmt.Printf("Is the heap empty: %t\n", isEmpty)
    }
    ```

=== "Swift"

    ```swift title="heap.swift"
    /* Initialize a heap */
    // Swift's Heap type supports both minimum and maximum operations and requires swift-collections
    var heap = Heap<Int>()

    /* Insert elements into the heap */
    heap.insert(1)
    heap.insert(3)
    heap.insert(2)
    heap.insert(5)
    heap.insert(4)

    /* Access the root element */
    var peek = heap.max()!

    /* Remove root elements */
    peek = heap.removeMax() // 5
    peek = heap.removeMax() // 4
    peek = heap.removeMax() // 3
    peek = heap.removeMax() // 2
    peek = heap.removeMax() // 1

    /* Get the heap size */
    let size = heap.count

    /* Check whether the heap is empty */
    let isEmpty = heap.isEmpty

    /* Build a heap from a list */
    let heap2 = Heap([1, 3, 2, 5, 4])
    ```

=== "JS"

    ```javascript title="heap.js"
    // JavaScript provides no built-in Heap class
    ```

=== "TS"

    ```typescript title="heap.ts"
    // TypeScript provides no built-in Heap class
    ```

=== "Dart"

    ```dart title="heap.dart"
    // Dart provides no built-in Heap class
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

    /* Insert elements into the heap */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);

    /* Access the root element */
    let peek = max_heap.peek().unwrap();  // 5

    /* Remove root elements */
    // Removed elements form a descending sequence
    let peek = max_heap.pop().unwrap();   // 5
    let peek = max_heap.pop().unwrap();   // 4
    let peek = max_heap.pop().unwrap();   // 3
    let peek = max_heap.pop().unwrap();   // 2
    let peek = max_heap.pop().unwrap();   // 1

    /* Get the heap size */
    let size = max_heap.len();

    /* Check whether the heap is empty */
    let is_empty = max_heap.is_empty();

    /* Build a heap from a list */
    let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    ```

=== "C"

    ```c title="heap.c"
    // C provides no built-in Heap class
    ```

=== "Kotlin"

    ```kotlin title="heap.kt"
    /* Initialize a heap */
    // Initialize a min heap
    var minHeap = PriorityQueue<Int>()
    // Initialize a max heap by changing the Comparator with a lambda expression
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    /* Insert elements into the heap */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)

    /* Access the root element */
    var peek = maxHeap.peek() // 5

    /* Remove root elements */
    // Removed elements form a descending sequence
    peek = maxHeap.poll() // 5
    peek = maxHeap.poll() // 4
    peek = maxHeap.poll() // 3
    peek = maxHeap.poll() // 2
    peek = maxHeap.poll() // 1

    /* Get the heap size */
    val size = maxHeap.size

    /* Check whether the heap is empty */
    val isEmpty = maxHeap.isEmpty()

    /* Build a heap from a list */
    minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
    ```

=== "Ruby"

    ```ruby title="heap.rb"
    # Ruby provides no built-in Heap class
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20min%20heap%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20Initialize%20a%20max%20heap%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%27s%20heapq%20module%20implements%20a%20min%20heap%20by%20default%0A%20%20%20%20%23%20Negate%20elements%20before%20insertion%20to%20reverse%20their%20order%20and%20implement%20a%20max%20heap%0A%20%20%20%20%23%20Here%2C%20flag%20%3D%201%20gives%20a%20min%20heap%20and%20flag%20%3D%20-1%20gives%20a%20max%20heap%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20elements%20into%20the%20heap%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20Access%20the%20root%20element%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20root%20elements%0A%20%20%20%20%23%20Removed%20elements%20form%20a%20descending%20sequence%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20Get%20the%20heap%20size%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20Check%20whether%20the%20heap%20is%20empty%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20Build%20a%20heap%20from%20a%20list%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## Implementing a heap

The following implementation is a max heap. To turn it into a min heap, reverse every ordering comparison, for example replacing $\geq$ with $\leq$. Interested readers can try this themselves.

### Storage and representation

The binary-tree chapter showed that complete binary trees are well suited to array representation. Since a heap is a complete binary tree, **we will store it in an array**.

In an array representation, elements store node values and indices identify positions in the tree. **Index-mapping formulas take the place of node pointers**.

As shown below, a node at index $i$ has its left child at $2i + 1$, its right child at $2i + 2$, and its parent at $(i - 1) / 2$, rounded down. An out-of-bounds index represents a missing node.

![Representing and storing a heap](heap.assets/representation_of_heap.png)

Wrap the index formulas in functions for convenient use:

```src
[file]{my_heap}-[class]{max_heap}-[func]{parent}
```

### Accessing the root

The heap's root is the first element of the list:

```src
[file]{my_heap}-[class]{max_heap}-[func]{peek}
```

### Inserting an element

To insert `val`, first append it at the end of the heap. Since it may be larger than other elements, this can violate the heap property. **We must restore the property along the path from the inserted node to the root**, an operation called <u>heapifying</u>.

Start at the inserted node and **sift upward**. As shown below, compare it with its parent and swap them if the inserted value is larger. Repeat upward until the root is reached or no swap is needed.

=== "<1>"
    ![Steps for inserting into a heap](heap.assets/heap_push_step1.png)

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

With $n$ nodes, the tree height is $O(\log n)$, so sifting takes at most $O(\log n)$ iterations. **Insertion therefore takes $O(\log n)$ time**. The code is as follows:

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_up}
```

### Removing the root

The root is the first element of the list. Removing it directly would change every remaining index, making it difficult to restore the heap property. To minimize index changes, use the following steps.

1. Swap the root with the last element, the rightmost leaf.
2. Remove the last element from the list. Because of the swap, this is the original root.
3. Starting at the root, **sift downward**.

As shown below, **sifting down proceeds in the opposite direction from sifting up**. Compare the root with its two children and swap it with the larger child when needed. Continue downward until a leaf is reached or no swap is necessary.

=== "<1>"
    ![Steps for removing the root of a heap](heap.assets/heap_pop_step1.png)

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

Like insertion, removing the root takes $O(\log n)$ time. The code is as follows:

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_down}
```

## Common applications

- **Priority queues**: Heaps are usually the first choice for implementing priority queues. Enqueueing and dequeueing both take $O(\log n)$ time, and building a heap takes $O(n)$.
- **Heap sort**: Build a heap from a dataset, then repeatedly remove its root to obtain sorted data. In practice, a more elegant implementation is usually used; see the heap-sort section.
- **Finding the largest $k$ elements**: This is both a classic algorithm problem and a common application, such as selecting the 10 hottest news stories for Weibo's trending list or the 10 best-selling products.
