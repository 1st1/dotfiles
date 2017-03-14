function __fish_vex_list
    command vex --list
end

complete -c vex -a '(__fish_vex_list)' --exclusive
