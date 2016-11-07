#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#define BUFFSIZE 4096
int main(int argc,char* argv[])
{
  size_t len = 1;
  if (argc > 1) {
    len = atoi(argv[1]);
  }
    int    n;
    char   buf[BUFFSIZE];

    while ((n = read(STDIN_FILENO, buf, len)) > 0)
        if (write(STDOUT_FILENO, buf, n) != n)
            printf("write error");
    if (n < 0)
        printf("read error,%s\n",strerror(errno));

    exit(0);
}
