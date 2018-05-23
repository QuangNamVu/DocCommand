#include <get_pass.h>

char *my_getpass (int echo_state)
{
  char *pass, c;
  int i=0;

  pass = new char[ENOUGH_SIZE];
  if (pass == NULL)
  {
    perror ("Exit");
    exit (1);
  }

  cbreak ();
  noecho ();

  while ((c=getch()) != '\n')
  {
    if (c == BACK_SPACE)
    {
      /* Do not let the buffer underflow */
      if (i > 0){
        i--;
        if (echo_state == ECHO_ON)
               printw ("\b \b");
      }
    }
    else if (c == '\t')
      ; /* Ignore tabs */
    else
    {
      pass[i] = c;
      i = (i >= ENOUGH_SIZE) ? ENOUGH_SIZE - 1 : i+1;
      if (echo_state == ECHO_ON)
        printw ("*");
    }
  }
  echo ();
  nocbreak ();
  pass[i] = '\0';
  endwin ();
  return pass;
}

char *get_pass (void) {
  char *pass;

  initscr ();

  printw("Enter Password: ");
  pass = my_getpass (ECHO_ON);

  // refresh ();
  /* getch (); */
  // endwin ();
  return pass;
}
