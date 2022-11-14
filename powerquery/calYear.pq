//Calendar Year
let
    Source = List.Dates(StartDate, Length, #duration(1, 0, 0, 0)),
    #"Converted to Table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "Date"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"Date", type date}}),
    StartDate = #date(2023, 1, 1),
    Today = Date.EndOfYear(DateTime.Date(DateTime.LocalNow())),
    Length = Duration.Days(Today - StartDate),
    Custom1 = #"Changed Type",
    #"Inserted Year" = Table.AddColumn(Custom1, "Year", each Date.Year([Date]), Int64.Type),
    #"Inserted Month Name" = Table.AddColumn(#"Inserted Year", "Month Name", each Date.MonthName([Date]), type text),
    #"Inserted Day Name" = Table.AddColumn(#"Inserted Month Name", "Day Name", each Date.DayOfWeekName([Date]), type text),
    #"Inserted Month" = Table.AddColumn(#"Inserted Day Name", "Month", each Date.Month([Date]), Int64.Type),
    #"Inserted Day of Week" = Table.AddColumn(#"Inserted Month", "Day of Week", each Date.DayOfWeek(([Date]), Day.Sunday)+1, Int64.Type),
    #"Inserted First Characters" = Table.AddColumn(#"Inserted Day of Week", "MMM", each Text.Start([Month Name], 3), type text),
    #"Inserted First Characters1" = Table.AddColumn(#"Inserted First Characters", "DDD", each Text.Start([Day Name], 3), type text),
    #"Reordered Columns" = Table.ReorderColumns(#"Inserted First Characters1",{"Date", "Year", "Month Name", "MMM", "Month", "Day Name", "DDD", "Day of Week"}),
    #"Added Custom" = Table.AddColumn(#"Reordered Columns", "YYMM", each ([Year]-2000)*100 + [Month]),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "MonthID", each (Date.Year([Date]) - Date.Year(StartDate))*12 + Date.Month([Date]))
in
    #"Added Custom1"
