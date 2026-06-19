Add-Type -AssemblyName PresentationFramework

$FiveMPath = Join-Path $env:LOCALAPPDATA "FiveM"

[xml]$xaml = @" 
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
     Title="Sequence Store"
     Width="900"
     Height="600"
     WindowStartupLocation="CenterScreen"
     Background="#0B1220">

```
<Grid Margin="20">

    <Grid.RowDefinitions>
        <RowDefinition Height="Auto"/>
        <RowDefinition Height="Auto"/>
        <RowDefinition Height="*"/>
    </Grid.RowDefinitions>

    <TextBlock Text="SEQUENCE STORE"
               FontSize="32"
               FontWeight="Bold"
               Foreground="DodgerBlue"/>

    <StackPanel Grid.Row="1" Margin="0,20,0,0">

        <TextBlock Text="FiveM Path"
                   Foreground="White"/>

        <TextBox Name="txtPath"
                 Height="35"/>

    </StackPanel>

    <StackPanel Grid.Row="2"
                Margin="0,20,0,0">

        <Button Name="btnInstall"
                Height="45"
                Content="ติดตั้ง ReShade"/>

        <TextBox Name="txtLog"
                 Margin="0,15,0,0"
                 AcceptsReturn="True"
                 VerticalScrollBarVisibility="Auto"
                 Height="250"/>

    </StackPanel>

</Grid>
```

</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$txtPath = $window.FindName("txtPath")
$txtLog = $window.FindName("txtLog")
$btnInstall = $window.FindName("btnInstall")

$txtPath.Text = $FiveMPath

$btnInstall.Add_Click({

```
$txtLog.AppendText("Sequence Store Installer`r`n")

if(Test-Path $txtPath.Text)
{
    $txtLog.AppendText("[OK] พบ FiveM`r`n")
}
else
{
    $txtLog.AppendText("[ERROR] ไม่พบ FiveM`r`n")
}
```

})

$window.ShowDialog()
