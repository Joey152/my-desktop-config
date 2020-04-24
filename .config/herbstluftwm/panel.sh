#!/bin/bash

hc() {
    herbstclient "$@"
}

monitor=${1:-0}
bar_offset=$(herbstclient list_monitors | grep "^$monitor" | cut -d" " -f2 | tr "x" "+" | cut -d"+" -f3)
bar_width=$(herbstclient list_monitors | grep "^$monitor" | cut -d" " -f2 | tr "x" "+" | cut -d"+" -f1)
bar_height="25"
font="-misc-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-iso8859-16"
default_f="%{F#ebdbb2}"
default_b="%{B#272727}"
inverted_f="%{F#272727}"
inverted_b="%{B#ebdbb2}"
blue_f="%{F#448488}"
magenta_f="%{F#b16185}"
orange_f="%{F#d79920}"

hc pad $monitor $bar_height

hc -i |
while read line; do
    tag_status=$(hc tag_status $monitor | tr -d '[:space:]')
    tags=""
    for (( i=0; i<${#tag_status}; i+=2 )); do
        case ${tag_status:$i:1} in
            .)
                # empty
                tags+="$default_f$default_b"
                ;;
            :)
                # not empty
                tags+="$blue_f$default_b"
                ;;
            +)
                # viewed on monitor, not focused
                tags+="$inverted_f$inverted_b"
                ;;
            \#)
                # viewed on monitor, focused
                tags+="$inverted_f$inverted_b"
                ;;
            -)
                # viewed on different monitor, not focused
                tags+="$magenta_f$default_b"
                ;;
            %)
                # viewed on different monitor, focused
                tags+="$magenta_f$default_b"
                ;;
            !)
                # urgent
                tags+="$orange_f$default_b"
                ;;
        esac
        tags+=" ${tag_status:$((i+1)):1} "
    done

    date=$(date +"%a %d/%m/%y %I:%M%p")

    echo "%{l}$tags$default_f$default_b%{r}$date $default_f$default_b"
done | lemonbar -g "${bar_width}x$bar_height+$bar_offset+" -f "$font"

# while true; do
#     herbstclient emit_hook REFRESH_PANEL BIG
#     for i in {1..10}; do
#         herbstclient emit_hook REFRESH_PANEL SMALL
#     done
# done

