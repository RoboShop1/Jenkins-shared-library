! [[ -v RUNNER_REPO_URL ]] && echo "RUNNER_REPO_URL variable is missing" && exit 1

! [[ -v RUNNER_LABELS ]] && echo "RUNNER_LABELS variable is missing" && exit 1

! [[ -v RUNNER_NAME ]] && echo "RUNNER_NAME variable is missing" && exit 1

! [[ -v RUNNER_TOKEN ]] && echo "RUNNER_TOKEN variable is missing" && exit 1

config_sh=$(echo -e "./config.sh  --unattended --replace --url ${RUNNER_REPO_URL} --token ${RUNNER_TOKEN} --name ${RUNNER_NAME}  --labels ${RUNNER_LABELS}")


eval $config_sh

./run.sh