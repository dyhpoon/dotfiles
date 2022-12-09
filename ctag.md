brew install ctags
gem install gem-ctags # add ruby bin path
ripper-tags -R --exclude=.git --exclude=tmp --exclude=public --exclude=app/assets `bundle show --paths`
echo tags >> .git/info/exclude

