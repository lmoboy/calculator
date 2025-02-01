const std = @import("std");
const mem = std.mem; // will be used to compare bytes
const print = std.debug.print;
const sio = @import("sio.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    print("Input first number: ", .{});
    const num = try sio.fCin(allocator);

    print("Input operator(+-/*^): ", .{});
    var operator = try sio.cCin(allocator);

    if (operator != '+' and operator != '-' and operator != '*' and operator != '/' and operator != '^') {
        print("operator: {c} is not valid\n", .{operator});
        operator = '+';
    }

    print("Input second number: ", .{});
    const num2 = try sio.fCin(allocator);
    var result: f32 = 0;
    switch (operator) {
        '+' => {
            result = num + num2;
        },
        '-' => {
            result = num - num2;
        },
        '*' => {
            result = num * num2;
        },
        '/' => {
            result = num / num2;
        },
        '^' => {
            result = std.math.pow(f32, num, num2);
        },
        else => {
            result = 0;
        },
    }

    print("The result is: {d} {c} {d} = {d}\n", .{ num, operator, num2, result });
}
