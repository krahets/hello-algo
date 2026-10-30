---
comments: true
---

# 7.6 &nbsp; Summary

### 1. &nbsp; Key takeaways

- A binary tree is a nonlinear data structure that embodies the divide-and-conquer idea of splitting in two. Each node contains a value and two pointers, one to each child.
- A node's left or right child, together with everything below it, forms its left or right subtree.
- Tree terminology includes root, leaf, level, degree, edge, height, and depth.
- Initializing a binary tree and inserting or deleting nodes resemble linked-list operations.
- Common types include perfect, complete, full, and balanced binary trees. A perfect tree is the ideal form; a linked list is the worst degenerate form.
- A binary tree can be represented by an array of node values and empty positions in level order. Index mappings between parents and children replace pointers.
- Level-order traversal is breadth-first search: it expands outward one layer at a time and usually uses a queue.
- Preorder, inorder, and postorder traversal are depth-first search: they follow paths to their ends before backtracking and usually use recursion.
- A binary search tree supports efficient lookup, insertion, and deletion in $O(\log n)$ time. If it degenerates into a linked list, all these operations degrade to $O(n)$.
- An AVL tree is a balanced binary search tree that uses rotations to maintain balance through insertions and deletions.
- AVL rotations include right rotation, left rotation, right-then-left rotation, and left-then-right rotation. After an insertion or deletion, rotations are performed from the bottom up to restore balance.

### 2. &nbsp; Q & A

**Q**: For a binary tree with only one node, are both the tree's height and the root's depth $0$?

Yes. Height and depth are usually defined by the number of edges traversed.

**Q**: The text says binary-tree insertion and deletion usually involve a sequence of coordinated operations. What does that mean? Does it refer to releasing resources held by child nodes?

For example, deleting a node from a binary search tree has three cases, and each case requires several steps involving nodes.

**Q**: Why does depth-first traversal have preorder, inorder, and postorder variants? What is each used for?

Just as an array can be traversed forward or backward, these are three ways to visit a binary tree and obtain a particular ordering. In a binary search tree, values satisfy `left child value < root value < right child value`, so visiting “left $\rightarrow$ root $\rightarrow$ right” produces a sorted node sequence.

**Q**: A right rotation adjusts `node`, `child`, and `grand_child`. What happens to the link between `node` and its parent? Doesn't the rotation break it?

View the operation recursively. `right_rotate(root)` receives a subtree's root and ends with `return child`, returning the new root of that subtree. The connection to its parent is updated after the function returns; it is outside the rotation function's responsibility.

**Q**: In C++, how do you decide which methods are `private` and which are `public`? Why is `height()` public but `updateHeight()` private?

The main consideration is where the method is used. A method used only within the class should be `private`. Calling `updateHeight()` alone is not meaningful to a user; it is just one step of insertion or deletion. In contrast, `height()` retrieves a node's height, much like `vector.size()`, so it is `public` for convenient access.

**Q**: How do you build a binary search tree from input data? Is choosing the root important?

Yes. The construction is provided by the `build_tree()` method in the binary-search-tree code. Usually, we sort the input, choose its middle element as the root, and recursively construct the left and right subtrees. This keeps the tree as balanced as possible.

**Q**: Must strings in Java always be compared with `equals()`?

For primitive types in Java, `==` compares variable values. For reference types, the two forms work differently.

- `==` compares whether two variables refer to the same object, meaning the same location in memory.
- `equals()` compares whether two objects have equal values.

Use `equals()` when comparing values. However, strings initialized with `String a = "hi"; String b = "hi";` are stored in the string pool and refer to the same object, so `a == b` also works for these strings.

**Q**: Just before breadth-first traversal reaches the lowest level, does the queue contain $2^h$ nodes?

Yes. For example, a perfect binary tree of height $h = 2$ has $n = 7$ nodes, with $4 = 2^h = (n + 1) / 2$ nodes on its lowest level.
