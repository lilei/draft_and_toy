#include <stdio.h>
#include <errno.h>

int main(int argc, char const *argv[]) {
  int fd = creat("creat.txt");
  if (fd < 0) {
    printf("crate file failed %d",errno);
    return 1;
  };
  printf("file dscriper is %d\n",fd);
  close(fd);
  return 0;
}
