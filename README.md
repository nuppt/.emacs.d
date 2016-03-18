## .emacs.d
This is my config directory of emacs.

### plugins management
The plugin packages are installed in folder elpa/ by melpa or in folder packages. If packages are download from github, I arrange it as a submodule in my .emacs.d project. Otherwise, I just put it in the folder packages.

> * Melpa
> * Github
We should be careful of these packages, because they are a independent git repository themselves. So if we want to add them into our own git repository ".emacs.d" as internal plugins,
we should use porper git command to regard them as submodules in a git repository.
**More infos can be found here:**
[git-how-to-deal-with-submodules][1]
> * Others
We don't need to care about the management of these packages, because all operations on them is manual. For example, if we want to update a pulgin named "plg", just download the latest
version and replace it by that.


In this config, I refer a lot of config of others from internet. Thanks for them.
So, that's all. Feel free to report any issue, and any question is welcome.


[1]: http://stackoverflow.com/questions/4161022/git-how-to-track-untracked-content
