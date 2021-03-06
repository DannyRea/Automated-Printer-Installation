function Show-Menu
{
    param (
        [string]$Title = 'Printer Driver Installation'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' for this option."
    Write-Host "2: Press '2' for this option."
    Write-Host "3: Press '3' for this option."
    Write-Host "Q: Press 'Q' to quit."
}

do
 {
     Show-Menu 
     $selection = Read-Host "Select Printer Driver"
     switch ($selection)
     {
         '1' { #Installs Toshiba Printer
             'Installing Toshiba Universal Printer Driver..........'
              $path = "C:\temp\Toshiba eStudio"
              If(!(test-path $path))
                {
              New-Item -ItemType Directory -Force -Path $path
              }
              New-PSDrive -Name source -PSProvider FileSystem -Root \\placerco\dewitt\dpw | Out-Null

              New-PSDrive -Name target -PSProvider FileSystem -Root C:\temp\Toshiba` eStudio| Out-Null

              Copy-Item -Path source:\DPW\DPW` IT\Daniel\Client\Drivers\UNI\Driver\64bit\* -Destination target:

              pnputil /add-driver C:\temp\Toshiba` eStudio\eSf6u.inf /install

              Add-PrinterDriver -Name "TOSHIBA Universal Printer 2"

              $portName = "IP_10.1.109.44"

              $portName2 = "IP_10.1.109.24"

              $portName3 = "IP_10.1.109.41"

              $checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

              $checkPortExists2 = Get-Printerport -Name $portname2 -ErrorAction SilentlyContinue

              $checkPortExists3 = Get-Printerport -Name $portname3 -ErrorAction SilentlyContinue

              if (-not $checkPortExists) {

              Add-PrinterPort -name $portName -PrinterHostAddress "10.1.109.44"

              }

              if (-not $checkPortExists2) {

              Add-PrinterPort -name $portName2 -PrinterHostAddress "10.1.109.24"

              }

              if (-not $checkPortExists3) {

              Add-PrinterPort -name $portName3 -PrinterHostAddress "10.1.109.41"

              }
              Add-Printer -Name "Admin" -DriverName "TOSHIBA Universal Printer 2" -PortName $portName –Published

              Add-Printer -Name "Engineering" -DriverName "TOSHIBA Universal Printer 2" -PortName $portName2 –Published

              Add-Printer -Name "Transportation" -DriverName "TOSHIBA Universal Printer 2" -PortName $portName3 –Published

              Remove-PSDrive source

              Remove-PSDrive target
              
         } '2' { #Installs HP DesignJet Printer
            'Installing HP DesignJet Printer..........'
              $path = "C:\temp\HP DesignJet"
              If(!(test-path $path))
                {
              New-Item -ItemType Directory -Force -Path $path
              }
              New-PSDrive -Name source -PSProvider FileSystem -Root \\placerco\dewitt\dpw | Out-Null

              New-PSDrive -Name target -PSProvider FileSystem -Root C:\temp\HP` DesignJet| Out-Null

              Copy-Item -Path source:\DPW\DPW` IT\Daniel\config\Drivers\V3\PS\x64\* -Destination target:

              pnputil /add-driver C:\temp\HP` DesignJet\hpi16puv.inf /install

              Add-PrinterDriver -Name "HP DesignJet Z6200ps 42in PS3"

              $portName = "IP_10.1.109.22"

              $checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

              if (-not $checkPortExists) {

              Add-PrinterPort -name $portName -PrinterHostAddress "10.1.109.22"

              }

              Add-Printer -Name "HP DesignJet" -DriverName "HP DesignJet Z6200ps 42in PS3" -PortName $portName –Published

              Remove-PSDrive source

              Remove-PSDrive target

         } '3' { #Installs HP Universal Driver
             'Installing HP Universal Printer..........'
              $path = "C:\temp\HP Universal"
              If(!(test-path $path))
                {
              New-Item -ItemType Directory -Force -Path $path
              }
              New-PSDrive -Name source -PSProvider FileSystem -Root \\placerco\dewitt\dpw | Out-Null

              New-PSDrive -Name target -PSProvider FileSystem -Root C:\temp\HP` Universal| Out-Null

              Copy-Item -Path source:\DPW\DPW` IT\Daniel\HP` Universal\* -Destination target:

               pnputil /add-driver C:\temp\HP` Universal\hpcu230u.inf /install

              Add-PrinterDriver -Name "HP Universal Printing PCL 6"

              $portName = "IP_10.1.109.16"

              $checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

              if (-not $checkPortExists) {

              Add-PrinterPort -name $portName -PrinterHostAddress "10.1.109.16"

              }

              Add-Printer -Name "HP Color LaserJet" -DriverName "HP Universal Printing PCL 6" -PortName $portName –Published

              Remove-PSDrive source

              Remove-PSDrive target
         }
     }
     pause
 }
 until ($selection -eq 'q')
