# Python Virtual Environments Management 
## [The Complete Guide to Python Virtual Environments](https://www.youtube.com/watch?v=KxvKCSwlUv8)

Every python project has its own dependencies. It is a good practice to create a virtual environment for each project. This way, you can have different versions of the same package for different projects. This is also useful when you want to share your project with others. They can install the dependencies by running a single command.

A virtual evnironment is a self-contained directory tree that contains a Python installation for a particular version of Python, plus a number of additional packages (3rd Party Libraries). You can create as many virtual environments as you like, and they can have different versions of Python installed in them.

The python version used in the virtual environment is independent of the python version used in the system. This is useful when you want to use a different version of python for a project. The python version cannot be changed once the virtual environment is created.

### Creating a virtual environment
```bash 
python3 -m venv venv_name
```

### Activating a virtual environment
```bash
source venv_name/bin/activate
```
This change is temporary. The virtual environment will be deactivated when the terminal is closed. If a separate terminal is opened, the virtual environment has to be activated again.

Inspect the Python version to see if the virtual environment is activated.
```bash
python --version
```
Note that this python version is not the one we installed on the system. Instead, it is the one installed in the virtual environment (an exact copy of the binary).

Inspect the $PATH variable to see the path to the python executable. It should point to the python executable in the virtual environment.
```bash
echo $PATH
```

Inspect the $PYTHONPATH variable to see the path to the python packages. It should point to the python packages in the virtual environment.
```bash
echo $PYTHONPATH
```

When we use pip to install a package, it is installed in the virtual environment. The package is not installed in the system.

### Deactivating a virtual environment
```bash
deactivate
```

### Track the dependencies
```bash
pip freeze > requirements.txt
```

To specify a version of a package, use the following syntax.
```
package_name==version_number
```

To specify a minimum version of a package, use the following syntax.
```
package_name>=version_number
```

### Install the dependencies
```bash
pip install -r requirements.txt
```

## Manage Virtual Environments with Anaconda

### Create a virtual environment
```bash
conda create --name venv_name python=3.8
```

### Activate a virtual environment
```bash
conda activate venv_name
```

### Deactivate a virtual environment
```bash
conda deactivate
```

### List all virtual environments
```bash
conda env list
```

### Remove a virtual environment
```bash
conda remove --name venv_name --all
```

### Create a virtual environment from a file
```bash
conda env create -f environment.yml
```

### Export a virtual environment to a file
```bash
conda env export > environment.yml
```

## Manage Virtual Environments with Pipenv

### Install pipenv
```bash
pip install pipenv
```

### Create a virtual environment
```bash
pipenv --python 3.8
```

### Activate a virtual environment
```bash
pipenv shell
```

### Deactivate a virtual environment
```bash
exit
```

### Install a package
```bash
pipenv install package_name
```

### Install a package for development
```bash
pipenv install --dev package_name
```

### Install a package from a file
```bash
pipenv install -r requirements.txt
```

### List all packages
```bash
pipenv graph
```

### Remove a virtual environment
```bash
pipenv --rm
```