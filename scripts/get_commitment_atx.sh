grpcurl -plaintext 127.0.0.1:10092 spacemesh.v1.ActivationService.Highest | jq -r '.atx.id.id' | base64 -d | xxd -p -c 64
