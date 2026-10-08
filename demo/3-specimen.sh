#!/usr/bin/env bash
# Paper Term demo 3: a character specimen.
clear
r=$'\e[0m'; b=$'\e[1m'; d=$'\e[2m'; o=$'\e[38;5;215m'
cat <<EOF

  ${b}PAPER TERM${r}  ${d}a terminal cut of Paper Mono · paper.design/mono${r}

  ${d}upper${r}    ABCDEFGHIJKLMNOPQRSTUVWXYZ
  ${d}lower${r}    abcdefghijklmnopqrstuvwxyz
  ${d}digits${r}   0123456789  \$1,280.50  ½  x²
  ${d}symbols${r}  @ & # % * ^ ~ \` ' " ( ) [ ] { } < > / \\ |

  ${d}tell-apart${r}   ${o}0O${r}  ${o}Il1|${r}  ${o}rn m${r}  ${o}cl d${r}  ${o}'\`"${r}  ${o}5S${r}  ${o}2Z${r}  ${o}8B${r}

  ${d}ligatures${r}    !=  !==  ==  ===  <=  >=  <=>  =>  ->  <-  ::  |>  <!--  -->

  ${d}regular${r}      The quick brown fox jumps over a lazy dog.
  ${d}bold${r}         ${b}The quick brown fox jumps over a lazy dog.${r}

  ${d}box drawing${r}
  ╭──────────────────╮  ┌─────┬─────┐  ╔════════════╗
  │  paper  ·  term  │  │ 0x0 │ 0x1 │  ║  ▁▂▃▄▅▆▇█  ║
  ╰──────────────────╯  └─────┴─────┘  ╚════════════╝
  ${o}██████████████████${r}${d}░░░░░░░░${r}  68%   sending...

EOF
