Import-Module .\funcs.psm1


$encode_string = (Get-Content -Path .\test_string.txt)
$points = convert_string_to_points -esncode_string $encode_string

$points | Format-Table