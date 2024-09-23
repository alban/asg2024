Output oci.gif
Env PS1 "\$ "

Hide
Type "cd .. && cd $(mktemp -d -p $PWD tmp-XXXXXX)"
Enter
Type "cp ../gotls/program.bpf.c ../gotls/*.h ./"
Enter
Type "clear"
Enter
Show

Type "ls -l"
Enter
Sleep 1s

Type "sudo -E ig image list"
Enter
Sleep 1s

Type "sudo -E ig image build -t ghcr.io/alban/asg2024/gotls ."
Enter
Sleep 5s

Type "ls -l"
Enter
Sleep 1s

Type "sudo -E ig image list"
Enter
Sleep 3s
