hook global BufCreate .*[.](vert|frag|tesc|tese|geom|comp) %{
    set-option buffer filetype glsl
}



hook -group zig-highlight global WinSetOption filetype=glsl %{ add-highlighter window/ ref glsl }
hook -group zig-highlight global WinSetOption filetype=(?!glsl).* %{ remove-highlighter window/glsl }

