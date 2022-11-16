#!/bin/bash
#
# Prepares the import of the WordPress project into Local [1] on a new machine.
# The script performs the following actions:
#
#   1. Changes the hardcoded project paths in the SQL database file according
#      to the location of the cloned repository on the new machine.
#   2. Zips the project directory so that it can be imported into Local.
#   3. Clears the project directory so that it can be used for the project
#      that's newly imported into Local (Local will put the files from the zip
#      file back to this directory).
# 
# Notes:    
#   - This script is intended to be run immediately after cloning the repo
#   - After running this script, the import should be immediately completed in
#     Local, as described in the output of the script
#   - This script must be executed from the root directory of the repo
#
# [1] https://localwp.com/
#------------------------------------------------------------------------------#

set -e

if [[ "$PWD" != $(git rev-parse --show-toplevel) ]]; then
  echo "Error: must be executed from root directory of repository"
  exit 1
fi
repo=$PWD

echo "> Determining previous project path..."
previous_path=$(cat "$repo"/wordpress/app/sql/local.sql | grep -o '[^"]*/app/public/wp-content' | sed 's|/app/public/wp-content||' | sort | uniq)
if [[ -z "$previous_path" || ! $(wc -l <<<"$previous_path") -eq 1 ]]; then
  echo "Error: could not determine previous project path: '$previous_path'"
  exit 1
fi
echo "  Detected '$previous_path'"

if [[ "$previous_path" = "$repo"/wordpress ]]; then
  echo "  Previous project path matches current project path"
else
  echo "> Changing project path to '$repo/wordpress'..."
  sed -i "s|$previous_path|$repo/wordpress|g" "$repo"/wordpress/app/sql/local.sql
fi

echo "> Zipping project directory to 'wordpress.zip'..."
# These files seem to be recreated on each import; deleting them prevents them from accumulating
rm "$repo"/wordpress/app/public/wp-content/fonts/*.css
zip -rq wordpress.zip "$repo"/wordpress

echo "> Clearing project directory '$repo/wordpress'..."
rm -rf "$repo"/wordpress/*

echo -e '\n* * *\n'

cat <<EOF
Complete the import by performing the following steps immediately:
  1. In Local, 'File > Import site' and select '$zip'
  2. Use the following import settings:
      * Local site name:   <anything>
      * Local site domain: <anything>
      * Local site path:   $repo/wordpress
  3. When the import completes, click 'Open site' and verify website display
  4. In the repo, run 'git status' and commit the changes
EOF
