/*
** EPITECH PROJECT, 2021
** B-ASM-400-TLS-4-1-asmminilibc-julien.prost [SSH: 192.168.0.28]
** File description:
** strcasecmp
*/

#include <criterion/criterion.h>

Test(strcasecmp, compare_equal_strings)
{
    char *s1 = "This Should Be The Same";
    char *s2 = "this should be the same";

    cr_assert(strcasecmp(s1, s2) == 0);
}
