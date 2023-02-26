for i in `find . -mindepth 1 -maxdepth 1 -type d -not -path "./.history*"`
    do
        cd $i
        git add .
        git commit -m "Correcciones"
        git push
        cd ..
    done
