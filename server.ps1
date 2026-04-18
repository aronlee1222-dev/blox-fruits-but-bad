$port = 8080
$root = "C:\Users\blaze\.gemini\antigravity\scratch\bloxfruits"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Server started at http://localhost:$port/"

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    
    $urlPath = $request.Url.LocalPath
    if ($urlPath -eq "/") { $urlPath = "/index.html" }
    
    $filePath = Join-Path $root $urlPath
    $filePath = $filePath -replace "/", "\"
    
    if (Test-Path $filePath -PathType Leaf) {
        $buffer = [System.IO.File]::ReadAllBytes($filePath)
        $response.ContentLength64 = $buffer.Length
        if ($filePath -match "\.html$") { $response.ContentType = "text/html" }
        elseif ($filePath -match "\.png$") { $response.ContentType = "image/png" }
        elseif ($filePath -match "\.js$") { $response.ContentType = "application/javascript" }
        
        $output = $response.OutputStream
        $output.Write($buffer, 0, $buffer.Length)
        $output.Close()
    } else {
        $response.StatusCode = 404
        $response.Close()
    }
}
