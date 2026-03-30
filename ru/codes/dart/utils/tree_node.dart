/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Класс узла двоичного дерева */
class TreeNode {
  int val; // Значение узла
  int height; // Высота узла
  TreeNode? left; // Ссылка на левый дочерний узел
  TreeNode? right; // Ссылка на правый дочерний узел

  /* Конструктор */
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}

/* Десериализовать список в двоичное дерево: рекурсия */
TreeNode? listToTreeDFS(List<int?> arr, int i) {
  if (i < 0 || i >= arr.length || arr[i] == null) {
    return null;
  }
  TreeNode? root = TreeNode(arr[i]!);
  root.left = listToTreeDFS(arr, 2 * i + 1);
  root.right = listToTreeDFS(arr, 2 * i + 2);
  return root;
}

/* Десериализовать список в двоичное дерево */
TreeNode? listToTree(List<int?> arr) {
  return listToTreeDFS(arr, 0);
}

/* Сериализовать двоичное дерево в список: рекурсия */
void treeToListDFS(TreeNode? root, int i, List<int?> res) {
  if (root == null) return;
  while (i >= res.length) {
    res.add(null);
  }
  res[i] = root.val;
  treeToListDFS(root.left, 2 * i + 1, res);
  treeToListDFS(root.right, 2 * i + 2, res);
}

/* Сериализовать двоичное дерево в список */
List<int?> treeToList(TreeNode? root) {
  List<int?> res = [];
  treeToListDFS(root, 0, res);
  return res;
}
