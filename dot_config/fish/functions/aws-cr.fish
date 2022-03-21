function aws-cr
  set --erase AWS_PROFILE
  aws-google-auth -d 3600 -p aws-cr
  set -xg AWS_PROFILE aws-cr
end
