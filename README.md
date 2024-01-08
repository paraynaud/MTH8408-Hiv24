# MTH8408

## Installer Julia

Il suffit de suivre les indications sur la page [Download du site officiel Julia](https://julialang.org/downloads/).

## Ouvrir un carnet Jupyter

Pour ouvrir un carnet Jupyter (extension `ipynb`), il suffit d'exécutez les commandes suivantes à l'invite Julia:
```
pkg> add IJulia # utiliser ] pour entrer en mode "package"
julia> using IJulia # utiliser DEL pour en sortir
julia> notebook(detached=true, dir="") # une fenêtre de votre browser devrait apparaître
```
