NAME="$1"
grpcurl --plaintext localhost:10094 spacemesh.v1.PostInfoService.PostStates | jq --arg NAME "$NAME" '.states[] | select(.name == $NAME) | .state'
