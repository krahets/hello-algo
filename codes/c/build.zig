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
        // Source File: "chapter_computational_complexity/time_complexity.c"
        // Run Command: zig build run_time_complexity
        const exe_time_complexity = b.addExecutable("time_complexity", null);
        exe_time_complexity.addCSourceFile("chapter_computational_complexity/time_complexity.c", &[_][]const u8{"-std=c99"});
        exe_time_complexity.linkSystemLibrary("c");
        exe_time_complexity.setTarget(target);
        exe_time_complexity.setBuildMode(mode);
        exe_time_complexity.install();
        const run_cmd_time_complexity = exe_time_complexity.run();
        run_cmd_time_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_time_complexity.addArgs(args);
        const run_step_time_complexity = b.step("run_time_complexity", "Run time_complexity");
        run_step_time_complexity.dependOn(&run_cmd_time_complexity.step);

        // Source File: "chapter_computational_complexity/worst_best_time_complexity.c"
        // Run Command: zig build run_worst_best_time_complexity
        const exe_worst_best_time_complexity = b.addExecutable("worst_best_time_complexity", null);
        exe_worst_best_time_complexity.addCSourceFile("chapter_computational_complexity/worst_best_time_complexity.c", &[_][]const u8{"-std=c99"});
        exe_worst_best_time_complexity.linkSystemLibrary("c");
        exe_worst_best_time_complexity.setTarget(target);
        exe_worst_best_time_complexity.setBuildMode(mode);
        exe_worst_best_time_complexity.install();
        const run_cmd_worst_best_time_complexity = exe_worst_best_time_complexity.run();
        run_cmd_worst_best_time_complexity.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_worst_best_time_complexity.addArgs(args);
        const run_step_worst_best_time_complexity = b.step("run_worst_best_time_complexity", "Run worst_best_time_complexity");
        run_step_worst_best_time_complexity.dependOn(&run_cmd_worst_best_time_complexity.step);

    // Section: "Array"
        // Source File: "chapter_array_and_linkedlist/array.c"
        // Run Command: zig build run_array
        const exe_array = b.addExecutable("array", null);
        exe_array.addCSourceFile("chapter_array_and_linkedlist/array.c", &[_][]const u8{"-std=c99"});
        exe_array.linkSystemLibrary("c");
        exe_array.setTarget(target);
        exe_array.setBuildMode(mode);
        exe_array.install();
        const run_cmd_array = exe_array.run();
        run_cmd_array.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_array.addArgs(args);
        const run_step_array = b.step("run_array", "Run array");
        run_step_array.dependOn(&run_cmd_array.step);

    // Section: "Bubble Sort"
        // Source File: "chapter_sorting/bubble_sort.c"
        // Run Command: zig build run_bubble_sort
        const exe_bubble_sort = b.addExecutable("bubble_sort", null);
        exe_bubble_sort.addCSourceFile("chapter_sorting/bubble_sort.c", &[_][]const u8{"-std=c99"});
        exe_bubble_sort.linkSystemLibrary("c");
        exe_bubble_sort.setTarget(target);
        exe_bubble_sort.setBuildMode(mode);
        exe_bubble_sort.install();
        const run_cmd_bubble_sort = exe_bubble_sort.run();
        run_cmd_bubble_sort.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_bubble_sort.addArgs(args);
        const run_step_bubble_sort = b.step("run_bubble_sort", "Run bubble_sort");
        run_step_bubble_sort.dependOn(&run_cmd_bubble_sort.step);

    // Section: "Insertion Sort"
        // Source File: "chapter_sorting/insertion_sort.c"
        // Run Command: zig build run_insertion_sort
        const exe_insertion_sort = b.addExecutable("insertion_sort", null);
        exe_insertion_sort.addCSourceFile("chapter_sorting/insertion_sort.c", &[_][]const u8{"-std=c99"});
        exe_insertion_sort.linkSystemLibrary("c");
        exe_insertion_sort.setTarget(target);
        exe_insertion_sort.setBuildMode(mode);
        exe_insertion_sort.install();
        const run_cmd_insertion_sort = exe_insertion_sort.run();
        run_cmd_insertion_sort.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_insertion_sort.addArgs(args);
        const run_step_insertion_sort = b.step("run_insertion_sort", "Run insertion_sort");
        run_step_insertion_sort.dependOn(&run_cmd_insertion_sort.step);

    // Section: "Binary Tree"
        // Source File: "chapter_tree/binary_tree.c"
        // Run Command: zig build run_binary_tree
        const exe_binary_tree = b.addExecutable("binary_tree", null);
        exe_binary_tree.addCSourceFile("chapter_tree/binary_tree.c", &[_][]const u8{"-std=c99"});
        exe_binary_tree.linkSystemLibrary("c");
        exe_binary_tree.setTarget(target);
        exe_binary_tree.setBuildMode(mode);
        exe_binary_tree.install();
        const run_cmd_binary_tree = exe_binary_tree.run();
        run_cmd_binary_tree.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_binary_tree.addArgs(args);
        const run_step_binary_tree = b.step("run_binary_tree", "Run binary_tree");
        run_step_binary_tree.dependOn(&run_cmd_binary_tree.step);

    // Section: "Binary Tree Types"
        // Source File: "chapter_tree/binary_tree_bfs.c"
        // Run Command: zig build run_binary_tree_bfs
        const exe_binary_tree_bfs = b.addExecutable("binary_tree_bfs", null);
        exe_binary_tree_bfs.addCSourceFile("chapter_tree/binary_tree_bfs.c", &[_][]const u8{"-std=c99"});
        exe_binary_tree_bfs.linkSystemLibrary("c");
        exe_binary_tree_bfs.setTarget(target);
        exe_binary_tree_bfs.setBuildMode(mode);
        exe_binary_tree_bfs.install();
        const run_cmd_binary_tree_bfs = exe_binary_tree_bfs.run();
        run_cmd_binary_tree_bfs.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_binary_tree_bfs.addArgs(args);
        const run_step_binary_tree_bfs = b.step("run_binary_tree_bfs", "Run binary_tree_bfs");
        run_step_binary_tree_bfs.dependOn(&run_cmd_binary_tree_bfs.step);

        // Source File: "chapter_tree/binary_tree_dfs.c"
        // Run Command: zig build run_binary_tree_dfs
        const exe_binary_tree_dfs = b.addExecutable("binary_tree_dfs", null);
        exe_binary_tree_dfs.addCSourceFile("chapter_tree/binary_tree_dfs.c", &[_][]const u8{"-std=c99"});
        exe_binary_tree_dfs.linkSystemLibrary("c");
        exe_binary_tree_dfs.setTarget(target);
        exe_binary_tree_dfs.setBuildMode(mode);
        exe_binary_tree_dfs.install();
        const run_cmd_binary_tree_dfs = exe_binary_tree_dfs.run();
        run_cmd_binary_tree_dfs.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd_binary_tree_dfs.addArgs(args);
        const run_step_binary_tree_dfs = b.step("run_binary_tree_dfs", "Run binary_tree_bfs");
        run_step_binary_tree_dfs.dependOn(&run_cmd_binary_tree_dfs.step);

    // // Section: "Binary Search Tree"
    //     // Source File: "chapter_tree/binary_search_tree.c"
    //     // Run Command: zig build run_binary_search_tree
    //     const exe_binary_search_tree = b.addExecutable("binary_search_tree", null);
    //     exe_binary_search_tree.addCSourceFile("chapter_tree/binary_search_tree.c", &[_][]const u8{"-std=c99"});
    //     exe_binary_search_tree.linkSystemLibrary("c");
    //     exe_binary_search_tree.setTarget(target);
    //     exe_binary_search_tree.setBuildMode(mode);
    //     exe_binary_search_tree.install();
    //     const run_cmd_exe_binary_search_tree = exe_binary_search_tree.run();
    //     run_cmd_exe_binary_search_tree.step.dependOn(b.getInstallStep());
    //     if (b.args) |args| run_cmd_exe_binary_search_tree.addArgs(args);
    //     const run_step_binary_search_tree = b.step("run_binary_search_tree", "Run binary_search_tree");
    //     run_step_binary_search_tree.dependOn(&run_cmd_exe_binary_search_tree.step);
}