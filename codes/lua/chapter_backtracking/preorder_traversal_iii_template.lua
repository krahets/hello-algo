-- @script preorder_traversal_iii_template.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)


-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local print_util = require("print_util")
local tree_node = require("tree_node")
local list_to_tree = tree_node.list_to_tree

--- 判断当前状态是否为解
--- @param state table 当前路径状态
--- @return boolean
local function is_solution(state)
    return #state > 0 and state[#state].val == 7
end

--- 记录解
--- @param state table 当前路径状态
--- @param res table 结果集合
local function record_solution(state, res)
    local solution = {}
    for _, node in ipairs(state) do
        table.insert(solution, node)
    end
    table.insert(res, solution)
end

--- 判断在当前状态下，该选择是否合法
--- @param state table 当前路径状态
--- @param choice TreeNode|nil 候选节点
--- @return boolean
local function is_valid(state, choice)
    return choice ~= nil and choice.val ~= 3
end

--- 更新状态
--- @param state table 当前路径状态
--- @param choice TreeNode 选择的节点
local function make_choice(state, choice)
    table.insert(state, choice)
end

--- 恢复状态
--- @param state table 当前路径状态
--- @param choice TreeNode 选择的节点
local function undo_choice(state, choice)
    table.remove(state)
end

--- 回溯算法：例题三
--- @param state table 当前路径状态
--- @param choices table 候选节点列表
--- @param res table 结果集合
local function backtrack(state, choices, res)
    -- 检查是否为解
    if is_solution(state) then
        record_solution(state, res)
    end

    -- 遍历所有选择
    for _, choice in ipairs(choices) do
        -- 剪枝：检查选择是否合法
        if is_valid(state, choice) then
            -- 尝试：做出选择，更新状态
            make_choice(state, choice)
            -- 进行下一轮选择
            backtrack(state, { choice.left, choice.right }, res)
            -- 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice)
        end
    end
end

-- Driver Code
local function main()
    local root = list_to_tree({ 1, 7, 3, 4, 5, 6, 7 })
    print("\n初始化二叉树")
    print_util.print_tree(root, nil, false)

    -- 回溯算法
    local res = {}
    backtrack({}, { root }, res)

    print("\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点")
    for _, path in ipairs(res) do
        local path_vals = {}
        for _, node in ipairs(path) do
            table.insert(path_vals, node.val)
        end
        print("[" .. table.concat(path_vals, ", ") .. "]")
    end
end

-- 执行主函数
main()
