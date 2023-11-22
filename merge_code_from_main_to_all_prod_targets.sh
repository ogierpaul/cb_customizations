#!/bin/bash
git checkout main
git pull origin/main
bash deploy_to_target.sh --target standard
bash deploy_to_target.sh --target client1
bash deploy_to_target.sh --target client2
git checkout main