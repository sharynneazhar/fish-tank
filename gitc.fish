// Usage: gitc <commit message>

function gitc
    set branchname (git branch | grep '*' | sed 's/* //')

    function any-arguments
        count $argv >/dev/null
    end

    function staged-files-matching-filter --argument filter
        git diff --cached --name-only --diff-filter=$filter | string split0
    end

    function count-files
        awk NF | wc -l | string trim
    end

    if not any-arguments $argv
        set new_files (staged-files-matching-filter A)
        set n_new_files (echo -n "$new_files" | count-files)

        set deleted_files (staged-files-matching-filter D)
        set n_deleted_files (echo -n "$deleted_files" | count-files)

        set updated_files (staged-files-matching-filter M)
        set n_updated_files (echo -n "$updated_files" | count-files)

        set renamed_files (staged-files-matching-filter R)
        set n_renamed_files (echo -n "$renamed_files" | count-files)

        set n_changed_files (math $n_new_files + $n_deleted_files + $n_updated_files + $n_renamed_files)

        switch $n_changed_files
            case 0
                echo "Nothing staged"
            case 1
                if [ $n_new_files = 1 ]
                    git commit -m "$branchname Add $new_files"
                else if [ $n_deleted_files = 1 ]
                    git commit -m "$branchname Delete $deleted_files"
                else if [ $n_updated_files = 1 ]
                    git commit -m "$branchname Update $updated_files"
                else if [ $n_renamed_files = 1 ]
                    git diff --cached --name-status | read _ from to
                    git commit -m "$branchname Rename $from to $to"
                end
            case '*'
                echo "Multiple files changes; add a commit message"
        end
    else
        git commit -m (echo "$branchname $argv")
    end
end
