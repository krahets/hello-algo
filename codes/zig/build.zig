// File: build.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Zig Version: 0.11.0-dev.3944+2e424e019
// Zig Build Command:  zig build -Doptimize=ReleaseFast
// Zig Run Command:    zig build run_* -Doptimize=ReleaseFast
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const group_name_path = .{
        // Source File: "chapter_computational_complexity/time_complexity.zig"
        // Run Command: zig build run_time_complexity -Doptimize=ReleaseFast
        .{ .name = "time_complexity", .path = "chapter_computational_complexity/time_complexity.zig" },

        // Source File: "chapter_computational_complexity/worst_best_time_complexity.zig"
        // Run Command: zig build run_worst_best_time_complexity -Doptimize=ReleaseFast
        .{ .name = "worst_best_time_complexity", .path = "chapter_computational_complexity/worst_best_time_complexity.zig" },

        // Source File: "chapter_computational_complexity/space_complexity.zig"
        // Run Command: zig build run_space_complexity -Doptimize=ReleaseFast
        .{ .name = "space_complexity", .path = "chapter_computational_complexity/space_complexity.zig" },

        // Source File: "chapter_array_and_linkedlist/array.zig"
        // Run Command: zig build run_array -Doptimize=ReleaseFast
        .{ .name = "array", .path = "chapter_array_and_linkedlist/array.zig" },

        // Source File: "chapter_array_and_linkedlist/linked_list.zig"
        // Run Command: zig build run_linked_list -Doptimize=ReleaseFast
        .{ .name = "linked_list", .path = "chapter_array_and_linkedlist/linked_list.zig" },

        // Source File: "chapter_array_and_linkedlist/list.zig"
        // Run Command: zig build run_list -Doptimize=ReleaseFast
        .{ .name = "list", .path = "chapter_array_and_linkedlist/list.zig" },

        // Source File: "chapter_array_and_linkedlist/my_list.zig"
        // Run Command: zig build run_my_list -Doptimize=ReleaseFast
        .{ .name = "my_list", .path = "chapter_array_and_linkedlist/my_list.zig" },

        // Source File: "chapter_stack_and_queue/stack.zig"
        // Run Command: zig build run_stack -Doptimize=ReleaseFast
        .{ .name = "stack", .path = "chapter_stack_and_queue/stack.zig" },

        // Source File: "chapter_stack_and_queue/linkedlist_stack.zig"
        // Run Command: zig build run_linkedlist_stack -Doptimize=ReleaseFast
        .{ .name = "linkedlist_stack", .path = "chapter_stack_and_queue/linkedlist_stack.zig" },

        // Source File: "chapter_stack_and_queue/array_stack.zig"
        // Run Command: zig build run_array_stack -Doptimize=ReleaseFast
        .{ .name = "array_stack", .path = "chapter_stack_and_queue/array_stack.zig" },

        // Source File: "chapter_stack_and_queue/queue.zig"
        // Run Command: zig build run_queue -Doptimize=ReleaseFast
        .{ .name = "queue", .path = "chapter_stack_and_queue/queue.zig" },

        // Source File: "chapter_stack_and_queue/array_queue.zig"
        // Run Command: zig build run_array_queue -Doptimize=ReleaseFast
        .{ .name = "array_queue", .path = "chapter_stack_and_queue/array_queue.zig" },

        // Source File: "chapter_stack_and_queue/linkedlist_queue.zig"
        // Run Command: zig build run_linkedlist_queue -Doptimize=ReleaseFast
        .{ .name = "linkedlist_queue", .path = "chapter_stack_and_queue/linkedlist_queue.zig" },

        // Source File: "chapter_stack_and_queue/deque.zig"
        // Run Command: zig build run_deque -Doptimize=ReleaseFast
        .{ .name = "deque", .path = "chapter_stack_and_queue/deque.zig" },

        // Source File: "chapter_stack_and_queue/linkedlist_deque.zig"
        // Run Command: zig build run_linkedlist_deque -Doptimize=ReleaseFast
        .{ .name = "linkedlist_deque", .path = "chapter_stack_and_queue/linkedlist_deque.zig" },

        // Source File: "chapter_hashing/hash_map.zig"
        // Run Command: zig build run_hash_map -Doptimize=ReleaseFast
        .{ .name = "hash_map", .path = "chapter_hashing/hash_map.zig" },

        // Source File: "chapter_hashing/array_hash_map.zig"
        // Run Command: zig build run_array_hash_map -Doptimize=ReleaseFast
        .{ .name = "array_hash_map", .path = "chapter_hashing/array_hash_map.zig" },

        // Source File: "chapter_tree/binary_tree.zig"
        // Run Command: zig build run_binary_tree -Doptimize=ReleaseFast
        .{ .name = "binary_tree", .path = "chapter_tree/binary_tree.zig" },

        // Source File: "chapter_tree/binary_tree_bfs.zig"
        // Run Command: zig build run_binary_tree_bfs -Doptimize=ReleaseFast
        .{ .name = "binary_tree_bfs", .path = "chapter_tree/binary_tree_bfs.zig" },

        // Source File: "chapter_tree/binary_tree_dfs.zig"
        // Run Command: zig build run_binary_tree_dfs -Doptimize=ReleaseFast
        .{ .name = "binary_tree_dfs", .path = "chapter_tree/binary_tree_dfs.zig" },

        // Source File: "chapter_tree/binary_search_tree.zig"
        // Run Command: zig build run_binary_search_tree -Doptimize=ReleaseFast
        .{ .name = "binary_search_tree", .path = "chapter_tree/binary_search_tree.zig" },

        // Source File: "chapter_tree/avl_tree.zig"
        // Run Command: zig build run_avl_tree -Doptimize=ReleaseFast
        .{ .name = "avl_tree", .path = "chapter_tree/avl_tree.zig" },

        // Source File: "chapter_heap/heap.zig"
        // Run Command: zig build run_heap -Doptimize=ReleaseFast
        .{ .name = "heap", .path = "chapter_heap/heap.zig" },

        // Source File: "chapter_heap/my_heap.zig"
        // Run Command: zig build run_my_heap -Doptimize=ReleaseFast
        .{ .name = "my_heap", .path = "chapter_heap/my_heap.zig" },

        // Source File: "chapter_searching/linear_search.zig"
        // Run Command: zig build run_linear_search -Doptimize=ReleaseFast
        .{ .name = "linear_search", .path = "chapter_searching/linear_search.zig" },

        // Source File: "chapter_searching/binary_search.zig"
        // Run Command: zig build run_binary_search -Doptimize=ReleaseFast
        .{ .name = "binary_search", .path = "chapter_searching/binary_search.zig" },

        // Source File: "chapter_searching/hashing_search.zig"
        // Run Command: zig build run_hashing_search -Doptimize=ReleaseFast
        .{ .name = "hashing_search", .path = "chapter_searching/hashing_search.zig" },

        // Source File: "chapter_searching/two_sum.zig"
        // Run Command: zig build run_two_sum -Doptimize=ReleaseFast
        .{ .name = "two_sum", .path = "chapter_searching/two_sum.zig" },

        // Source File: "chapter_sorting/bubble_sort.zig"
        // Run Command: zig build run_bubble_sort -Doptimize=ReleaseFast
        .{ .name = "bubble_sort", .path = "chapter_sorting/bubble_sort.zig" },

        // Source File: "chapter_sorting/insertion_sort.zig"
        // Run Command: zig build run_insertion_sort -Doptimize=ReleaseFast
        .{ .name = "insertion_sort", .path = "chapter_sorting/insertion_sort.zig" },

        // Source File: "chapter_sorting/quick_sort.zig"
        // Run Command: zig build run_quick_sort -Doptimize=ReleaseFast
        .{ .name = "quick_sort", .path = "chapter_sorting/quick_sort.zig" },

        // Source File: "chapter_sorting/merge_sort.zig"
        // Run Command: zig build run_merge_sort -Doptimize=ReleaseFast
        .{ .name = "merge_sort", .path = "chapter_sorting/merge_sort.zig" },

        // Source File: "chapter_sorting/radix_sort.zig"
        // Run Command: zig build run_radix_sort -Doptimize=ReleaseFast
        .{ .name = "radix_sort", .path = "chapter_sorting/radix_sort.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_backtrack.zig"
        // Run Command: zig build run_climbing_stairs_backtrack -Doptimize=ReleaseFast
        .{ .name = "climbing_stairs_backtrack", .path = "chapter_dynamic_programming/climbing_stairs_backtrack.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_constraint_dp.zig"
        // Run Command: zig build run_climbing_stairs_constraint_dp -Doptimize=ReleaseFast
        .{ .name = "climbing_stairs_constraint_dp", .path = "chapter_dynamic_programming/climbing_stairs_constraint_dp.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_dfs_mem.zig"
        // Run Command: zig build run_climbing_stairs_dfs_mem -Doptimize=ReleaseFast
        .{ .name = "climbing_stairs_dfs_mem", .path = "chapter_dynamic_programming/climbing_stairs_dfs_mem.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_dfs.zig"
        // Run Command: zig build run_climbing_stairs_dfs -Doptimize=ReleaseFast
        .{ .name = "climbing_stairs_dfs", .path = "chapter_dynamic_programming/climbing_stairs_dfs.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_dp.zig"
        // Run Command: zig build run_climbing_stairs_dp -Doptimize=ReleaseFast
        .{ .name = "climbing_stairs_dp", .path = "chapter_dynamic_programming/climbing_stairs_dp.zig" },

        // Source File: "chapter_dynamic_programming/coin_change_ii.zig"
        // Run Command: zig build run_coin_change_ii -Doptimize=ReleaseFast
        .{ .name = "coin_change_ii", .path = "chapter_dynamic_programming/coin_change_ii.zig" },

        // Source File: "chapter_dynamic_programming/coin_change.zig"
        // Run Command: zig build run_coin_change -Doptimize=ReleaseFast
        .{ .name = "coin_change", .path = "chapter_dynamic_programming/coin_change.zig" },

        // Source File: "chapter_dynamic_programming/edit_distance.zig"
        // Run Command: zig build run_edit_distance -Doptimize=ReleaseFast
        .{ .name = "edit_distance", .path = "chapter_dynamic_programming/edit_distance.zig" },

        // Source File: "chapter_dynamic_programming/knapsack.zig"
        // Run Command: zig build run_knapsack -Doptimize=ReleaseFast
        .{ .name = "knapsack", .path = "chapter_dynamic_programming/knapsack.zig" },

        // Source File: "chapter_dynamic_programming/min_cost_climbing_stairs_dp.zig"
        // Run Command: zig build run_min_cost_climbing_stairs_dp -Doptimize=ReleaseFast
        .{ .name = "min_cost_climbing_stairs_dp", .path = "chapter_dynamic_programming/min_cost_climbing_stairs_dp.zig" },

        // Source File: "chapter_dynamic_programming/min_path_sum.zig"
        // Run Command: zig build run_min_path_sum -Doptimize=ReleaseFast
        .{ .name = "min_path_sum", .path = "chapter_dynamic_programming/min_path_sum.zig" },

        // Source File: "chapter_dynamic_programming/unbounded_knapsack.zig"
        // Run Command: zig build run_unbounded_knapsack -Doptimize=ReleaseFast
        .{ .name = "unbounded_knapsack", .path = "chapter_dynamic_programming/unbounded_knapsack.zig" },
    };

    inline for (group_name_path) |name_path| {
        const exe = b.addExecutable(.{
            .name = name_path.name,
            .root_source_file = .{ .path = name_path.path },
            .target = target,
            .optimize = optimize,
        });
        exe.addModule("include", b.addModule("", .{
            .source_file = .{ .path = "include/include.zig" },
        }));
        b.installArtifact(exe);
        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd.addArgs(args);
        const run_step = b.step("run_" ++ name_path.name, "Run the app");
        run_step.dependOn(&run_cmd.step);
    }
}
