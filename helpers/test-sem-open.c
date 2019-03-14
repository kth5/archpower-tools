#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <semaphore.h>


int main(int argc, char *argv[]) {

 const char *SEM_NAME = "SHRMEM_SCXL";  /* name of mutex */
 sem_t *mutex = SEM_FAILED;             /* ptr to mutex */

#ifdef _POSIX_SEMAPHORES
  printf("_POSIX_SEMAPHORES %ld\n", _POSIX_SEMAPHORES);
#else
  puts("Undefined");
#endif

 printf("sysconf %s\n", sysconf(_SC_SEMAPHORES) ? "Yes" : "No" );

 mutex = sem_open(SEM_NAME, O_CREAT, 0666, 1);

 if (mutex == SEM_FAILED) printf("Failed %d\n", errno);
 else {
        puts("Success - pause while you check /dev/shm ");
        sleep(5);
        sem_close(mutex);
        sem_unlink(SEM_NAME);
 }
}


