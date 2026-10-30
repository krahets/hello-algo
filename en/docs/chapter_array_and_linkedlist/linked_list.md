# Linked lists

Memory is a resource used by all programs, and in a complex system, free space may be scattered throughout it. An array requires contiguous storage, which may be unavailable for a very large array. This is where a linked list's flexibility helps.

A <u>linked list</u> is a linear data structure whose elements are node objects connected by references. Each reference stores the next node's memory address, allowing us to reach it from the current node.

This design lets nodes occupy scattered memory locations; their addresses need not be contiguous.

![Linked list definition and storage layout](linked_list.assets/linkedlist_definition.png)

As shown above, the basic unit of a linked list is a <u>node</u> object. Each node holds a value and a reference to the next node.

- The first node is called the head, and the last is called the tail.
- The tail points to a null value: `null` in Java, `nullptr` in C++, and `None` in Python.
- In languages supporting pointers, such as C, C++, Go, and Rust, these references are expressed as pointers.

As the code below shows, each `ListNode` stores a reference (pointer) in addition to its value. Thus, **a linked list uses more memory than an array for the same amount of data**.

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

    // NewListNode constructor: create a new linked list
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
        var next: ListNode? = null // Reference to the next node
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

## Common linked list operations

### Initializing a linked list

Building a linked list takes two steps: initialize the node objects, then connect them with references. Afterward, start at the head and follow `next` references to visit every node in order.

=== "Python"

    ```python title="linked_list.py"
    # Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4
    # Initialize the nodes
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Link the nodes with references
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "C++"

    ```cpp title="linked_list.cpp"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    ListNode* n0 = new ListNode(1);
    ListNode* n1 = new ListNode(3);
    ListNode* n2 = new ListNode(2);
    ListNode* n3 = new ListNode(5);
    ListNode* n4 = new ListNode(4);
    // Link the nodes with references
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Java"

    ```java title="linked_list.java"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    ListNode n0 = new ListNode(1);
    ListNode n1 = new ListNode(3);
    ListNode n2 = new ListNode(2);
    ListNode n3 = new ListNode(5);
    ListNode n4 = new ListNode(4);
    // Link the nodes with references
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "C#"

    ```csharp title="linked_list.cs"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    ListNode n0 = new(1);
    ListNode n1 = new(3);
    ListNode n2 = new(2);
    ListNode n3 = new(5);
    ListNode n4 = new(4);
    // Link the nodes with references
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Go"

    ```go title="linked_list.go"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    n0 := NewListNode(1)
    n1 := NewListNode(3)
    n2 := NewListNode(2)
    n3 := NewListNode(5)
    n4 := NewListNode(4)
    // Link the nodes with references
    n0.Next = n1
    n1.Next = n2
    n2.Next = n3
    n3.Next = n4
    ```

=== "Swift"

    ```swift title="linked_list.swift"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    let n0 = ListNode(x: 1)
    let n1 = ListNode(x: 3)
    let n2 = ListNode(x: 2)
    let n3 = ListNode(x: 5)
    let n4 = ListNode(x: 4)
    // Link the nodes with references
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "JS"

    ```javascript title="linked_list.js"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Link the nodes with references
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "TS"

    ```typescript title="linked_list.ts"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Link the nodes with references
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Dart"

    ```dart title="linked_list.dart"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */\
    // Initialize the nodes
    ListNode n0 = ListNode(1);
    ListNode n1 = ListNode(3);
    ListNode n2 = ListNode(2);
    ListNode n3 = ListNode(5);
    ListNode n4 = ListNode(4);
    // Link the nodes with references
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Rust"

    ```rust title="linked_list.rs"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    let n0 = Rc::new(RefCell::new(ListNode { val: 1, next: None }));
    let n1 = Rc::new(RefCell::new(ListNode { val: 3, next: None }));
    let n2 = Rc::new(RefCell::new(ListNode { val: 2, next: None }));
    let n3 = Rc::new(RefCell::new(ListNode { val: 5, next: None }));
    let n4 = Rc::new(RefCell::new(ListNode { val: 4, next: None }));

    // Link the nodes with references
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    ```

=== "C"

    ```c title="linked_list.c"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    ListNode* n0 = newListNode(1);
    ListNode* n1 = newListNode(3);
    ListNode* n2 = newListNode(2);
    ListNode* n3 = newListNode(5);
    ListNode* n4 = newListNode(4);
    // Link the nodes with references
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Kotlin"

    ```kotlin title="linked_list.kt"
    /* Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4 */
    // Initialize the nodes
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)
    // Link the nodes with references
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Ruby"

    ```ruby title="linked_list.rb"
    # Initialize the linked list 1 -> 3 -> 2 -> 5 -> 4
    # Initialize the nodes
    n0 = ListNode.new(1)
    n1 = ListNode.new(3)
    n2 = ListNode.new(2)
    n3 = ListNode.new(5)
    n4 = ListNode.new(4)
    # Link the nodes with references
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

??? pythontutor "Visualize execution"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20successor%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20linked%20list%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20Initialize%20the%20nodes%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20Link%20the%20nodes%20with%20references%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

An array is a single variable, such as `nums`, containing entries `nums[0]`, `nums[1]`, and so on. A linked list consists of separate node objects. **We usually refer to the list by its head node**; for example, the list above can be called `n0`.

### Inserting a node

Inserting a node is straightforward. As shown in the figure below, inserting a new node `P` between adjacent nodes `n0` and `n1` **requires changing only two references (pointers)**, taking $O(1)$ time.

In contrast, inserting an array element takes $O(n)$ time and is slower for large datasets.

![Inserting a node into a linked list](linked_list.assets/linkedlist_insert_node.png)

```src
[file]{linked_list}-[class]{}-[func]{insert}
```

### Removing a node

Removing a node is also straightforward: as shown in the figure below, **only one reference (pointer) needs to change**.

Although `P` still points to `n1` after removal, traversing the list can no longer reach `P`. It therefore no longer belongs to the list.

![Removing a linked list node](linked_list.assets/linkedlist_remove_node.png)

```src
[file]{linked_list}-[class]{}-[func]{remove}
```

### Accessing a node

**Accessing a node in a linked list is relatively slow**. An array provides access to any element in $O(1)$ time, but a linked list must be traversed from its head until the desired node is reached. Accessing the $i$-th node requires $i - 1$ iterations, giving $O(n)$ time complexity.

```src
[file]{linked_list}-[class]{}-[func]{access}
```

### Finding a node

Traverse the list to find a node with value `target`, then return its index. This is also linear search. The code is as follows:

```src
[file]{linked_list}-[class]{}-[func]{find}
```

## Arrays versus linked lists

The table below compares their properties and operation costs. Their contrasting storage strategies give them contrasting strengths.

<p align="center"> Table <id> &nbsp; Comparing array and linked list efficiency </p>

|          | Array                           | Linked list           |
| -------- | ------------------------------ | -------------- |
| Storage | Contiguous memory                   | Scattered memory   |
| Expansion | Fixed length                     | Flexible expansion     |
| Memory efficiency | Less memory per element, but may waste space | More memory per element |
| Access an element | $O(1)$                         | $O(n)$         |
| Add an element | $O(n)$                         | $O(1)$         |
| Remove an element | $O(n)$                         | $O(1)$         |

## Common types of linked lists

The figure below shows three common types.

- **Singly linked list**: The ordinary linked list introduced above. Each node stores a value and a reference to the next node. The first and last nodes are the head and tail, and the tail points to `None`.
- **Circular linked list**: Connecting a singly linked list's tail to its head forms a circular list. Any node can then be treated as the head.
- **Doubly linked list**: Each node stores references (pointers) in both directions, to its successor and predecessor. This makes it more flexible and allows traversal in either direction, at the cost of additional memory.

=== "Python"

    ```python title=""
    class ListNode:
        """Doubly linked list node class"""
        def __init__(self, val: int):
            self.val: int = val                # Node value
            self.next: ListNode | None = None  # Reference to the successor
            self.prev: ListNode | None = None  # Reference to the predecessor
    ```

=== "C++"

    ```cpp title=""
    /* Doubly linked list node structure */
    struct ListNode {
        int val;         // Node value
        ListNode *next;  // Pointer to the successor
        ListNode *prev;  // Pointer to the predecessor
        ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // Constructor
    };
    ```

=== "Java"

    ```java title=""
    /* Doubly linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode next;  // Reference to the successor
        ListNode prev;  // Reference to the predecessor
        ListNode(int x) { val = x; }  // Constructor
    }
    ```

=== "C#"

    ```csharp title=""
    /* Doubly linked list node class */
    class ListNode(int x) {  // Constructor
        int val = x;    // Node value
        ListNode next;  // Reference to the successor
        ListNode prev;  // Reference to the predecessor
    }
    ```

=== "Go"

    ```go title=""
    /* Doubly linked list node structure */
    type DoublyListNode struct {
        Val  int             // Node value
        Next *DoublyListNode // Pointer to the successor
        Prev *DoublyListNode // Pointer to the predecessor
    }

    // Initialize a node with NewDoublyListNode
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
        var next: ListNode? // Reference to the successor
        var prev: ListNode? // Reference to the predecessor

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
            this.next = next  ===  undefined ? null : next;  // Reference to the successor
            this.prev = prev  ===  undefined ? null : prev;  // Reference to the predecessor
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
            this.next = next  ===  undefined ? null : next;  // Reference to the successor
            this.prev = prev  ===  undefined ? null : prev;  // Reference to the predecessor
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Doubly linked list node class */
    class ListNode {
        int val;        // Node value
        ListNode? next;  // Reference to the successor
        ListNode? prev;  // Reference to the predecessor
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
        next: Option<Rc<RefCell<ListNode>>>, // Pointer to the successor
        prev: Option<Rc<RefCell<ListNode>>>, // Pointer to the predecessor
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
        struct ListNode *next; // Pointer to the successor
        struct ListNode *prev; // Pointer to the predecessor
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
        var next: ListNode? = null  // Reference to the successor
        var prev: ListNode? = null  // Reference to the predecessor
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Doubly linked list node class
    class ListNode
      attr_accessor :val    # Node value
      attr_accessor :next   # Reference to the successor
      attr_accessor :prev   # Reference to the predecessor

      def initialize(val=0, next_node=nil, prev_node=nil)
        @val = val
        @next = next_node
        @prev = prev_node
      end
    end
    ```

![Common types of linked lists](linked_list.assets/linkedlist_common_types.png)

## Typical applications of linked lists

Singly linked lists commonly implement stacks, queues, hash tables, and graphs.

- **Stacks and queues**: Inserting and removing at the same end gives last-in, first-out behavior, forming a stack. Inserting at one end and removing at the other gives first-in, first-out behavior, forming a queue.
- **Hash tables**: Separate chaining is a common collision-handling strategy that places colliding elements in a linked list.
- **Graphs**: An adjacency list associates each vertex with a linked list whose elements represent the other vertices connected to it.

Doubly linked lists are useful when both the previous and next elements must be found quickly.

- **Advanced data structures**: In structures such as red-black trees and B-trees, a node may need access to its parent. Storing a parent reference is similar to the backward link in a doubly linked list.
- **Browser history**: The forward and back buttons require access to the next and previous visited pages. A doubly linked list makes this straightforward.
- **LRU caching**: Least recently used eviction needs fast access to the least recently used data and efficient insertion and removal, making doubly linked lists a good fit.

Circular linked lists suit cyclic operations, such as operating-system resource scheduling.

- **Round-robin scheduling**: This common CPU scheduling algorithm cycles through processes, giving each a time slice before moving to the next. A circular linked list can implement this cycle.
- **Data buffers**: Some buffers use circular linked lists. Audio and video players, for example, may divide a stream into buffer blocks arranged in a circular list for seamless playback.
