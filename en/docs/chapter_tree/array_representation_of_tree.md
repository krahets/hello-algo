# Array representation of a binary tree

In a linked representation, a binary tree stores data in `TreeNode` nodes connected by pointers. The previous section introduced basic operations on binary trees in this form.

Can we represent a binary tree with an array instead? Yes.

## Representing a perfect binary tree

Start with a simple case. Store every node of a perfect binary tree in an array in level order. Each node then corresponds to a unique array index.

Level-order traversal gives us a mapping between parent and child indices: **if a node has index $i$, its left child has index $2i + 1$ and its right child has index $2i + 2$**. The figure below illustrates this relationship.

![Array representation of a perfect binary tree](array_representation_of_tree.assets/array_representation_binary_tree.svg)

**The mapping formulas serve the same role as node references or pointers in a linked representation**. Given any node in the array, we can use them to access its left or right child.

## Representing an arbitrary binary tree

A perfect binary tree is a special case. Other binary trees often contain many missing nodes, `None`, at intermediate levels. Ordinary level-order traversal omits these positions, so its sequence alone cannot tell us their number or locations. **Multiple tree structures can therefore produce the same level-order sequence**.

As shown below, the array representation above no longer works for a non-perfect binary tree.

![Multiple binary trees can share a level-order sequence](array_representation_of_tree.assets/array_representation_without_empty.svg)

To solve this, **include every `None` position explicitly in the level-order sequence**. The sequence then represents the tree uniquely, as shown below. Example code follows:

```snippet
tree_array_representation
```

![Array representation of an arbitrary binary tree](array_representation_of_tree.assets/array_representation_with_empty.svg)

**Complete binary trees are particularly well suited to array representation**. By definition, missing positions occur only at the right end of the lowest level, **so all `None` entries appear at the end of the level-order sequence**.

We can therefore omit all `None` entries when storing a complete binary tree in an array. An example is shown below.

![Array representation of a complete binary tree](array_representation_of_tree.assets/array_representation_complete_binary_tree.svg)

The following code implements an array-based binary tree with these operations.

- Given a node, get its value, left or right child, and parent.
- Obtain preorder, inorder, postorder, and level-order traversal sequences.

```src
[file]{array_binary_tree}-[class]{array_binary_tree}-[func]{}
```

## Strengths and limitations

Array representation offers the following advantages.

- Contiguous memory is cache-friendly, making access and traversal fast.
- No pointers need to be stored, saving space.
- Nodes can be accessed randomly by index.

However, it also has limitations.

- Arrays require contiguous memory, making them unsuitable for extremely large trees.
- Adding and removing nodes requires array insertion and deletion operations, which are inefficient.
- If the tree has many missing nodes, actual node data occupies only a small fraction of the array, wasting space.
