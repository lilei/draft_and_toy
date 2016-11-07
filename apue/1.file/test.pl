#! /usr/bin/perl
#`time ./copy `
#$my @case = qw/1 2 4 8 16 32 64 128/;
print("this is the test case:\n");
my @case = qw/ 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288/;
foreach(@case){
    print("$_:\n");
    my @lines = `time  -p ./copy < data.txt > /dev/null $_`;
}
