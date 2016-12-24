#include "PackageHead.h"
#include "../util/Data.h"
#define FLAG            0x0000
PackageHead* getPackageHead(){
	 PackageHead* temp=(PackageHead*)malloc(sizeof(PackageHead));
	 temp->commandID_=0;
	 temp->bodySize_=0;
	 temp->flag_=0;
	 temp->headLength=0;
	 temp->data=NULL;
     temp->free_func=free_PackageHead;
	 return temp;
}
void free_PackageHead(void* data){
    if (data)
    {
        CCLOG("free_PackageHead~~~~~~~~~~~~~\n");
        PackageHead* temp=(PackageHead*)data;
        /* code */
        if (temp->data)
        {
            FREE_STRUCT(temp->data);
        }
        // FREE_POINTER(temp);
    }
}
void initDefaultPackageParams(){
     defaultSize=11;
}
void converseToData(PackageHead* head)
{
    Data *tempData =newData();
    appendBytes(tempData,(signed char*)&head->type_, 1);
    appendData(tempData,intToData(head->commandID_));
    appendData(tempData,intToData(head->flag_));
    head->data =newData();
    appendData(head->data,shortToData(head->bodySize_ + tempData ->len));
    appendBytes(head->data,tempData ->bytes, tempData ->len);
    FREE_STRUCT(tempData);
    head->headLength = head->data->len;
}
bool init_package_head(PackageHead* head,char *bytes){
    Data* data_=getData(bytes,defaultSize);
    DataReadTool* stream=newDataReadTool(data_);
    head->bodySize_ =data_read_short(stream) - 9;
    head->type_ = data_read_byte(stream);
    head->commandID_ = data_read_int(stream);
    head->flag_ = data_read_int(stream);
    head->data = data_;
    head->headLength = defaultSize;
    FREE_STRUCT(stream);
    return true;
}
bool init_package_head_len(PackageHead* head,int bodySize, unsigned char type, int commandID, long long flag)
{
    head->bodySize_ = bodySize;
    head->type_ = type;
    head->commandID_ = commandID;
    head->flag_ = flag;
    // printf("bodySize %d  type is %d commandID is %d\n",bodySize,type,commandID );
    converseToData(head);
    return true;
}
PackageHead* getDefaultPackageHead(int commandId, int bodySize, unsigned char type)
{
    PackageHead* packagetHead = getPackageHead();

    if (!defaultFlags || !defaultSize) {
        initDefaultPackageParams();
    }
    init_package_head_len(packagetHead,bodySize, type, commandId, FLAG);
    
    return packagetHead;
}