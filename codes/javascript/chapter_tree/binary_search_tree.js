/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const Tree = require("../include/TreeNode");
const { printTree } = require("../include/PrintUtil");

/* 二叉搜索树 */
var root;

function BinarySearchTree(nums) {
    nums.sort((a, b) => { return a - b }); // 排序数组
    root = buildTree(nums, 0, nums.length - 1);  // 构建二叉搜索树
}

/* 获取二叉树根结点 */
function getRoot() {
    return root;
}

/* 构建二叉搜索树 */
function buildTree(nums, i, j) {
    if (i > j) return null;
    // 将数组中间结点作为根结点
    let mid = Math.floor((i + j) / 2);
    let root = new Tree.TreeNode(nums[mid]);
    // 递归建立左子树和右子树
    root.left = buildTree(nums, i, mid - 1);
    root.right = buildTree(nums, mid + 1, j);
    return root;
}

/* 查找结点 */
function search(num) {
    let cur = root;
    // 循环查找，越过叶结点后跳出
    while (cur !== null) {
        // 目标结点在 cur 的右子树中
        if (cur.val < num) cur = cur.right;
        // 目标结点在 cur 的左子树中
        else if (cur.val > num) cur = cur.left;
        // 找到目标结点，跳出循环
        else break;
    }
    // 返回目标结点
    return cur;
}

/* 插入结点 */
function insert(num) {
    // 若树为空，直接提前返回
    if (root === null) return null;
    let cur = root, pre = null;
    // 循环查找，越过叶结点后跳出
    while (cur !== null) {
        // 找到重复结点，直接返回
        if (cur.val === num) return null;
        pre = cur;
        // 插入位置在 cur 的右子树中
        if (cur.val < num) cur = cur.right;
        // 插入位置在 cur 的左子树中
        else cur = cur.left;
    }
    // 插入结点 val
    let node = new Tree.TreeNode(num);
    if (pre.val < num) pre.right = node;
    else pre.left = node;
    return node;
}

/* 删除结点 */
function remove(num) {
    // 若树为空，直接提前返回
    if (root === null) return null;
    let cur = root, pre = null;
    // 循环查找，越过叶结点后跳出
    while (cur !== null) {
        // 找到待删除结点，跳出循环
        if (cur.val === num) break;
        pre = cur;
        // 待删除结点在 cur 的右子树中
        if (cur.val < num) cur = cur.right;
        // 待删除结点在 cur 的左子树中
        else cur = cur.left;
    }
    // 若无待删除结点，则直接返回
    if (cur === null) return null;
    // 子结点数量 = 0 or 1
    if (cur.left === null || cur.right === null) {
        // 当子结点数量 = 0 / 1 时， child = null / 该子结点
        let child = cur.left !== null ? cur.left : cur.right;
        // 删除结点 cur
        if (pre.left === cur) pre.left = child;
        else pre.right = child;
    }
    // 子结点数量 = 2
    else {
        // 获取中序遍历中 cur 的下一个结点
        let nex = getInOrderNext(cur.right);
        let tmp = nex.val;
        // 递归删除结点 nex
        remove(nex.val);
        // 将 nex 的值复制给 cur
        cur.val = tmp;
    }
    return cur;
}

/* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
function getInOrderNext(root) {
    if (root === null) return root;
    // 循环访问左子结点，直到叶结点时为最小结点，跳出
    while (root.left !== null) {
        root = root.left;
    }
    return root;
}

/* Driver Code */
/* 初始化二叉搜索树 */
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
BinarySearchTree(nums);
console.log("\n初始化的二叉树为\n");
printTree(getRoot());

/* 查找结点 */
let node = search(7);
console.log("\n查找到的结点对象为 " + node + "，结点值 = " + node.val);

/* 插入结点 */
node = insert(16);
console.log("\n插入结点 16 后，二叉树为\n");
printTree(getRoot());

/* 删除结点 */
remove(1);
console.log("\n删除结点 1 后，二叉树为\n");
printTree(getRoot());
remove(2);
console.log("\n删除结点 2 后，二叉树为\n");
printTree(getRoot());
remove(4);
console.log("\n删除结点 4 后，二叉树为\n");
printTree(getRoot());
