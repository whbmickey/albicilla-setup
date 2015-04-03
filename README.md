# albicilla-setup
Setup scripts for deploy develop environment.

## Install dependences
1. git
2. node
3. docker

## Prepare
### Edit `hosts`
Add these lines to the `hosts` file

```
127.0.0.1	api_dev.albicilla.com
127.0.0.1	user3.albicilla.com
127.0.0.1	user.albicilla.com
127.0.0.1	api.albicilla.com
127.0.0.1	www.albicilla.com
```

### Create Workspace
Create a directory as the workspace

```
mkdir tradesparq
cd tradesparq
```

Clone the albicilla-setup

```
git clone git@github.com:Tradesparq/albicilla-setup.git
```

## Install
### Clone Codebase
```bash
albicilla-setup/setup.sh clone
```

### Pull Docker Images
```bash
albicilla-setup/setup.sh pull
```

### Launch Docker Containers
```bash
albicilla-setup/setup.sh launch
```
