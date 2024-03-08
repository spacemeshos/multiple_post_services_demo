NAME=$1
POST_STATE=$(grpcurl --plaintext localhost:10094 spacemesh.v1.PostInfoService.PostStates | jq -r --arg NAME "${NAME}.key" '.states[] | select(.name == $NAME) | .state')
echo $POST_STATE
