// File: format.zig
// Created Time: 2025-07-19
// Author: CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const ListNode = @import("ListNode.zig").ListNode;
const TreeNode = @import("TreeNode.zig").TreeNode;

pub fn slice(items: anytype) SliceFormatter(@TypeOf(items)) {
    return .{ .items = items };
}

pub fn SliceFormatter(comptime SliceType: type) type {
    return struct {
        const Self = @This();

        items: SliceType,

        pub fn format(
            self: Self,
            comptime _: []const u8,
            _: std.fmt.FormatOptions,
            writer: anytype,
        ) !void {
            try writer.writeAll("[");

            if (self.items.len > 0) {
                for (self.items, 0..) |item, i| {
                    try std.fmt.format(writer, "{}", .{item});
                    if (i != self.items.len - 1) {
                        try writer.writeAll(", ");
                    }
                }
            }

            try writer.writeAll("]");
        }
    };
}

pub fn linkedList(comptime T: type, head: *const ListNode(T)) LinkedListFormatter(T) {
    return .{ .head = head };
}

pub fn LinkedListFormatter(comptime T: type) type {
    return struct {
        const Self = @This();

        head: *const ListNode(T),

        pub fn format(
            self: Self,
            comptime _: []const u8,
            _: std.fmt.FormatOptions,
            writer: anytype,
        ) !void {
            try printLinkedList(self.head, writer);
        }

        pub fn printLinkedList(head: *const ListNode(T), writer: anytype) !void {
            try std.fmt.format(writer, "{}", .{head.val});
            if (head.next) |next_node| {
                try writer.writeAll("->");
                try printLinkedList(next_node, writer);
            }
        }
    };
}

pub fn tree(comptime T: type, root: ?*const TreeNode(T)) TreeFormatter(T) {
    return .{ .root = root };
}

pub fn TreeFormatter(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*const TreeNode(T),

        pub fn format(
            self: Self,
            comptime _: []const u8,
            _: std.fmt.FormatOptions,
            writer: anytype,
        ) !void {
            try printTree(self.root, null, false, writer);
        }

        // 打印二叉树
        fn printTree(root: ?*const TreeNode(T), prev: ?*Trunk, isRight: bool, writer: anytype) !void {
            if (root == null) {
                return;
            }

            var prev_str = "    ";
            var trunk = Trunk{ .prev = prev, .str = prev_str };

            try printTree(root.?.right, &trunk, true, writer);

            if (prev == null) {
                trunk.str = "———";
            } else if (isRight) {
                trunk.str = "/———";
                prev_str = "   |";
            } else {
                trunk.str = "\\———";
                prev.?.str = prev_str;
            }

            try showTrunks(&trunk, writer);
            try std.fmt.format(writer, "{d}\n", .{root.?.val});

            if (prev) |_| {
                prev.?.str = prev_str;
            }
            trunk.str = "   |";

            try printTree(root.?.left, &trunk, false, writer);
        }

        // 打印二叉树
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

        pub fn showTrunks(p: ?*Trunk, writer: anytype) !void {
            if (p == null) return;
            try showTrunks(p.?.prev, writer);
            try std.fmt.format(writer, "{s}", .{p.?.str});
        }
    };
}
