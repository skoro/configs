# Put this file to:
# ~/.config/fish/functions/fish_prompt.fish

function fish_prompt --description 'Prompt with svn and git support.'

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end
    
    set branch (svn info ^ /dev/null | grep '^Relative URL:' | sed 's/Relative URL: ^\///' )
    if test -z $branch
        set branch (git branch ^ /dev/null | grep '^\*' | sed 's/^\* //' )
    end
    
    switch $USER
    case root
        if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end
        echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '# '
    
    case '*'
        if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
        echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"
    end
    
    if not test -z $branch
        echo -n -s (set_color blue) ':' "$branch" $__fish_prompt_normal
    end
    
    echo -n '> '
end

