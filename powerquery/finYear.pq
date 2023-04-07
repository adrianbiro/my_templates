//Fin Year July to June
let
    Source = List.Dates(StartDate, Length, #duration(1, 0, 0, 0)),
    #"Converted to Table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "Date"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"Date", type date}}),
    StartDate = #date(2023, 1, 1),
    Today = DateTime.Date(DateTime.LocalNow()),
    Length = Duration.Days(Today - StartDate),
    Custom1 = #"Changed Type",
    #"Inserted Year" = Table.AddColumn(Custom1, "Fin Year", each Date.Year([Date]+#duration(184,0,0,0)), Int64.Type),
    #"Inserted Month Name" = Table.AddColumn(#"Inserted Year", "Month Name", each Date.MonthName([Date]), type text),
    #"Inserted Day Name" = Table.AddColumn(#"Inserted Month Name", "Day Name", each Date.DayOfWeekName([Date]), type text),
    #"Inserted Month" = Table.AddColumn(#"Inserted Day Name", "Fin Month", each if Date.Month([Date]) >=7 then Date.Month([Date])-6 else Date.Month([Date])+6  , Int64.Type),
    #"Inserted Day of Week" = Table.AddColumn(#"Inserted Month", "Day of Week", each Date.DayOfWeek(([Date]), Day.Sunday)+1, Int64.Type),
    #"Inserted First Characters" = Table.AddColumn(#"Inserted Day of Week", "MMM", each Text.Start([Month Name], 3), type text),
    #"Inserted First Characters1" = Table.AddColumn(#"Inserted First Characters", "DDD", each Text.Start([Day Name], 3), type text),
    #"Reordered Columns" = Table.ReorderColumns(#"Inserted First Characters1",{"Date", "Fin Year", "Month Name", "MMM", "Fin Month", "Day Name", "DDD", "Day of Week"}),
    #"Added Custom" = Table.AddColumn(#"Reordered Columns", "FYMM", each ([Fin Year]-2000)*100 + [Fin Month]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Added Custom",{{"FYMM", Int64.Type}}),
    #"Added Custom1" = Table.AddColumn(#"Changed Type1", "MonthID", each (Date.Year([Date]) - Date.Year(StartDate))*12 + Date.Month([Date])),
    #"Changed Type2" = Table.TransformColumnTypes(#"Added Custom1",{{"MonthID", Int64.Type}})
in
    #"Changed Type2"

