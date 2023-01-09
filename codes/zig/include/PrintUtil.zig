// File: PrintUtil.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const ListNode = @import("ListNode.zig").ListNode;
const TreeNode = @import("TreeNode.zig").TreeNode;

// Print an array
pub fn printArray(comptime T: type, nums: []T) void {
    std.debug.print("[", .{});
    if (nums.len > 0) {
        for (nums) |num, j| {
            std.debug.print("{}{s}", .{num, if (j == nums.len-1) "]\n" else ", " });
        }
    } else {
        std.debug.print("]", .{});
        std.debug.print("\n", .{});
    }
}

// This tree printer is borrowed from TECHIE DELIGHT
// https://www.techiedelight.com/c-program-print-binary-tree/
const Trunk = struct {
    prev: ?*Trunk = null,
    str: []const u8 = undefined,
    
    pub fn init(self: *Trunk, prev: ?*Trunk, str: []const u8) void {
        self.prev = prev;
        self.str = str;
    }
};

// Helper function to print branches of the binary tree
pub fn showTrunks(p: ?*Trunk) void {
    if (p == null) return;
    showTrunks(p.?.prev);
    std.debug.print("{s}", .{p.?.str});
}

// The interface of the tree printer
// Print a binary tree
pub fn printTree(root: ?*TreeNode(i32), prev: ?*Trunk, isLeft: bool) !void {
    if (root == null) {
        return;
    }

    var prev_str = "    ";
    var trunk = Trunk{.prev = prev, .str = prev_str};

    try printTree(root.?.right, &trunk, true);
   
    if (prev == null) {
        trunk.str = "———";
    } else if (isLeft) {
        trunk.str = "/———";
        prev_str = "   |";
    } else {
        trunk.str = "\\———";
        prev.?.str = prev_str;
    }

    showTrunks(&trunk);
    std.debug.print(" {}\n", .{root.?.val});

    if (prev) |_| {
        prev.?.str = prev_str;
    }
    trunk.str = "   |";

    try printTree(root.?.left, &trunk, false);
}