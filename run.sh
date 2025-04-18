python -m eval \
--base_path ./logs/accel \
--prefix MultiGrid-GoalLastEmptyAdversarialEnv-Edit-v0-ACCEL \
--model_tar model_5000 \
--benchmark maze \
--num_episodes 100 \
--accumulator mean \
--result_path ./eval_results/MiniGrid/ACCEL
