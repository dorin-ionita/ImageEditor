#!/bin/bash

#HOW TO USE:
#./renameDirGit.sh [old_dir_name][new_dir_name]

repo_name=$(cat ./cfg_git/Repo_name.txt)
echo "----Renaming director $1 to $2..."
git mv $1 $2
echo "----Making the commit..."
git commit -m "Renamed director $1 to $2"
echo "----Pushing..."
git push -u $repo_name master
echo "----Git Hub updated succesfully!"

