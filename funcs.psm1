
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


function NOT_WORKING_lagrange_interpolation() {
    param(
        $points_list = $null,
        $test_value = 0
    )
    $calculated_value = 0

    for ($y_index = 0; $y_index -lt $points_list.count; $y_index++) {
        $top_chunk = 1
        for ($x_index = 0; $x_index -lt $points_list.count; $x_index++) {
            if ($points_list[$x_index].x -ne $test_value) {
                $temp_hold = $test_value - $points_list[$x_index].x
                $top_chunk *= $temp_hold    
            }
            
        }

        $under_chunk = 1
        for ($x_index = 0; $x_index -lt $points_list.count; $x_index++) {
            if ($x_index -ne $y_index) {
                $temp_hold = ($points_list[$y_index].x - $points_list[$x_index].x)
                $under_chunk *= $temp_hold    
            }
        }

        $calculated_value += ($top_chunk * $points_list[$y_index].y) / $under_chunk 
    }

    return $calculated_value
}