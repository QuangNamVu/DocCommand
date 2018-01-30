#include <linux/linkage.h>
#include <linux/uaccess.h>
static int result =0;
asmlinkage long sys_get_unique_id(int *uuid)
{
	result++;
	int err=0;
	err = put_user(result,uuid);
	return err? -EFAULT : 0;
}