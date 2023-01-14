// File: build.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Zig Version: 0.10.0
// Build Command: zig build
pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    // Section: "Time Complexity"
        // Source File: "chapter_computational_complexity/time_complexity.zig"
        // Run Command: zig build run_time_complexity
        const exe_time_complexity = b.addExecutable("time_complexity", "chapter_computational_complexity/time_complexity.zig");
        exe_time_complexity.addPackagePath("include", "include/include.zig");
        exe_time_complexity.setTarget(target);
        exe_time_complexity.setBuildMode(mode);
        exe_time_complexity.install();
        const run_cmd_time_complexity = exe_time_complexity.run();
        run_cmd_time_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_time_complexity.addArgs(args);
        const run_step_time_complexity = b.step("run_time_complexity", "Run time_complexity");
        run_step_time_complexity.dependOn(&run_cmd_time_complexity.step);

        // Source File: "chapter_computational_complexity/worst_best_time_complexity.zig"
        // Run Command: zig build run_worst_best_time_complexity
        const exe_worst_best_time_complexity = b.addExecutable("worst_best_time_complexity", "chapter_computational_complexity/worst_best_time_complexity.zig");
        exe_worst_best_time_complexity.addPackagePath("include", "include/include.zig");
        exe_worst_best_time_complexity.setTarget(target);
        exe_worst_best_time_complexity.setBuildMode(mode);
        exe_worst_best_time_complexity.install();
        const run_cmd_worst_best_time_complexity = exe_worst_best_time_complexity.run();
        run_cmd_worst_best_time_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_worst_best_time_complexity.addArgs(args);
        const run_step_worst_best_time_complexity = b.step("run_worst_best_time_complexity", "Run worst_best_time_complexity");
        run_step_worst_best_time_complexity.dependOn(&run_cmd_worst_best_time_complexity.step);

    // Section: "Space Complexity"
        // Source File: "chapter_computational_complexity/space_complexity.zig"
        // Run Command: zig build run_space_complexity
        const exe_space_complexity = b.addExecutable("space_complexity", "chapter_computational_complexity/space_complexity.zig");
        exe_space_complexity.addPackagePath("include", "include/include.zig");
        exe_space_complexity.setTarget(target);
        exe_space_complexity.setBuildMode(mode);
        exe_space_complexity.install();
        const run_cmd_space_complexity = exe_space_complexity.run();
        run_cmd_space_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_space_complexity.addArgs(args);
        const run_step_space_complexity = b.step("run_space_complexity", "Run space_complexity");
        run_step_space_complexity.dependOn(&run_cmd_space_complexity.step);

    // Section: "Space Time Tradeoff"
        // Source File: "chapter_computational_complexity/leetcode_two_sum.zig"
        // Run Command: zig build run_leetcode_two_sum
        const exe_leetcode_two_sum = b.addExecutable("leetcode_two_sum", "chapter_computational_complexity/leetcode_two_sum.zig");
        exe_leetcode_two_sum.addPackagePath("include", "include/include.zig");
        exe_leetcode_two_sum.setTarget(target);
        exe_leetcode_two_sum.setBuildMode(mode);
        exe_leetcode_two_sum.install();
        const run_cmd_leetcode_two_sum = exe_leetcode_two_sum.run();
        run_cmd_leetcode_two_sum.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_leetcode_two_sum.addArgs(args);
        const run_step_leetcode_two_sum = b.step("run_leetcode_two_sum", "Run leetcode_two_sum");
        run_step_leetcode_two_sum.dependOn(&run_cmd_leetcode_two_sum.step);

    // Section: "Array"
        // Source File: "chapter_array_and_linkedlist/array.zig"
        // Run Command: zig build run_array
        const exe_array = b.addExecutable("array", "chapter_array_and_linkedlist/array.zig");
        exe_array.addPackagePath("include", "include/include.zig");
        exe_array.setTarget(target);
        exe_array.setBuildMode(mode);
        exe_array.install();
        const run_cmd_array = exe_array.run();
        run_cmd_array.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_array.addArgs(args);
        const run_step_array = b.step("run_array", "Run array");
        run_step_array.dependOn(&run_cmd_array.step);

    // Section: "LinkedList"
        // Source File: "chapter_array_and_linkedlist/linked_list.zig"
        // Run Command: zig build run_linked_list
        const exe_linked_list = b.addExecutable("linked_list", "chapter_array_and_linkedlist/linked_list.zig");
        exe_linked_list.addPackagePath("include", "include/include.zig");
        exe_linked_list.setTarget(target);
        exe_linked_list.setBuildMode(mode);
        exe_linked_list.install();
        const run_cmd_linked_list = exe_linked_list.run();
        run_cmd_linked_list.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_linked_list.addArgs(args);
        const run_step_linked_list = b.step("run_linked_list", "Run linked_list");
        run_step_linked_list.dependOn(&run_cmd_linked_list.step);

    // Section: "List"
        // Source File: "chapter_array_and_linkedlist/list.zig"
        // Run Command: zig build run_list
        const exe_list = b.addExecutable("list", "chapter_array_and_linkedlist/list.zig");
        exe_list.addPackagePath("include", "include/include.zig");
        exe_list.setTarget(target);
        exe_list.setBuildMode(mode);
        exe_list.install();
        const run_cmd_list = exe_list.run();
        run_cmd_list.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_list.addArgs(args);
        const run_step_list = b.step("run_list", "Run list");
        run_step_list.dependOn(&run_cmd_list.step);

        // Source File: "chapter_array_and_linkedlist/my_list.zig"
        // Run Command: zig build run_my_list
        const exe_my_list = b.addExecutable("my_list", "chapter_array_and_linkedlist/my_list.zig");
        exe_my_list.addPackagePath("include", "include/include.zig");
        exe_my_list.setTarget(target);
        exe_my_list.setBuildMode(mode);
        exe_my_list.install();
        const run_cmd_my_list = exe_my_list.run();
        run_cmd_my_list.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_my_list.addArgs(args);
        const run_step_my_list = b.step("run_my_list", "Run my_list");
        run_step_my_list.dependOn(&run_cmd_my_list.step);

    // Section: "Stack"
        // Source File: "chapter_stack_and_queue/stack.zig"
        // Run Command: zig build run_stack
        const exe_stack = b.addExecutable("stack", "chapter_stack_and_queue/stack.zig");
        exe_stack.addPackagePath("include", "include/include.zig");
        exe_stack.setTarget(target);
        exe_stack.setBuildMode(mode);
        exe_stack.install();
        const run_cmd_stack = exe_stack.run();
        run_cmd_stack.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_stack.addArgs(args);
        const run_step_stack = b.step("run_stack", "Run stack");
        run_step_stack.dependOn(&run_cmd_stack.step);

        // Source File: "chapter_stack_and_queue/linkedlist_stack.zig"
        // Run Command: zig build run_linkedlist_stack
        const exe_linkedlist_stack = b.addExecutable("linkedlist_stack", "chapter_stack_and_queue/linkedlist_stack.zig");
        exe_linkedlist_stack.addPackagePath("include", "include/include.zig");
        exe_linkedlist_stack.setTarget(target);
        exe_linkedlist_stack.setBuildMode(mode);
        exe_linkedlist_stack.install();
        const run_cmd_linkedlist_stack = exe_linkedlist_stack.run();
        run_cmd_linkedlist_stack.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_linkedlist_stack.addArgs(args);
        const run_step_linkedlist_stack = b.step("run_linkedlist_stack", "Run linkedlist_stack");
        run_step_linkedlist_stack.dependOn(&run_cmd_linkedlist_stack.step);

        // Source File: "chapter_stack_and_queue/array_stack.zig"
        // Run Command: zig build run_array_stack
        const exe_array_stack = b.addExecutable("array_stack", "chapter_stack_and_queue/array_stack.zig");
        exe_array_stack.addPackagePath("include", "include/include.zig");
        exe_array_stack.setTarget(target);
        exe_array_stack.setBuildMode(mode);
        exe_array_stack.install();
        const run_cmd_array_stack = exe_linkedlist_stack.run();
        run_cmd_array_stack.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_array_stack.addArgs(args);
        const run_step_array_stack = b.step("run_array_stack", "Run array_stack");
        run_step_array_stack.dependOn(&run_cmd_array_stack.step);      

    // Section: "Hash Map"
        // Source File: "chapter_hashing/hash_map.zig"
        // Run Command: zig build run_hash_map
        const exe_hash_map = b.addExecutable("hash_map", "chapter_hashing/hash_map.zig");
        exe_hash_map.addPackagePath("include", "include/include.zig");
        exe_hash_map.setTarget(target);
        exe_hash_map.setBuildMode(mode);
        exe_hash_map.install();
        const run_cmd_hash_map = exe_hash_map.run();
        run_cmd_hash_map.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_hash_map.addArgs(args);
        const run_step_hash_map= b.step("run_hash_map", "Run hash_map");
        run_step_hash_map.dependOn(&run_cmd_hash_map.step);

    // Section: "Binary Tree"
        // Source File: "chapter_tree/binary_tree.zig"
        // Run Command: zig build run_binary_tree
        const exe_binary_tree = b.addExecutable("hash_map", "chapter_tree/binary_tree.zig");
        exe_binary_tree.addPackagePath("include", "include/include.zig");
        exe_binary_tree.setTarget(target);
        exe_binary_tree.setBuildMode(mode);
        exe_binary_tree.install();
        const run_cmd_binary_tree = exe_binary_tree.run();
        run_cmd_binary_tree.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_binary_tree.addArgs(args);
        const run_step_binary_tree= b.step("run_binary_tree", "Run binary_tree");
        run_step_binary_tree.dependOn(&run_cmd_binary_tree.step);
        
    // Section: "Linear Search"
        // Source File: "chapter_searching/linear_search.zig"
        // Run Command: zig build run_linear_search
        const exe_linear_search = b.addExecutable("linear_search", "chapter_searching/linear_search.zig");
        exe_linear_search.addPackagePath("include", "include/include.zig");
        exe_linear_search.setTarget(target);
        exe_linear_search.setBuildMode(mode);
        exe_linear_search.install();
        const run_cmd_linear_search = exe_linear_search.run();
        run_cmd_linear_search.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_linear_search.addArgs(args);
        const run_step_linear_search= b.step("run_linear_search", "Run linear_search");
        run_step_linear_search.dependOn(&run_cmd_linear_search.step);

    // Section: "Bubble Sort"
        // Source File: "chapter_sorting/bubble_sort.zig"
        // Run Command: zig build run_bubble_sort
        const exe_bubble_sort = b.addExecutable("bubble_sort", "chapter_sorting/bubble_sort.zig");
        exe_bubble_sort.addPackagePath("include", "include/include.zig");
        exe_bubble_sort.setTarget(target);
        exe_bubble_sort.setBuildMode(mode);
        exe_bubble_sort.install();
        const run_cmd_bubble_sort = exe_bubble_sort.run();
        run_cmd_bubble_sort.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_bubble_sort.addArgs(args);
        const run_step_bubble_sort = b.step("run_bubble_sort", "Run bubble_sort");
        run_step_bubble_sort.dependOn(&run_cmd_bubble_sort.step);

    // Section: "Insertion Sort"
        // Source File: "chapter_sorting/insertion_sort.zig"
        // Run Command: zig build run_insertion_sort
        const exe_insertion_sort = b.addExecutable("insertion_sort", "chapter_sorting/insertion_sort.zig");
        exe_insertion_sort.addPackagePath("include", "include/include.zig");
        exe_insertion_sort.setTarget(target);
        exe_insertion_sort.setBuildMode(mode);
        exe_insertion_sort.install();
        const run_cmd_insertion_sort = exe_insertion_sort.run();
        run_cmd_insertion_sort.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_insertion_sort.addArgs(args);
        const run_step_insertion_sort = b.step("run_insertion_sort", "Run insertion_sort");
        run_step_insertion_sort.dependOn(&run_cmd_insertion_sort.step);
}
