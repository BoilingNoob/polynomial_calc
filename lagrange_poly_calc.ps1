#https://mathworld.wolfram.com/LagrangeInterpolatingPolynomial.html   "Written explicitly,"


Import-Module .\funcs.psm1

function make_point_obj() {
    param(
        $x = 0,
        $y = 0
    )
    return [pscustomobject]@{x = $x; y = $y }
}


#$encode_string = (Get-Content -Path .\input_string.txt)
$encode_string = (Get-Content -Path .\test_string.txt)
$points = convert_string_to_points -encode_string $encode_string

$points | Format-Table


lagrange_interpolation -points_list $points -test_value 2