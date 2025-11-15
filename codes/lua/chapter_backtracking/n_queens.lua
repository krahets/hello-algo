-- @script n_queens.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 回溯算法：n 皇后
--- @param row integer 当前处理的行
--- @param n integer 棋盘大小
--- @param state table 当前棋盘状态
--- @param res table 存储所有解的列表
--- @param cols table 列占用标记
--- @param diags1 table 主对角线占用标记
--- @param diags2 table 次对角线占用标记
local function backtrack(row, n, state, res, cols, diags1, diags2)
    -- 当放置完所有行时，记录解
    if row == n then
        local solution = {}
        for i = 1, n do
            solution[i] = {}
            for j = 1, n do
                solution[i][j] = state[i][j]
            end
        end
        table.insert(res, solution)
        return
    end

    -- 遍历所有列
    for col = 1, n do
        -- 计算该格子对应的主对角线和次对角线
        local diag1 = row - col + n
        local diag2 = row + col - 1

        -- 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
        if not cols[col] and not diags1[diag1] and not diags2[diag2] then
            -- 尝试：将皇后放置在该格子
            state[row + 1][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true

            -- 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2)

            -- 回退：将该格子恢复为空位
            state[row + 1][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        end
    end
end

--- 求解 n 皇后问题
--- @param n integer 棋盘大小
--- @return table 所有解的列表
local function n_queens(n)
    -- 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    local state = {}
    for i = 1, n do
        state[i] = {}
        for j = 1, n do
            state[i][j] = "#"
        end
    end

    local cols = {}   -- 记录列是否有皇后
    local diags1 = {} -- 记录主对角线上是否有皇后
    local diags2 = {} -- 记录次对角线上是否有皇后

    for i = 1, n do
        cols[i] = false
    end

    for i = 1, 2 * n - 1 do
        diags1[i] = false
        diags2[i] = false
    end

    local res = {}
    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
end

-- Driver Code
local function main()
    local n = 4
    local res = n_queens(n)

    print(string.format("输入棋盘长宽为 %d", n))
    print(string.format("皇后放置方案共有 %d 种", #res))

    for i, state in ipairs(res) do
        print("--------------------")
        for j = 1, #state do
            print("['" .. table.concat(state[j], "', '") .. "']")
        end
    end
end

-- 执行主函数
main()
