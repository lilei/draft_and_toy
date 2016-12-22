#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/stat.h>
#include <string.h>
int main(int argc, char const *argv[]) {
  int fd = open(argv[1],O_RDONLY);
  if (-1 == fd) {
    printf("%s\n",strerror(errno));
    return 0;
  }
  struct stat buf;
  if(fstat(fd,&buf) == -1){
    printf("fstat failed %s",strerror(errno));
  }
  printf("the file size is %ld\n",buf.st_size);

  return 0;
}
