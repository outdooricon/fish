function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end
