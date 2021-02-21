/*
** EPITECH PROJECT, 2021
** Preshot [SSH: 192.168.0.111]
** File description:
** tester
*/

#include <stdio.h>
#include <stdlib.h>

size_t strlen(const char* str);
char* strchr(const char* str, char c);
void* memset(void* adr, int c, size_t n);
void* memcpy(void* dest, const void* src, size_t n);
int strcmp(const char* s1, const char* s2);
void* memmove(void* dest, const void *src, size_t n);
int strncmp(const char* s1, const char* s2, size_t n);
int strcasecmp(const char* s1, const char *s2);
char *rindex(const char *s, int c);

int main(void)
{
    char *test = "heloo";
    /*int a = strcasecmp(test, "HELOO");

    printf("strcasecmp(heloo, HELOO) = %d\n", a);*/
    char *result = rindex(test, 'l');

    printf("rindex(heloo, l) = %ld\n", result - test);
    return (0);
}

int madin(void)
{
    printf("strlen(hello) = %lu\n", strlen("hello"));
    printf("strchr(gay, g) = %s\n", strchr("gay", 'g'));
    printf("strchr(gay, a) = %s\n", strchr("gay", 'a'));
    printf("strchr(gay, h) = %s\n", strchr("gay", 'h'));
    printf("strchr(gay, \\0) = %s\n", strchr("gay", '\0'));

    char* array = malloc(sizeof(char) * 50);
    char* array2 = malloc(sizeof(char) * 50);

    char* ret = memset(array, 5, 50);

    for (size_t i = 0; i < 50; i++) {
        if (ret[i] != 5) {
            printf("FAILURE\n");
        }
    }
    printf("array[0] = %d\n", array[0]);
    printf("array[25] = %d\n", array[25]);
    printf("array[49] = %d\n", array[49]);
    ret = memcpy(array2, array, 50);
    for (size_t i = 0; i < 50; i++) {
        if (ret[i] != 5) {
            printf("FAILURE\n");
        }
    }

    char* test = "dello";
    int a = strcmp(test, "hello");
    int b = strcmp(test, "denlo");
    printf("strcmp(dello, hello) = %d\n", a);
    printf("strcmp(dello, denlo) = %d\n", b);

    ret = memset(array, 3, 50);
    char *ret3 = memmove(array2, array, 50);
    for (size_t i = 0; i < 50; i++) {
        if (ret3[i] != 3) {
            printf("FAILURE Got %d\n", ret3[i]);
        }
    }

    test = "heloo";
    a = strncmp(test, "hello", 3);
    printf("strncmp(heloo, hello, 3) = %d\n", a);

    a = strcasecmp(test, "HELOO");
    printf("strcasecmp(heloo, HELOO) = %d\n", a);
    return (0);
}