Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Sequence Store"
$form.Width = 800
$form.Height = 500
$form.StartPosition = "CenterScreen"

$label = New-Object System.Windows.Forms.Label
$label.Text = "SEQUENCE STORE"
$label.AutoSize = $true
$label.Font = New-Object System.Drawing.Font("Segoe UI",20,[System.Drawing.FontStyle]::Bold)
$label.Location = New-Object System.Drawing.Point(20,20)

$button = New-Object System.Windows.Forms.Button
$button.Text = "ตรวจสอบ FiveM"
$button.Width = 200
$button.Height = 40
$button.Location = New-Object System.Drawing.Point(20,80)

$log = New-Object System.Windows.Forms.TextBox
$log.Multiline = $true
$log.ScrollBars = "Vertical"
$log.Width = 740
$log.Height = 300
$log.Location = New-Object System.Drawing.Point(20,140)

$button.Add_Click({
$FiveMPath = Join-Path $env:LOCALAPPDATA "FiveM"

```
if (Test-Path $FiveMPath) {
    $log.AppendText("[OK] พบ FiveM : $FiveMPath`r`n")
}
else {
    $log.AppendText("[ERROR] ไม่พบ FiveM`r`n")
}
```

})

$form.Controls.Add($label)
$form.Controls.Add($button)
$form.Controls.Add($log)

[void]$form.ShowDialog()
