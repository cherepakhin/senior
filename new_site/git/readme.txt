Показать адрес репозитория:

$ git config --get remote.origin.url
https://github.com/cherepakhin/redux_first_app.git

Клонировать только один каталог из удаленного репоитория:

````shell
$ git init my_repo
$ cd my_repo
//Док-ия: git remote add -f origin <url>
$ git remote add -f origin https://github.com/thombergs/code-examples

$ git config core.sparseCheckout true

//Док-ия: echo "another/sub/tree" >> .git/info/sparse-checkout
$ echo "spring-webflux/" >> .git/info/sparse-checkout

$ git pull origin master
From https://github.com/thombergs/code-examples
 * branch            master     -> FETCH_HEAD
````

Совет отсюда https://askubuntu.com/questions/460885/how-to-clone-only-some-directories-from-a-git-repository