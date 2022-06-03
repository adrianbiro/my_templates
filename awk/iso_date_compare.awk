BEGIN {
    date_column=1
    lowestYear = 9999
    lowestMonth = 99
    lowestDay = 99
    name = ""
}

{
    split($date_column, date, "-")
    if (date[1] < lowestYear) {
        lowestYear = date[1]
        lowestMonth = date[2]
        lowestDay = date[3]
    }
    if (date[1] == lowestYear && date[2] < lowestMonth) {
        lowestMonth = date[2]
        lowestDay = date[3]
    }
    if (date[1] == lowestYear && date[2] == lowestMonth && date[3] < lowestDay) {
        lowestDay = date[3]
    }
}

END {
    print lowestYear "-" lowestMonth "-" lowestDay
}

# $ cat datesISO.txt
# 1999-06-08
# 2014-09-08
# 1999-06-07
# 2022-06-03
# 1999-07-08
# 2020-01-20


# $ awk -f iso_date_compare.awk datesISO.txt
# 1999-06-07

