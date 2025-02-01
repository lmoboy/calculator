const std = @import("std");

pub fn sCin(allocator: std.mem.Allocator) ![]u8 {
    const reader = std.io.getStdIn().reader();
    var input = try reader.readUntilDelimiterAlloc(allocator, '\n', std.math.maxInt(usize));
    input = input[0 .. input.len - 1];
    return input;
}

pub fn cCin(allocator: std.mem.Allocator) !u8 {
    const input = try sCin(allocator);
    return input[0];
}

pub fn nCin(allocator: std.mem.Allocator) !f32 {
    const input = try sCin(allocator);
    return try std.fmt.parseInt(i32, input, 10);
}

pub fn fCin(allocator: std.mem.Allocator) !f32 {
    const input = try sCin(allocator);
    return try std.fmt.parseFloat(f32, input);
}
