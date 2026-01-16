#include <stdio.h>
#include "process.h"

/* ============================================================
 * Student implementation area
 * ============================================================ */
void fcfs_schedule(Process p[], int n)
{
    int current_time = 0;

    for (int i = 0; i < n; i++)
    {
        /* Si el proceso aún no llega, la CPU espera */
        if (current_time < p[i].arrival_time)
        {
            current_time = p[i].arrival_time;
        }

        /* Tiempo de espera */
        p[i].waiting_time = current_time - p[i].arrival_time;

        /* Tiempo de retorno */
        p[i].turnaround_time = p[i].waiting_time + p[i].burst_time;

        /* Avanza el tiempo actual */
        current_time += p[i].burst_time;
    }
}

/* ============================================================
 * DO NOT MODIFY MAIN
 * ============================================================ */
#ifndef UNIT_TEST
int main(void)
{
    int n;
    printf("Número de procesos: ");
    scanf("%d", &n);

    Process p[n];
    read_processes(p, n);
    init_processes(p, n);

    fcfs_schedule(p, n);

    print_results(p, n, "FCFS Scheduling");
    return 0;
}
#endif