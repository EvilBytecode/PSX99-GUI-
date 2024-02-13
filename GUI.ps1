Add-Type -AssemblyName System.Windows.Forms

Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class User32 {
        [DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }

    public class Kernel32 {
        [DllImport("kernel32.dll")]
        public static extern IntPtr GetConsoleWindow();
    }
"@

$kittyhide = 0

$kittywind = [Kernel32]::GetConsoleWindow()
[User32]::ShowWindow($kittywind, $kittyhide)


$form = New-Object System.Windows.Forms.Form
$form.Text = "PS99 Server Crasher"
$form.Size = New-Object System.Drawing.Size(400, 300)
$form.BackColor = "Black"

$button = New-Object System.Windows.Forms.Button
$button.Text = "Trade Scam (Server Down)"
$button.BackColor = "Green"
$button.Size = New-Object System.Drawing.Size(150, 55) 
$button.Location = New-Object System.Drawing.Point(125, 200)
$button.ForeColor = "White" 

$OTB = New-Object System.Windows.Forms.TextBox
$OTB.Multiline = $true
$OTB.BackColor = "Black"
$OTB.ForeColor = "White"
$OTB.Size = New-Object System.Drawing.Size(350, 120)
$OTB.Location = New-Object System.Drawing.Point(25, 30)

$form.Controls.Add($button)
$form.Controls.Add($OTB)

$button.Add_Click({
        $OTB.Text += "[$(Get-Date)] [INFO] Connected Into PS99:" + [Environment]::NewLine
        Start-Sleep -Seconds 1
        $OTB.Text += "[$(Get-Date)] [SYSTEM] Opened Trade Code Vulnerability 0000000000000000$([char](Get-Random -Minimum 65 -Maximum 91))" + [Environment]::NewLine
        Start-Sleep -Seconds 1
        $OTB.Text += "[$(Get-Date)] [SYSTEM] Server Crashing" + [Environment]::NewLine
        Start-Sleep -Seconds 1
        $OTB.Text += "[$(Get-Date)] [SYSTEM] Trade Scam Successfully Executed" + [Environment]::NewLine
    })

[Windows.Forms.Application]::Run($form)
