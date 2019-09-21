Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

 $form = New-Object “System.Windows.Forms.Form”;
 $form.Width = 500;
 $form.Height = 300;
 $form.Text = "Lazy Geo Lookup - by Chad Monterichard";
 $form.TopMost = $true;
 # $form.BackColor = "#ffffff"

############Description
 $Description = New-Object system.Windows.Forms.Label;
 $Description.Text = "Enter an IP address to look up its approximate geographic location.";
 $Description.AutoSize = $false;
 $Description.Width = 450;
 $Description.Height = 50;
 $Description.Location = New-Object System.Drawing.Point(20,20);

############Define text box1 for input
 $textBox1 = New-Object “System.Windows.Forms.TextBox”;
 $textBox1.Left = 20;
 $textBox1.Top = 40;
 $textBox1.Width = 200;

#############Define default values for the input boxes
 $defaultValue = ""
 $textBox1.Text = $defaultValue;

#############Define button
 $button = New-Object “System.Windows.Forms.Button”;
 $button.Location = New-Object System.Drawing.Point(20,70);
 $button.Width = 100;
 $button.Text = “Enter”;

#############Define console
 $textBox2 = New-Object System.Windows.Forms.TextBox;
 $textBox2.Multiline = $true;
 $textBox2.AcceptsReturn = $true;
 $textBox2.Width = 300;
 $textBox2.Height = 120;
 $textBox2.Location = New-Object System.Drawing.Point(20,120);

 function RunCurl { 
 $ip = $textBox1.Text;
 $results = Invoke-WebRequest "http://ipinfo.io/$ip";
 # $textBox2.AppendText("$results\r\n");
 $textBox2.Text = $results.ToString() + "\n";
 Write-Host $results;
 $results = $null;
 $ip = $null;
 # $form.Close();
 }
 
$button.Add_Click({RunCurl}) ;

#############Add controls to all the above objects defined
 $form.Controls.Add($button);
 $form.Controls.Add($textBox1);
 $form.Controls.Add($Description);
 $form.Controls.Add($textBox2);
 $ret = $form.ShowDialog();

#################return values
$ip = $null;
$textBox1.Text