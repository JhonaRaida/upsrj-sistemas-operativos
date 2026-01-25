#include <stdio.h>
#include "process.h"

/* ============================================================
 * Student implementation area
 * ============================================================ */
void fcfs_schedule(Process p[], int n)
{
    int time = 0;
    Process result[n];
    int k = 0;

    // Ordenar por arrival_time y id
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (p[j].arrival_time < p[i].arrival_time ||
               (p[j].arrival_time == p[i].arrival_time &&
                p[j].id < p[i].id)) {

                Process tmp = p[i];
                p[i] = p[j];
                p[j] = tmp;
            }
        }
    }

    for (int i = 0; i < n; i++) {

        if (time < p[i].arrival_time)
            time = p[i].arrival_time;

        p[i].waiting_time = time - p[i].arrival_time;
        time += p[i].burst_time;
        p[i].turnaround_time = time - p[i].arrival_time;

        result[k++] = p[i];
    }

    // Copiar orden final
    for (int i = 0; i < n; i++) {
        p[i] = result[i];
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
