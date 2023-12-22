<!-- PROJECT LOGO -->
<br />
<div align="center">

<h1 align="center">CUDA Programming Template</h1>

  <p align="center">
    A just-enough template/tutorial for building a CUDA development environment.
  </p>
</div>


## About The Project

This template/tutorial records the necessary steps for developing a CUDA application, listed as follows.

1. Create a development container
2. Structure your source code
3. Setup CMake
4. Setup VS Code



## Getting Started

If your project is developing on the **eda38/eda39** server, skip the prerequisites.



### Prerequisites

Please install [CUDA](https://developer.nvidia.com/CUDA-TOOLKIT-ARCHIVE), [CuDNN](https://developer.nvidia.com/rdp/cudnn-archive), [Docker](https://www.docker.com/), and [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) on your machine.


### Setup

1. Clone this repository.
```shell
git clone --recursive https://github.com/YanjenChen/CUDA-Programming-Template.git
```
2. Install the following VS Code extensions.
  * [Remote Development extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
3. Start VS Code, run the **Dev Containers: Reopen in Container** command from the Command Palette (`F1`) or quick actions Status bar item.
4. Build the example project
```shell
$ mkdir build && cd build
$ cmake ..
$ make -j8 && make install
```
5. Test the example project
```shell
$ python main.py
```
6. You are all set! Begin your development.



## Usage

You can detail the usage of your application here.



## Install

You can detail the installation procedure of your application here.



## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



## Contact

Yan-Jen Chen - yanjen.chen4453@gmail.com



## Reference

* [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
