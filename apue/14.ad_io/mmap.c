#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define COPYINCR (1024 * 1024 * 1024)
#define  FILE_MODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
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
        return 0;
    }

    printf("intput file %s,output file %s\n",argv[1],argv[2]);
    if ((fdin = open(argv[1],O_RDONLY)) < 0) {
        printf("open file error,%s\n", strerror(errno));
        return 0;
    }

    if (fstat(fdin,&sbuf) < 0) {
        printf("fstat error,%s\n", strerror(errno));
        return 0;
    }

    if ((fdout = open(argv[2],O_RDWR | O_CREAT | O_TRUNC,FILE_MODE)) < 0) {
        printf("cannot create file rror,%s\n", strerror(errno));
        return 0;
    }


  /* set size of output file.must first grow up the file, mmap can not append a file*/
  /* in fact lseek cannot enlarge a file*/
    if (lseek(fdout, sbuf.st_size-1, SEEK_SET) == -1){
        printf("lseek error,%s\n",strerror(errno));
        return 0;
    }
    if (write(fdout, "1", 1) != 1){
        printf("write error\n");
        return 0;
    }

    if ((src = mmap(0, sbuf.st_size, PROT_READ, MAP_SHARED,
      fdin, 0)) == MAP_FAILED){
        printf("mmap error for input\n");
        return 0;
      }

    if ((dst = mmap(0, sbuf.st_size, PROT_READ | PROT_WRITE,
      MAP_SHARED, fdout, 0)) == MAP_FAILED){
        printf("mmap error for output,%s\n",strerror(errno));
        return 0;
      }

    memcpy(dst, src, sbuf.st_size); /* does the file copy */
    exit(0);
}
