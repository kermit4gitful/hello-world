# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


# Create a new form
$LocalCurlForm                    = New-Object system.Windows.Forms.Form
# Define the size, title and background color
$LocalCurlForm.ClientSize         = '500,300'
$LocalCurlForm.text               = "Lazy Geo Lookup - by Chad Monterichard"
$LocalCurlForm.BackColor          = "#ffffff"
# Display the form
#[void]$LocalCurlForm.ShowDialog()

# Create a Title for our form. We will use a label for it.
$Title                           = New-Object system.Windows.Forms.Label
# The content of the label
$Title.text                      = "IP Geographic Lookup"
# Make sure the label is sized the height and length of the content
$Title.AutoSize                  = $true
# Define the minial width and height (not nessary with autosize true)
$Title.width                     = 25
$Title.height                    = 10
# Position the element
$Title.location                  = New-Object System.Drawing.Point(20,20)
# Define the font type and size
$Title.Font                      = 'Microsoft Sans Serif,13'

function RunCurl { 
  # RUN CURL LOGIC GOES HERE
  # $IPAddress = $IPForm.Text;$results = (Invoke-WebRequest http://ipinfo.io/$IPAddress)
  $IPForm.Text
  }

# Other elements
$Description                     = New-Object system.Windows.Forms.Label
$Description.text                = "Enter an IP address to look up its approximate geographic location using cURL."
$Description.AutoSize            = $false
$Description.width               = 450
$Description.height              = 50
$Description.location            = New-Object System.Drawing.Point(20,50)
$Description.Font                = 'Microsoft Sans Serif,10'

$IPForm                          = New-Object system.Windows.Forms.TextBox
$defaultValue                    = ""
$IPForm.Text                     = $defaultValue
$IPForm.width                    = 170
$IPForm.Location                 = New-Object System.Drawing.Point(20,100)
$IPForm.autosize                 = $true

$AddCurlBtn                   = New-Object system.Windows.Forms.Button
$AddCurlBtn.BackColor         = "#dddddd"
$AddCurlBtn.text              = "Check"
$AddCurlBtn.width             = 90
$AddCurlBtn.height            = 30
$AddCurlBtn.location          = New-Object System.Drawing.Point(370,250)
$AddCurlBtn.Font              = 'Microsoft Sans Serif,10'
$AddCurlBtn.ForeColor         = "#000074"

# Add the elements to the form
$LocalCurlForm.controls.AddRange(@($Title, $Description, $IPForm, $AddCurlBtn))

# $AddCurlBtn.Add_Click({ RunCurl })
$AddCurlBtn.Add_Click({ RunCurl })

# THIS SHOULD BE AT THE END OF YOUR SCRIPT FOR NOW
# Display the form
$LocalCurlForm.ShowDialog()

$IPForm