###
### Wordpress 'wp-cli' competions.
###
### Put this file to $HOME/.config/fish/competions directory.
###

function __fish_wp_cli_process_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 -a $cmd[1] = 'wp' ]
        return 0
    end
    if [ (count $cmd) -eq 1 -a $cmd[1] = 'wp.phar' ]
        return 0
    end
    return 1
end

function __fish_wp_cli_get_complete
    if [ (count $argv) ]
        set subcmd help $argv[1]
    end
    wp $subcmd | awk 'BEGIN {g=0} /^SUBCOMMANDS/ {g=1;next} /^[A-Z]+/ {g=0} /^$/ {next} {if (g) print $0}'
end

function __fish_wp_cli_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

for i in (__fish_wp_cli_get_complete)
    echo $i | read cmd desc
    complete -f -c wp -n __fish_wp_cli_process_command -a $cmd -d "$desc"
    for x in (__fish_wp_cli_get_complete $cmd)
        echo $x | read subcmd desc
        complete -f -c wp -n "__fish_wp_cli_using_command $cmd" -a $subcmd -d "$desc"
    end
end

