grep -e "^[0-9]\{3\}\-[0-9]\{3\}\-[0-9]\{4\}$" -e "^([0-9]\{3\}) [0-9]\{3\}\-[0-9]\{4\}$" file.txt

this is a grep command accepting two regular expressions
1 .^[0-9]\{3\}\-[0-9]\{3\}\-[0-9]\{4\}$
2 .^([0-9]\{3\}) [0-9]\{3\}\-[0-9]\{4\}$

The construction is as follows

    ^: indicates the starting of the string
    $: indicates the end of the string
    [0-9]\{3\} : represent 3 numbers (\{3\}) between the range 0-9 ([0-9] a digit in the range)
    \: suppresses the specialness of the character
    -e: to include multiple regex

------------------------------------------------------------------------------------------------------------------------------------------------------------------


Explanation

The idea is to local certain pattern and print them out. regex is the perfect choice to locate the pattern. sed can be a easy to use helper here.

There are 2 patterns needed:

    For 123-456-7890, we can use pattern like this
        ^[0-9]{3}-[0-9]{3}-[0-9]{4}$
        Meaning starting with 3 digits (^[0-9]{3}), then a dash -, another 3 digits ([0-9]{3}) with a dash -, then ending with 4 digits ([0-9]{4}$)
    For (123) 456-7890, pattern will be like
        ^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$
        Meaning starting with a open parenthesis \( need to use back slash to escape, then 3 digits ([0-9]{3}) and a ending parenthesis \), then a space , the rest will be similar to the first pattern

In sed:

    -n: is to silence the auto printout (default by sed)
    -r: is to use extended regex

Implementation

# Implementation with 2 patterns
sed -nr '/^[0-9]{3}-[0-9]{3}-[0-9]{4}$|^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$/p' file.txt

# If we merge the similar part, the regex will be like
sed -nr '/(^[0-9]{3}-|^\([0-9]{3}\) )[0-9]{3}-[0-9]{4}$/p' file.txt
