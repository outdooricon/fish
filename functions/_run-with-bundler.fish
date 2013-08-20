# pulled from oh-my-fish: https://github.com/bpinto/oh-my-fish/blob/master/plugins/bundler/bundler.load

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

function _run-with-bundler
  if begin; _bundler-installed; and _within-bundled-project; end
    command bundle exec $argv
  else
    eval command $argv
  end
end
