function chroot
    if ! type -q gchroot
        command chroot $argv
    else
        gchroot $argv
    end
end
