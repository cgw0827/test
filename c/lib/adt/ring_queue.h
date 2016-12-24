//ringbuff.h//
#ifndef RINGBUFF_H_INCLUDED
#define RINGBUFF_H_INCLUDED
#include <stdio.h>
#include <stdlib.h>
typedef  void*   rfpointer;
typedef struct ring_queue
{
    int start;
    int end;
    int size;
    int count;
    rfpointer    *buff;
} Ringbuff;
int free_ringbuff_queue(Ringbuff *queue);
int ringbuff_isempty(Ringbuff *queue);
int ringbuff_isfull(Ringbuff *queue);
#define   INIT_RINGBUFF(rb,BUFFTYPE,SIZE )        \
               rb=(Ringbuff *)malloc(sizeof(Ringbuff))  \
               ,rb->start=0     \
               ,rb->end=0       \
               ,rb->count=0     \
               ,rb->size=SIZE+1\
               ,rb->buff=( rfpointer )malloc(sizeof(BUFFTYPE)*SIZE)

#define   PUSH_RINGBUFF(rb,BUFFTYPE,REAL)      \
               if(rb==NULL)                                        \
                {                                                           \
                printf(#rb" do not exist!\n");                 \
                exit(0);                                                  \
                }                                                           \
                if(rb->count==rb->size-1)                   \
                {                                                           \
                    printf(#rb" buff has been full.\n");    \
                }                                                           \
                *((BUFFTYPE*)rb->buff+rb->end)=REAL;    \
                rb->end=(rb->end+1)%rb->size;           \
                rb->count=rb->count+1



#define POP_RINGBUFF(rb,BUFFTYPE,REAL)        \
             if(rb==NULL)                                        \
             {                                                           \
             printf(#rb" do not exist!\n");             \
             exit(0);                                                  \
             }                                                           \
             if(rb->count>0)                                    \
             {                                                           \
             REAL=*((BUFFTYPE*)rb->buff+rb->start);  \
             rb->count=rb->count-1;                       \
             rb->start=(rb->start+1)%rb->size;         \
             }                                                            \
             else                                                       \
             printf("No element in "#rb"\n")

#endif // RINGBUFF_H_INCLUDED
