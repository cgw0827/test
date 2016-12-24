#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct mapNode_{
int st_i_key;
char *st_sz_value;
struct mapNode_ *pst_mapNode_left; //左节点
struct mapNode_ *pst_mapNode_right; //右节点
}mapNode;
typedef struct mapTree_{
mapNode *st_mapNode_root; //根节点
int st_mapTree_size; //树的节点数
//int st_mapTree_index; //数组下标
}mapTree;

mapNode *map_find_key(mapNode* tree,const int key);
void map_insert_key(mapTree* mt,mapNode** tree,const int key,const char* value);
void map_clear_node(mapNode **tree);
//树的初始化
mapTree* map_InitMapTree()
{
mapTree *mt = (mapTree *)calloc( sizeof(mapTree),1 );
if( mt==NULL )
{
fprintf(stderr,"内存已满 !\n");
exit( -1 );
}
mt->st_mapNode_root = NULL;
mt->st_mapTree_size = 0;
return mt;
}
//插入数据
void map_insert(mapTree* mt,const int key,const char* value)
{
//判断数据合法性
if( mt == NULL )
{
fprintf(stderr,"此mapTree不存在 !\n");
return ;
}
map_insert_key(mt,&(mt->st_mapNode_root),key,value);
}
//通过key查找对应的value
char *map_find(mapTree* mt,const int key)
{
mapNode* node = map_find_key(mt->st_mapNode_root,key);
if(node == NULL)
return "";
return node->st_sz_value;
}
//删除节点
int map_remove(mapTree* mt,int key)
{
mapNode *node = map_find_key(mt->st_mapNode_root,key);
if(node)
{
;
}
return 0;
}
//清空树节点
void map_clear(mapTree* mt)
{
map_clear_node(&(mt->st_mapNode_root));
mt->st_mapTree_size = 0;
}
void map_clear_node(mapNode **tree)
{
if(*tree)
{
map_clear_node(&((*tree)->pst_mapNode_left));
map_clear_node(&((*tree)->pst_mapNode_right));
free((*tree)->st_sz_value);
free(*tree);
*tree = NULL;
}
}
mapNode* map_find_key(mapNode* tree,const int key)
{
if(!tree)
return tree;
if(key == tree->st_i_key)
return tree;
else if(key > tree->st_i_key)
return map_find_key(tree->pst_mapNode_right,key);
else
return map_find_key(tree->pst_mapNode_left,key);
}
void map_insert_key(mapTree* mt,mapNode** tree,const int key,const char* value)
{
if(!(*tree))
{
(*tree) = (mapNode*)calloc(sizeof(mapNode),1);
if( (*tree) == NULL )
{
fprintf(stderr,"内存已满 !\n");
exit( -1 );
}

(*tree)->st_sz_value = (char *)malloc( strlen(value)+1 );
if( (*tree)->st_sz_value == NULL )
{
fprintf(stderr,"内存已满 !\n");
exit( -1 );
}
(*tree)->st_i_key = key;
strcpy((*tree)->st_sz_value,value);
(*tree)->pst_mapNode_left = NULL;
(*tree)->pst_mapNode_right = NULL;
mt->st_mapTree_size++;
return;
}
if(key < (*tree)->st_i_key)
{
map_insert_key(mt,&(*tree)->pst_mapNode_left,key,value);
}
else if(key > (*tree)->st_i_key)
{
map_insert_key(mt,&(*tree)->pst_mapNode_right,key,value);
}
else
{
strcpy((*tree)->st_sz_value,value);
}
}
int main()
{
//printf("%d\n",sizeof(mapTree));
mapTree *mt;
mt = map_InitMapTree();
map_insert(mt,4,"DJJHHKHKJHKHKHKHLJ:LK:K:K:LJJLKGUJTDUYURUHR");
printf("%s %d\n",map_find(mt,4),mt->st_mapTree_size);
map_insert(mt,1,"A");
printf("%s %d\n",map_find(mt,1),mt->st_mapTree_size);
//map_clear(mt);
map_insert(mt,4,"A");
printf("%s %d\n",map_find(mt,6),mt->st_mapTree_size);
return 0;
}
