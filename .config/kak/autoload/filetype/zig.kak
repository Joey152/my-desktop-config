hook global BufCreate .*[.]zig %{
    set-option buffer filetype zig
}

# From https://github.com/ziglang/zig.vim/blob/55b690029791022fd7818ebd0ee395e8976899fe/syntax/zig.vim

addhl shared/zig regions
addhl shared/zig/code          default-region                       group
addhl shared/zig/comment-line  region         '//'  '$'             fill comment
addhl shared/zig/double-string region         'c?"' (?<!\\)(\\\\)*" fill string
addhl shared/zig/single-string region         "'"   (?<!\\)(\\\\)*' fill string

addhl shared/zig/code/ regex \b(const|var|extern|packed|export|pub|noalias|inline|noinline|comptime|callconv|volatile|allowzero|align|linksection|threadlocal)\b 0:keyword
addhl shared/zig/code/ regex \b(struct|enum|union|error)\b 0:keyword
addhl shared/zig/code/ regex \b(break|return|continue|asm|defer|errdefer|unreachable|try|catch|async|noasync|await|suspend|resume)\b 0:keyword
addhl shared/zig/code/ regex \b(if|else|switch|and|or|orelse)\b 0:keyword
addhl shared/zig/code/ regex \b(while|for)\b 0:keyword

addhl shared/zig/code/ regex \b(null|undefined)\b 0:value 
addhl shared/zig/code/ regex \b(fn|usingnamespace|test)\b 0:keyword
addhl shared/zig/code/ regex \b(bool|f16|f32|f64|f128|void|noreturn|type|anyerror|anyframe)\b 0:type
addhl shared/zig/code/ regex \b(i0|u0|i8|u8|i16|u16|i32|u32|i64|u64|isize|usize|comptime_int|comptime_float)\b 0:type
addhl shared/zig/code/ regex \b(c_short|c_ushort|c_int|c_uint|c_long|c_ulong|c_longlong|c_ulonglong|c_longdouble|c_void)\b 0:type

addhl shared/zig/code/ regex '(@)(\w+)' 0:meta

# numbers
addhl shared/zig/code/ regex \b[0-9]+(\.[0-9]+)?([eE][-+][0-9]+)?\b 0:value

hook -group zig-highlight global WinSetOption filetype=zig %{ add-highlighter window/ ref zig }
hook -group zig-highlight global WinSetOption filetype=(?!zig).* %{ remove-highlighter window/zig }

