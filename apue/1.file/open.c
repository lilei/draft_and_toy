#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
int main(int argc, char const *argv[]) {
  int ret = open("./1.txt",O_WRONLY | O_CREAT);
  if (-1 == ret) {
    printf("the errno is %d\n",errno);
  }
  return 0;
}
