#ifndef FRAME_WORK_H_
#define FRAME_WORK_H_
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// typedef enum  {
//     BASE,
//     STRUCT,
//     UNION,
// }C_Type;

typedef int bool;
#define true  1 
#define false 0
typedef void (*FREE_FUNC)(void* obj);

#define FREE_POINTER(p)  if(p) { free(p);(p) = NULL; }
#define FREE_LIST(adt,model) if(adt){\
    model * data=(model*)pop_list_front(adt);\
    while(data!=NULL){ \
        FREE_STRUCT(data);\
        data=(model*)pop_list_front(adt);\
    }\
    FREE_STRUCT(adt);\
  }
#define FREE_STRUCT(obj) if(obj){\
    if(obj->free_func){\
      obj->free_func(obj);\
    }\
    FREE_POINTER(obj);\
  }





#define REALLOC(p,s)\
        if(!((p)=realloc(s))){\
            fprintf(stderr,"REALLOC Insufficient_memory");\
            exit(EXIT_FAILURE);\
        }
#define CALLOC(p,n,s)\
        if(!((p)=calloc(n,s))){\
            fprintf(stderr,"CALLOC Insufficient_memory");\
            exit(EXIT_FAILURE);\
        }
#define MALLOC(p,s)\
  if(!((p)=malloc(s))){\
      fprintf(stderr,"MALLOC Insufficient_memory");\
      exit(EXIT_FAILURE);\
  }
#endif
