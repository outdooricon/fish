function fish_prompt
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color -o red)
  set -l blue (set_color blue)
  set -l magenta (set_color -o magenta)
  set -l normal (set_color normal)

  set -l arrow "$red➜"
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    set -l with_unpushed (_git_branch_name)

    if [ (_is_git_dirty) ]
      set arrow "$red✗"
    end

    if [ (_unpushed) ]
      set git_info "$git_info$normal with$magenta unpushed"
    end
  end

  echo \n
  echo -n (rvm_prompt) $cwd $git_info
  echo \n $arrow $normal
end
