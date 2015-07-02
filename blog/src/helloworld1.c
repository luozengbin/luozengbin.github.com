#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <unistd.h>

#define U_SIZE (1024 * 1000 * 10)
#define F_SIZE 10

char* global_var1 = "0123456789";                  /* Initinalized data segment   */

int main(int argc, char *argv[])
{
    printf("PID: %d\n", getpid());

    /* Allocated in Initinalized data segment   */
    printf ("-----------------------------------------------------------------\n");
    printf("初期化済みglobal変数 global_var1         -> 0x%016lx\n", &global_var1);
    for (int i = 0; i < F_SIZE; i++) {
        printf("                     global_var1[%7d]-> 0x%016lx\n", i, &global_var1[i]);
    }

    /* Allocated in Initinalized data segment   */
    printf ("-----------------------------------------------------------------\n");
    static char* static_var1 = "0123456789";
    printf("初期化済みstatic変数 static_var1         -> 0x%016lx\n", &static_var1);
    for (int i = 0; i < strlen(static_var1); i++) {
        printf("                     static_var1[%7d]-> 0x%016lx\n", i, &static_var1[i]);
    }

    /* Allocated in stack segment */
    printf ("-----------------------------------------------------------------\n");
    char local_var2[10];
    printf("初期化なしローカル変数local_var2        -> 0x%016lx\n", &local_var2);
    for (int i = 0; i < 10; i++) {
        local_var2[i] = 'a';
        printf("                     local_var2[%7d]-> 0x%016lx\n", i, &local_var2[i]);
    }

    /* sleep(5); */
    /* printf ("allocate new heap\n"); */

    /* Allocated in heap segment */
    printf ("-----------------------------------------------------------------\n");
    char *local_var3;
    local_var3 = malloc(1024);
    printf("mallocローカル変数  local_var3          -> 0x%016lx\n", &local_var3);
    for (int i = 0; i < 10; i++) {
        local_var3[i] = 'a';
        printf("                     local_var3[%7d]-> 0x%016lx\n", i, &local_var3[i]);
    }

    sleep(5);
    printf ("allocate new heap\n");

    char *local_var4;

    local_var4 = malloc(67108864*10);

    sleep(5);
    printf ("allocate new heap\n");

    while(1) {
        for (int i = 0; i < 1000; i++) {
            char *local_var5;
            local_var5 = malloc(67108864*10);
        }
        sleep(1);
        printf ("allocate new heap\n");
    }

    /* for (int i = 0; i < U_SIZE; i++) { */
    /*     local_var4[i] = 'a'; */
    /* } */

    /* sleep(2); */
    /* printf ("allocate new heap\n"); */
    /* char *local_var5; */
    /* local_var5 = malloc(U_SIZE); */
    /* for (int i = 0; i < U_SIZE; i++) { */
    /*     local_var5[i] = 'a'; */
    /* } */

    while (1) sleep(100);
    return 0;
}

/* int main(void) */
/* { */
/*   FILE *fp; */
/*   char *fname = "/home/akira/mywork/devspace/java-samples/java8-learning/target/java8-learning-1.0.jar"; */
/*   int c; */

/*   fp = fopen( fname, "r" ); */
/*   if( fp == NULL ){ */
/*     printf( "%sファイルが開けません¥n", fname ); */
/*     return -1; */
/*   } */

/*   printf( "¥n-- fgetc() --¥n" ); */
/*   while( (c = fgetc( fp )) != EOF ){ */
/*       sleep(1); */
/*   } */

/*   printf( "¥n-- sleep --¥n" ); */
/*   sleep(16); */

/*   fclose( fp ); */
/*   return 0; */
/* } */
