Output gotls-k8s-without-install.gif
Output gotls-k8s-without-install.webm
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

Type "# Let's investigate our Kubernetes workload"
Enter
Type "kubectl get node"
Enter
Sleep 2s
Type "kubectl get pod"
Enter
Sleep 2s

Type "# Using Inspektor Gadget without installation"
Enter
Type "kubectl debug node"
Sleep 1s
Type "/minikube-containerd \"
Sleep 1s
Enter
Type "    --profile=sysadmin \"
Enter
Type "    -ti \"
Enter
Type "    --image=ghcr.io/inspektor-gadget/ig:latest \"
Enter
Type "    -- \"
Enter
Type "    ig run trace_dns:latest \"
Enter
Type "    -r containerd \"
Enter
Type "    -c worker"
Sleep 2s
Enter
Sleep 15s
Ctrl+C
Sleep 2s
Type "# Not much relevant information from this gadget"
Enter
Sleep 10s

Type "kubectl debug node"
Sleep 1s
Type "/minikube-containerd \"
Sleep 1s
Enter
Type "    --profile=sysadmin \"
Enter
Type "    -ti \"
Enter
Type "    --image=ghcr.io/inspektor-gadget/ig:latest \"
Enter
Type "    -- \"
Enter
Type "    ig run ghcr.io/alban/asg2024/gotls:v0 \"
Enter
Type `    --public-keys="$(cat cosign.pub)" \`
Enter
Type "    -r containerd \"
Enter
Type "    -c worker"
Sleep 2s
Enter
Sleep 15s
Ctrl+C
Sleep 2s


Sleep 10s
