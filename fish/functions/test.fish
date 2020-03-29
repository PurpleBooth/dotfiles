function test
    if ! type -q gtest
        command test $argv
    else
        gtest $argv
    end
end
