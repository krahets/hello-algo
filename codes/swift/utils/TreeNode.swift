/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

public class TreeNode {
    public var val: Int // 结点值
    public var height: Int // 结点高度
    public var left: TreeNode? // 左子结点引用
    public var right: TreeNode? // 右子结点引用

    public init(x: Int) {
        val = x
        height = 0
    }
}
