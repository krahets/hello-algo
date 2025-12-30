-- @script: simple_hash.lua
-- @date 2025-11-12
-- @author fisheryv (yue.fisher2025@gdhfi.com)


--- 加法哈希
--- @param key string 输入字符串
--- @return integer
local function add_hash(key)
    local hash = 0
    local modulus = 1000000007
    for i = 1, #key do
        local c = string.byte(key, i)
        hash = hash + c
    end
    return hash % modulus
end

--- 乘法哈希
--- @param key string 输入字符串
--- @return integer
local function mul_hash(key)
    local hash = 0
    local modulus = 1000000007
    for i = 1, #key do
        local c = string.byte(key, i)
        hash = 31 * hash + c
    end
    return hash % modulus
end

--- 异或哈希
--- @param key string 输入字符串
--- @return integer
--- @warning Lua 5.3及以上版本才支持位运算符
local function xor_hash(key)
    local hash = 0
    local modulus = 1000000007
    for i = 1, #key do
        local c = string.byte(key, i)
        hash = hash ~ c
    end
    return hash % modulus
end

--- 旋转哈希
--- @param key string 输入字符串
--- @return integer
--- @warning Lua 5.3及以上版本才支持位运算符
local function rot_hash(key)
    local hash = 0
    local modulus = 1000000007
    for i = 1, #key do
        local c = string.byte(key, i)
        hash = ((hash << 4) ~ (hash >> 28) ~ c) & 0x7FFFFFFF
    end
    return hash % modulus
end


-- Driver Code
local function main()
    local key = "Hello 算法"

    local hash = add_hash(key)
    print(string.format("加法哈希值为 %d", hash))

    hash = mul_hash(key)
    print(string.format("乘法哈希值为 %d", hash))

    hash = xor_hash(key)
    print(string.format("异或哈希值为 %d", hash))

    hash = rot_hash(key)
    print(string.format("旋转哈希值为 %d", hash))
end

-- 执行主函数
main()
