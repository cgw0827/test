#!/bin/sh

## change to script dir
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$DIR/"
if [ $# -lt 1 ]
then
#加密为encode，解密decode  在这里可以通过控制台传参，如果有参数用参数判断是加密还是解密，如果不想哟功能参数直接设置encrypt。
	encrypt="encode"
else
	encrypt=$1
fi


#源目录
sourceDir="/Users/cgw/svn/cocos2d-x-2.2.6/projects/SanGuoGame/Resources"


./codeTool $sourceDir $encrypt

