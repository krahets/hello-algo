# Linked List

Memory space is a shared resource for all programs. In a complex system runtime environment, available memory space may be scattered throughout the memory. We know that the memory space for storing an array must be contiguous, and when the array is very large, the memory may not be able to provide such a large contiguous space. This is where the flexibility advantage of linked lists becomes apparent.

A <u>linked list</u> is a linear data structure in which each element is a node object, and the nodes are connected through "references". A reference records the memory address of the next node, through which the next node can be accessed from the current node.

The design of linked lists allows nodes to be stored scattered throughout the memory, and their memory addresses do not need to be contiguous.

![Linked list definition and storage method](linked_list.assets/linkedlist_definition.png)

Observing the figure above, the basic unit of a linked list is a <u>node</u> object. Each node contains two pieces of data: the node's "value" and a "reference" to the next node.

- The first node of a linked list is called the "head node", and the last node is called the "tail node".
- The tail node points to "null", which is denoted as `null`, `nullptr`, and `None` in Java, C++, and Python, respectively.
- In languages that support pointers, such as C, C++, Go, and Rust, the aforementioned "reference" should be replaced with "pointer".

As shown in the following code, a linked list node `ListNode` contains not only a value but also an additional reference (pointer). Therefore, **linked lists occupy more memory space than arrays when storing the same amount of data**.

=== "Python"

    ```python title=""
    class ListNode:
        """Linked list node class"""
        def __init__(self, val: int):
            self.val: int = val               # Node value
            self.next: ListNode | None = None # Reference to the next node
    ```

=== "C++"

    ```cpp title=""
    /* Linked list node structure */
    struct ListNode {
        int val;         // Node value
        ListNode *next;  // Pointer to the next node
        ListNode(int x) : val(x), next(nullptr) {}  // Constructor
    };
    ```

=== "Java"

    ```java title=""
    /* Linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode next;  // Reference to the next node
        ListNode(int x) { val = x; }  // Constructor
    }
    ```

=== "C#"

    ```csharp title=""
    /* Linked list node class */
    class ListNode(int x) {  // Constructor
        int val = x;         // Node value
        ListNode? next;      // Reference to the next node
    }
    ```

=== "Go"

    ```go title=""
    /* Linked list node structure */
    type ListNode struct {
        Val  int       // Node value
        Next *ListNode // Pointer to the next node
    }

    // NewListNode Constructor, creates a new linked list
    func NewListNode(val int) *ListNode {
        return &ListNode{
            Val:  val,
            Next: nil,
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Linked list node class */
    class ListNode {
        var val: Int // Node value
        var next: ListNode? // Reference to the next node

        init(x: Int) { // Constructor
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Linked list node class */
    class ListNode {
        constructor(val, next) {
            this.val = (val === undefined ? 0 : val);       // Node value
            this.next = (next === undefined ? null : next); // Reference to the next node
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Linked list node class */
    class ListNode {
        val: number;
        next: ListNode | null;
        constructor(val?: number, next?: ListNode | null) {
            this.val = val === undefined ? 0 : val;        // Node value
            this.next = next === undefined ? null : next;  // Reference to the next node
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Linked list node class */
    class ListNode {
      int val; // Node value
      ListNode? next; // Reference to the next node
      ListNode(this.val, [this.next]); // Constructor
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    /* Linked list node class */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Node value
        next: Option<Rc<RefCell<ListNode>>>, // Pointer to the next node
    }
    ```

=== "C"

    ```c title=""
    /* Linked list node structure */
    typedef struct ListNode {
        int val;               // Node value
        struct ListNode *next; // Pointer to the next node
    } ListNode;

    /* Constructor */
    ListNode *newListNode(int val) {
        ListNode *node;
        node = (ListNode *) malloc(sizeof(ListNode));
        node->val = val;
        node->next = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Linked list node class */
    // Constructor
    class ListNode(x: Int) {
        val _val: Int = x          // Node value
        val next: ListNode? = null // Reference to the next node
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Linked list node class
    class ListNode
      attr_accessor :val  # Node value
      attr_accessor :next # Reference to the next node

      def initialize(val=0, next_node=nil)
        @val = val
        @next = next_node
      end
    end
    ```

## Common Linked List Operations

### Initializing a Linked List

Building a linked list involves two steps: first, initializing each node object; second, constructing the reference relationships between nodes. Once initialization is complete, we can traverse all nodes starting from the head node of the linked list through the reference `next`.

=== "Python"

    ```python title="linked_list.py"
    # Initialize linked list 1 -> 3 -> 2 -> 5 -> 4
    # Initialize each node
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Build references between nodes
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "C++"

    ```cpp title="linked_list.cpp"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    ListNode* n0 = new ListNode(1);
    ListNode* n1 = new ListNode(3);
    ListNode* n2 = new ListNode(2);
    ListNode* n3 = new ListNode(5);
    ListNode* n4 = new ListNode(4);
    // Build references between nodes
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Java"

    ```java title="linked_list.java"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    ListNode n0 = new ListNode(1);
    ListNode n1 = new ListNode(3);
    ListNode n2 = new ListNode(2);
    ListNode n3 = new ListNode(5);
    ListNode n4 = new ListNode(4);
    // Build references between nodes
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "C#"

    ```csharp title="linked_list.cs"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    ListNode n0 = new(1);
    ListNode n1 = new(3);
    ListNode n2 = new(2);
    ListNode n3 = new(5);
    ListNode n4 = new(4);
    // Build references between nodes
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Go"

    ```go title="linked_list.go"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    n0 := NewListNode(1)
    n1 := NewListNode(3)
    n2 := NewListNode(2)
    n3 := NewListNode(5)
    n4 := NewListNode(4)
    // Build references between nodes
    n0.Next = n1
    n1.Next = n2
    n2.Next = n3
    n3.Next = n4
    ```

=== "Swift"

    ```swift title="linked_list.swift"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    let n0 = ListNode(x: 1)
    let n1 = ListNode(x: 3)
    let n2 = ListNode(x: 2)
    let n3 = ListNode(x: 5)
    let n4 = ListNode(x: 4)
    // Build references between nodes
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "JS"

    ```javascript title="linked_list.js"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Build references between nodes
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "TS"

    ```typescript title="linked_list.ts"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Build references between nodes
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Dart"

    ```dart title="linked_list.dart"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */\
    // Initialize each node
    ListNode n0 = ListNode(1);
    ListNode n1 = ListNode(3);
    ListNode n2 = ListNode(2);
    ListNode n3 = ListNode(5);
    ListNode n4 = ListNode(4);
    // Build references between nodes
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Rust"

    ```rust title="linked_list.rs"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    let n0 = Rc::new(RefCell::new(ListNode { val: 1, next: None }));
    let n1 = Rc::new(RefCell::new(ListNode { val: 3, next: None }));
    let n2 = Rc::new(RefCell::new(ListNode { val: 2, next: None }));
    let n3 = Rc::new(RefCell::new(ListNode { val: 5, next: None }));
    let n4 = Rc::new(RefCell::new(ListNode { val: 4, next: None }));

    // Build references between nodes
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    ```

=== "C"

    ```c title="linked_list.c"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    ListNode* n0 = newListNode(1);
    ListNode* n1 = newListNode(3);
    ListNode* n2 = newListNode(2);
    ListNode* n3 = newListNode(5);
    ListNode* n4 = newListNode(4);
    // Build references between nodes
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Kotlin"

    ```kotlin title="linked_list.kt"
    /* Initialize linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize each node
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)
    // Build references between nodes
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Ruby"

    ```ruby title="linked_list.rb"
    # Initialize linked list 1 -> 3 -> 2 -> 5 -> 4
    # Initialize each node
    n0 = ListNode.new(1)
    n1 = ListNode.new(3)
    n2 = ListNode.new(2)
    n3 = ListNode.new(5)
    n4 = ListNode.new(4)
    # Build references between nodes
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

??? pythontutor "Code Visualization"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%93%BE%E8%A1%A8%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%90%84%E4%B8%AA%E8%8A%82%E7%82%B9%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%E6%9E%84%E5%BB%BA%E8%8A%82%E7%82%B9%E4%B9%8B%E9%97%B4%E7%9A%84%E5%BC%95%E7%94%A8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

An array is a single variable; for example, an array `nums` contains elements `nums[0]`, `nums[1]`, etc. A linked list, however, is composed of multiple independent node objects. **We typically use the head node as the reference to the linked list**; for example, the linked list in the above code can be referred to as linked list `n0`.

### Inserting a Node

Inserting a node in a linked list is very easy. As shown in the figure below, suppose we want to insert a new node `P` between two adjacent nodes `n0` and `n1`. **We only need to change two node references (pointers)**, with a time complexity of $O(1)$.

In contrast, the time complexity of inserting an element in an array is $O(n)$, which is inefficient when dealing with large amounts of data.

![Example of inserting a node into a linked list](linked_list.assets/linkedlist_insert_node.png)

```src
[file]{linked_list}-[class]{}-[func]{insert}
```

### Removing a Node

As shown in the figure below, removing a node in a linked list is also very convenient. **We only need to change one node's reference (pointer)**.

Note that although node `P` still points to `n1` after the deletion operation is complete, the linked list can no longer access `P` when traversing, which means `P` no longer belongs to this linked list.

![Removing a node from a linked list](linked_list.assets/linkedlist_remove_node.png)

```src
[file]{linked_list}-[class]{}-[func]{remove}
```

### Accessing a Node

**Accessing nodes in a linked list is less efficient**. As mentioned in the previous section, we can access any element in an array in $O(1)$ time. This is not the case with linked lists. The program needs to start from the head node and traverse backward one by one until the target node is found. That is, accessing the $i$-th node in a linked list requires $i - 1$ iterations, with a time complexity of $O(n)$.

```src
[file]{linked_list}-[class]{}-[func]{access}
```

### Finding a Node

Traverse the linked list to find a node with value `target`, and output the index of that node in the linked list. This process is also a linear search. The code is shown below:

```src
[file]{linked_list}-[class]{}-[func]{find}
```

## Arrays vs. Linked Lists

The table below summarizes the characteristics of arrays and linked lists and compares their operational efficiencies. Since they employ two opposite storage strategies, their various properties and operational efficiencies also exhibit contrasting characteristics.

<p align="center"> Table <id> &nbsp; Comparison of array and linked list efficiencies </p>

|                        | Array                                         | Linked List                |
| ---------------------- | --------------------------------------------- | -------------------------- |
| Storage method         | Contiguous memory space                       | Scattered memory space     |
| Capacity expansion     | Immutable length                              | Flexible expansion         |
| Memory efficiency      | Elements occupy less memory, but space may be wasted | Elements occupy more memory |
| Accessing an element   | $O(1)$                                        | $O(n)$                     |
| Adding an element      | $O(n)$                                        | $O(1)$                     |
| Removing an element    | $O(n)$                                        | $O(1)$                     |

## Common Types of Linked Lists

As shown in the figure below, there are three common types of linked lists:

- **Singly linked list**: This is the ordinary linked list introduced earlier. The nodes of a singly linked list contain a value and a reference to the next node. We call the first node the head node and the last node the tail node, which points to null `None`.
- **Circular linked list**: If we make the tail node of a singly linked list point to the head node (connecting the tail to the head), we get a circular linked list. In a circular linked list, any node can be viewed as the head node.
- **Doubly linked list**: Compared to a singly linked list, a doubly linked list records references in both directions. The node definition of a doubly linked list includes references to both the successor node (next node) and the predecessor node (previous node). Compared to a singly linked list, a doubly linked list is more flexible and can traverse the linked list in both directions, but it also requires more memory space.

=== "Python"

    ```python title=""
    class ListNode:
        """Doubly linked list node class"""
        def __init__(self, val: int):
            self.val: int = val                # Node value
            self.next: ListNode | None = None  # Reference to the successor node
            self.prev: ListNode | None = None  # Reference to the predecessor node
    ```

=== "C++"

    ```cpp title=""
    /* Doubly linked list node structure */
    struct ListNode {
        int val;         // Node value
        ListNode *next;  // Pointer to the successor node
        ListNode *prev;  // Pointer to the predecessor node
        ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // Constructor
    };
    ```

=== "Java"

    ```java title=""
    /* Doubly linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode next;  // Reference to the successor node
        ListNode prev;  // Reference to the predecessor node
        ListNode(int x) { val = x; }  // Constructor
    }
    ```

=== "C#"

    ```csharp title=""
    /* Doubly linked list node class */
    class ListNode(int x) {  // Constructor
        int val = x;    // Node value
        ListNode next;  // Reference to the successor node
        ListNode prev;  // Reference to the predecessor node
    }
    ```

=== "Go"

    ```go title=""
    /* Doubly linked list node structure */
    type DoublyListNode struct {
        Val  int             // Node value
        Next *DoublyListNode // Pointer to the successor node
        Prev *DoublyListNode // Pointer to the predecessor node
    }

    // NewDoublyListNode Initialization
    func NewDoublyListNode(val int) *DoublyListNode {
        return &DoublyListNode{
            Val:  val,
            Next: nil,
            Prev: nil,
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Doubly linked list node class */
    class ListNode {
        var val: Int // Node value
        var next: ListNode? // Reference to the successor node
        var prev: ListNode? // Reference to the predecessor node

        init(x: Int) { // Constructor
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Doubly linked list node class */
    class ListNode {
        constructor(val, next, prev) {
            this.val = val  ===  undefined ? 0 : val;        // Node value
            this.next = next  ===  undefined ? null : next;  // Reference to the successor node
            this.prev = prev  ===  undefined ? null : prev;  // Reference to the predecessor node
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Doubly linked list node class */
    class ListNode {
        val: number;
        next: ListNode | null;
        prev: ListNode | null;
        constructor(val?: number, next?: ListNode | null, prev?: ListNode | null) {
            this.val = val  ===  undefined ? 0 : val;        // Node value
            this.next = next  ===  undefined ? null : next;  // Reference to the successor node
            this.prev = prev  ===  undefined ? null : prev;  // Reference to the predecessor node
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Doubly linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode? next;  // Reference to the successor node
        ListNode? prev;  // Reference to the predecessor node
        ListNode(this.val, [this.next, this.prev]);  // Constructor
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* Doubly linked list node type */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Node value
        next: Option<Rc<RefCell<ListNode>>>, // Pointer to the successor node
        prev: Option<Rc<RefCell<ListNode>>>, // Pointer to the predecessor node
    }

    /* Constructor */
    impl ListNode {
        fn new(val: i32) -> Self {
            ListNode {
                val,
                next: None,
                prev: None,
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* Doubly linked list node structure */
    typedef struct ListNode {
        int val;               // Node value
        struct ListNode *next; // Pointer to the successor node
        struct ListNode *prev; // Pointer to the predecessor node
    } ListNode;

    /* Constructor */
    ListNode *newListNode(int val) {
        ListNode *node;
        node = (ListNode *) malloc(sizeof(ListNode));
        node->val = val;
        node->next = NULL;
        node->prev = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Doubly linked list node class */
    // Constructor
    class ListNode(x: Int) {
        val _val: Int = x           // Node value
        val next: ListNode? = null  // Reference to the successor node
        val prev: ListNode? = null  // Reference to the predecessor node
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Doubly linked list node class
    class ListNode
      attr_accessor :val    # Node value
      attr_accessor :next   # Reference to the successor node
      attr_accessor :prev   # Reference to the predecessor node

      def initialize(val=0, next_node=nil, prev_node=nil)
        @val = val
        @next = next_node
        @prev = prev_node
      end
    end
    ```

![Common types of linked lists](linked_list.assets/linkedlist_common_types.png)

## Typical Applications of Linked Lists

Singly linked lists are commonly used to implement stacks, queues, hash tables, and graphs.

- **Stacks and queues**: When insertion and deletion operations both occur at one end of the linked list, it exhibits last-in-first-out characteristics, corresponding to a stack. When insertion operations occur at one end of the linked list and deletion operations occur at the other end, it exhibits first-in-first-out characteristics, corresponding to a queue.
- **Hash tables**: Separate chaining is one of the mainstream solutions for resolving hash collisions. In this approach, all colliding elements are placed in a linked list.
- **Graphs**: An adjacency list is a common way to represent a graph, where each vertex in the graph is associated with a linked list, and each element in the linked list represents another vertex connected to that vertex.

Doubly linked lists are commonly used in scenarios where quick access to the previous and next elements is needed.

- **Advanced data structures**: For example, in red-black trees and B-trees, we need to access the parent node of a node, which can be achieved by saving a reference to the parent node in the node, similar to a doubly linked list.
- **Browser history**: In web browsers, when a user clicks the forward or backward button, the browser needs to know the previous and next web pages the user visited. The characteristics of doubly linked lists make this operation simple.
- **LRU algorithm**: In cache eviction (LRU) algorithms, we need to quickly find the least recently used data and support quick addition and deletion of nodes. Using a doubly linked list is very suitable for this.

Circular linked lists are commonly used in scenarios that require periodic operations, such as operating system resource scheduling.

- **Round-robin scheduling algorithm**: In operating systems, round-robin scheduling is a common CPU scheduling algorithm that needs to cycle through a set of processes. Each process is assigned a time slice, and when the time slice expires, the CPU switches to the next process. This cyclic operation can be implemented using a circular linked list.
- **Data buffers**: In some data buffer implementations, circular linked lists may also be used. For example, in audio and video players, the data stream may be divided into multiple buffer blocks and placed in a circular linked list to achieve seamless playback.
