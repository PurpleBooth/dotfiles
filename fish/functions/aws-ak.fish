function aws-ak
  set --erase AWS_PROFILE
  aws-google-auth -d 3600 -p aws-ak
  set -xg AWS_PROFILE aws-ak
end
