/**
 * File: binary_search_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 二叉搜索树 */
class BinarySearchTree {
    /* 构造方法 */
    constructor() {
        // 初始化空树
        this.root = null;
    }

    /* 获取二叉树根节点 */
    getRoot() {
        return this.root;
    }

    /* 查找节点 */
    search(num) {
        let cur = this.root;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > num) cur = cur.left;
            // 找到目标节点，跳出循环
            else break;
        }
        // 返回目标节点
        return cur;
    }

    /* 插入节点 */
    insert(num) {
        // 若树为空，则初始化根节点
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 找到重复节点，直接返回
            if (cur.val === num) return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子树中
            else cur = cur.left;
        }
        // 插入节点
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }

    /* 删除节点 */
    remove(num) {
        // 若树为空，直接提前返回
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 找到待删除节点，跳出循环
            if (cur.val === num) break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur === null) return;
        // 子节点数量 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            const child = cur.left !== null ? cur.left : cur.right;
            // 删除节点 cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                this.root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // 递归删除节点 tmp
            this.remove(tmp.val);
            // 用 tmp 覆盖 cur
            cur.val = tmp.val;
        }
    }
}

/* Driver Code */
/* 初始化二叉搜索树 */
const bst = new BinarySearchTree();
// 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\n初始化的二叉树为\n');
printTree(bst.getRoot());

/* 查找节点 */
const node = bst.search(7);
console.log('\n查找到的节点对象为 ' + node + '，节点值 = ' + node.val);

/* 插入节点 */
bst.insert(16);
console.log('\n插入节点 16 后，二叉树为\n');
printTree(bst.getRoot());

/* 删除节点 */
bst.remove(1);
console.log('\n删除节点 1 后，二叉树为\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\n删除节点 2 后，二叉树为\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\n删除节点 4 后，二叉树为\n');
printTree(bst.getRoot());
