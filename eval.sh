#!/usr/bin/env bash

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v1.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v1.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v1.1.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v1.1.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v1.4 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v1.4

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v2.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v2.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v2.1.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v2.1.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v2.1.2 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v2.1.2

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v2.1.5 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v2.1.5

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v4.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v4.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v4.1.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v4.1.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v6 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v6

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v7.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v7.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v7.2 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v7.2

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v7.3 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v7.4

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v7.4 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v7.4

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v7.5 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v7.5

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v8.1 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v8.1

echo "Evaluating model_20000..."
python -m eval \
  --base_path ./logs/v8.2 \
  --prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
  --model_tar model_20000 \
  --env_names MultiGrid-PerfectMazeXL-v0 \
  --num_episodes 100 \
  --accumulator mean \
  --result_path ./eval_results/MiniGrid/v8.2
