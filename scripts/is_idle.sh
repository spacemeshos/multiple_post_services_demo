NAME=$1
POST_STATE=$(grpcurl --plaintext localhost:10094 spacemesh.v1.PostInfoService.PostStates | jq -r --arg NAME "${NAME}.key" '.states[] | select(.name == $NAME) | .state')
echo "Post service $NAME is $POST_STATE"
if [ "$POST_STATE" = "IDLE" ]; then
  exit 0
else
  exit 1
fi
