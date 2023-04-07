let
    Source = Excel.Workbook(File.Contents("C:\Users\AdriánBíro\Downloads\5 Tables in Excel.xlsx"), null, true),
    Sales_Sheet = Source{[Item="Sales",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Sales_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ProductKey", Int64.Type}, {"OrderDate", type date}, {"CustomerKey", Int64.Type}, {"SalesTerritoryKey", Int64.Type}, {"SalesOrderNumber", type text}, {"SalesOrderLineNumber", Int64.Type}, {"OrderQuantity", Int64.Type}, {"UnitPrice", type number}, {"ExtendedAmount", type number}, {"TotalProductCost", type number}, {"TaxAmt", type number}, {"Freight", type number}, {"RegionMonthID", type text}}),
    #"Sorted Rows" = Table.Buffer(Table.Sort(#"Changed Type",{{"OrderDate", Order.Descending}})),
    #"Removed Duplicates" = Table.Distinct(#"Sorted Rows", {"CustomerKey"}),
    #"Sorted Rows1" = Table.Sort(#"Removed Duplicates",{{"CustomerKey", Order.Ascending}})
in
    #"Sorted Rows1"
