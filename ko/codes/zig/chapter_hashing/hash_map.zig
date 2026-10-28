// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 실행 코드
pub fn main() !void {
    // 해시 테이블 초기화
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // 메모리 해제를 지연한다
    defer map.deinit();

    // 추가 연산
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    try map.put(12836, "小哈");
    try map.put(15937, "小啰");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鸭");
    std.debug.print("\n추가한 후의 해시 테이블:\n키 -> 값\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 조회 연산
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    var name = map.get(15937).?;
    std.debug.print("\n학번 15937로 조회한 이름: {s}\n", .{name});

    // 삭제 연산
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    _ = map.remove(10583);
    std.debug.print("\n10583을 삭제한 후의 해시 테이블:\n키 -> 값\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 해시 테이블 순회
    std.debug.print("\n키-값 쌍(키->값) 순회\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\n키 Key만 순회\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\n값 value만 순회\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

