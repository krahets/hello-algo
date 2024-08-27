import scala.collection.mutable.ListBuffer

/**
 * File: TreeNode.scala
 * Author: WangBlue
 * Create: 2024-08-09 15:35
 */
class TreeNode {
  var value: Int = 0 // 节点值
  var height: Int = 0 // 节点高度
  var left: TreeNode = _ // 左子节点引用
  var right: TreeNode = _ // 右子节点引用

  /* 构造方法 */
  def this(value: Int) = {
    this()
    this.value = value
  }
  // 二叉树的数组表示：
  // [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15]
  // 二叉树的链表表示：
  //             /——— 15
  //         /——— 7
  //     /——— 3
  //    |    \——— 6
  //    |        \——— 12
  // ——— 1
  //     \——— 2
  //        |    /——— 9
  //         \——— 4
  //             \——— 8

  /* 将列表反序列化为二叉树：递归 */
  private def listToTreeDFS(arr: List[Option[Int]], i: Int): TreeNode = {
    if (i < 0 || i >= arr.size || arr(i).isEmpty) {
      return null
    }

    val root: TreeNode = new TreeNode(arr(i).get)
    root.left = listToTreeDFS(arr, 2 * i + 1)
    root.right = listToTreeDFS(arr, 2 * i + 2)
    root
  }

  /* 将列表反序列化为二叉树 */
  def listToTree(arr: List[Option[Int]]): TreeNode = {
    listToTreeDFS(arr, 0)
  }

  /* 将二叉树序列化为列表：递归 */
  private def treeToListDFS(root: TreeNode, i: Int, res: ListBuffer[Option[Int]]): Unit = {
    if (root == null) {
      return
    }
    while (i >= res.size) {
      res += None
    }
    res(i) = Some(root.value)
    treeToListDFS(root.left, i + 1, res)
    treeToListDFS(root.right, i + 1, res)
  }


  /* 将二叉树序列化为列表 */
  def treeToList(root: TreeNode): List[Option[Int]] = {
    val res = ListBuffer[Option[Int]]()
    treeToListDFS(root, 0, res)
    res.toList
  }

}
