set PATH=%PATH%;C:\Program Files\Git\cmd
"C:\Program Files\GitHub CLI\gh.exe" auth setup-git
git add .
git commit -m "Fix syntax error"
git push -f -u origin main
