## .emacs.d
This is my config directory of emacs.

### plugins management
The plugin packages are installed in folder elpa/ by melpa or in folder packages. If packages are download from github, I arrange it as a submodule in my .emacs.d project. Otherwise, I just put it in the folder packages.

> * Melpa
> 
> * Github
> 
>	 We should be careful of these packages, because they are a independent git repository themselves. So if we want to add them into our own git repository ".emacs.d" as internal plugins,
we should use porper git command to regard them as submodules in a git repository.
**More infos can be found here:**
[git-how-to-deal-with-submodules][1]
> * Others
>
>   We don't need to care about the management of these packages, because all operations on them is manual. For example, if we want to update a pulgin named "plg", just download the latest
version and replace it by that.

### Install
* Linux/Mac

```shell
cd ~
git clone https://github.com/nuppt/.emacs.d.git
cd .emacs.d/
git submodule update --init
emacs
```

* Windows

	edit "C:/Users/[user-name]/AppData/Romaing/.emacs", if not exists, create it and add following code into .emacs:

```lisp
(defvar home-path (concat "C:/Users/" user-login-name))(if (string-equal system-type "windows-nt")    (progn (setenv "HOME" home-path)		(setenv "PATH" home-path)))(load-file (concat home-path "/.emacs.d/init.el"))
```
	
Then, like installation in Linux/Mac, go to C:/Users/user-name folder, do:

```shell
git clone https://github.com/nuppt/.emacs.d.git
cd .emacs.d/
git submodule update --init
emacs
```

### Suggestion

In this config, I refer a lot of config of others from internet. Thanks for them.

Try to hack emacs and have more fun. We don't need worring about meeting problems, because there are a lot of materials on the internet. From this process, we can learn functional programming through writing some lisp code, we can also see how to design a flexible system with powerful capacity of extension. And, the most important thing is that we get a powerful and broad-spectrum general editor.

So, that's all. Feel free to report any issue, and any question is welcome.


[1]: http://stackoverflow.com/questions/4161022/git-how-to-track-untracked-content
