//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const Io = std.Io;

// We are going to work with 64 bit aligned implementation

const Bitmap = struct {
    data: [64]u8 align(64) = @splat(0),

    pub fn is_set(self: Bitmap, index: u64) bool {
        return 0b1 == self.data[index / 8] & (1 << (index % 8));
    }

    pub fn set(self: *Bitmap, index: u64) void {
        self.data[index / 8] |= 1 << (index % 8);
    }
};

const DataType = enum {};

const Metadata = struct { data_type: DataType, length: i64, null_count: i64 };

const FixedSizedPrimitive = struct { metadata: Metadata, validity_bitmap: *Bitmap, value_buffer: *[]u8 };
