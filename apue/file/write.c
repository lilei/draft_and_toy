#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define BUFFSIZE 4096
int main(int argc, char const *argv[]) {
  int fd = creat("data.txt",O_CREAT);
  if (fd < 0) {
    printf("create file failed,%s",strerror(errno));
    exit(1);
  }

  int len = 0;
  char buf[BUFFSIZE] = {0};
  memset(buf,'1',BUFFSIZE);
  while (len < 103316352) {
    if (BUFFSIZE < write(fd,buf,BUFFSIZE)) {
      printf("create file failed,%s",strerror(errno));
      exit(1);
    }
    len += BUFFSIZE;
  }
  return 0;
}
