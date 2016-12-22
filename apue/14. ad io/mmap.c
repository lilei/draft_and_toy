#include <sys/mman.h>
#include <stdio.h>

#define COPYINCR (1024 * 1024 * 1024)
int main(int argc, char * argv[])
{
    int fdin;
    int fdout;
    void *src;
    void *dst;
    size_t copysz;
    struct stat sbuf;
    off_t sfz = 0;
    if (argc != 3) {
        printf("usage: %s <fromfile> <tofile>\n", argv[0]);
    }

    if (fdin = open(argv[1],O_RDONLY) < 0) {
        printf("open file error,%s\n", strerror(errno));
    }

    if (fout = open(argv[2],O_RDWR | O_CREAT | O_TRUNC,FILE_MODE) < 0) {
        printf("cannot create file rror,%s\n", strerror(errno));
    }

    if (fstat(fdin,&sbuf) < 0) {
        printf("fstat error,%s\n", strerror(errno));
    }

    if (ftruncate(fout,sbuf.st_size) < 0) {
        printf("ftruncate error,%s\n", strerror(errno));
    }
    while (fsz < sbuf.st_size) {
        if()
    }


}

