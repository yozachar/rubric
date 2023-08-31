/// Linear Search.
const std = @import("std");
const fmt = std.fmt;

/// Linear Search Function.
fn linear_search(given_sequence: []u8, search_term: []u8) bool {
    const LENGTH_OF_SEARCH_TERM = search_term.len;
    const LENGTH_OF_GIVEN_SEQUQNCE = given_sequence.len;
    var left_cursor: usize = 0;
    var right_cursor = LENGTH_OF_SEARCH_TERM;

    while (right_cursor < LENGTH_OF_GIVEN_SEQUQNCE - 1) : (left_cursor += 1) {
        if (std.mem.eql(u8, given_sequence[left_cursor .. right_cursor + 1], search_term)) {
            return true;
        }
        right_cursor = left_cursor + LENGTH_OF_SEARCH_TERM;
    }
    return false;
}

/// Main.
pub fn main() !void {
    const SAMPLE_INPUT_SEQUENCE = "This is an example sequence.";
    const SAMPLE_INPUT_SEARCH_TERM = "an ex";

    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buffer1: [512]u8 = [_]u8{0} ** 512;
    try stdout.print("Sequence: ", .{});
    var input_sequence = try stdin.readUntilDelimiterOrEof(buffer1[0..], '\n');

    var buffer2: [512]u8 = [_]u8{0} ** 512;
    try stdout.print("Search term: ", .{});
    var input_search_term = try stdin.readUntilDelimiterOrEof(buffer2[0..], '\n');

    var buffer3: [512]u8 = [_]u8{0} ** 512;
    input_sequence = if (input_sequence.?.len == 0) try fmt.bufPrint(&buffer3, "{s}", .{SAMPLE_INPUT_SEQUENCE}) else input_sequence;
    var buffer4: [512]u8 = [_]u8{0} ** 512;
    input_search_term = if (input_search_term.?.len == 0) try fmt.bufPrint(&buffer4, "{s}", .{SAMPLE_INPUT_SEARCH_TERM}) else input_search_term;

    try stdout.print("{}\n", .{linear_search(input_sequence.?, input_search_term.?)});
}
