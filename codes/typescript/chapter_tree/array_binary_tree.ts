/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* 数组表示下的二叉树类 */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* 构造方法 */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* 列表容量 */
    size(): number {
        return this.#tree.length;
    }

    /* 获取索引为 i 节点的值 */
    val(i: number): number | null {
        // 若索引越界，则返回 null ，代表空位
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 获取索引为 i 节点的父节点的索引 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 向下整除
    }

    /* 层序遍历 */
    levelOrder(): number[] {
        let res = [];
        // 直接遍历数组
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* 深度优先遍历 */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // 若为空位，则返回
        if (this.val(i) === null) return;
        // 前序遍历
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // 中序遍历
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // 后序遍历
        if (order === 'post') res.push(this.val(i));
    }

    /* 前序遍历 */
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* 中序遍历 */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* 后序遍历 */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Driver Code */
// 初始化二叉树
// 这里借助了一个从数组直接生成二叉树的函数
const arr = Array.of(
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
);

const root = arrToTree(arr);
console.log('\n初始化二叉树\n');
console.log('二叉树的数组表示：');
console.log(arr);
console.log('二叉树的链表表示：');
printTree(root);

// 数组表示下的二叉树类
const abt = new ArrayBinaryTree(arr);

// 访问节点
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\n当前节点的索引为 ' + i + ' ，值为 ' + abt.val(i));
console.log(
    '其左子节点的索引为 ' + l + ' ，值为 ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    '其右子节点的索引为 ' + r + ' ，值为 ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    '其父节点的索引为 ' + p + ' ，值为 ' + (p === null ? 'null' : abt.val(p))
);

// 遍历树
let res = abt.levelOrder();
console.log('\n层序遍历为：' + res);
res = abt.preOrder();
console.log('前序遍历为：' + res);
res = abt.inOrder();
console.log('中序遍历为：' + res);
res = abt.postOrder();
console.log('后序遍历为：' + res);

export {};
