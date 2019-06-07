/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/icarosix/WinData/Cursos/SistemasDigitales/simulation/ISE/VHDL-Examples/Semaphore/top_module.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );


static void work_a_3225011129_3212880686_p_0(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2984);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t1 = xsi_get_transient_memory(22U);
    memset(t1, 0, 22U);
    t5 = t1;
    memset(t5, (unsigned char)2, 22U);
    t6 = (t0 + 3064);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 22U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1512U);
    t5 = *((char **)t2);
    t2 = (t0 + 5280U);
    t6 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t11, t5, t2, 1);
    t7 = (t11 + 12U);
    t12 = *((unsigned int *)t7);
    t13 = (1U * t12);
    t4 = (22U != t13);
    if (t4 == 1)
        goto LAB7;

LAB8:    t8 = (t0 + 3064);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 22U);
    xsi_driver_first_trans_fast(t8);
    goto LAB3;

LAB7:    xsi_size_not_matching(22U, t13, 0);
    goto LAB8;

}


extern void work_a_3225011129_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3225011129_3212880686_p_0};
	xsi_register_didat("work_a_3225011129_3212880686", "isim/Top_module_tb_isim_beh.exe.sim/work/a_3225011129_3212880686.didat");
	xsi_register_executes(pe);
}
