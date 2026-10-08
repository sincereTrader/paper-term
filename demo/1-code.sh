#!/usr/bin/env bash
# Paper Term demo 1: syntax-highlighted code with ligatures.
clear
d=$'\e[2m'; r=$'\e[0m'; k=$'\e[38;5;215m'; s=$'\e[38;5;150m'; f=$'\e[38;5;110m'; n=$'\e[38;5;180m'; c=$'\e[38;5;244m'; t=$'\e[38;5;139m'
cat <<EOF
${c}  ── src/dispatch.ts ───────────────────────────────────────────────────${r}

${d} 1${r}  ${k}import${r} { Worktree, Agent } ${k}from${r} ${s}"./types"${r};
${d} 2${r}
${d} 3${r}  ${c}// Send queued tasks to idle agents, one worktree each.${r}
${d} 4${r}  ${k}export async function${r} ${f}dispatch${r}(queue: ${t}Task${r}[], agents: ${t}Agent${r}[]) {
${d} 5${r}    ${k}const${r} idle = agents.${f}filter${r}((a) => a.status !== ${s}"busy"${r});
${d} 6${r}
${d} 7${r}    ${k}for${r} (${k}const${r} task ${k}of${r} queue) {
${d} 8${r}      ${k}if${r} (idle.length == ${n}0${r} || task.retries >= ${n}3${r}) ${k}break${r};
${d} 9${r}      ${k}const${r} agent = idle.${f}shift${r}()!;
${d}10${r}      ${k}await${r} agent.${f}run${r}(task) ?? ${f}log${r}(${s}\`skipped \${task.id}\`${r});
${d}11${r}    }
${d}12${r}
${d}13${r}    ${k}return${r} queue.length <= ${n}0x10${r} ? ${s}"ok"${r} : ${s}"backlog"${r};
${d}14${r}  }
${d}15${r}
${d}16${r}  ${c}/* Ligatures: != !== == === <= >= => -> <- :: |> */${r}

EOF
