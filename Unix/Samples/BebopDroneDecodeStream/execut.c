#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>

int main(){
execlp("mplayer", "mplayer","/tmp/arsdk_B3Akqs/arsdk_fifo", "-demuxer", "rawvideo", "-rawvideo", "w=640:h=368:fps=30:format=i420", NULL);
}
