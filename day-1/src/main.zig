const std = @import("std");
const split = std.mem.split;
const input = @embedFile("input");

pub fn main() !void {
    var maxCaloriesCarried: usize = 0;
    var inventories = split(u8, input, "\n");

    var currentInventoryCalories: usize = 0;
    while (inventories.next()) |food| {
        var calories: usize = strToInt(food);
        currentInventoryCalories += calories;

        // Inventory change
        if (std.mem.eql(u8, food, "") and currentInventoryCalories > maxCaloriesCarried) {
            maxCaloriesCarried = currentInventoryCalories;
            currentInventoryCalories = 0;
        }
    }

    std.debug.print("{d}\n", .{maxCaloriesCarried});
}

fn strToInt(str: []const u8) usize {
    var int: usize = 0;
    var strLen: usize = str.len;

    var t: usize = 1;
    for (str) |digit| {
        t = std.math.pow(usize, 10, strLen - 1);

        int = int + (digit - 48) * t;
        strLen = strLen - 1;
    }

    return int;
}