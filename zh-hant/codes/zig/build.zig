// File: build.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Zig Version: 0.11.0
// Zig Build Command:  zig build -Doptimize=ReleaseSafe
// Zig Run Command:    zig build run_* -Doptimize=ReleaseSafe
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const group_name_path = .{
        // Source File: "chapter_computational_complexity/time_complexity.zig"
        // Run Command: zig build run_time_complexity -Doptimize=ReleaseSafe
        .{ .name = "time_complexity", .path = "chapter_computational_complexity/time_complexity.zig" },

        // Source File: "chapter_computational_complexity/worst_best_time_complexity.zig"
        // Run Command: zig build run_worst_best_time_complexity -Doptimize=ReleaseSafe
        .{ .name = "worst_best_time_complexity", .path = "chapter_computational_complexity/worst_best_time_complexity.zig" },

        // Source File: "chapter_computational_complexity/space_complexity.zig"
        // Run Command: zig build run_space_complexity -Doptimize=ReleaseSafe
        .{ .name = "space_complexity", .path = "chapter_computational_complexity/space_complexity.zig" },

        // Source File: "chapter_computational_complexity/iteration.zig"
        // Run Command: zig build run_iteration -Doptimize=ReleaseFast
        .{ .name = "iteration", .path = "chapter_computational_complexity/iteration.zig" },

        // Source File: "chapter_computational_complexity/recursion.zig"
        // Run Command: zig build run_recursion -Doptimize=ReleaseFast
        .{ .name = "recursion", .path = "chapter_computational_complexity/recursion.zig" },

        // Source File: "chapter_array_and_linkedlist/array.zig"
        // Run Command: zig build run_array -Doptimize=ReleaseSafe
        .{ .name = "array", .path = "chapter_array_and_linkedlist/array.zig" },

        // Source File: "chapter_array_and_linkedlist/linked_list.zig"
        // Run Command: zig build run_linked_list -Doptimize=ReleaseSafe
        .{ .name = "linked_list", .path = "chapter_array_and_linkedlist/linked_list.zig" },

        // Source File: "chapter_array_and_linkedlist/list.zig"
        // Run Command: zig build run_list -Doptimize=ReleaseSafe
        .{ .name = "list", .path = "chapter_array_and_linkedlist/list.zig" },

        // Source File: "chapter_array_and_linkedlist/my_list.zig"
        // Run Command: zig build run_my_list -Doptimize=ReleaseSafe
        .{ .name = "my_list", .path = "chapter_array_and_linkedlist/my_list.zig" },

        // Source File: "chapter_stack_and_queue/stack.zig"
        // Run Command: zig build run_stack -Doptimize=ReleaseSafe
        .{ .name = "stack", .path = "chapter_stack_and_queue/stack.zig" },

        // Source File: "chapter_stack_and_queue/linkedlist_stack.zig"
        // Run Command: zig build run_linkedlist_stack -Doptimize=ReleaseSafe
        .{ .name = "linkedlist_stack", .path = "chapter_stack_and_queue/linkedlist_stack.zig" },

        // Source File: "chapter_stack_and_queue/array_stack.zig"
        // Run Command: zig build run_array_stack -Doptimize=ReleaseSafe
        .{ .name = "array_stack", .path = "chapter_stack_and_queue/array_stack.zig" },

        // Source File: "chapter_stack_and_queue/queue.zig"
        // Run Command: zig build run_queue -Doptimize=ReleaseSafe
        .{ .name = "queue", .path = "chapter_stack_and_queue/queue.zig" },

        // Source File: "chapter_stack_and_queue/array_queue.zig"
        // Run Command: zig build run_array_queue -Doptimize=ReleaseSafe
        .{ .name = "array_queue", .path = "chapter_stack_and_queue/array_queue.zig" },

        // Source File: "chapter_stack_and_queue/linkedlist_queue.zig"
        // Run Command: zig build run_linkedlist_queue -Doptimize=ReleaseSafe
        .{ .name = "linkedlist_queue", .path = "chapter_stack_and_queue/linkedlist_queue.zig" },

        // Source File: "chapter_stack_and_queue/deque.zig"
        // Run Command: zig build run_deque -Doptimize=ReleaseSafe
        .{ .name = "deque", .path = "chapter_stack_and_queue/deque.zig" },

        // Source File: "chapter_stack_and_queue/linkedlist_deque.zig"
        // Run Command: zig build run_linkedlist_deque -Doptimize=ReleaseSafe
        .{ .name = "linkedlist_deque", .path = "chapter_stack_and_queue/linkedlist_deque.zig" },

        // Source File: "chapter_hashing/hash_map.zig"
        // Run Command: zig build run_hash_map -Doptimize=ReleaseSafe
        .{ .name = "hash_map", .path = "chapter_hashing/hash_map.zig" },

        // Source File: "chapter_hashing/array_hash_map.zig"
        // Run Command: zig build run_array_hash_map -Doptimize=ReleaseSafe
        .{ .name = "array_hash_map", .path = "chapter_hashing/array_hash_map.zig" },

        // Source File: "chapter_tree/binary_tree.zig"
        // Run Command: zig build run_binary_tree -Doptimize=ReleaseSafe
        .{ .name = "binary_tree", .path = "chapter_tree/binary_tree.zig" },

        // Source File: "chapter_tree/binary_tree_bfs.zig"
        // Run Command: zig build run_binary_tree_bfs -Doptimize=ReleaseSafe
        .{ .name = "binary_tree_bfs", .path = "chapter_tree/binary_tree_bfs.zig" },

        // Source File: "chapter_tree/binary_tree_dfs.zig"
        // Run Command: zig build run_binary_tree_dfs -Doptimize=ReleaseSafe
        .{ .name = "binary_tree_dfs", .path = "chapter_tree/binary_tree_dfs.zig" },

        // Source File: "chapter_tree/binary_search_tree.zig"
        // Run Command: zig build run_binary_search_tree -Doptimize=ReleaseSafe
        .{ .name = "binary_search_tree", .path = "chapter_tree/binary_search_tree.zig" },

        // Source File: "chapter_tree/avl_tree.zig"
        // Run Command: zig build run_avl_tree -Doptimize=ReleaseSafe
        .{ .name = "avl_tree", .path = "chapter_tree/avl_tree.zig" },

        // Source File: "chapter_heap/heap.zig"
        // Run Command: zig build run_heap -Doptimize=ReleaseSafe
        .{ .name = "heap", .path = "chapter_heap/heap.zig" },

        // Source File: "chapter_heap/my_heap.zig"
        // Run Command: zig build run_my_heap -Doptimize=ReleaseSafe
        .{ .name = "my_heap", .path = "chapter_heap/my_heap.zig" },

        // Source File: "chapter_searching/linear_search.zig"
        // Run Command: zig build run_linear_search -Doptimize=ReleaseSafe
        .{ .name = "linear_search", .path = "chapter_searching/linear_search.zig" },

        // Source File: "chapter_searching/binary_search.zig"
        // Run Command: zig build run_binary_search -Doptimize=ReleaseSafe
        .{ .name = "binary_search", .path = "chapter_searching/binary_search.zig" },

        // Source File: "chapter_searching/hashing_search.zig"
        // Run Command: zig build run_hashing_search -Doptimize=ReleaseSafe
        .{ .name = "hashing_search", .path = "chapter_searching/hashing_search.zig" },

        // Source File: "chapter_searching/two_sum.zig"
        // Run Command: zig build run_two_sum -Doptimize=ReleaseSafe
        .{ .name = "two_sum", .path = "chapter_searching/two_sum.zig" },

        // Source File: "chapter_sorting/bubble_sort.zig"
        // Run Command: zig build run_bubble_sort -Doptimize=ReleaseSafe
        .{ .name = "bubble_sort", .path = "chapter_sorting/bubble_sort.zig" },

        // Source File: "chapter_sorting/insertion_sort.zig"
        // Run Command: zig build run_insertion_sort -Doptimize=ReleaseSafe
        .{ .name = "insertion_sort", .path = "chapter_sorting/insertion_sort.zig" },

        // Source File: "chapter_sorting/quick_sort.zig"
        // Run Command: zig build run_quick_sort -Doptimize=ReleaseSafe
        .{ .name = "quick_sort", .path = "chapter_sorting/quick_sort.zig" },

        // Source File: "chapter_sorting/merge_sort.zig"
        // Run Command: zig build run_merge_sort -Doptimize=ReleaseSafe
        .{ .name = "merge_sort", .path = "chapter_sorting/merge_sort.zig" },

        // Source File: "chapter_sorting/radix_sort.zig"
        // Run Command: zig build run_radix_sort -Doptimize=ReleaseSafe
        .{ .name = "radix_sort", .path = "chapter_sorting/radix_sort.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_backtrack.zig"
        // Run Command: zig build run_climbing_stairs_backtrack -Doptimize=ReleaseSafe
        .{ .name = "climbing_stairs_backtrack", .path = "chapter_dynamic_programming/climbing_stairs_backtrack.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_constraint_dp.zig"
        // Run Command: zig build run_climbing_stairs_constraint_dp -Doptimize=ReleaseSafe
        .{ .name = "climbing_stairs_constraint_dp", .path = "chapter_dynamic_programming/climbing_stairs_constraint_dp.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_dfs_mem.zig"
        // Run Command: zig build run_climbing_stairs_dfs_mem -Doptimize=ReleaseSafe
        .{ .name = "climbing_stairs_dfs_mem", .path = "chapter_dynamic_programming/climbing_stairs_dfs_mem.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_dfs.zig"
        // Run Command: zig build run_climbing_stairs_dfs -Doptimize=ReleaseSafe
        .{ .name = "climbing_stairs_dfs", .path = "chapter_dynamic_programming/climbing_stairs_dfs.zig" },

        // Source File: "chapter_dynamic_programming/climbing_stairs_dp.zig"
        // Run Command: zig build run_climbing_stairs_dp -Doptimize=ReleaseSafe
        .{ .name = "climbing_stairs_dp", .path = "chapter_dynamic_programming/climbing_stairs_dp.zig" },

        // Source File: "chapter_dynamic_programming/coin_change_ii.zig"
        // Run Command: zig build run_coin_change_ii -Doptimize=ReleaseSafe
        .{ .name = "coin_change_ii", .path = "chapter_dynamic_programming/coin_change_ii.zig" },

        // Source File: "chapter_dynamic_programming/coin_change.zig"
        // Run Command: zig build run_coin_change -Doptimize=ReleaseSafe
        .{ .name = "coin_change", .path = "chapter_dynamic_programming/coin_change.zig" },

        // Source File: "chapter_dynamic_programming/edit_distance.zig"
        // Run Command: zig build run_edit_distance -Doptimize=ReleaseSafe
        .{ .name = "edit_distance", .path = "chapter_dynamic_programming/edit_distance.zig" },

        // Source File: "chapter_dynamic_programming/knapsack.zig"
        // Run Command: zig build run_knapsack -Doptimize=ReleaseSafe
        .{ .name = "knapsack", .path = "chapter_dynamic_programming/knapsack.zig" },

        // Source File: "chapter_dynamic_programming/min_cost_climbing_stairs_dp.zig"
        // Run Command: zig build run_min_cost_climbing_stairs_dp -Doptimize=ReleaseSafe
        .{ .name = "min_cost_climbing_stairs_dp", .path = "chapter_dynamic_programming/min_cost_climbing_stairs_dp.zig" },

        // Source File: "chapter_dynamic_programming/min_path_sum.zig"
        // Run Command: zig build run_min_path_sum -Doptimize=ReleaseSafe
        .{ .name = "min_path_sum", .path = "chapter_dynamic_programming/min_path_sum.zig" },

        // Source File: "chapter_dynamic_programming/unbounded_knapsack.zig"
        // Run Command: zig build run_unbounded_knapsack -Doptimize=ReleaseSafe
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
