###
### Wordpress 'wp-cli' competions.
###

function __fish_wp_cli_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 -a $cmd[1] == 'wp' ]
        return 0
    end
    if [ (count $cmd) -eq 1 -a $cmd[1] == 'wp.phar' ]
        return 0
    end
    return 1
end

set wp (wp | awk 'BEGIN {g=0} /^SUBCOMMANDS/ {g=1;next} /^[A-Z]+/ {g=0} /^$/ {next} {if (g) print $0}')

for i in $wp
    echo $i | read cmd desc
    complete -f -c wp -n __fish_wp_cli_needs_command -a $cmd -d "$desc"
end

