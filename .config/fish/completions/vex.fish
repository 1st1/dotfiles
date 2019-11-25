function __fish_vex_list
    vex --list
end

complete -c vex -a '(__fish_vex_list)' --exclusive
