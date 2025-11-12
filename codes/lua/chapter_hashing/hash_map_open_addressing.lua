-- @script: hash_map_open_addressing.lua
-- @date 2025-11-12
-- @author fisheryv (yue.fisher2025@gdhfi.com)

-- 添加模块搜索路径
package.path = package.path .. ";codes/lua/modules/?.lua"

local Pair = require("pair")

--- @class HashMapOpenAddressing
--- 开放寻址哈希表
--- @field size integer 键值对数量
--- @field capacity integer 哈希表容量
--- @field load_thres number 触发扩容的负载因子阈值
--- @field extend_ratio integer 扩容倍数
--- @field buckets table 桶数组
--- @field TOMBSTONE Pair 删除标记
local HashMapOpenAddressing = {}
HashMapOpenAddressing.__index = HashMapOpenAddressing

--- 构造方法
--- @return HashMapOpenAddressing
function HashMapOpenAddressing.new()
    local obj = setmetatable({}, HashMapOpenAddressing)
    obj.size = 0                       -- 键值对数量
    obj.capacity = 4                   -- 哈希表容量
    obj.load_thres = 2.0 / 3.0         -- 触发扩容的负载因子阈值
    obj.extend_ratio = 2               -- 扩容倍数
    obj.buckets = {}                   -- 桶数组
    obj.TOMBSTONE = Pair:new(-1, "-1") -- 删除标记

    -- 初始化桶数组
    for i = 1, obj.capacity do
        obj.buckets[i] = ""
    end

    return obj
end

--- 哈希函数
--- @param key integer 键
--- @return integer
function HashMapOpenAddressing:hash_func(key)
    return (key % self.capacity) + 1 -- Lua 数组索引从 1 开始
end

--- 计算负载因子
--- @return number
function HashMapOpenAddressing:load_factor()
    return self.size / self.capacity
end

--- 搜索 key 对应的桶索引
--- @param key integer 要搜索的键
--- @return integer
function HashMapOpenAddressing:find_bucket(key)
    local index = self:hash_func(key)
    local first_tombstone = -1

    -- 线性探测，当遇到空桶时跳出
    while self.buckets[index] ~= "" do
        -- 若遇到 key，返回对应的桶索引
        if self.buckets[index].key == key then
            -- 若之前遇到了删除标记，则将键值对移动至该索引处
            if first_tombstone ~= -1 then
                self.buckets[first_tombstone] = self.buckets[index]
                self.buckets[index] = self.TOMBSTONE
                return first_tombstone -- 返回移动后的桶索引
            end
            return index               -- 返回桶索引
        end

        -- 记录遇到的首个删除标记
        if first_tombstone == -1 and self.buckets[index] == self.TOMBSTONE then
            first_tombstone = index
        end

        -- 计算桶索引，越过尾部则返回头部
        index = (index % self.capacity) + 1
    end

    -- 若 key 不存在，则返回添加点的索引
    return first_tombstone == -1 and index or first_tombstone
end

--- 查询操作
--- @param key integer 要查询的键
--- @return string|nil
function HashMapOpenAddressing:get(key)
    -- 搜索 key 对应的桶索引
    local index = self:find_bucket(key)

    -- 若找到键值对，则返回对应 val
    if self.buckets[index] ~= "" and self.buckets[index] ~= self.TOMBSTONE then
        return self.buckets[index].val
    end

    -- 若键值对不存在，则返回 nil
    return nil
end

--- 添加操作
--- @param key integer 键
--- @param val string 值
function HashMapOpenAddressing:put(key, val)
    -- 当负载因子超过阈值时，执行扩容
    if self:load_factor() > self.load_thres then
        self:extend()
    end

    -- 搜索 key 对应的桶索引
    local index = self:find_bucket(key)

    -- 若找到键值对，则覆盖 val 并返回
    if self.buckets[index] ~= "" and self.buckets[index] ~= self.TOMBSTONE then
        self.buckets[index].val = val
        return
    end

    -- 若键值对不存在，则添加该键值对
    self.buckets[index] = Pair:new(key, val)
    self.size = self.size + 1
end

--- 删除操作
--- @param key integer 要删除的键
function HashMapOpenAddressing:remove(key)
    -- 搜索 key 对应的桶索引
    local index = self:find_bucket(key)

    -- 若找到键值对，则用删除标记覆盖它
    if self.buckets[index] ~= "" and self.buckets[index] ~= self.TOMBSTONE then
        self.buckets[index] = self.TOMBSTONE
        self.size = self.size - 1
    end
end

--- 扩容哈希表
function HashMapOpenAddressing:extend()
    -- 暂存原哈希表
    local buckets_tmp = {}
    for i, v in ipairs(self.buckets) do
        buckets_tmp[i] = v
    end

    -- 初始化扩容后的新哈希表
    self.capacity = self.capacity * self.extend_ratio
    self.buckets = {}
    self.size = 0

    -- 初始化新桶数组
    for i = 1, self.capacity do
        self.buckets[i] = ""
    end

    -- 将键值对从原哈希表搬运至新哈希表
    for _, pair in ipairs(buckets_tmp) do
        if pair ~= "" and pair ~= self.TOMBSTONE then
            self:put(pair.key, pair.val)
        end
    end
end

--- 打印哈希表
function HashMapOpenAddressing:print()
    for i, pair in ipairs(self.buckets) do
        if pair == "" then
            print("None")
        elseif pair == self.TOMBSTONE then
            print("TOMBSTONE")
        else
            print(pair.key .. " -> " .. pair.val)
        end
    end
end

-- Driver Code
local function main()
    -- 初始化哈希表
    local hashmap = HashMapOpenAddressing.new()

    -- 添加操作
    -- 在哈希表中添加键值对 (key, val)
    hashmap:put(12836, "小哈")
    hashmap:put(15937, "小啰")
    hashmap:put(16750, "小算")
    hashmap:put(13276, "小法")
    hashmap:put(10583, "小鸭")
    print("\n添加完成后，哈希表为\nKey -> Value")
    hashmap:print()

    -- 查询操作
    -- 向哈希表中输入键 key ，得到值 val
    local name = hashmap:get(13276)
    print("\n输入学号 13276 ，查询到姓名 " .. name)

    -- 删除操作
    -- 在哈希表中删除键值对 (key, val)
    hashmap:remove(16750)
    print("\n删除 16750 后，哈希表为\nKey -> Value")
    hashmap:print()
end

-- 执行主函数
main()
