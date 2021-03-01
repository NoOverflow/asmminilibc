/*
** EPITECH PROJECT, 2021
** B-ASM-400-TLS-4-1-asmminilibc-julien.prost [SSH: 192.168.0.28]
** File description:
** strncmp
*/

#include <criterion/criterion.h>

Test(strncmp, compare_equal_strings)
{
    char *s1 = "This is a compl3x string!~";
    char *s2 = "This_is a compl3x string!~";

    cr_assert(strncmp(s1, s2, 4) == 0);
}
