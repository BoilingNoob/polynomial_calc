Import-Module ".\funcs.psm1" -Force

#https://www.geeksforgeeks.org/lagrange-interpolation-formula/
#https://www.geeksforgeeks.org/wp-content/ql-cache/quicklatex.com-403fd0524f40b39402fb71f95fc3e7f5_l3.svg

$encode_string = (Get-Content -Path .\test_string.txt)
$points = convert_string_to_points -encode_string $encode_string

$points | Format-Table

$lagrange_text = make_lagrange_text -points_list $points -evaluate_Y

$reped_text = replace_lagrange_text -lagrange_text $lagrange_text -points_list $points

Write-Host $reped_text

function evaluate_my_expression () {
    param(
        $expression,
        $x,
        [switch]$dont_round
    )

    $result = $expression -replace "X", $x | Invoke-Expression
    if ($dont_round) {
        $final_result = $result
    }
    else {
        $final_result = [math]::Round($result, 0)
    }
    return $final_result

}


evaluate_my_expression -expression $reped_text -x 4