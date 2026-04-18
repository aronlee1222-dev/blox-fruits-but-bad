$b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\Users\blaze\.gemini\antigravity\scratch\bloxfruits\sprites\player_swordsman.png'))
$html = [IO.File]::ReadAllText('C:\Users\blaze\.gemini\antigravity\scratch\bloxfruits\index.html')
$html = $html.Replace('/sprites/player_swordsman.png', 'data:image/png;base64,' + $b64)
[IO.File]::WriteAllText('C:\Users\blaze\.gemini\antigravity\scratch\bloxfruits\index.html', $html)
