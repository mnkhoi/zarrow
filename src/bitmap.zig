const Bitmap = struct {
    data: [64]u8 align(64) = @splat(0),

    pub fn is_set(self: Bitmap, index: u64) bool {
        return 0b1 == self.data[index / 8] & (1 << (index % 8));
    }

    pub fn set(self: *Bitmap, index: u64) void {
        self.data[index / 8] |= 1 << (index % 8);
    }
};

