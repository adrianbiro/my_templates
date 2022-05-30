#!/usr/bin/awk -f
function date_time(format){
    switch (format) {
        case "date" :
            format_var = strftime( "%Y-%m-%d", systime())
            break
        case "time" :
            format_var = strftime( "%H:%M:%S", systime())
            break
        case "date_time" :
            format_var = strftime( "%Y-%m-%d_%H:%M:%S", systime())
            break
        case "date time" :
            format_var = strftime( "%Y-%m-%d %H:%M:%S", systime())
            break
    }
    return format_var
}

# BEGIN {
#     print "date", date_time("date");
#     print "time", date_time("time");
#     print "date_time", date_time("date_time");
#     print "date time", date_time("date time");
#     }

# $ awk -f datetime.awk
# date 2022-05-29
# time 16:42:48
# date_time 2022-05-29_16:42:48
# date time 2022-05-29 16:42:48

