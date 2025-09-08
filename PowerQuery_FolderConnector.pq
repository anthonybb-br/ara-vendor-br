
let
    OutputFolder = Folder.Files("C:\caminho\para\ara_vendor_br_starter_kit_v2\output"),
    GetTable = (prefix as text) as table =>
        let
            F = Table.SelectRows(OutputFolder, each Text.StartsWith([Name], prefix & "_") and Text.EndsWith([Name], ".json")),
            J = Table.AddColumn(F, "Json", each Json.Document([Content])),
            E = Table.TransformColumns(J, {{"Json", Json.Document}}),
            R = Table.FromRecords(List.Transform(E[Json], (j) => j))
        in R,
    Sales = GetTable("sales"),
    Traffic = GetTable("traffic"),
    Inventory = GetTable("inventory"),
    Forecast = GetTable("forecast"),
    NetPPM = GetTable("netppm")
in
    [Sales=Sales, Traffic=Traffic, Inventory=Inventory, Forecast=Forecast, NetPPM=NetPPM]
