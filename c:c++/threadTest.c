/* fireaxe的例程 */
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
pthread_key_t   key;

void * child1(void *arg){
        printf("child1\n");
        return NULL;
}
void * child2(void *arg)
{
        printf("child2\n");
        return NULL;
}
int main(void)
{
        pthread_t tid1,tid2;
        printf("hello\n");
        pthread_create(&tid1,NULL,child1,NULL);
        pthread_create(&tid2,NULL,child2,NULL);
        sleep(10);
        printf("main thread exit\n");
        return 0;
}
