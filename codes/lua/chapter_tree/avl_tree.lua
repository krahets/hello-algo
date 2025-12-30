-- @script avl_tree.lua
-- @date 2025-11-14
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local TreeNode = tree_node.TreeNode

--- @class AVLTree
--- AVL 树
--- @field _root TreeNode|nil AVL 树的根节点
local AVLTree = {}

---AVLTree 构造函数
---@return AVLTree
function AVLTree:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj._root = nil
    return obj
end

--- 获取二叉树根节点
--- @return TreeNode|nil
function AVLTree:get_root()
    return self._root
end

--- 获取节点高度
--- @param node TreeNode|nil
--- @return integer
function AVLTree:height(node)
    -- 空节点高度为 -1 ，叶节点高度为 0
    if node ~= nil then
        return node.height
    end
    return -1
end

--- 更新节点高度
--- @param node TreeNode|nil
function AVLTree:update_height(node)
    if node == nil then
        return
    end
    -- 节点高度等于最高子树高度 + 1
    node.height = math.max(self:height(node.left), self:height(node.right)) + 1
end

--- 获取平衡因子
--- @param node TreeNode|nil
--- @return integer
function AVLTree:balance_factor(node)
    -- 空节点平衡因子为 0
    if node == nil then
        return 0
    end
    -- 节点平衡因子 = 左子树高度 - 右子树高度
    return self:height(node.left) - self:height(node.right)
end

--- 右旋操作
--- @param node TreeNode
--- @return TreeNode
function AVLTree:right_rotate(node)
    local child = node.left
    local grand_child = child.right
    -- 以 child 为原点，将 node 向右旋转
    child.right = node
    node.left = grand_child
    -- 更新节点高度
    self:update_height(node)
    self:update_height(child)
    -- 返回旋转后子树的根节点
    return child
end

--- 左旋操作
--- @param node TreeNode
--- @return TreeNode
function AVLTree:left_rotate(node)
    local child = node.right
    local grand_child = child.left
    -- 以 child 为原点，将 node 向左旋转
    child.left = node
    node.right = grand_child
    -- 更新节点高度
    self:update_height(node)
    self:update_height(child)
    -- 返回旋转后子树的根节点
    return child
end

--- 执行旋转操作，使该子树重新恢复平衡
--- @param node TreeNode
--- @return TreeNode
function AVLTree:rotate(node)
    -- 获取节点 node 的平衡因子
    local balance_factor = self:balance_factor(node)
    -- 左偏树
    if balance_factor > 1 then
        if self:balance_factor(node.left) >= 0 then
            -- 右旋
            return self:right_rotate(node)
        else
            -- 先左旋后右旋
            node.left = self:left_rotate(node.left)
            return self:right_rotate(node)
        end
        -- 右偏树
    elseif balance_factor < -1 then
        if self:balance_factor(node.right) <= 0 then
            -- 左旋
            return self:left_rotate(node)
        else
            -- 先右旋后左旋
            node.right = self:right_rotate(node.right)
            return self:left_rotate(node)
        end
    end
    -- 平衡树，无须旋转，直接返回
    return node
end

--- 插入节点
--- @param val integer
function AVLTree:insert(val)
    self._root = self:insert_helper(self._root, val)
end

--- 递归插入节点（辅助方法）
--- @param node TreeNode|nil
--- @param val integer
--- @return TreeNode
function AVLTree:insert_helper(node, val)
    if node == nil then
        return TreeNode.new(val)
    end
    -- 1. 查找插入位置并插入节点
    if val < node.val then
        node.left = self:insert_helper(node.left, val)
    elseif val > node.val then
        node.right = self:insert_helper(node.right, val)
    else
        -- 重复节点不插入，直接返回
        return node
    end
    -- 更新节点高度
    self:update_height(node)
    -- 2. 执行旋转操作，使该子树重新恢复平衡
    return self:rotate(node)
end

--- 删除节点
--- @param val integer
function AVLTree:remove(val)
    self._root = self:remove_helper(self._root, val)
end

--- 递归删除节点（辅助方法）
--- @param node TreeNode|nil
--- @param val integer
--- @return TreeNode|nil
function AVLTree:remove_helper(node, val)
    if node == nil then
        return nil
    end
    -- 1. 查找节点并删除
    if val < node.val then
        node.left = self:remove_helper(node.left, val)
    elseif val > node.val then
        node.right = self:remove_helper(node.right, val)
    else
        if node.left == nil or node.right == nil then
            local child = node.left or node.right
            -- 子节点数量 = 0 ，直接删除 node 并返回
            if child == nil then
                return nil
                -- 子节点数量 = 1 ，直接删除 node
            else
                node = child
            end
        else
            -- 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
            local temp = node.right
            while temp.left ~= nil do
                temp = temp.left
            end
            node.right = self:remove_helper(node.right, temp.val)
            node.val = temp.val
        end
    end
    -- 更新节点高度
    self:update_height(node)
    -- 2. 执行旋转操作，使该子树重新恢复平衡
    return self:rotate(node)
end

--- 查找节点
--- @param val integer
--- @return TreeNode|nil
function AVLTree:search(val)
    local cur = self._root
    -- 循环查找，越过叶节点后跳出
    while cur ~= nil do
        -- 目标节点在 cur 的右子树中
        if cur.val < val then
            cur = cur.right
            -- 目标节点在 cur 的左子树中
        elseif cur.val > val then
            cur = cur.left
            -- 找到目标节点，跳出循环
        else
            break
        end
    end
    -- 返回目标节点
    return cur
end

-- Driver Code
local function main()
    local function test_insert(tree, val)
        tree:insert(val)
        print(string.format("\n插入节点 %d 后，AVL 树为", val))
        print_util.print_tree(tree:get_root(), nil, false)
    end

    local function test_remove(tree, val)
        tree:remove(val)
        print(string.format("\n删除节点 %d 后，AVL 树为", val))
        print_util.print_tree(tree:get_root(), nil, false)
    end

    -- 初始化空 AVL 树
    local avl_tree = AVLTree:new()

    -- 插入节点
    -- 请关注插入节点后，AVL 树是如何保持平衡的
    local test_values = { 1, 2, 3, 4, 5, 8, 7, 9, 10, 6 }
    for _, val in ipairs(test_values) do
        test_insert(avl_tree, val)
    end

    -- 插入重复节点
    test_insert(avl_tree, 7)

    -- 删除节点
    -- 请关注删除节点后，AVL 树是如何保持平衡的
    test_remove(avl_tree, 8) -- 删除度为 0 的节点
    test_remove(avl_tree, 5) -- 删除度为 1 的节点
    test_remove(avl_tree, 4) -- 删除度为 2 的节点

    local result_node = avl_tree:search(7)
    if result_node then
        print(string.format("\n查找到的节点对象为 %s，节点值 = %d", tostring(result_node), result_node.val))
    else
        print("\n未找到节点 7")
    end
end

-- 运行主函数
main()
