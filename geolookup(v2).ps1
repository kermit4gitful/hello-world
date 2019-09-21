Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

 $form = New-Object “System.Windows.Forms.Form”;
 $form.Width = 500;
 $form.Height = 300;
 $form.Text = "Lazy Geo Lookup - by C*** M***********";
 $form.BackColor = "#ffffff"

############Description
 $Description = New-Object system.Windows.Forms.Label
 $Description.text = "Enter an IP address to look up its approximate geographic location using cURL."
 $Description.AutoSize = $false
 $Description.width = 450
 $Description.height = 50
 $Description.location = New-Object System.Drawing.Point(20,20)

############Define text box1 for input
 $textBox1 = New-Object “System.Windows.Forms.TextBox”;
 $textBox1.Left = 20;
 $textBox1.Top = 50;
 $textBox1.width = 200;

#############Define default values for the input boxes
 $defaultValue = ""
 $textBox1.Text = $defaultValue;

#############define button
 $button = New-Object “System.Windows.Forms.Button”;
 $button.location = New-Object System.Drawing.Point(20,80)
 $button.Width = 100;
 $button.Text = “Enter”;

############# This is when you have to close the form after getting values
# $eventHandler = [System.EventHandler]{
# $textBox1.Text;
# $form.Close();};

 function RunCurl { 
 $ip = $textBox1.Text;
 $results = Invoke-WebRequest "http://ipinfo.io/$ip";
 Write-Host $results
 $results = $null;
 $ip = $null;
 # $form.Close();
 }
 
$button.Add_Click({RunCurl}) ;

#############Add controls to all the above objects defined
 $form.Controls.Add($button);
 $form.Controls.Add($textBox1);
 $form.Controls.Add($Description);
 $ret = $form.ShowDialog();

#################return values
$ip = $null;
$textBox1.Text