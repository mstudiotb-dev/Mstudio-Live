# Decode the MStudio Live logo PNGs from their base64 text copies.
#
# Why: the logo PNGs are binary files. This script recreates them locally
# from images/*.png.b64 (plain text) so a local build uses the MStudio logo.
# Run once after cloning, before building:
#   powershell -ExecutionPolicy Bypass -File images\decode-logo.ps1
# The Windows CI workflow (.github/workflows/windows.yml) does the same step.
function Decode-Logo($b64, $dest) {
    $text = (Get-Content $b64 -Raw).Trim()
    $bytes = [Convert]::FromBase64String($text)
    [IO.File]::WriteAllBytes($dest, $bytes)
    Write-Host "decoded $dest"
}
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Decode-Logo (Join-Path $here "mstudio_logo_1024.png.b64") (Join-Path $here "sonobus_icon_mac_1024.png")
Decode-Logo (Join-Path $here "mstudio_logo_1024.png.b64") (Join-Path $here "sonobus_logo@2x.png")
Decode-Logo (Join-Path $here "mstudio_logo_256.png.b64")  (Join-Path $here "sonobus_icon_mac_256.png")
Decode-Logo (Join-Path $here "mstudio_logo_96.png.b64")   (Join-Path $here "sonobus_logo_96.png")
Decode-Logo (Join-Path $here "mstudio_title_small.png.b64") (Join-Path $here "sonobus_title_small.png")
Decode-Logo (Join-Path $here "mstudio_title.png.b64")       (Join-Path $here "sonobus_title.png")
