# Summary

### Key points

- A binary tree is a nonlinear data structure that embodies the divide-and-conquer idea of splitting in two. Each node holds a value and two pointers, one to its left child and one to its right.
- For any node in a binary tree, its left subtree consists of its left child and all that child's descendants. Its right subtree is defined in the same way.
- Binary tree terminology includes root, leaf, level, degree, edge, height, and depth.
- Initializing a binary tree and inserting or deleting a node are similar to the corresponding linked list operations.
- Common types include perfect, complete, full, and balanced binary trees. A perfect binary tree is the ideal shape. A tree that degenerates into a linked list has the worst shape.
- To represent a binary tree in an array, arrange node values and empty slots in level order. Formulas relating parent and child indices take the place of pointers.
- Level-order traversal of a binary tree is a breadth-first search. It expands outward one level at a time and usually uses a queue.
- Preorder, inorder, and postorder are depth-first searches. They follow a branch to its end before backtracking to continue and are usually implemented recursively.
- A binary search tree supports efficient lookup. Search, insertion, and deletion take $O(\log n)$ time. When the tree degenerates into a linked list, these operations worsen to $O(n)$ time.
- An AVL tree is a balanced binary search tree that uses rotations to maintain balance through repeated insertions and deletions.
- AVL rotations include right, left, right-left, and left-right rotations. After insertion or deletion, an AVL tree works upward from the bottom, applying rotations to restore balance.

### Q & A

**Q**: In a binary tree with just one node, are the tree height and the root's depth both $0$?

Yes. Height and depth usually count the edges on a path.

**Q**: Inserting or deleting a node in a binary tree generally requires several coordinated operations. What are those operations? Does this mean freeing the resources held by child nodes?

Consider deletion in a binary search tree. There are three cases, and each takes several steps involving nodes.

**Q**: Why does depth-first traversal of a binary tree have three orders, and what is each one used for?

Much as an array can be traversed forward or backward, a binary tree can be traversed in preorder, inorder, or postorder to obtain a particular ordering. For example, values in a binary search tree satisfy `left child value < root value < right child value`. Visiting the tree in the order “left $\rightarrow$ root $\rightarrow$ right” therefore yields a sorted sequence.

**Q**: A right rotation handles the relationships among the unbalanced node `node`, `child`, and `grand_child`. What about the original connection between the parent of `node` and `node`? Doesn't the rotation break it?

Think of the recursive calls. The right rotation `right_rotate(root)` receives a subtree root, and `return child` returns the root of the rotated subtree. The new subtree root is connected to its parent after the function returns, outside the right rotation itself.

**Q**: In C++, how do we decide which functions belong in `private` and which in `public`? Why are `height()` and `updateHeight()` placed in `public` and `private`, respectively?

It mainly depends on where a method is used. A method used only within the class should be `private`. For example, there is no reason for a user to call `updateHeight()` on its own. It is just one step in insertion or deletion. In contrast, `height()` accesses a node's height, much like `vector.size()` accesses a size, so it is `public` for convenient access.

**Q**: How can we build a binary search tree from a collection of input values? Does the choice of root matter?

Yes. The `build_tree()` method in the binary search tree code shows how to build the tree. To choose the root, we usually sort the input, take the middle element as the root, and recursively build the left and right subtrees. This keeps the tree as balanced as possible.

**Q**: In Java, do we always need the `equals()` method to compare strings?

For Java primitive types, `==` compares the values of two variables. For reference types, the two forms of comparison work differently.

- `==` checks whether the variables refer to the same object, that is, the same location in memory.
- `equals()` checks whether two objects have equal values.

To compare values, use `equals()`. However, strings initialized by `String a = "hi"; String b = "hi";` are stored in the string pool and refer to the same object, so `a == b` can also be used to compare the contents of these two strings.

**Q**: Just before breadth-first traversal visits the bottom level, does the queue contain $2^h$ nodes?

Yes. For example, a perfect binary tree of height $h = 2$ has $n = 7$ nodes in total and $4 = 2^h = (n + 1) / 2$ nodes on its bottom level.
