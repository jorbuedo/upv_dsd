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
static const char *ng0 = "/home/jorbuedo/DSD/tema2/WaterBombs.vhd";



static void work_a_3350991905_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3552);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 3648);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1832U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t2 = (t0 + 3648);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t11;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB7:    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

}

static void work_a_3350991905_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    char *t12;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB6, &&LAB7, &&LAB8};

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 3568);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 5750);
    t6 = (t0 + 3712);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 2U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5752);
    t3 = 1;
    if (2U == 2U)
        goto LAB13;

LAB14:    t3 = 0;

LAB15:    if (t3 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5754);
    t3 = 1;
    if (2U == 2U)
        goto LAB21;

LAB22:    t3 = 0;

LAB23:    if (t3 != 0)
        goto LAB19;

LAB20:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB11:    goto LAB2;

LAB4:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 5756);
    t4 = (t0 + 3712);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5758);
    t3 = 1;
    if (2U == 2U)
        goto LAB30;

LAB31:    t3 = 0;

LAB32:    if (t3 != 0)
        goto LAB27;

LAB29:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5760);
    t3 = 1;
    if (2U == 2U)
        goto LAB38;

LAB39:    t3 = 0;

LAB40:    if (t3 != 0)
        goto LAB36;

LAB37:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5762);
    t3 = 1;
    if (2U == 2U)
        goto LAB46;

LAB47:    t3 = 0;

LAB48:    if (t3 != 0)
        goto LAB44;

LAB45:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB28:    goto LAB2;

LAB5:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 5764);
    t4 = (t0 + 3712);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5766);
    t3 = 1;
    if (2U == 2U)
        goto LAB55;

LAB56:    t3 = 0;

LAB57:    if (t3 != 0)
        goto LAB52;

LAB54:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5768);
    t3 = 1;
    if (2U == 2U)
        goto LAB63;

LAB64:    t3 = 0;

LAB65:    if (t3 != 0)
        goto LAB61;

LAB62:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB53:    goto LAB2;

LAB6:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 5770);
    t4 = (t0 + 3712);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5772);
    t3 = 1;
    if (2U == 2U)
        goto LAB72;

LAB73:    t3 = 0;

LAB74:    if (t3 != 0)
        goto LAB69;

LAB71:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5774);
    t3 = 1;
    if (2U == 2U)
        goto LAB80;

LAB81:    t3 = 0;

LAB82:    if (t3 != 0)
        goto LAB78;

LAB79:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB70:    goto LAB2;

LAB7:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 5776);
    t4 = (t0 + 3712);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5778);
    t3 = 1;
    if (2U == 2U)
        goto LAB89;

LAB90:    t3 = 0;

LAB91:    if (t3 != 0)
        goto LAB86;

LAB88:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5780);
    t3 = 1;
    if (2U == 2U)
        goto LAB97;

LAB98:    t3 = 0;

LAB99:    if (t3 != 0)
        goto LAB95;

LAB96:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5782);
    t3 = 1;
    if (2U == 2U)
        goto LAB105;

LAB106:    t3 = 0;

LAB107:    if (t3 != 0)
        goto LAB103;

LAB104:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB87:    goto LAB2;

LAB8:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 5784);
    t4 = (t0 + 3712);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5786);
    t3 = 1;
    if (2U == 2U)
        goto LAB114;

LAB115:    t3 = 0;

LAB116:    if (t3 != 0)
        goto LAB111;

LAB113:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5788);
    t3 = 1;
    if (2U == 2U)
        goto LAB122;

LAB123:    t3 = 0;

LAB124:    if (t3 != 0)
        goto LAB120;

LAB121:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB112:    goto LAB2;

LAB9:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 5790);
    t4 = (t0 + 3712);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 3776);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB10:    xsi_set_current_line(53, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t7);
    goto LAB11;

LAB13:    t11 = 0;

LAB16:    if (t11 < 2U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB14;

LAB18:    t11 = (t11 + 1);
    goto LAB16;

LAB19:    xsi_set_current_line(55, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t7);
    goto LAB11;

LAB21:    t11 = 0;

LAB24:    if (t11 < 2U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB22;

LAB26:    t11 = (t11 + 1);
    goto LAB24;

LAB27:    xsi_set_current_line(62, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    goto LAB28;

LAB30:    t11 = 0;

LAB33:    if (t11 < 2U)
        goto LAB34;
    else
        goto LAB32;

LAB34:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB31;

LAB35:    t11 = (t11 + 1);
    goto LAB33;

LAB36:    xsi_set_current_line(64, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t7);
    goto LAB28;

LAB38:    t11 = 0;

LAB41:    if (t11 < 2U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB39;

LAB43:    t11 = (t11 + 1);
    goto LAB41;

LAB44:    xsi_set_current_line(66, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB28;

LAB46:    t11 = 0;

LAB49:    if (t11 < 2U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB47;

LAB51:    t11 = (t11 + 1);
    goto LAB49;

LAB52:    xsi_set_current_line(73, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    goto LAB53;

LAB55:    t11 = 0;

LAB58:    if (t11 < 2U)
        goto LAB59;
    else
        goto LAB57;

LAB59:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB56;

LAB60:    t11 = (t11 + 1);
    goto LAB58;

LAB61:    xsi_set_current_line(75, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t7);
    goto LAB53;

LAB63:    t11 = 0;

LAB66:    if (t11 < 2U)
        goto LAB67;
    else
        goto LAB65;

LAB67:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB64;

LAB68:    t11 = (t11 + 1);
    goto LAB66;

LAB69:    xsi_set_current_line(82, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB70;

LAB72:    t11 = 0;

LAB75:    if (t11 < 2U)
        goto LAB76;
    else
        goto LAB74;

LAB76:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB73;

LAB77:    t11 = (t11 + 1);
    goto LAB75;

LAB78:    xsi_set_current_line(84, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t7);
    goto LAB70;

LAB80:    t11 = 0;

LAB83:    if (t11 < 2U)
        goto LAB84;
    else
        goto LAB82;

LAB84:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB81;

LAB85:    t11 = (t11 + 1);
    goto LAB83;

LAB86:    xsi_set_current_line(91, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t7);
    goto LAB87;

LAB89:    t11 = 0;

LAB92:    if (t11 < 2U)
        goto LAB93;
    else
        goto LAB91;

LAB93:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB90;

LAB94:    t11 = (t11 + 1);
    goto LAB92;

LAB95:    xsi_set_current_line(93, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t7);
    goto LAB87;

LAB97:    t11 = 0;

LAB100:    if (t11 < 2U)
        goto LAB101;
    else
        goto LAB99;

LAB101:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB98;

LAB102:    t11 = (t11 + 1);
    goto LAB100;

LAB103:    xsi_set_current_line(95, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)5;
    xsi_driver_first_trans_fast(t7);
    goto LAB87;

LAB105:    t11 = 0;

LAB108:    if (t11 < 2U)
        goto LAB109;
    else
        goto LAB107;

LAB109:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB106;

LAB110:    t11 = (t11 + 1);
    goto LAB108;

LAB111:    xsi_set_current_line(102, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)5;
    xsi_driver_first_trans_fast(t7);
    goto LAB112;

LAB114:    t11 = 0;

LAB117:    if (t11 < 2U)
        goto LAB118;
    else
        goto LAB116;

LAB118:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB115;

LAB119:    t11 = (t11 + 1);
    goto LAB117;

LAB120:    xsi_set_current_line(104, ng0);
    t7 = (t0 + 3776);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t7);
    goto LAB112;

LAB122:    t11 = 0;

LAB125:    if (t11 < 2U)
        goto LAB126;
    else
        goto LAB124;

LAB126:    t5 = (t2 + t11);
    t6 = (t1 + t11);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB123;

LAB127:    t11 = (t11 + 1);
    goto LAB125;

}


extern void work_a_3350991905_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3350991905_3212880686_p_0,(void *)work_a_3350991905_3212880686_p_1};
	xsi_register_didat("work_a_3350991905_3212880686", "isim/WaterBombs_tb_isim_beh.exe.sim/work/a_3350991905_3212880686.didat");
	xsi_register_executes(pe);
}
