#https://mathworld.wolfram.com/LagrangeInterpolatingPolynomial.html

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

function convert_string_to_points() {
    param(
        $encode_string = ""
    )
    $encode_string = $encode_string.trim()
    $points = New-Object System.Collections.ArrayList
    #          =========================
    
    for ($i = 0; $i -lt $encode_string.length; $i++) {
        $null = $points.Add((make_point_obj -x ($i + 1) -y ([byte][char]($encode_string[$i]))))
    }  
    
    $points_array = $points -as [array]
    return $points_array
}


$encode_string = (Get-Content -Path .\input_string.txt)
$points = convert_string_to_points -encode_string $encode_string

$points | ft