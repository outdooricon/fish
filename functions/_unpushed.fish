function _unpushed
  echo (git cherry -v "@{upstream}" ^/dev/null)
end
