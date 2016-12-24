#ifndef PACKAGE_HEAD_H_
#define PACKAGE_HEAD_H_
#define FLAG            0x0000
int defaultSize=11;
static char* defaultFlags;
typedef struct 
{
	int commandID_;
	int bodySize_;
	unsigned char type_;
	int flag_;
	int headLength;
	FREE_FUNC free_func;
	Data* data;
}PackageHead;
PackageHead* getPackageHead();
void free_PackageHead(void* data);
bool initPackageHead(PackageHead* head,char *bytes);
void converseToData(PackageHead* head);
bool init_package_head_len(PackageHead* head,int bodySize, unsigned char type, int commandID, long long flag);
#endif