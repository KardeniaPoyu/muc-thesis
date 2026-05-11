Add-Type -AssemblyName System.Drawing
$f = New-Object System.Drawing.Text.PrivateFontCollection
$f.AddFontFile('FZXBSJW.ttf')
$f.Families[0].Name
