const std = @import("std");

const iteration = @import("chapter_computational_complexity/iteration.zig");
const recursion = @import("chapter_computational_complexity/recursion.zig");
const time_complexity = @import("chapter_computational_complexity/time_complexity.zig");
const space_complexity = @import("chapter_computational_complexity/space_complexity.zig");
const worst_best_time_complexity = @import("chapter_computational_complexity/worst_best_time_complexity.zig");

const array = @import("chapter_array_and_linkedlist/array.zig");
const linked_list = @import("chapter_array_and_linkedlist/linked_list.zig");
const list = @import("chapter_array_and_linkedlist/list.zig");
const my_list = @import("chapter_array_and_linkedlist/my_list.zig");

pub fn main() !void {
    try iteration.run();
    recursion.run();
    time_complexity.run();
    try space_complexity.run();
    worst_best_time_complexity.run();

    try array.run();
    linked_list.run();
    try list.run();
    try my_list.run();
}
