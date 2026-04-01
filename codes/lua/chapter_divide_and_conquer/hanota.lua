-- @script hanota.lua
-- @date 2025-11-15
-- @author fisheryv (yue.fisher2025@gdhfi.com)

--- 移动一个圆盘
--- @param src table 源柱子
--- @param tar table 目标柱子
local function move(src, tar)
    -- 从 src 顶部拿出一个圆盘
    local pan = table.remove(src)
    -- 将圆盘放入 tar 顶部
    table.insert(tar, pan)
end

--- 求解汉诺塔问题 f(i)
--- @param i number 要移动的圆盘数量
--- @param src table 源柱子
--- @param buf table 缓冲柱子
--- @param tar table 目标柱子
local function dfs(i, src, buf, tar)
    -- 若 src 只剩下一个圆盘，则直接将其移到 tar
    if i == 1 then
        move(src, tar)
        return
    end

    -- 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf)
    -- 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, tar)
    -- 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar)
end

--- 求解汉诺塔问题
--- @param A table 起始柱子A
--- @param B table 辅助柱子B
--- @param C table 目标柱子C
local function solve_hanota(A, B, C)
    local n = #A
    -- 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C)
end

-- Driver Code
local function main()
    -- 列表尾部是柱子顶部
    local A = { 5, 4, 3, 2, 1 }
    local B = {}
    local C = {}

    print("初始状态下：")
    print("A = [" .. table.concat(A, ", ") .. "]")
    print("B = [" .. table.concat(B, ", ") .. "]")
    print("C = [" .. table.concat(C, ", ") .. "]")

    solve_hanota(A, B, C)

    print("圆盘移动完成后：")
    print("A = [" .. table.concat(A, ", ") .. "]")
    print("B = [" .. table.concat(B, ", ") .. "]")
    print("C = [" .. table.concat(C, ", ") .. "]")
end

-- 执行主函数
main()
