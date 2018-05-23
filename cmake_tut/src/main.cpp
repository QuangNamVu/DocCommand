#include <iostream>
#include <get_pass.h>

using namespace std;

int main(int argc, char *argv[])
{
  string password = get_pass();
  if (password == "x") {
    cout << password << endl;
  }

  return 0;
}
