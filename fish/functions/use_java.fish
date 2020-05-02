function use_java
    set -gx JAVA_HOME=(/usr/libexec/java_home -v $argv[1])
end
