#include <stdio.h>
#include <sys/dir.h>
#include <sys/stat.h>
#include <sys/dirent.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
const char* keys[]={"png","PNG","jpg","JPG","ccz"};
const char* result[]={"成功","失败"};
const char* key = "jaeger";
static int count = 0,totalCount=0;  
void encode(unsigned char* buffer){
    unsigned long size=strlen(key);
    for(int i=0;i<size;i++){
        buffer[i]^=key[i]; 
    }
}
void decode(unsigned char* buffer){
    unsigned long size=strlen(key);
    for(int i=0;i<size;i++){
        buffer[i]^=key[i];
    }
}
unsigned char* getFileData(const char* fileName, const char* pszMode, unsigned long * pSize)
{
    unsigned char * pBuffer = NULL;
    *pSize = 0;
    do
    {
        // read the file from hardware
        FILE *fp = fopen(fileName, pszMode);
        fseek(fp,0,SEEK_END);
        *pSize = ftell(fp);
    //printf("psize is %lu \n",*pSize);
        fseek(fp,0,SEEK_SET);
        pBuffer =(unsigned char*)calloc(sizeof(unsigned char),*pSize);
        *pSize = fread(pBuffer,sizeof(unsigned char), *pSize,fp);
        //printf("psize 2 is %lu \n",*pSize);
        fclose(fp);
    } while (0);
    
    if (! pBuffer)
    {
       printf("error read file %s ",fileName);
    }
    return pBuffer;
}
void setFileData(unsigned char* buffer,unsigned long * pSize,const char* fileName, const char* pszMode){
    FILE * fp;
    if((fp=fopen(fileName,pszMode))==NULL)
    {
        printf("Cannot open %s\n",fileName);
        return ;
    }
    fwrite(buffer,sizeof(unsigned char),*pSize,fp);
    fclose(fp);
}
int doFile(const char* fileName,char* codeMode){
    unsigned long size=0;
    unsigned char * buf=getFileData(fileName,"r",&size); 
    //printf("buf size is %lu \n",size);
    if(size!=0){
        if(!strcmp(codeMode,"encode")){
            encode(buf);
            setFileData(buf,&size,fileName,"w");
        }else if(!strcmp(codeMode,"decode")){
            decode(buf);
            setFileData(buf,&size,fileName,"w");
        }
        free(buf);   
    }else{
        free(buf);   
        return 1;
    }
    return 0;
}
int canAddFile(const char* name){
    //printf("canAddFile name is %s \n",name);
    for (int i = 0; i < 5; ++i)
    {

        if (strstr(name,keys[i])!=NULL)
        {
            // printf("key is %s name is %s\n",keys[i],name);
            /* code */
            return 1;
        }
        /* code */
    }
    return 0;
}
//获取指定目录下的所有文件列表 author:wangchangshaui jlu  
void startCode(const char *path, char* mode)  
{  
    struct dirent* ent = NULL;  
    DIR *pDir;  
    char dir[512];  
    struct stat statbuf;  
  
//打开目录  
    if ((pDir = opendir(path)) == NULL)  
    {  
        printf("Cannot open directory:%s\n", path);  
        return ;  
    }  
//读取目录  
    chdir(path);
    while((ent = readdir(pDir)) != NULL) {
        lstat(ent->d_name,&statbuf);
        if(S_ISDIR(statbuf.st_mode)) {
            if(strcmp(".",ent->d_name) == 0 ||
               strcmp("..",ent->d_name) == 0|| strstr(ent->d_name,"svn")!=NULL)
                continue;
            //printf("dirName is  %s \n ",ent->d_name);
            startCode(ent->d_name,mode);
        } else {
            if (canAddFile(ent->d_name))
            {
                /* code */
                int n=doFile(ent->d_name,mode);
                printf("%s\n",ent->d_name);
                totalCount++;
                if (n==0)
                {
                   count++;
                }else{
                    printf("fail fileName is %s\n",ent->d_name);
                }
            }
           
        }
    }
    chdir(".."); 
//关闭目录  
    closedir(pDir);  
}  
int main(int argc,char*argv[]){

    if(argc==3){
        count=0;
        totalCount=0;
         startCode(argv[1],argv[2]);
         printf("文件总数： %d 成功文件数： %d \n ",totalCount,count);
    }else{
        printf("parameter count is not right");
    }
   return 0;
}