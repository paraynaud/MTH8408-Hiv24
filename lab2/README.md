# MTH8408

## Bienvenue dans le lab 2 !

Le sujet du lab est dans le carnet Jupyter `Lab2-notebook.ipynb`. Bon courage!

## Ouvrir un carnet Jupyter

Pour ouvrir un carnet Jupyter (extension `ipynb`), il suffit d'exécutez les commandes suivantes à l'invite Julia.
Placez-vous dans le dossier qui contient le Lab2, puis:
```
pkg> activate . # utiliser ] pour entrer en mode "package"
julia> using IJulia # utiliser DEL pour en sortir
julia> notebook(detached=true, dir=pwd()) # une fenêtre de votre browser devrait apparaître
```

## Tips Github: Mettre à jour votre "Fork"

La plupart d'entre vous avez une `fork` de ce répo, i.e. paraynaud/MTH8408-Hiv24. Pour mettre à jour, directement sur votre ordinateur vous devez:
a) ajouter paraynaud dans les `remote`.
b) faire un `rebase`.

### Ajouter un remote

Sur VS Code, ouvrez le terminal à la source du dossier MTH8408 que vous avez cloné sur votre ordinateur.

La commande
```
git remote
```
affiche les `remote` (liens distants) de ce dossier avec `github`. Par défaut, il n'y en a que un `origin`, qui est la source d'où vous avez clonez ce répo (normalement votre compte github). Pour en être sûr:
```
git remote get-url origin
```
va vous donnez l'url du `remote` `origin`.

On souhaite maintenant ajouter la source initial du projet comme `remote` pour ce faire:
```
git remote add upstream https://github.com/paraynaud/MTH8408-Hiv24
```
On a crée une nouvelle `remote` qui s'appelle `upstream`!! Vous pouvez vérifier en reprenant les étapes ci-dessus.

### Rebase

Maintenant que l'on a crée le lien vers le répo source, `upstream`, on va effectuer une mise à jour de notre version.
Dans un premier temps, on va chercher l'état du dossier `upstream` en faisant `fetch`:
```
git fetch upstream
```
Puis, on va faire un `rebase` qui va tenter d'amener les dernières modifications chez nous:
```
git rebase upstream/main
```
On peut ensuite ajouter ces modifications à votre Github en faisant un `push`:
```
git push origin main --force
```

## Tips Github 2: Contributions

Lorsque l'on souhaite contribuer à un répo Github, il y a trois notions importants à comprendre:
- `branch`
- `commit`
- `pull request`

### Branch

Chaque répo Github est composé de `branch`. La principale est en général appelé `main` (ou `master` pour les plus anciens).
Quand on modifie un répo, on crée une nouvelle `branch` pour faire des modifications.

Pour afficher les `branch` de votre répo:
```
git branch
```
et pour se déplacer d'une `branch` à l'autre
```
git checkout nom_de_la_branch_ou_vous_voulez_aller
```
Et pour créer une nouvelle `branch` et s'y déplacer:
```
git checkout -b nom_de_la_nouvelle_branch
```
et finalement pour supprimer une `branch`
```
git branch -d nom_de_la_nouvelle_branch
```

Un conseil: quand votre répo est une `fork`, je vous conseille vivement de ne jamais faire d'ajouts à votre `branch` principale.
On l'a mettra seulement à jour au moment de faire un rebase.

### Commit

On peut faire des modifications sur votre `branch` en faisant un `commit`
```
git add fichier_modifié1 fichier_modifié2 fichier_modifié3
git commit -m "Un message qui décrit votre modif"
```
Ces deux étapes peuvent être faites dans le menu à gauche sur VS Code.

Parce qu'on a tous le droit à l'erreur. Pour supprimer les 2 derniers commit:
```
git reset --hard HEAD~2
```
Remplacez le 2 par le nombre qui convient à votre cas.

Une fois vos `commit` réalisés on peut mettre à jour la version Github en faisant un `push`:
```
git push origin nom_de_votre_branch
```

### Pull request

Une fois votre `branch` satisfaisante, vous pourriez être tenté de suggérer ces modifications au répo initial (`upstream`).
Pour cela, on fait une `pull request`!
Je vous conseille d'utiliser l'interface de Github. 
Chercher `contribute` sur votre répo après avoir sélectionné la `branch` désirée.

Une `pull request` a ensuite un titre et une description. Essayez d'être concis et précis.
Le/les contributeurs principales d'une répo où vous faites la `pull request` vont ensuite la commenter, proposer de nouvelles modifications, et éventuellement la `merge` dans le répo!
