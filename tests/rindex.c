#include <criterion/criterion.h>

Test(rindex, find_char_dup)
{
    char *s1 = "This should return 4";

    cr_assert(rindex(s1, 's') == (s1 + 5));
}

Test(rindex, find_char_no_match)
{
    char *s1 = "No char like that in here";

    cr_assert(rindex(s1, 's') == NULL);
}

Test(rindex, find_char_one_match)
{
    char *s1 = "Only one s here";

    cr_assert(rindex(s1, 's') == (s1 + 9));
}

Test(rindex, find_char_empty_string)
{
    char *s1 = "";

    cr_assert(rindex(s1, 's') == NULL);
}

Test(rindex, find_char_empty_string_two)
{
    char *s1 = "";

    cr_assert(rindex(s1, '\0') == s1);
}
