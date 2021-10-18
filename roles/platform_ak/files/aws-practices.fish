function aws-practices
  set --erase AWS_PROFILE
  aws-google-auth -d 3600 -p aws-practices
  set -xg AWS_PROFILE aws-practices
end
