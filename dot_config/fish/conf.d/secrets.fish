
# Not committed
if [ -f "$HOME/.config/envsecret/envsecret.sourceable.fish" ]
    set OLD_IFS "$IFS"
    set IFS ""

    if set --query CLOUDSDK_ACTIVE_CONFIG_NAME
      set --local CLOUDSDK_ACTIVE_CONFIG_NAME_OLD "$CLOUDSDK_ACTIVE_CONFIG_NAME"
    end

    set --global --export  CLOUDSDK_ACTIVE_CONFIG_NAME "secret-store"
    set --local ENV_SECRETS (
      sops \
        exec-file \
        "$HOME/.config/envsecret/envsecret.sourceable.fish" \
        'cat "{}"'
    )

    if set --query  CLOUDSDK_ACTIVE_CONFIG_NAME_OLD
      set --global --export  CLOUDSDK_ACTIVE_CONFIG_NAME "$CLOUDSDK_ACTIVE_CONFIG_NAME_OLD"
    else
      set --erase  CLOUDSDK_ACTIVE_CONFIG_NAME
    end


    eval "$HOME/.config/envsecret/envsecret.sourceable.fish"
    set IFS "$OLD_IFS"
end
