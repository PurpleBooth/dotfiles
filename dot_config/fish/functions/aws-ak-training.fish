function aws-ak-training
  set --erase AWS_PROFILE
  aws-google-auth -d 3600 -p ak-training
  set -xg AWS_PROFILE ak-training
end
