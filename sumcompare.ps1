#check if checksum sha256 is valid
param([string]$p1)
if($p1) {
    $checksum = Get-Clipboard
    #TODO check if hex is valid
    $valid = foreach($i in [char]'A'..[char]'F' && 0..9) {$i}
    $ascii = foreach($i in 33..126) {"$([char]$i)"}
    foreach($i in $ascii) { 
        if($i -contains $valid) {
            continue
        }
        if($i -contains $checksum) {
            "Checksum in clipboard is not valid"  #TODO 
            Exit
        }
    }
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