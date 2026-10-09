#!/usr/bin/env bash
# Paper Term demo 2: an everyday shell session.
clear
r=$'\e[0m'; b=$'\e[1m'; d=$'\e[2m'; g=$'\e[32m'; y=$'\e[33m'; bl=$'\e[34m'; m=$'\e[35m'; cy=$'\e[36m'; red=$'\e[31m'
p="${cy}~/code/paper-term${r} ${m}main${r} ${b}❯${r}"
cat <<EOF
$p git log --oneline --graph -4
$(git -C "$(dirname "$0")/.." log --oneline --graph --color=always -4)

$p du -sh fonts/otf/*
┌──────────────────────────┬────────┬────────────────────────────┐
│ ${b}file${r}                     │ ${b}size${r}   │ ${b}weight${r}                     │
├──────────────────────────┼────────┼────────────────────────────┤
│ PaperTerm-Thin.otf       │ 112K   │ ${bl}██░░░░░░░░░░░░░░░░░░${r}   100 │
│ PaperTerm-Regular.otf    │ 112K   │ ${bl}████████░░░░░░░░░░░░${r}   400 │
│ PaperTerm-Medium.otf     │ 112K   │ ${bl}██████████░░░░░░░░░░${r}   500 │
│ PaperTerm-ExtraBold.otf  │ 116K   │ ${bl}████████████████████${r}   800 │
└──────────────────────────┴────────┴────────────────────────────┘

$p
EOF
