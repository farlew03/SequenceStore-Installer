Add-Type -AssemblyName PresentationFramework

$FiveMPath = Join-Path $env:LOCALAPPDATA "FiveM"

[xml]$xaml = @" 
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
     xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
     Title="Sequence Store"
     Height="500"
     Width="800"
     WindowStartupLocation="CenterScreen"
     Background="#0B1220">

```
<Grid Margin="20">

    <Grid.RowDefinitions>
        <RowDefinition Height="Auto"/>
        <RowDefinition Height="Auto"/>
        <RowDefinition Height="*"/>
    </Grid.RowDefinitions>

    <TextBlock Grid.Row="0"
               Text="SEQUENCE STORE"
               FontSize="30"
               FontWeight="Bold"
               Foreground="#4DA3FF"
               HorizontalAlignment="Center"/>

    <StackPanel Grid.Row="1" Margin="0,20,0,20">

        <TextBlock Text="FiveM Path"
                   Foreground="White"/>

        <TextBox x:Name="txtPath"
                 Height="30"/>

        <Button x:Name="btnInstall"
                Content="ติดตั้ง ReShade"
                Height="40"
                Margin="0,15,0,0"/>

    </StackPanel>

    <TextBox Grid.Row="2"
             x:Name="txtLog"
             AcceptsReturn="True"
             VerticalScrollBarVisibility="Auto"
             IsReadOnly="True"/>

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

if (Test-Path $txtPath.Text)
{
    $txtLog.AppendText("[OK] พบ FiveM`r`n")
}
else
{
    $txtLog.AppendText("[ERROR] ไม่พบ FiveM`r`n")
}
```

})

$null = $window.ShowDialog()
