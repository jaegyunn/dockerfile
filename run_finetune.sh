#!/bin/bash

# 사용법 체크
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <agent> <domains> <seeds>"
    echo "Example: $0 sbrl 'walker quadruped' '1 2 3;4 5 6'"
    exit 1
fi

# 입력 인자
AGENT="$1"
IFS=' ' read -r -a DOMAINS <<< "$2"  # 공백으로 도메인 분리
IFS=';' read -r -a SEED_GROUPS <<< "$3"  # 세미콜론으로 시드 그룹 분리

# 현재 디렉토리를 실험 디렉토리로 설정
EXPERIMENT_DIR=$(pwd)

# 기본 설정
SNAPSHOT_TS=2000000  # 고정값
LOG_DIR="$EXPERIMENT_DIR/logs"
mkdir -p "$LOG_DIR"

# 실행할 실험 목록
declare -A TASKS
TASKS["walker"]="walker_run walker_flip walker_stand walker_walk"
TASKS["quadruped"]="quadruped_walk quadruped_run quadruped_stand quadruped_jump"
TASKS["jaco"]="jaco_reach_top_left jaco_reach_top_right jaco_reach_bottom_left jaco_reach_bottom_right"

# 각 도메인별 실험 실행
for idx in "${!DOMAINS[@]}"; do
    DOMAIN="${DOMAINS[$idx]}"
    DOMAIN_LOG_DIR="$LOG_DIR/finetune/$DOMAIN/$AGENT"
    mkdir -p "$DOMAIN_LOG_DIR"

    # 도메인의 task 목록 가져오기
    if [[ -z "${TASKS[$DOMAIN]}" ]]; then
        echo "Invalid domain: $DOMAIN"
        continue
    fi

    # 해당 도메인의 시드 리스트 추출
    IFS=' ' read -r -a SEEDS <<< "${SEED_GROUPS[$idx]}"

    for SEED in "${SEEDS[@]}"; do
        for TASK in ${TASKS[$DOMAIN]}; do
            # 기존 로그 파일 확인 후 index 결정 (중복 방지)
            INDEX=1
            while [[ -e "$DOMAIN_LOG_DIR/finetune_${AGENT}_seed_${SEED}_${TASK}_${INDEX}.out" ]]; do
                ((INDEX++))
            done

            # 로그 파일 경로 설정
            OUT_LOG="$DOMAIN_LOG_DIR/finetune_${AGENT}_seed_${SEED}_${TASK}_${INDEX}.out"
            ERR_LOG="$DOMAIN_LOG_DIR/finetune_${AGENT}_seed_${SEED}_${TASK}_${INDEX}.err"

            # 실행 명령어
            CMD="HYDRA_FULL_ERROR=1 python $EXPERIMENT_DIR/finetune.py domain=$DOMAIN task=$TASK obs_type=states agent=$AGENT reward_free=false pretrain_seed=$SEED snapshot_ts=$SNAPSHOT_TS"

            echo "Starting experiment: $CMD"
            eval "$CMD" > "$OUT_LOG" 2> "$ERR_LOG"

            if [ $? -eq 0 ]; then
                echo "Experiment completed successfully: $OUT_LOG"
            else
                echo "Experiment failed: $ERR_LOG. Check logs for details."
                exit 1
            fi
        done
    done
done

echo "All experiments completed."
