# include <stdio.h>
# include <errno.h>
# include <sys/syscall.h>
int main(){
	int uuid;
	long int r =syscall (548 , &uuid);
	printf(" Syscall returned %d,uuid is %d\n",r,uuid);
	return 0;
}
