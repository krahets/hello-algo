// File: my_heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 힙 클래스의 간단한 구현
pub fn MaxHeap(comptime T: type) type {
    return struct {
        const Self = @This();
        
        max_heap: ?std.ArrayList(T) = null,      // 배열 대신 리스트를 사용하므로 용량 확장을 고려할 필요가 없다

        // 생성자: 입력 리스트를 바탕으로 힙 구성
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
            if (self.max_heap != null) return;
            self.max_heap = std.ArrayList(T).init(allocator);
            // 리스트 원소를 그대로 힙에 추가한다
            try self.max_heap.?.appendSlice(nums);
            // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
            var i: usize = parent(self.size() - 1) + 1;
            while (i > 0) : (i -= 1) {
                try self.siftDown(i - 1);
            }
        }

        // 소멸자, 메모리 해제
        pub fn deinit(self: *Self) void {
            if (self.max_heap != null) self.max_heap.?.deinit();
        }

        // 왼쪽 자식 노드의 인덱스 반환
        fn left(i: usize) usize {
            return 2 * i + 1;
        }

        // 오른쪽 자식 노드의 인덱스 반환
        fn right(i: usize) usize {
            return 2 * i + 2;
        }

        // 부모 노드의 인덱스 반환
        fn parent(i: usize) usize {
            // return (i - 1) / 2; // 내림 나눗셈
            return @divFloor(i - 1, 2);
        }

        // 원소 교환
        fn swap(self: *Self, i: usize, j: usize) !void {
            var tmp = self.max_heap.?.items[i];
            try self.max_heap.?.replaceRange(i, 1, &[_]T{self.max_heap.?.items[j]});
            try self.max_heap.?.replaceRange(j, 1, &[_]T{tmp});
        }

        // 힙 크기 반환
        pub fn size(self: *Self) usize {
            return self.max_heap.?.items.len;
        }

        // 힙이 비어 있는지 판단
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 힙의 루트 원소 접근
        pub fn peek(self: *Self) T {
            return self.max_heap.?.items[0];
        }  

        // 힙에 원소 삽입
        pub fn push(self: *Self, val: T) !void {
            // 노드 추가
            try self.max_heap.?.append(val);
            // 아래에서 위로 힙을 재정렬한다
            try self.siftUp(self.size() - 1);
        }  

        // 노드 i에서 시작하여 아래에서 위로 힙 재정렬
        fn siftUp(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // 노드 i의 부모 노드를 구한다
                var p = parent(i);
                // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
                if (p < 0 or self.max_heap.?.items[i] <= self.max_heap.?.items[p]) break;
                // 두 노드를 교환한다
                try self.swap(i, p);
                // 위쪽으로 힙 재정렬을 반복한다
                i = p;
            }
        }

        // 힙에서 원소 꺼내기
        pub fn pop(self: *Self) !T {
            // 조건에 따른 처리
            if (self.isEmpty()) unreachable;
            // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
            try self.swap(0, self.size() - 1);
            // 노드 삭제
            var val = self.max_heap.?.pop();
            // 위에서 아래로 힙을 재정렬한다
            try self.siftDown(0);
            // 힙의 루트 원소를 반환한다
            return val;
        } 

        // 노드 i에서 시작하여 위에서 아래로 힙 재정렬
        fn siftDown(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
                var l = left(i);
                var r = right(i);
                var ma = i;
                if (l < self.size() and self.max_heap.?.items[l] > self.max_heap.?.items[ma]) ma = l;
                if (r < self.size() and self.max_heap.?.items[r] > self.max_heap.?.items[ma]) ma = r;
                // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
                if (ma == i) break;
                // 두 노드를 교환한다
                try self.swap(i, ma);
                // 아래쪽으로 힙 재정렬을 반복한다
                i = ma;
            }
        }

        fn lessThan(context: void, a: T, b: T) std.math.Order {
            _ = context;
            return std.math.order(a, b);
        }

        fn greaterThan(context: void, a: T, b: T) std.math.Order {
            return lessThan(context, a, b).invert();
        }

        // 힙 출력(이진 트리)
        pub fn print(self: *Self, mem_allocator: std.mem.Allocator) !void {
            const PQgt = std.PriorityQueue(T, void, greaterThan);
            var queue = PQgt.init(std.heap.page_allocator, {});
            defer queue.deinit();
            try queue.addSlice(self.max_heap.?.items);
            try inc.PrintUtil.printHeap(T, mem_allocator, queue);
        } 
    };
}

// 실행 코드
pub fn main() !void {
    // 메모리 할당자 초기화
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 최대 힙 초기화
    var max_heap = MaxHeap(i32){};
    try max_heap.init(std.heap.page_allocator, &[_]i32{ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 });
    defer max_heap.deinit();
    std.debug.print("\n리스트를 입력하고 힙을 구성한 후\n", .{});
    try max_heap.print(mem_allocator);

    // 힙의 루트 원소 반환
    var peek = max_heap.peek();
    std.debug.print("\n힙의 루트 원소: {}\n", .{peek});

    // 힙에 원소 삽입
    const val = 7;
    try max_heap.push(val);
    std.debug.print("\n원소 {} 삽입 후의 힙\n", .{val});
    try max_heap.print(mem_allocator);

    // 힙의 루트 원소 꺼내기
    peek = try max_heap.pop();
    std.debug.print("\n루트 원소 {} 삭제 후의 힙\n", .{peek});
    try max_heap.print(mem_allocator);

    // 힙의 크기 조회
    var size = max_heap.size();
    std.debug.print("\n힙의 원소 개수: {}", .{size});

    // 힙이 비어 있는지 판단
    var is_empty = max_heap.isEmpty();
    std.debug.print("\n힙이 비어 있는가: {}\n", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

