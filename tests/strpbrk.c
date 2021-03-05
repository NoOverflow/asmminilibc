/*
** EPITECH PROJECT, 2021
** B-ASM-400-TLS-4-1-asmminilibc-julien.prost [SSH: 192.168.0.28]
** File description:
** strncmp
*/

#include <criterion/criterion.h>

Test(strpbrk, search_accept)
{
    char *test = "This O should be 5";
    char *ret = strpbrk(test, "89OD");

    cr_assert_eq(ret, test + 5);
}

Test(strpbrk, search_none)
{
    char *test = "This O should be NULL";
    char *ret = strpbrk(test, "78964PM");

    cr_assert_eq(ret, NULL);
}
