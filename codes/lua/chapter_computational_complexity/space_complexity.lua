-- @script space_complexity.lua
-- @date 2025-11-10
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local list_node = require("list_node")
local tree_node = require("tree_node")
local print_util = require("print_util")
local ListNode = list_node.ListNode
local TreeNode = tree_node.TreeNode

--- 占位函数
--- @return integer 返回0
local function _function()
    -- 执行某些操作
    return 0
end

--- 常数阶空间复杂度
--- @param n integer 输入大小
local function constant(n)
    -- 常量、变量、对象占用 O(1) 空间
    local a = 0
    local nums = {}
    for i = 1, 10000 do
        nums[i] = 0
    end
    local node = ListNode.new(0)

    -- 循环中的变量占用 O(1) 空间
    for i = 1, n do
        local c = 0
    end

    -- 循环中的函数占用 O(1) 空间
    for i = 1, n do
        _function()
    end
end

--- 线性阶空间复杂度
--- @param n integer 输入大小
local function linear(n)
    -- 长度为 n 的列表占用 O(n) 空间
    local nums = {}
    for i = 1, n do
        nums[i] = 0
    end

    -- 长度为 n 的哈希表占用 O(n) 空间
    local hmap = {}
    for i = 1, n do
        hmap[i] = tostring(i)
    end
end

--- 线性阶空间复杂度（递归实现）
--- @param n integer 输入大小
local function linear_recur(n)
    print("递归 n = " .. n)
    if n == 1 then
        return
    end
    linear_recur(n - 1)
end

--- 平方阶空间复杂度
--- @param n integer 输入大小
local function quadratic(n)
    -- 二维列表占用 O(n^2) 空间
    local num_matrix = {}
    for i = 1, n do
        num_matrix[i] = {}
        for j = 1, n do
            num_matrix[i][j] = 0
        end
    end
end

--- 平方阶空间复杂度（递归实现）
--- @param n integer 输入大小
--- @return integer 返回值
local function quadratic_recur(n)
    if n <= 0 then
        return 0
    end
    -- 数组 nums 长度为 n, n-1, ..., 2, 1
    local nums = {}
    for i = 1, n do
        nums[i] = 0
    end
    return quadratic_recur(n - 1)
end

--- 指数阶空间复杂度（建立满二叉树）
--- @param n integer 树的高度
--- @return TreeNode|nil 树的根节点
local function build_tree(n)
    if n == 0 then
        return nil
    end
    local root = TreeNode.new(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root
end

-- Driver Code
local function main()
    local n = 5

    -- 常数阶
    constant(n)

    -- 线性阶
    linear(n)
    linear_recur(n)

    -- 平方阶
    quadratic(n)
    quadratic_recur(n)

    -- 指数阶
    local root = build_tree(n)
    print_util.print_tree(root, nil, false)
end

-- 执行主函数
main()
