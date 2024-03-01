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
        $num_temp = [byte][char]($encode_string[$i])
        $point_temp = make_point_obj -x ($i + 1) -y $num_temp
        
        $null = $points.Add($point_temp)
    }  
    
    $points_array = $points -as [array]
    return $points_array
}


$encode_string = (Get-Content -Path .\input_string.txt)
$points = convert_string_to_points -encode_string $encode_string

$points | Format-Table