#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
source "$script_dir/global/functions.sh"

title='Guide Getting Started Vue Complete'

# cat ~/.vuerc | jq '.presets["vue-cli-2"]' | pbcopy
export PRESET=$(cat <<'EOF'
{
  "useConfigFiles": false,
  "plugins": {
    "@vue/cli-plugin-babel": {},
    "@vue/cli-plugin-eslint": {
      "config": "base",
      "lintOn": []
    }
  },
  "vueVersion": "3"
}
EOF
)

preset_file="$PWD/$dir.json"
echo "$PRESET" > "$preset_file"
function cleanup() { rm "$preset_file"; }
trap cleanup EXIT

create_branch

step
cmd vue create -m "yarn" --preset "./$dir.json" $dir
cmd cd $dir
commit_all "Run: ${commands[-2]}"

step
apply_patch
commit_all "Update app to move global styles into main.css file"

step
cmd yarn add -D https://cdn.cypress.io/beta/npm/10.0.0/circle-10.0-release-0366d4fa8971e5e5189c6fd6450cc3c8d72dcfe1/cypress.tgz @cypress/vue@3 @cypress/webpack-dev-server webpack-dev-server
apply_patch
commit_all "Add Cypress with example components and page tests"

finalize
