#include "ZipUtils.h"
int ccInflateMemory(unsigned char *in, unsigned int inLength, unsigned char **out)
{
    // 256k for hint
    return ccInflateMemoryWithHint(in, inLength, out, 256 * 1024);
}
int ccInflateMemoryWithHint(unsigned char *in, unsigned int inLength, unsigned char **out, unsigned int outLengthHint)
{
    unsigned int outLength = 0;
    int err = ccInflateMemoryWithHint(in, inLength, out, &outLength, outLengthHint);
    
    if (err != Z_OK || *out == NULL) {
        if (err == Z_MEM_ERROR)
        {
            CCLOG("cocos2d: ZipUtils: Out of memory while decompressing map data!");
        } else
            if (err == Z_VERSION_ERROR)
            {
                CCLOG("cocos2d: ZipUtils: Incompatible zlib version!");
            } else
                if (err == Z_DATA_ERROR)
                {
                    CCLOG("cocos2d: ZipUtils: Incorrect zlib compressed data!");
                }
                else
                {
                    CCLOG("cocos2d: ZipUtils: Unknown error while decompressing map data!");
                }
        
        delete[] *out;
        *out = NULL;
        outLength = 0;
    }
    
    return outLength;
}
int ccInflateMemoryWithHint(unsigned char *in, unsigned int inLength, unsigned char **out, unsigned int *outLength, unsigned int outLenghtHint)
{
    /* ret value */
    int err = Z_OK;
    
    int bufferSize = outLenghtHint;
    *out = new unsigned char[bufferSize];
    
    z_stream d_stream; /* decompression stream */
    d_stream.zalloc = (alloc_func)0;
    d_stream.zfree = (free_func)0;
    d_stream.opaque = (voidpf)0;
    
    d_stream.next_in  = in;
    d_stream.avail_in = inLength;
    d_stream.next_out = *out;
    d_stream.avail_out = bufferSize;
    
    /* window size to hold 256k */
    if( (err = inflateInit2(&d_stream, 15 + 32)) != Z_OK )
        return err;
    
    for (;;)
    {
        err = inflate(&d_stream, Z_NO_FLUSH);
        
        if (err == Z_STREAM_END)
        {
            break;
        }
        
        switch (err)
        {
            case Z_NEED_DICT:
                err = Z_DATA_ERROR;
            case Z_DATA_ERROR:
            case Z_MEM_ERROR:
                inflateEnd(&d_stream);
                return err;
        }
        
        // not enough memory ?
        if (err != Z_STREAM_END)
        {
            *out = (unsigned char*)realloc(*out, bufferSize * BUFFER_INC_FACTOR);
            
            /* not enough memory, ouch */
            if (! *out )
            {
                CCLOG("cocos2d: ZipUtils: realloc failed");
                inflateEnd(&d_stream);
                return Z_MEM_ERROR;
            }
            
            d_stream.next_out = *out + bufferSize;
            d_stream.avail_out = bufferSize;
            bufferSize *= BUFFER_INC_FACTOR;
        }
    }
    
    *outLength = bufferSize - d_stream.avail_out;
    err = inflateEnd(&d_stream);
    return err;
}