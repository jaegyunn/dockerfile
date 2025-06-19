# dockerfile

docker run --gpus all -it --rm -v ${PWD}:/workspace --workdir /workspace sbrl bash   


payload = torch.load(f, map_location="cuda:0")


os.environ["MUJOCO_GL"] = "glfw"


CONDA_CHANNEL_PRIORITY=flexible conda env create -f conda_env.yml


HYDRA_FULL_ERROR=1 python pretrain.py agent=amped domain=walker seed=9291 agent.becl_cic_ratio=0.6 agent.lr=3e-4
