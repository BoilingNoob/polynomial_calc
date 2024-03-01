function make_point_obj() {
    param(
        $x = 0,
        $y = 0
    )
    return [pscustomobject]@{x = $x; y = $y }
}
function parse_point() {
    param(
        $input_string = $null
    )

    $coords = $input_string.split(",")
    return make_point_obj -x $coords[0] -y $coords[1]
}

<#
$points = "
1,65
2,34
3,23
4,90
5,14
6,56
7,47
8,
9,
10,
11,
12,
13,
14,
15,
16,
17,
18,
19,
20,
21,
22,
23,
24,
25,
".trim().split("`n") | % { parse_point -input_string $_ }

[char]::GetNumericValue('A')

$points[0]
#>

$points = New-Object System.Collections.ArrayList
#          =========================
$enocde_string = (Get-Content -Path .\input_string.txt).trim()
Write-Host $enocde_string, $enocde_string.Length