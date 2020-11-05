#!/bin/bash
set -e
set -u
source ../setup.sh

# diff
kapp app-change list -a kube-system
ytt --ignore-unknown-comments -f templates |
	kapp deploy -a kube-system -c --diff-run -f -
