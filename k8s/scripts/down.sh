#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR"/setup_context.sh"

kubectl delete ns $NAMESPACE
