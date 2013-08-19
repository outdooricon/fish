function fish_prompt
	echo -n (set_color -o)(whoami)'@'(hostname | cut -d . -f 1) (set_color -o $fish_color_cwd)(prompt_pwd)

	if git branch >&- ^&-
		set -l branch (git branch --color=never ^&- | awk '/*/ {print $2}')
		set -l changes (git status --porcelain ^&-)

		if [ -z "$changes" ]
			echo -n ' '(set_color -o $fish_color_git_clean)$branch
		else
			set -l unstaged "n"
			set -l staged   "n"

			for c in $changes
				echo "$c" | grep -q '^.[^ ] ' ^&-; and set unstaged "y"
				echo "$c" | grep -q '^[^ ?]. ' ^&-; and set staged   "y"
			end

			[ $unstaged = y ]
				and echo -n ' '(set_color -o $fish_color_git_unstaged)$branch
				or  echo -n ' '(set_color -o $fish_color_git_staged  )$branch

			[ $staged = y ]
				and echo -n '*'
		end
	end

	set_color normal
	[ $USER = root ]
		and echo -n '# '
		or  echo -n '$ '
end
