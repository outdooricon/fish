function rvm_prompt
  set -l yellow (set_color -o yellow)
#  if [ (which rvm) ]
  if type -t rvm >/dev/null
    if begin; _bundler-installed; and _within-bundled-project; end
      set -l identifier (command bundle exec rvm tools identifier)
      echo "$yellow$identifier "
    end
  else
    echo ""
  end
end

function _bundler-installed
  which bundle >/dev/null ^&1
end

function _within-bundled-project
  set -l check_dir $PWD
  while [ $check_dir != "/" ]
    test -f "$check_dir/Gemfile"; and return
    set check_dir (dirname $check_dir)
  end
  false
end

