# xconda
a simple shell help you to quickly select conda environment  
When you want to change conda env, you may:
1. To excute `conda env list` to check out the env name you want to use and copy it.
2. To knock up `conda activate` on the keyboard and paste the env name.  

🎉 Now,you only need to knock `xconda`  

<img width="703" alt="image" src="https://user-images.githubusercontent.com/57001533/163529473-3d8dac28-5a9c-46b6-ae41-958c20e63775.png">


# How to use  
## step1. ensure what shell you used
> The script only support `bash` or `zsh`, don't support `sh`
```
echo $SHELL
```
=>
```
/bin/bash
```
or
```
/bin/zsh
```
## step2. edit your shell config
> Due to the difference of array between `zsh` and `bash`, the script can't compatible with the two shell environment automatically.
> By default, the script is compatible with `bash`. if you use `zsh`, you can change the value of a variable, named array_len_delta, in the first few lines, to 1.

1. `vim ~/.bashrc` if you use bash shell or `vim ~/.zshrc` if you use zsh shell.
2. add the content of `xconda.sh` to the tail of your shell config file.  
you can also excute `echo xcd.sh >> ~/.bashrc` to simple the above operations

## step3. refresh
You can restart a shell window or excute:
```
source ~/.bashrc
or
source ~/.zshrc
```
