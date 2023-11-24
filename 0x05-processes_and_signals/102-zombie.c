#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

/**
 * infinite_while - Sleeps in an infinite loop.
 *
 * Return: Always 0.
 */
int infinite_while(void)
{
	while (1)
		sleep(1);
	return (0);
}

/**
 * main - Creates five zombie processes.
 *
 * Return: Always 0.
 */
int main(void)
{
	int i;
	pid_t pid;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
		}
		else
			exit(0);
	}

	return (infinite_while());
}
