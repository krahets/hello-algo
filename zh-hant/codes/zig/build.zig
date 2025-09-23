// File: build.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

//! Zig Version: 0.14.1
//! Build Command:          zig build
//! Run Command:            zig build run | zig build run_*
//! Test Command:           zig build test | zig build test -Dtest-filter=*

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const chapters = [_][]const u8{
        "chapter_computational_complexity",
        "chapter_array_and_linkedlist",
        "chapter_stack_and_queue",
        "chapter_hashing",
        "chapter_tree",
        "chapter_heap",
        "chapter_searching",
        "chapter_sorting",
        "chapter_dynamic_programming",
    };

    const test_step = b.step("test", "Run unit tests");
    const test_filters = b.option([]const []const u8, "test-filter", "Skip tests that do not match any filter") orelse &[0][]const u8{};

    buildChapterExeModules(b, target, optimize, &chapters, test_step, test_filters);
    buildMainExeModule(b, target, optimize);
}

fn buildChapterExeModules(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    chapter_dirs: []const []const u8,
    test_step: *std.Build.Step,
    test_filters: []const []const u8,
) void {
    for (chapter_dirs) |chapter_dir_name| {
        const chapter_dir_path = std.fs.path.join(b.allocator, &[_][]const u8{chapter_dir_name}) catch continue;
        var chapter_dir = std.fs.cwd().openDir(chapter_dir_path, .{ .iterate = true }) catch continue;
        defer chapter_dir.close();

        var it = chapter_dir.iterate();
        while (it.next() catch continue) |chapter_dir_entry| {
            if (chapter_dir_entry.kind != .file or !std.mem.endsWith(u8, chapter_dir_entry.name, ".zig")) continue;
            const exe_mod = buildExeModuleFromChapterDirEntry(b, target, optimize, chapter_dir_name, chapter_dir_entry) catch continue;
            addTestStepToExeModule(b, test_step, exe_mod, test_filters);
        }
    }
}

fn buildExeModuleFromChapterDirEntry(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    chapter_dir_name: []const u8,
    chapter_dir_entry: std.fs.Dir.Entry,
) !*std.Build.Module {
    const zig_file_path = try std.fs.path.join(b.allocator, &[_][]const u8{ chapter_dir_name, chapter_dir_entry.name });
    const zig_file_name = chapter_dir_entry.name[0 .. chapter_dir_entry.name.len - 4]; // abstract zig file name from xxx.zig

    // 這裡臨時只新增陣列和鏈結串列章節部分，後續修改完後全部放開
    const new_algo_names = [_][]const u8{
        "array",
        "linked_list",
        "list",
        "my_list",
        "iteration",
        "recursion",
        "space_complexity",
        "time_complexity",
        "worst_best_time_complexity",
    };
    var can_run = false;
    for (new_algo_names) |name| {
        if (std.mem.eql(u8, zig_file_name, name)) {
            can_run = true;
        }
    }
    if (!can_run) {
        return error.CanNotRunUseOldZigCodes;
    }

    // std.debug.print("now run zig file name = {s}\n", .{zig_file_name});

    const exe_mod = b.createModule(.{
        .root_source_file = b.path(zig_file_path),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = zig_file_name,
        .root_module = exe_mod,
    });

    const utils_mod = createUtilsModule(b, target, optimize);
    exe_mod.addImport("utils", utils_mod);

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const step_name = try std.fmt.allocPrint(b.allocator, "run_{s}", .{zig_file_name});
    const step_desc = try std.fmt.allocPrint(b.allocator, "Run {s}/{s}.zig", .{ chapter_dir_name, zig_file_name });
    const run_step = b.step(step_name, step_desc);
    run_step.dependOn(&run_cmd.step);

    return exe_mod;
}

fn buildMainExeModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) void {
    const exe_mod = b.createModule(.{
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const utils_mod = createUtilsModule(b, target, optimize);
    exe_mod.addImport("utils", utils_mod);

    const exe = b.addExecutable(.{
        .name = "main",
        .root_module = exe_mod,
    });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run all hello algo zig");
    run_step.dependOn(&run_cmd.step);
}

fn createUtilsModule(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode) *std.Build.Module {
    const utils_mod = b.createModule(.{
        .root_source_file = b.path("utils/utils.zig"),
        .target = target,
        .optimize = optimize,
    });
    return utils_mod;
}

fn addTestStepToExeModule(b: *std.Build, test_step: *std.Build.Step, exe_mod: *std.Build.Module, test_filters: []const []const u8) void {
    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
        .filters = test_filters,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);
    test_step.dependOn(&run_exe_unit_tests.step);
}
