Output gotls-k8s-with-install.gif
Output gotls-k8s-with-install.webm
Set Theme "Ubuntu"
Env PS1 "\n\e[0;31m\$ \e[m"

Hide

Type@1ms "cd .. && cd $(mktemp -d -p $PWD tmp-XXXXXX)"
Enter
Type@1ms "cp ../gotls/program.bpf.c ../gotls/*.h ./"
Enter
Type@1ms "cp ../vhs/cosign.pub ./"
Enter
Type@1ms "sudo -E ig image remove ghcr.io/alban/asg2024/gotls"
Enter
Type@1ms "sudo -E ig image remove ghcr.io/alban/asg2024/gotls:v0"
Enter
Type@1ms "for i in $(kubectl get pod -o name|grep pod/node-debugger) ; do kubectl delete $i ; done"
Enter
Type@1ms "clear"
Enter

Sleep 2s
Show

Type "# Run our gadget gotls"
Enter
Sleep 1s
Type "kubectl gadget run \"
Enter
Type "    ghcr.io/alban/asg2024/gotls:v0 \"
Enter
Type "    -o jsonpretty \"
Enter
Type "    -l role=demo"
Sleep 2s
Enter
Sleep 15s
Ctrl+C
Sleep 15s
