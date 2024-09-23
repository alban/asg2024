Output oci.gif
Output oci.webm
Set Theme "Ubuntu"
Env PS1 "\n\e[0;31m\$ \e[m"

Hide

Type@1ms "cd .. && cd $(mktemp -d -p $PWD tmp-XXXXXX)"
Enter
Type@1ms "cp ../gotls/program.bpf.c ../gotls/*.h ./"
Enter
Type@1ms "sudo -E ig image remove ghcr.io/alban/asg2024/gotls"
Enter
Type@1ms "sudo -E ig image remove ghcr.io/alban/asg2024/gotls:v0"
Enter
Type@1ms "clear"
Enter

Sleep 2s
Show

Type "# Demo: build and push a gadget"
Enter
Enter
Type "# The current directory contain the BPF program"
Enter
Type "ls -l"
Enter
Sleep 1s

Type "# List gadgets currently available"
Enter
Type "sudo -E ig image list"
Enter
Sleep 1s
Type "# So far, Inspektor Gadget does not have any gadget"
Enter
Sleep 4s

Type "# Build our first gadget"
Enter
Type "sudo -E ig image build -t ghcr.io/alban/asg2024/gotls:v0 ."
Sleep 1s
Enter
Sleep 7s
Type "# Successfull build :-)"
Enter
Sleep 3s

Type "ls -l"
Enter
Sleep 1s

Type "sudo -E ig image list"
Enter
Sleep 1s
Type "# Inspektor Gadget has our gadget (in /var/lib/ig)"
Enter
Sleep 5s

Type "# Let's push our gadget"
Enter
Type "sudo -E ig image push ghcr.io/alban/asg2024/gotls:v0"
Enter
Sleep 5s

Type "# Let's run the gadget using the curl | sh ..."
Enter
Type "# Just kidding. Let's sign it first."
Enter
Sleep 1s

Type "cosign generate-key-pair"
Enter
Sleep 1s
Enter
Sleep 1s
Enter
Sleep 1s
Type "ls -l cosign.*"
Enter
Sleep 2s

Type "digest=$(sudo -E ig image inspect \"
Enter
Type "    ghcr.io/alban/asg2024/gotls:v0 -o json \"
Enter
Type "    | jq -r .Digest)"
Enter
Sleep 1s
Type "echo $digest"
Enter
Sleep 1s
Type "cosign sign --key cosign.key --yes --recursive \"
Enter
Type "    ghcr.io/alban/asg2024/gotls@$digest"
Enter
Sleep 1s
Enter

Sleep 10s

Hide

Type@1ms "cp cosign.* ../vhs/"
Enter

Sleep 1s
