# Linked Lists

Memory space is a common resource for all programs. In a complex system environment, free memory space can be scattered throughout memory. We know that the memory space for storing an array must be contiguous, and when the array is very large, it may not be possible to provide such a large contiguous space. This is where the flexibility advantage of linked lists becomes apparent.

A "linked list" is a linear data structure where each element is a node object, and the nodes are connected via "references". A reference records the memory address of the next node, allowing access to the next node from the current one.

The design of a linked list allows its nodes to be scattered throughout memory, with no need for contiguous memory addresses.

![Linked List Definition and Storage Method](linked_list.assets/linkedlist_definition.png)

Observing the image above, the fundamental unit of a linked list is the "node" object. Each node contains two pieces of data: the "value" of the node and the "reference" to the next node.

- The first node of a linked list is known as the "head node", and the last one is called the "tail node".
- The tail node points to "null", which is represented as $\text{null}$ in Java, $\text{nullptr}$ in C++, and $\text{None}$ in Python.
- In languages that support pointers, like C, C++, Go, and Rust, the aforementioned "reference" should be replaced with a "pointer".

As shown in the following code, a linked list node `ListNode`, apart from containing a value, also needs to store a reference (pointer). Therefore, **a linked list consumes more memory space than an array for the same amount of data**.

=== "Python"

    ```python title=""
    class ListNode:
        """Linked List Node Class"""
        def __init__(self, val: int):
            self.val: int = val               # Node value
            self.next: ListNode | None = None # Reference to the next node
    ```

=== "C++"

    ```cpp title=""
    /* Linked List Node Structure */
    struct ListNode {
        int val;         // Node value
        ListNode *next;  // Pointer to the next node
        ListNode(int x) : val(x), next(nullptr) {}  // Constructor
    };
    ```

=== "Java"

    ```java title=""
    /* Linked List Node Class */
    class ListNode {
        int val;        // Node value
        ListNode next;  // Reference to the next node
        ListNode(int x) { val = x; }  // Constructor
    }
    ```

=== "C#"

    ```csharp title=""
    /* Linked List Node Class */
    class ListNode(int x) {  // Constructor
        int val = x;         // Node value
        ListNode? next;      // Reference to the next node
    }
    ```

=== "Go"

    ```go title=""
    /* Linked List Node Structure */
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
    /* Linked List Node Class */
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
    /* Linked List Node Class */
    class ListNode {
        constructor(val, next) {
            this.val = (val === undefined ? 0 : val);       // Node value
            this.next = (next === undefined ? null : next); // Reference to the next node
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Linked List Node Class */
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
    /* 链表节点类 */
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
    /* Linked List Node Class */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Node value
        next: Option<Rc<RefCell<ListNode>>>, // Pointer to the next node
    }
    ```

=== "C"

    ```c title=""
    /* Linked List Node Structure */
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

=== "Zig"

    ```zig title=""
    // Linked List Node Class
    pub fn ListNode(comptime T: type) type {
        return struct {
            const Self = @This();

            val: T = 0, // Node value
            next: ?*Self = null, // Pointer to the next node

            // Constructor
            pub fn init(self: *Self, x: i32) void {
                self.val = x;
                self.next = null;
            }
        };
    }
    ```

## Common Operations on Linked Lists

### Initializing a Linked List

Building a linked list involves two steps: initializing each node object and then establishing the references between nodes. Once initialized, we can access all nodes sequentially from the head node via the `next` reference.

=== "Python"

    ```python title="linked_list.py"
    # Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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
    /* Initialize linked list: 1 -> 3 -> 2 -> 5 -> 4 */
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

=== "Zig"

    ```zig title="linked_list.zig"
    // Initialize linked list
    // Initialize each node
    var n0 = inc.ListNode(i32){.val = 1};
    var n1 = inc.ListNode(i32){.val = 3};
    var n2 = inc.ListNode(i32){.val = 2};
    var n3 = inc.ListNode(i32){.val = 5};
    var n4 = inc.ListNode(i32){.val = 4};
    // Build references between nodes
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    ```

An array is a single variable, such as the array `nums` containing elements `nums[0]`, `nums[1]`, etc., while a linked list is composed of multiple independent node objects. **We usually refer to the linked list by its head node**, as in the linked list `n0` in the above code.

### Inserting a Node

Inserting a node in a linked list is very easy. As shown in the image below, suppose we want to insert a new node `P` between two adjacent nodes `n0` and `n1`. **This requires changing only two node references (pointers)**, with a time complexity of $O(1)$.

In contrast, the time complexity of inserting an element in an array is $O(n)$, which is less efficient with large data volumes.

![Linked List Node Insertion Example](linked_list.assets/linkedlist_insert_node.png)

```src
[file]{linked_list}-[class]{}-[func]{insert}
```

### Deleting a Node

As shown below, deleting a node in a linked list is also very convenient, **requiring only the change of one node's reference (pointer)**.

Note that although node `P` still points to `n1` after the deletion operation is completed, it is no longer accessible when traversing the list, meaning `P` is no longer part of the list.

![Linked List Node Deletion](linked_list.assets/linkedlist_remove_node.png)

```src
[file]{linked_list}-[class]{}-[func]{remove}
```

### Accessing Nodes

**Accessing nodes in a linked list is less efficient**. As mentioned earlier, any element in an array can be accessed in $O(1)$ time. However, in a linked list, the program needs to start from the head node and traverse each node sequentially until it finds the target node. That is, accessing the $i$-th node of a linked list requires $i - 1$ iterations, with a time complexity of $O(n)$.

```src
[file]{linked_list}-[class]{}-[func]{access}
```

### Finding Nodes

Traverse the linked list to find a node with a value equal to `target`, and output the index of that node in the linked list. This process also falls under linear search. The code is as follows:

```src
[file]{linked_list}-[class]{}-[func]{find}
```

## Arrays vs. Linked Lists

The following table summarizes the characteristics of arrays and linked lists and compares their operational efficiencies. Since they employ two opposite storage strategies, their properties and operational efficiencies also show contrasting features.

<p align="center"> Table <id> &nbsp; Efficiency Comparison of Arrays and Linked Lists </p>

|                    | Arrays                                           | Linked Lists            |
| ------------------ | ------------------------------------------------ | ----------------------- |
| Storage            | Contiguous Memory Space                          | Dispersed Memory Space  |
| Capacity Expansion | Fixed Length                                     | Flexible Expansion      |
| Memory Efficiency  | Less Memory per Element, Potential Space Wastage | More Memory per Element |
| Accessing Elements | $O(1)$                                           | $O(n)$                  |
| Adding Elements    | $O(n)$                                           | $O(1)$                  |
| Deleting Elements  | $O(n)$                                           | $O(1)$                  |

## Common Types of Linked Lists

As shown in the following image, there are three common types of linked lists.

- **Singly Linked List**: This is the regular linked list introduced earlier. The nodes of a singly linked list contain the value and a reference to the next node. The first node is called the head node, and the last node, pointing to null (`None`), is the tail node.
- **Circular Linked List**: If the tail node of a singly linked list points back to the head node (forming a loop), it becomes a circular linked list. In a circular linked list, any node can be considered the head node.
- **Doubly Linked List**: Compared to a singly linked list, a doubly linked list stores references in two directions. Its nodes contain references to both the next (successor) and the previous (predecessor) nodes. Doubly linked lists are more flexible as they allow traversal in both directions but require more memory space.

=== "Python"

    ```python title=""
    class ListNode:
        """Bidirectional linked list node class""""
        def __init__(self, val: int):
            self.val: int = val                # Node value
            self.next: ListNode | None = None  # Reference to the successor node
            self.prev: ListNode | None = None  # Reference to a predecessor node
    ```

=== "C++"

    ```cpp title=""
    /* Bidirectional linked list node structure */
    struct ListNode {
        int val;         // Node value
        ListNode *next;  // Pointer to the successor node
        ListNode *prev;  // Pointer to the predecessor node
        ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // Constructor
    };
    ```

=== "Java"

    ```java title=""
    /* Bidirectional linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode next;  // Reference to the next node
        ListNode prev;  // Reference to the predecessor node
        ListNode(int x) { val = x; }  // Constructor
    }
    ```

=== "C#"

    ```csharp title=""
    /* Bidirectional linked list node class */
    class ListNode(int x) {  // Constructor
        int val = x;    // Node value
        ListNode next;  // Reference to the next node
        ListNode prev;  // Reference to the predecessor node
    }
    ```

=== "Go"

    ```go title=""
    /* Bidirectional linked list node structure */
    type DoublyListNode struct {
        Val  int             // Node value
        Next *DoublyListNode // Pointer to the successor node
        Prev *DoublyListNode // Pointer to the predecessor node
    }

    // NewDoublyListNode initialization
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
    /* Bidirectional linked list node class */
    class ListNode {
        var val: Int // Node value
        var next: ListNode? // Reference to the next node
        var prev: ListNode? // Reference to the predecessor node

        init(x: Int) { // Constructor
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Bidirectional linked list node class */
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
    /* Bidirectional linked list node class */
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
    /* Bidirectional linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode next;  // Reference to the next node
        ListNode prev;  // Reference to the predecessor node
        ListNode(this.val, [this.next, this.prev]);  // Constructor
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* Bidirectional linked list node type */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Node value
        next: Option<Rc<RefCell<ListNode>>>, // Pointer to successor node
        prev: Option<Rc<RefCell<ListNode>>>, // Pointer to predecessor node
    }

    /* Constructors */
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
    /* Bidirectional linked list node structure */
    typedef struct ListNode {
        int val;               // Node value
        struct ListNode *next; // Pointer to the successor node
        struct ListNode *prev; // Pointer to the predecessor node
    } ListNode;

    /* Constructors */
    ListNode *newListNode(int val) {
        ListNode *node, *next;
        node = (ListNode *) malloc(sizeof(ListNode));
        node->val = val;
        node->next = NULL;
        node->prev = NULL;
        return node;
    }
    ```

=== "Zig"

    ```zig title=""
    // Bidirectional linked list node class
    pub fn ListNode(comptime T: type) type {
        return struct {
            const Self = @This();

            val: T = 0, // Node value
            next: ?*Self = null, // Pointer to the successor node
            prev: ?*Self = null, // Pointer to the predecessor node

            // Constructor
            pub fn init(self: *Self, x: i32) void {
                self.val = x;
                self.next = null;
                self.prev = null;
            }
        };
    }
    ```

![Common Types of Linked Lists](linked_list.assets/linkedlist_common_types.png)

## Typical Applications of Linked Lists

Singly linked lists are commonly used to implement stacks, queues, hash tables, and graphs.

- **Stacks and Queues**: When insertion and deletion operations are performed at one end of the linked list, it exhibits last-in-first-out characteristics, corresponding to a stack. When insertion is at one end and deletion is at the other, it shows first-in-first-out characteristics, corresponding to a queue.
- **Hash Tables**: Chaining is one of the mainstream solutions to hash collisions, where all colliding elements are placed in a linked list.
- **Graphs**: Adjacency lists are a common way to represent graphs, where each vertex is associated with a linked list. Each element in the list represents other vertices connected to that vertex.

Doubly linked lists are commonly used in scenarios that require quick access to the previous and next elements.

- **Advanced Data Structures**: For example, in red-black trees and B-trees, we need to access a node's parent, which can be achieved by storing a reference to the parent node in each node, similar to a doubly linked list.
- **Browser History**: In web browsers, when a user clicks the forward or backward button, the browser needs to know the previously and next visited web pages. The properties of a doubly linked list make this operation simple.
- **LRU Algorithm**: In Least Recently Used (LRU) cache eviction algorithms, we need to quickly find the least recently used data and support rapid addition and deletion of nodes. Here, using a doubly linked list is very appropriate.

Circular linked lists are commonly used in scenarios requiring periodic operations, such as resource scheduling in operating systems.

- **Round-Robin Scheduling Algorithm**: In operating systems, the round-robin scheduling algorithm is a common CPU scheduling algorithm that cycles through a group of processes. Each process is assigned a time slice, and when it expires, the CPU switches to the next process. This circular operation can be implemented using a circular linked list.
- **Data Buffers**: Circular linked lists may also be used in some data buffer implementations. For instance, in audio and video players, the data stream might be divided into multiple buffer blocks placed in a circular linked list to achieve seamless playback.
