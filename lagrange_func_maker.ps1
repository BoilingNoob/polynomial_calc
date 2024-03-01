Import-Module ".\funcs.psm1" -Force

#https://www.geeksforgeeks.org/lagrange-interpolation-formula/
#https://www.geeksforgeeks.org/wp-content/ql-cache/quicklatex.com-403fd0524f40b39402fb71f95fc3e7f5_l3.svg

#$encode_string = (Get-Content -Path .\test_string.txt)
$encode_string = (Get-Content -Path .\input_string.txt)
$points = convert_string_to_points -encode_string $encode_string

$points | Format-Table

$lagrange_text = make_lagrange_text -points_list $points

$reped_text = replace_lagrange_text -lagrange_text $lagrange_text -points_list $points

#Write-Host $reped_text

function decode_polynomial() {
    param(
        $length = 0,
        $expression = $null,
        [switch]$calc_length
    )

    if ($calc_length) {
        $length = ([regex]::Matches($expression, "\)\)\)")).count
    }
    $resultant_text = ""

    0..($length) | ForEach-Object {
        try {
            $resultant_text += [char]((evaluate_my_expression -expression $expression -x $_) -as [int])
        }
        catch {
            Write-Host "issue with index $_"
        }
    }

    return $resultant_text
}
$resultant_text = decode_polynomial -expression $reped_text -calc_length
Write-Host $resultant_text

#$expression_result = evaluate_my_expression -expression $reped_text -x 4