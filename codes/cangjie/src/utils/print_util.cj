/**
 * File: print_util.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.utils

import std.collection.{ArrayList, Map}

public class Trunk {
    var prev: ?Trunk
    var str: String

    public init(prev: ?Trunk, str: String) {
        this.prev = prev
        this.str = str
    }
}

public class PrintUtil {

    /* 打印矩阵（Array） */
    public static func printMatrix<T>(matrix: Array<Array<T>>): Unit where T <: ToString {
        println("[")
        for (row in matrix) {
            println("  ${row},")
        }
        println("]")
    }

    /* 打印矩阵（List） */
    public static func printMatrix<T>(matrix: ArrayList<ArrayList<T>>): Unit where T <: ToString {
        println("[")
        for (row in matrix) {
            println("  ${row},")
        }
        println("]")
    }

    /* 打印链表 */
    public static func printLinkedList(head: ?ListNode): Unit {
        let list = ArrayList<String>()
        var var_head = head
        while (let Some(head) <- var_head) {
            list.add("${head.val}")
            var_head = head.next
        }
        println(String.join(list.toArray(), delimiter: " -> "))
    }

    // PrintTree 打印二叉树
    public static func printTree(root: ?TreeNode): Unit {
        printTree(root, None, false)
    }

    /**
     * 打印二叉树
     * This tree printer is borrowed from TECHIE DELIGHT
     * https://www.techiedelight.com/c-program-print-binary-tree/
     */
    public static func printTree(root: ?TreeNode, prev: ?Trunk, isRight: Bool): Unit {
        if (let Some(p_root) <- root && let Some(val) <- p_root.val) {
            var prev_str = "    "
            let trunk = Trunk(prev, prev_str)
            printTree(p_root.right, trunk, true)
            if (prev.isNone()) {
                trunk.str = "———"
            } else if (isRight) {
                trunk.str = "/———"
                prev_str = "   |"
            } else {
                trunk.str = "\\———"
                prev?.str = prev_str
            }
            showTrunks(trunk)
            println("${val}")
            if (let Some(prev) <- prev) {
                prev.str = prev_str
            }
            trunk.str = "   |"
            printTree(p_root.left, trunk, false)
        }
    }

    public static func showTrunks(p: ?Trunk): Unit {
        if (let Some(p) <- p) {
            showTrunks(p.prev)
            print(p.str)
        }
    }

    /* 打印哈希表 */
    public static func printHashMap<K, V>(map: Map<K, V>): Unit where K <: Equatable<K> & ToString, V <: ToString {
        for (key in map.keys()) {
            println("${key} -> ${map.get(key)}");
        }
    }
}
