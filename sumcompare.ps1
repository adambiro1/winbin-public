#check if checksum sha256 is valid
param([string]$p1)
if($p1) {
    $checksum = Get-Clipboard
    #TODO check if hex is valid
    $isoHash = Get-FileHash $p1 -Algorithm sha256
    if ($isoHash.Hash -eq $checksum.ToUpper()) {
        "Checksum is valid."
    } else {
        "Checksum is not valid"
    }
} else {
    $sname = $MyInvocation.MyCommand.Name
    "Usage:`n`t$sname <file>"
}