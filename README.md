# dockerfile

docker run --gpus all -it --rm -v ${PWD}:/workspace --workdir /workspace sbrl bash   


payload = torch.load(f, map_location="cuda:0")


os.environ["MUJOCO_GL"] = "glfw"
