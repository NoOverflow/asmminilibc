/*
** EPITECH PROJECT, 2021
** B-ASM-400-TLS-4-1-asmminilibc-julien.prost
** File description:
** memcpy
*/

#include <criterion/criterion.h>

Test(strcmp, compare_equal_strings)
{
    char *s1 = "This is a compl3x string!~";
    char *s2 = "This is a compl3x string!~";

    cr_assert(strcmp(s1, s2) == 0);
}

Test(strcmp, compare_different_strings)
{
    char *s1 = "This is a compl3x string!~";
    char *s2 = "Thiv is a compl3x string!~";

    cr_assert(strcmp(s1, s2) == -3);
}

Test(strcmp, compare_different_strings_two)
{
    char *s1 = "This is a compl3x string!~";
    char *s2 = "Thip is a compl3x string!~";

    cr_assert(strcmp(s1, s2) == 3);
}

Test(strcmp, compare_different_strings_three)
{
    char *s1 = "";
    char *s2 = "This";

    cr_assert_eq(strcmp(s1, s2), -84);
}

Test(strcmp, compare_different_strings_four)
{
    char *s1 = "This";
    char *s2 = "";

    cr_assert_eq(strcmp(s1, s2), 84);
}
