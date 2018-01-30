# include <stdio.h>
# include <errno.h>
# include <sys/syscall.h>
# define IS_32_BIT 1
#if IS_32_BIT
	# define __NR_get_unique_id 386
#else
	# define __NR_get_unique_id 583
#endif

long get_unique_id (int *uuid){
	return syscall (__NR_get_unique_id, uuid) ? errno :0;
}

int main(){
	int uuid;
	int res;
	res= get_unique_id(&uuid);
	printf(" Syscall returned %d, uuid is %d,\n",res,uuid );
	res= get_unique_id(&uuid);
	printf(" Syscall returned %d, uuid is %d,\n",res,uuid );
	res= get_unique_id(47424742);
	printf(" Syscall returned %d",res);
	return 0;
}