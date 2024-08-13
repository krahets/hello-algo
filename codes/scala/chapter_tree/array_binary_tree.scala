import scala.collection.mutable.{ArrayBuffer, ListBuffer}

/**
 * File: array_binary_tree.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-13 14:02
 */

/* 数组表示下的二叉树类 */
class array_binary_tree(arr: List[Option[Int]]) {

  private val tree: List[Option[Int]] = arr

  /* 列表容量 */
  def size(): Int = tree.size


  /* 获取索引为 i 节点的值 */
  def value(i: Int): Option[Int] = {
    // 若索引越界，则返回 null ，代表空位
    if (i < 0 || i >= size) {
      return null
    }
    tree(i)
  }

  /* 获取索引为 i 节点的左子节点的索引 */
  def left(i: Int): Int = {
    2 * i + 1
  }


  /* 获取索引为 i 节点的右子节点的索引 */
  def right(i: Int): Int = {
    2 * i + 2
  }

  /* 获取索引为 i 节点的父节点的索引 */
  def parent(i: Int): Int = {
    (i - 1) / 2
  }

  /* 层序遍历 */
  def levelOrder(): ListBuffer[Int] = {
    var res: ListBuffer[Int] = ListBuffer[Int]()
    for (i <- 0 until size()) {
      if (value(i).isDefined) {
        res = res :+ value(i).get
      }
    }
    res
  }


  /* 深度优先遍历 */
  def dfs(i: Int, order: String, res: ListBuffer[Int]): Unit = {

    // 若为空位，则返回
    if (value(i) == null || value(i).isEmpty) return
    // 前序遍历
    if ("pre".equals(order)) {
      res += value(i).get
    }
    dfs(left(i), order, res)
    // 中序遍历
    if ("in".equals(order)) {
      res += value(i).get
    }
    dfs(right(i), order, res)
    // 后序遍历
    if ("post".equals(order)) {
      res += value(i).get
    }
  }


  /* 前序遍历 */
  def preOrder(): ListBuffer[Int] = {
    val res: ListBuffer[Int] = ListBuffer[Int]()
    dfs(0, "pre", res)
    res
  }


  /* 中序遍历 */
  def inOrder(): ListBuffer[Int] = {
    val res: ListBuffer[Int] = ListBuffer[Int]()
    dfs(0, "in", res)
    res

  }

  /* 后序遍历 */
  def postOrder(): ListBuffer[Int] = {
    val res: ListBuffer[Int] = ListBuffer[Int]()
    dfs(0, "post", res)
    res
  }


}


/* 构造二叉树 */
object array_binary_tree {
  def main(args: Array[String]): Unit = {
    // 初始化二叉树
    // 这里借助了一个从数组直接生成二叉树的函数， 这里使用None替换null, 更加符号scala的习惯

    val arr: List[Option[Int]] = List(
      Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)
    )


    val treeNode: TreeNode = new TreeNode()
    val node: TreeNode = treeNode.listToTree(arr)
    println("\n初始化二叉树\n")
    println("二叉树的数组表示：")
    println(arr.map(_.getOrElse(null)))
    println("二叉树的链表表示：")
    new PrintUtil().printTree(node)

    // 数组表示下的二叉树类
    val abt: array_binary_tree = new array_binary_tree(arr)

    // 访问节点// 访问节点
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("\n当前节点的索引为 " + i + " ，值为 " + abt.value(i).get)
    println("其左子节点的索引为 " + l + " ，值为 " + (
      if (abt.value(l) == null || abt.value(l).isEmpty) "null"
      else abt.value(l).get)
    )
    System.out.println("其右子节点的索引为 " + r + " ，值为 " + (
      if (abt.value(r) == null || abt.value(r).isEmpty) "null"
    else abt.value(r).get))
    System.out.println("其父节点的索引为 " + p + " ，值为 " + (
      if (abt.value(p) == null || abt.value(p).isEmpty) "null"
    else abt.value(p).get))

    // 遍历树
    var res = abt.levelOrder()
    println("\n层序遍历为：" + res)


    res = abt.preOrder()
    println("前序遍历为：" + res)
    res = abt.inOrder()
    println("中序遍历为：" + res)
    res = abt.postOrder()
    println("后序遍历为：" + res)
  }
}
