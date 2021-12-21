#!/bin/sh
[ "${TERM:-none}" = "linux" ] && \
    printf '%b' '\e]P0666666
                 \e]P1CC6699
                 \e]P299CC66
                 \e]P3CC9966
                 \e]P46699CC
                 \e]P59966CC
                 \e]P666CC99
                 \e]P7CCCCCC
                 \e]P8999999
                 \e]P9CC6699
                 \e]PA99CC66
                 \e]PBCC9966
                 \e]PC6699CC
                 \e]PD9966CC
                 \e]PE66CC99
                 \e]PFCCCCCC
                 \ec'
