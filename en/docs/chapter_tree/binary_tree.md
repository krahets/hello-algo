---
comments: true
---

# 7.1 &nbsp; Binary tree

A <u>binary tree</u> is a nonlinear data structure that represents relationships between ancestors and descendants. Its two branches reflect the divide-and-conquer idea of splitting a problem in two. As with a linked list, the basic unit is a node. Each node contains a value and references to its left and right children.

=== "Python"

    ```python title=""
    class TreeNode:
        """Binary tree node class"""
        def __init__(self, val: int):
            self.val: int = val                # Node value
            self.left: TreeNode | None = None  # Left child reference
            self.right: TreeNode | None = None # Right child reference
    ```

=== "C++"

    ```cpp title=""
    /* Binary tree node structure */
    struct TreeNode {
        int val;          // Node value
        TreeNode *left;   // Left child pointer
        TreeNode *right;  // Right child pointer
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    };
    ```

=== "Java"

    ```java title=""
    /* Binary tree node class */
    class TreeNode {
        int val;         // Node value
        TreeNode left;   // Left child reference
        TreeNode right;  // Right child reference
        TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* Binary tree node class */
    class TreeNode(int? x) {
        public int? val = x;    // Node value
        public TreeNode? left;  // Left child reference
        public TreeNode? right; // Right child reference
    }
    ```

=== "Go"

    ```go title=""
    /* Binary tree node structure */
    type TreeNode struct {
        Val   int
        Left  *TreeNode
        Right *TreeNode
    }
    /* Constructor */
    func NewTreeNode(v int) *TreeNode {
        return &TreeNode{
            Left:  nil, // Left child pointer
            Right: nil, // Right child pointer
            Val:   v,   // Node value
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Binary tree node class */
    class TreeNode {
        var val: Int // Node value
        var left: TreeNode? // Left child reference
        var right: TreeNode? // Right child reference

        init(x: Int) {
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Binary tree node class */
    class TreeNode {
        val; // Node value
        left; // Left child pointer
        right; // Right child pointer
        constructor(val, left, right) {
            this.val = val === undefined ? 0 : val;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Binary tree node class */
    class TreeNode {
        val: number;
        left: TreeNode | null;
        right: TreeNode | null;

        constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
            this.val = val === undefined ? 0 : val; // Node value
            this.left = left === undefined ? null : left; // Left child reference
            this.right = right === undefined ? null : right; // Right child reference
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Binary tree node class */
    class TreeNode {
      int val;         // Node value
      TreeNode? left;  // Left child reference
      TreeNode? right; // Right child reference
      TreeNode(this.val, [this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* Binary tree node structure */
    struct TreeNode {
        val: i32,                               // Node value
        left: Option<Rc<RefCell<TreeNode>>>,    // Left child reference
        right: Option<Rc<RefCell<TreeNode>>>,   // Right child reference
    }

    impl TreeNode {
        /* Constructor */
        fn new(val: i32) -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(Self {
                val,
                left: None,
                right: None
            }))
        }
    }
    ```

=== "C"

    ```c title=""
    /* Binary tree node structure */
    typedef struct TreeNode {
        int val;                // Node value
        struct TreeNode *left;  // Left child pointer
        struct TreeNode *right; // Right child pointer
    } TreeNode;

    /* Constructor */
    TreeNode *newTreeNode(int val) {
        TreeNode *node;

        node = (TreeNode *)malloc(sizeof(TreeNode));
        node->val = val;
        node->left = NULL;
        node->right = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Binary tree node class */
    class TreeNode(val _val: Int) {  // Node value
        var left: TreeNode? = null   // Left child reference
        var right: TreeNode? = null  // Right child reference
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Binary tree node class ###
    class TreeNode
      attr_accessor :val    # Node value
      attr_accessor :left   # Left child reference
      attr_accessor :right  # Right child reference

      def initialize(val)
        @val = val
      end
    end
    ```

Each node has two references (pointers), one to its <u>left child</u> and one to its <u>right child</u>. The node is the <u>parent</u> of these children. For a given node, the tree consisting of its left child and all that child's descendants is its <u>left subtree</u>. Its <u>right subtree</u> is defined in the same way.

**Every node in a binary tree except a leaf has at least one child and a nonempty subtree**. For example, take node 2 as the parent in Figure 7-1. Its left and right children are nodes 4 and 5. Its left subtree consists of node 4 and all its descendants, and its right subtree consists of node 5 and all its descendants.

![Parent, children, and subtrees](binary_tree.assets/binary_tree_definition.svg){ class="animation-figure" }

<p align="center"> Figure 7-1 &nbsp; Parent, children, and subtrees </p>

## 7.1.1 &nbsp; Binary tree terminology

Figure 7-2 illustrates common binary tree terms.

- The <u>root</u> is the node at the top of a binary tree. It has no parent.
- A <u>leaf</u> has no children. Both its pointers refer to `None`.
- An <u>edge</u> is a line connecting two nodes. It represents a node reference (pointer).
- A node's <u>level</u> increases from top to bottom. The root is at level 1.
- A node's <u>degree</u> is its number of children. In a binary tree, the possible degrees are 0, 1, and 2.
- The <u>height</u> of a binary tree is the number of edges from the root to the farthest leaf.
- A node's <u>depth</u> is the number of edges from the root to that node.
- A node's <u>height</u> is the number of edges between it and its farthest descendant leaf.

![Common binary tree terms](binary_tree.assets/binary_tree_terminology.svg){ class="animation-figure" }

<p align="center"> Figure 7-2 &nbsp; Common binary tree terms </p>

!!! tip

    We usually define height and depth by counting edges. Some problems and textbooks count nodes instead. Under that convention, add 1 to both height and depth.

## 7.1.2 &nbsp; Basic binary tree operations

### 1. &nbsp; Initialize the binary tree

As with a linked list, first initialize the nodes, then connect them with references (pointers).

=== "Python"

    ```python title="binary_tree.py"
    # Initialize the binary tree
    # Initialize the nodes
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # Link the nodes with references (pointers)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "C++"

    ```cpp title="binary_tree.cpp"
    /* Initialize the binary tree */
    // Initialize the nodes
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // Link the nodes with references (pointers)
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    ```

=== "Java"

    ```java title="binary_tree.java"
    /* Initialize the binary tree */
    // Initialize the nodes
    TreeNode n1 = new TreeNode(1);
    TreeNode n2 = new TreeNode(2);
    TreeNode n3 = new TreeNode(3);
    TreeNode n4 = new TreeNode(4);
    TreeNode n5 = new TreeNode(5);
    // Link the nodes with references (pointers)
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* Initialize the binary tree */
    // Initialize the nodes
    TreeNode n1 = new(1);
    TreeNode n2 = new(2);
    TreeNode n3 = new(3);
    TreeNode n4 = new(4);
    TreeNode n5 = new(5);
    // Link the nodes with references (pointers)
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* Initialize the binary tree */
    // Initialize the nodes
    n1 := NewTreeNode(1)
    n2 := NewTreeNode(2)
    n3 := NewTreeNode(3)
    n4 := NewTreeNode(4)
    n5 := NewTreeNode(5)
    // Link the nodes with references (pointers)
    n1.Left = n2
    n1.Right = n3
    n2.Left = n4
    n2.Right = n5
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    /* Initialize the binary tree */
    // Initialize the nodes
    let n1 = TreeNode(x: 1)
    let n2 = TreeNode(x: 2)
    let n3 = TreeNode(x: 3)
    let n4 = TreeNode(x: 4)
    let n5 = TreeNode(x: 5)
    // Link the nodes with references (pointers)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* Initialize the binary tree */
    // Initialize the nodes
    let n1 = new TreeNode(1),
        n2 = new TreeNode(2),
        n3 = new TreeNode(3),
        n4 = new TreeNode(4),
        n5 = new TreeNode(5);
    // Link the nodes with references (pointers)
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* Initialize the binary tree */
    // Initialize the nodes
    let n1 = new TreeNode(1),
        n2 = new TreeNode(2),
        n3 = new TreeNode(3),
        n4 = new TreeNode(4),
        n5 = new TreeNode(5);
    // Link the nodes with references (pointers)
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* Initialize the binary tree */
    // Initialize the nodes
    TreeNode n1 = TreeNode(1);
    TreeNode n2 = TreeNode(2);
    TreeNode n3 = TreeNode(3);
    TreeNode n4 = TreeNode(4);
    TreeNode n5 = TreeNode(5);
    // Link the nodes with references (pointers)
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    /* Initialize the binary tree */
    // Initialize the nodes
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // Link the nodes with references (pointers)
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    ```

=== "C"

    ```c title="binary_tree.c"
    /* Initialize the binary tree */
    // Initialize the nodes
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // Link the nodes with references (pointers)
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    ```

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    /* Initialize the binary tree */
    // Initialize the nodes
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // Link the nodes with references (pointers)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # Initialize the binary tree
    # Initialize the nodes
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    n4 = TreeNode.new(4)
    n5 = TreeNode.new(5)
    # Link the nodes with references (pointers)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20left%20child%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Reference%20to%20the%20right%20child%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20tree%0A%20%20%20%20%23%20Initialize%20the%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Link%20the%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20left%20child%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Reference%20to%20the%20right%20child%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20tree%0A%20%20%20%20%23%20Initialize%20the%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Link%20the%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Insert and delete nodes

As with a linked list, we can insert and delete nodes in a binary tree by changing pointers. Figure 7-3 gives an example.

![Inserting and deleting a node in a binary tree](binary_tree.assets/binary_tree_add_remove.svg){ class="animation-figure" }

<p align="center"> Figure 7-3 &nbsp; Inserting and deleting a node in a binary tree </p>

=== "Python"

    ```python title="binary_tree.py"
    # Insert and delete nodes
    P = TreeNode(0)
    # Insert node P between n1 and n2
    n1.left = P
    P.left = n2
    # Delete node P
    n1.left = n2
    ```

=== "C++"

    ```cpp title="binary_tree.cpp"
    /* Insert and delete nodes */
    TreeNode *P = new TreeNode(0);
    // Insert node P between n1 and n2
    n1->left = P;
    P->left = n2;
    // Delete node P
    n1->left = n2;
    delete P; // Free memory
    ```

=== "Java"

    ```java title="binary_tree.java"
    /* Insert and delete nodes */
    TreeNode P = new TreeNode(0);
    // Insert node P between n1 and n2
    n1.left = P;
    P.left = n2;
    // Delete node P
    n1.left = n2;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* Insert and delete nodes */
    TreeNode P = new(0);
    // Insert node P between n1 and n2
    n1.left = P;
    P.left = n2;
    // Delete node P
    n1.left = n2;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* Insert and delete nodes */
    // Insert node P between n1 and n2
    p := NewTreeNode(0)
    n1.Left = p
    p.Left = n2
    // Delete node P
    n1.Left = n2
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    /* Insert and delete nodes */
    let P = TreeNode(x: 0)
    // Insert node P between n1 and n2
    n1.left = P
    P.left = n2
    // Delete node P
    n1.left = n2
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* Insert and delete nodes */
    const P = new TreeNode(0);
    // Insert node P between n1 and n2
    n1.left = P;
    P.left = n2;
    // Delete node P
    n1.left = n2;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* Insert and delete nodes */
    const P = new TreeNode(0);
    // Insert node P between n1 and n2
    n1.left = P;
    P.left = n2;
    // Delete node P
    n1.left = n2;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* Insert and delete nodes */
    TreeNode p = TreeNode(0);
    // Insert node P between n1 and n2
    n1.left = p;
    p.left = n2;
    // Delete node P
    n1.left = n2;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    /* Insert and delete nodes */
    let p = TreeNode::new(0);
    // Insert node P between n1 and n2
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    // Delete node P
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    ```

=== "C"

    ```c title="binary_tree.c"
    /* Insert and delete nodes */
    TreeNode *P = newTreeNode(0);
    // Insert node P between n1 and n2
    n1->left = P;
    P->left = n2;
    // Delete node P
    n1->left = n2;
    // Free memory
    free(P);
    ```

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    /* Insert and delete nodes */
    val P = TreeNode(0)
    // Insert node P between n1 and n2
    n1.left = P
    P.left = n2
    // Delete node P
    n1.left = n2
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # Insert and delete nodes
    _p = TreeNode.new(0)
    # Insert node _p between n1 and n2
    n1.left = _p
    _p.left = n2
    # Delete a node
    n1.left = n2
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20left%20child%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Reference%20to%20the%20right%20child%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20tree%0A%20%20%20%20%23%20Initialize%20the%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Link%20the%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20Insert%20and%20remove%20a%20node%0A%20%20%20%20P%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20Insert%20node%20P%20into%20the%20link%20n1%20-%3E%20n2%0A%20%20%20%20n1.left%20%3D%20P%0A%20%20%20%20P.left%20%3D%20n2%0A%20%20%20%20%23%20Remove%20node%20P%0A%20%20%20%20n1.left%20%3D%20n2&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=37&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20left%20child%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20Reference%20to%20the%20right%20child%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20tree%0A%20%20%20%20%23%20Initialize%20the%20nodes%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20Link%20the%20nodes%20with%20references%20%28pointers%29%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5%0A%0A%20%20%20%20%23%20Insert%20and%20remove%20a%20node%0A%20%20%20%20P%20%3D%20TreeNode%280%29%0A%20%20%20%20%23%20Insert%20node%20P%20into%20the%20link%20n1%20-%3E%20n2%0A%20%20%20%20n1.left%20%3D%20P%0A%20%20%20%20P.left%20%3D%20n2%0A%20%20%20%20%23%20Remove%20node%20P%0A%20%20%20%20n1.left%20%3D%20n2&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=37&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

!!! tip

    Inserting a node can change the logical structure of a binary tree, and deleting a node usually means removing it along with all its subtrees. In practice, insertion and deletion in a binary tree therefore involve coordinating several operations to achieve the intended result.

## 7.1.3 &nbsp; Common types of binary trees

### 1. &nbsp; Perfect binary tree

In a <u>perfect binary tree</u>, every level is completely filled, as shown below. Leaves have degree $0$, and every other node has degree $2$. A tree of height $h$ has $2^{h+1} - 1$ nodes. This exponential relationship mirrors the familiar pattern of cell division in nature.

!!! tip

    In Chinese usage, a perfect binary tree is often called a <u>mǎn èrchāshù</u>.

![Perfect binary tree](binary_tree.assets/perfect_binary_tree.svg){ class="animation-figure" }

<p align="center"> Figure 7-4 &nbsp; Perfect binary tree </p>

### 2. &nbsp; Complete binary tree

In a <u>complete binary tree</u>, only the bottom level may be partially filled, and its nodes must occupy consecutive positions from left to right, as shown below. Every perfect binary tree is also complete.

![Complete binary tree](binary_tree.assets/complete_binary_tree.svg){ class="animation-figure" }

<p align="center"> Figure 7-5 &nbsp; Complete binary tree </p>

### 3. &nbsp; Full binary tree

In a <u>full binary tree</u>, every node except a leaf has two children, as shown below.

![Full binary tree](binary_tree.assets/full_binary_tree.svg){ class="animation-figure" }

<p align="center"> Figure 7-6 &nbsp; Full binary tree </p>

### 4. &nbsp; Balanced binary tree

In a <u>balanced binary tree</u>, the absolute difference between the heights of the left and right subtrees at every node is at most 1, as shown below.

![Balanced binary tree](binary_tree.assets/balanced_binary_tree.svg){ class="animation-figure" }

<p align="center"> Figure 7-7 &nbsp; Balanced binary tree </p>

## 7.1.4 &nbsp; How a binary tree degenerates

Figure 7-8 shows the ideal and degenerate forms of a binary tree. When every level is full, the tree is perfect. When all nodes lean to one side, the tree degenerates into a linked list.

- A perfect binary tree is the ideal case. It takes full advantage of a binary tree's divide-and-conquer structure.
- A linked list is the other extreme. Operations become linear, with time complexity $O(n)$.

![Best- and worst-case binary tree shapes](binary_tree.assets/binary_tree_best_worst_cases.svg){ class="animation-figure" }

<p align="center"> Figure 7-8 &nbsp; Best- and worst-case binary tree shapes </p>

As Table 7-1 shows, quantities such as the number of leaves, total node count, and height reach their maximum or minimum values in the best- and worst-case shapes.

<p align="center"> Table 7-1 &nbsp; Best- and worst-case binary tree shapes </p>

<div class="center-table" markdown>

|                             | Perfect binary tree         | Linked list    |
| --------------------------- | ------------------ | ------- |
| Number of nodes at level $i$         | $2^{i-1}$          | $1$     |
| Number of leaves in a tree of height $h$ | $2^h$              | $1$     |
| Total number of nodes in a tree of height $h$   | $2^{h+1} - 1$      | $h + 1$ |
| Height of a tree with $n$ nodes   | $\log_2 (n+1) - 1$ | $n - 1$ |

</div>
