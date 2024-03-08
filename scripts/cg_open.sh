while true; do
    grpcurl --plaintext localhost:10094 spacemesh.v1.PostInfoService.PostStates | grep "PROVING"
    if [ $? -eq 0 ]; then
        break
    fi
    echo "Waiting for CG to open..."
    sleep 5
done
exit 0
