/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL 트리 */
class AVLTree {
    public TreeNode? root; // 루트 노드

    /* 노드 높이 구하기 */
    int Height(TreeNode? node) {
        // 빈 노드의 높이는 -1, 리프 노드의 높이는 0이다
        return node == null ? -1 : node.height;
    }

    /* 노드 높이 갱신 */
    void UpdateHeight(TreeNode node) {
        // 노드 높이는 가장 높은 서브트리의 높이에 1을 더한 값이다
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* 균형 인수 구하기 */
    public int BalanceFactor(TreeNode? node) {
        // 빈 노드의 균형 인수는 0이다
        if (node == null) return 0;
        // 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
        return Height(node.left) - Height(node.right);
    }

    /* 오른쪽 회전 연산 */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // child를 축으로 node를 오른쪽으로 회전한다
        child.right = node;
        node.left = grandChild;
        // 노드 높이 갱신
        UpdateHeight(node);
        UpdateHeight(child);
        // 회전 후 서브트리의 루트 노드를 반환한다
        return child;
    }

    /* 왼쪽 회전 연산 */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // child를 축으로 node를 왼쪽으로 회전한다
        child.left = node;
        node.right = grandChild;
        // 노드 높이 갱신
        UpdateHeight(node);
        UpdateHeight(child);
        // 회전 후 서브트리의 루트 노드를 반환한다
        return child;
    }

    /* 회전으로 이 서브트리의 균형을 회복한다 */
    TreeNode? Rotate(TreeNode? node) {
        // 노드 node의 균형 인수를 구한다
        int balanceFactorInt = BalanceFactor(node);
        // 왼쪽으로 치우친 트리
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // 오른쪽 회전
                return RightRotate(node);
            } else {
                // 왼쪽 회전 후 오른쪽 회전
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // 오른쪽으로 치우친 트리
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // 왼쪽 회전
                return LeftRotate(node);
            } else {
                // 오른쪽 회전 후 왼쪽 회전
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // 균형이 잡혔으므로 회전 없이 바로 반환한다
        return node;
    }

    /* 노드 삽입 */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* 재귀적 노드 삽입(보조 메서드) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. 삽입 위치를 찾아 노드를 삽입한다 */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // 중복 노드는 삽입하지 않고 바로 반환한다
        UpdateHeight(node);  // 노드 높이 갱신
        /* 2. 회전으로 이 서브트리의 균형을 회복한다 */
        node = Rotate(node);
        // 서브트리의 루트 노드를 반환한다
        return node;
    }

    /* 노드 삭제 */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* 재귀적 노드 삭제(보조 메서드) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. 노드를 찾아 삭제한다 */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // 자식 수 = 0. node를 바로 삭제하고 반환한다
                if (child == null)
                    return null;
                // 자식 수 = 1. node를 바로 삭제한다
                else
                    node = child;
            } else {
                // 자식 수 = 2. 중위 순회에서 다음에 오는 노드를 삭제하고 그 값으로 현재 노드의 값을 대체한다
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // 노드 높이 갱신
        /* 2. 회전으로 이 서브트리의 균형을 회복한다 */
        node = Rotate(node);
        // 서브트리의 루트 노드를 반환한다
        return node;
    }

    /* 노드 탐색 */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 찾는 노드는 cur의 오른쪽 서브트리에 있다
            if (cur.val < val)
                cur = cur.right;
            // 찾는 노드는 cur의 왼쪽 서브트리에 있다
            else if (cur.val > val)
                cur = cur.left;
            // 찾는 노드를 발견했으므로 반복문을 종료한다
            else
                break;
        }
        // 찾은 노드를 반환한다
        return cur;
    }
}

public class avl_tree {
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\n삽입한 노드: " + val + " | 변경 후 AVL 트리:");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\n삭제한 노드: " + val + " | 변경 후 AVL 트리:");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* 빈 AVL 트리 초기화 */
        AVLTree avlTree = new();

        /* 노드 삽입 */
        // 노드를 삽입한 뒤 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
        TestInsert(avlTree, 1);
        TestInsert(avlTree, 2);
        TestInsert(avlTree, 3);
        TestInsert(avlTree, 4);
        TestInsert(avlTree, 5);
        TestInsert(avlTree, 8);
        TestInsert(avlTree, 7);
        TestInsert(avlTree, 9);
        TestInsert(avlTree, 10);
        TestInsert(avlTree, 6);

        /* 중복 노드 삽입 */
        TestInsert(avlTree, 7);

        /* 노드 삭제 */
        // 노드를 삭제한 뒤 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
        TestRemove(avlTree, 8); // 차수가 0인 노드 삭제
        TestRemove(avlTree, 5); // 차수가 1인 노드 삭제
        TestRemove(avlTree, 4); // 차수가 2인 노드 삭제

        /* 노드 조회 */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\n찾은 노드 객체: " + node + ", 노드 값 = " + node?.val);
    }
}
