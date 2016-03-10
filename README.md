# .emacs.d
This is my config directory of emacs.

# packages/plugins management
This directory contains some plugins installed from other way, not by melpa. Generally, I would consider to install a plugin by mepla first, if cann't, I will search github to get that.
If I cann't find that plugin repository in github. I will just download that plugin package from google and throw it into the package directory.

We should know difference among these three way of installation, it relates the strategy of pulgin management. List difference as follows:

* Melpa
These packages can be installed, updated, uninstalled easily by melpa mechanism.

* Github
We should be careful of these packages, because they are a independent git repository themselves. So if we want to add them into our own git repository ".emacs.d" as internal plugins,
we should use porper git command to regard them as submodules in a git repository.

**More infos can be found here:**
[git-how-to-deal-with-submodules][1]

* Others
We don't need to care about the management of these packages, because all operations on them is manual. For example, if we want to update a pulgin named "plg", just download the latest
version and replace it by that.


In this config, I refer a lot of config of others from internet. Thanks for them.
So, that's all. Feel free to report any issue, and any question is welcome.


[1]: http://stackoverflow.com/questions/4161022/git-how-to-track-untracked-content
