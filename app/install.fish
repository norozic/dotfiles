#!/usr/bin/env fish

switch $argv[1]
case 'git-credential-helper'
  $DOTPATH/git-credential-helper/install.fish
case 'node'
  $DOTPATH/node/install.fish
end
