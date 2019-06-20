conda update -n nam_clone -c defaults tensorflow
conda env create -f environment.yml
conda create --name myclone --clone myenv
conda env export > environment.yml
