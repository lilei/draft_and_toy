#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

void test()
{
  if (lseek(STDIN_FILENO,0,SEEK_CUR) == -1) {
    printf("cannot seek,erno = %d,%s\n",errno,strerror(errno));
  }else{
    printf("seek ok\n");
  }
}

int main(int argc, char const *argv[]) {
  //test();
  int fd = open("./1.txt",O_RDONLY);
  off_t pos = 0;
  if (fd < 0) {
    printf("open file failed %d\n",fd);
    return 1;
  }
  lseek(fd,3,SEEK_CUR);
  pos = lseek(fd,0,SEEK_CUR);
  if (-1 == pos) {
      printf("seek failed %d",errno);
  }
  printf("the new pos is %ld\n",pos);
  return 0;
}
