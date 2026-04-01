-- @script binary_search_tree.lua
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local TreeNode = tree_node.TreeNode

--- @class BinarySearchTree
--- 二叉搜索树类
--- @field _root TreeNode|nil 二叉搜索树的根节点
local BinarySearchTree = {}
BinarySearchTree.__index = BinarySearchTree

--- 构造方法
--- 初始化空树
--- @return BinarySearchTree
function BinarySearchTree.new()
    local obj = {}
    setmetatable(obj, BinarySearchTree)
    obj._root = nil
    return obj
end

--- 获取二叉树根节点
--- @return TreeNode|nil
function BinarySearchTree:get_root()
    return self._root
end

--- 查找节点
--- @param num number 要查找的值
--- @return TreeNode|nil
function BinarySearchTree:search(num)
    local cur = self._root
    -- 循环查找，越过叶节点后跳出
    while cur ~= nil do
        -- 目标节点在 cur 的右子树中
        if cur.val < num then
            cur = cur.right
            -- 目标节点在 cur 的左子树中
        elseif cur.val > num then
            cur = cur.left
            -- 找到目标节点，跳出循环
        else
            break
        end
    end
    return cur
end

--- 插入节点
--- @param num number 要插入的值
function BinarySearchTree:insert(num)
    -- 若树为空，则初始化根节点
    if self._root == nil then
        self._root = TreeNode.new(num)
        return
    end

    -- 循环查找，越过叶节点后跳出
    local cur = self._root
    local pre = nil
    while cur ~= nil do
        -- 找到重复节点，直接返回
        if cur.val == num then
            return
        end
        pre = cur
        -- 插入位置在 cur 的右子树中
        if cur.val < num then
            cur = cur.right
            -- 插入位置在 cur 的左子树中
        else
            cur = cur.left
        end
    end

    -- 插入节点
    local node = TreeNode.new(num)
    if pre.val < num then
        pre.right = node
    else
        pre.left = node
    end
end

---删除节点
---@param num number 要删除的值
function BinarySearchTree:remove(num)
    -- 若树为空，直接提前返回
    if self._root == nil then
        return
    end

    -- 循环查找，越过叶节点后跳出
    local cur = self._root
    local pre = nil
    while cur ~= nil do
        -- 找到待删除节点，跳出循环
        if cur.val == num then
            break
        end
        pre = cur
        -- 待删除节点在 cur 的右子树中
        if cur.val < num then
            cur = cur.right
            -- 待删除节点在 cur 的左子树中
        else
            cur = cur.left
        end
    end

    -- 若无待删除节点，则直接返回
    if cur == nil then
        return
    end

    -- 子节点数量 = 0 or 1
    if cur.left == nil or cur.right == nil then
        -- 当子节点数量 = 0 / 1 时，child = null / 该子节点
        local child = cur.left or cur.right
        -- 删除节点 cur
        if cur ~= self._root then
            if pre.left == cur then
                pre.left = child
            else
                pre.right = child
            end
        else
            -- 若删除节点为根节点，则重新指定根节点
            self._root = child
        end
        -- 子节点数量 = 2
    else
        -- 获取中序遍历中 cur 的下一个节点
        local tmp = cur.right
        while tmp.left ~= nil do
            tmp = tmp.left
        end
        -- 递归删除节点 tmp
        self:remove(tmp.val)
        -- 用 tmp 覆盖 cur
        cur.val = tmp.val
    end
end

-- Driver Code
local function main()
    -- 初始化二叉搜索树
    local bst = BinarySearchTree.new()
    local nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 }
    -- 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
    for _, num in ipairs(nums) do
        bst:insert(num)
    end
    print("\n初始化的二叉树为\n")
    print_util.print_tree(bst:get_root(), nil, false)

    -- 查找节点
    local node = bst:search(7)
    if node then
        print("\n查找到的节点对象为: " .. tostring(node) .. "，节点值= " .. node.val)
    else
        print("\n未找到节点 7")
    end

    -- 插入节点
    bst:insert(16)
    print("\n插入节点 16 后，二叉树为\n")
    print_util.print_tree(bst:get_root(), nil, false)

    -- 删除节点
    bst:remove(1)
    print("\n删除节点 1 后，二叉树为\n")
    print_util.print_tree(bst:get_root(), nil, false)

    bst:remove(2)
    print("\n删除节点 2 后，二叉树为\n")
    print_util.print_tree(bst:get_root(), nil, false)

    bst:remove(4)
    print("\n删除节点 4 后，二叉树为\n")
    print_util.print_tree(bst:get_root(), nil, false)
end

-- 运行主函数
main()
