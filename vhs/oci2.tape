Output oci2.gif
Output oci2.webm
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
Type@1ms "clear"
Enter

Sleep 2s
Show

Type "# Let's pull our gadget"
Enter
Type "sudo -E ig image pull ghcr.io/alban/asg2024/gotls:v0"
Enter
Sleep 5s

Type "# Inspektor Gadget has our gadget (in /var/lib/ig)"
Enter
Sleep 1s
Type "sudo -E ig image list"
Enter
Sleep 1s

Type "# Let's run the gadget!"
Enter
Sleep 1s
Type `sudo -E ig run ghcr.io/alban/asg2024/gotls:v0 -r docker \`
Enter
Type `    --public-keys="$(cat cosign.pub)"`
Enter
Sleep 8s
Ctrl+C
Enter

Sleep 5s
