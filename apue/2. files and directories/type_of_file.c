#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char const *argv[]) {
  int i;
  struct stat buf;
  char *ptr;
  for (i = 1; i < argc; i++) {
    if (lstat(argv[i],&buf) < 0) {
      printf("lstat failed errno = %d\n", errno);
      continue;
    }
    else if (S_ISREG(buf.st_mode)) {
      ptr = "regular";
    }
    else if (S_ISDIR(buf.st_mode)) {
      ptr = "directory";
    }
    else if (S_ISCHR(buf.st_mode)) {
      ptr = "character special";
    }
    else if (S_ISBLK(buf.st_mode)) {
      ptr = "block special";
    }
    else if (S_ISFIFO(buf.st_mode)) {
      ptr = "fifo";
    }
    else if (S_ISLNK(buf.st_mode)) {
      ptr = "symbol link";
    }
    else if (S_ISSOCK(buf.st_mode)) {
      ptr = "socket";
    }
    else{
      ptr = "unknown mode";
    }
    printf("%s\n",ptr);
    printf("the size is %ld\n",buf.st_size);
  }
  return 0;
}
