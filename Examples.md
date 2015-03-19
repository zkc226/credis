The intention with this page is to provide a few source code snippets that show how to use credis to interact with a Redis server.

In most examples error handling has been left out for simplicity.

# Connecting to a Redis server #

The example below connects to a Redis server running on the same machine. Sets a key value; and retrieves and displays the newly set key value. Then the example closes the connection.

```
#include <stdio.h>

#include "credis.h"

int main(int argc, char **argv)
{
  REDIS rh;
  char *val;

  /* create handle to a Redis server running on localhost, port 6789,
     with a 2 second response timeout */
  rh = credis_connect(NULL, 6789, 2000);

  /* ping server */
  credis_ping(rh);

  /* set value of key "kalle" to "kula" */
  credis_set(rh, "kalle", "kula");

  /* get value of key "kalle" */
  credis_get(rh, "kalle", &val);
  printf("get kalle returned: %s\n", val);

  /* close connection to redis server */
  credis_close(rh);

  return 0;
}
```