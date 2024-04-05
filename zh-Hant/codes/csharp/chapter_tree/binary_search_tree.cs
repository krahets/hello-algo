/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree() {
        // 初始化空樹
        root = null;
    }

    /* 獲取二元樹根節點 */
    public TreeNode? GetRoot() {
        return root;
    }

    /* 查詢節點 */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            if (cur.val < num) cur =
                cur.right;
            // 目標節點在 cur 的左子樹中
            else if (cur.val > num)
                cur = cur.left;
            // 找到目標節點，跳出迴圈
            else
                break;
        }
        // 返回目標節點
        return cur;
    }

    /* 插入節點 */
    public void Insert(int num) {
        // 若樹為空，則初始化根節點
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到重複節點，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子樹中
            else
                cur = cur.left;
        }

        // 插入節點
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* 刪除節點 */
    public void Remove(int num) {
        // 若樹為空，直接提前返回
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到待刪除節點，跳出迴圈
            if (cur.val == num)
                break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 待刪除節點在 cur 的左子樹中
            else
                cur = cur.left;
        }
        // 若無待刪除節點，則直接返回
        if (cur == null)
            return;
        // 子節點數量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            TreeNode? child = cur.left ?? cur.right;
            // 刪除節點 cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child;
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 遞迴刪除節點 tmp
            Remove(tmp.val!.Value);
            // 用 tmp 覆蓋 cur
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* 初始化二元搜尋樹 */
        BinarySearchTree bst = new();
        // 請注意，不同的插入順序會生成不同的二元樹，該序列可以生成一個完美二元樹
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\n初始化的二元樹為\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* 查詢節點 */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\n查詢到的節點物件為 " + node + "，節點值 = " + node?.val);

        /* 插入節點 */
        bst.Insert(16);
        Console.WriteLine("\n插入節點 16 後，二元樹為\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* 刪除節點 */
        bst.Remove(1);
        Console.WriteLine("\n刪除節點 1 後，二元樹為\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\n刪除節點 2 後，二元樹為\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\n刪除節點 4 後，二元樹為\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
