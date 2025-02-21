#!/bin/bash

# 사용법 체크
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <agent> <domains> <seeds> [additional hydra overrides]"
    echo "Example: $0 sbrl 'walker quadruped' '1 2 3; 4 5' agent.lr=0.001 agent.hidden_dim=512"
    exit 1
fi

# 입력 인자
AGENT="$1"
IFS=' ' read -r -a DOMAINS <<< "$2"  # 공백으로 도메인 분리
IFS=';' read -r -a SEED_GROUPS <<< "$3"  # ;로 도메인별 seed 그룹 분리

# 추가적인 Hydra 인자
shift 3
EXTRA_ARGS="$@"

# 현재 디렉토리를 실험 디렉토리로 설정
EXPERIMENT_DIR=$(pwd)

# 기본 설정
LOG_DIR="$EXPERIMENT_DIR/logs"
mkdir -p "$LOG_DIR"

# 각 도메인별 실험 실행
for ((i=0; i<${#DOMAINS[@]}; i++)); do
    DOMAIN="${DOMAINS[i]}"
    DOMAIN_LOG_DIR="$LOG_DIR/pretrain/$DOMAIN/$AGENT"
    mkdir -p "$DOMAIN_LOG_DIR"

    IFS=' ' read -r -a SEEDS <<< "${SEED_GROUPS[i]}"  # 해당 도메인의 seed 리스트

    for SEED in "${SEEDS[@]}"; do
        INDEX=1
        while [[ -e "$DOMAIN_LOG_DIR/pretrain_${AGENT}_seed_${SEED}_${INDEX}.out" ]]; do
            ((INDEX++))
        done

        OUT_LOG="$DOMAIN_LOG_DIR/pretrain_${AGENT}_seed_${SEED}_${INDEX}.out"
        ERR_LOG="$DOMAIN_LOG_DIR/pretrain_${AGENT}_seed_${SEED}_${INDEX}.err"

        # CMD에 EXTRA_ARGS 추가
        CMD="HYDRA_FULL_ERROR=1 python ./pretrain.py agent=$AGENT domain=$DOMAIN seed=$SEED $EXTRA_ARGS"

        echo "Starting experiment: $CMD"
        nohup bash -c "$CMD" > "$OUT_LOG" 2> "$ERR_LOG" &
        PID=$!  # 실행된 프로세스의 PID 저장

        # 현재 실행한 실험이 종료될 때까지 대기
        wait $PID
    done
done

echo "All experiments completed."
