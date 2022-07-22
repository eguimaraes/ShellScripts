$parameters = @{
    Name = "Y"
    PSProvider = "FileSystem"
    Root = "\\\"
    Description = "DiscoNovo"
}
New-PSDrive @parameters
