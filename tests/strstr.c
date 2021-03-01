#include <criterion/criterion.h>

Test(strstr, find_needle_basic)
{
    char *haystack = "This should return 5";
    char *needle = "should";

    cr_assert(strstr(haystack, needle) == (haystack + 5));
}

Test(strstr, find_needle_not_present)
{
    char *haystack = "This return 5";
    char *needle = "should";

    cr_assert(strstr(haystack, needle) == NULL);
}

Test(strstr, find_needle_larger)
{
    char *haystack = "This return 5";
    char *needle = "ddddddddddddddddddddddddddddd";

    cr_assert(strstr(haystack, needle) == NULL);
}
