# 1st lab

Welcome to our first lab session \:smiley: . This first session aims to:
- Exercise 1-(a/b/c): check that we have everything installed to code in Julia, i.e. VS Code, Julia, and Github;
- Exercise 2: run over the basics in Julia;
- Exercise 3: manage Julia's package manager;
- Exercise 4: use JuMP and ADNLPModels to model an optimization problem, and use a solver;
- Exercise 5: use a Jupyter notebook.

Some references are given below, but you can also find some in the file `installation.pdf` available on Moodle.

## Short answers to big questions

* What is Visual Studio Code, a.k.a VS Code? It is a developer environment tool. [wiki/Visual_Studio_Code](https://en.wikipedia.org/wiki/Visual_Studio_Code);
* What is Julia? It is a recent programming language [wiki/Julia](https://en.wikipedia.org/wiki/Julia_(programming_language)) that is getting very popular in numerical science;
* What is Github? It is an internet hosting service for software development and version control using Git. [wiki/Github](https://en.wikipedia.org/wiki/GitHub);
* What is Markdown? Markdown is a text-to-HTML conversion tool for web writers. Note that this file you are reading is the file `README.md` and is written in markdown.
* What is the difference between Git and Github? Simply put, Git is a version control system that lets you manage and keep track of your source code history. GitHub is a cloud-based hosting service that lets you manage Git repositories. If you have open-source projects that use Git, then GitHub is designed to help you better manage them. [wiki/Git](https://en.wikipedia.org/wiki/Git).
* What is a Jupyter notebook? The Jupyter Notebook is a web-based interactive computing platform. The notebook combines live code, equations, narrative text, visualizations, ... (`.ipynb` files)

## Exercise 1-a: VS Code & Julia

- [ ] Start VS Code;
- [ ] In the left menu, "Extensions" install the *Julia* app. Note that VS Code works with different applications you can install for various use;
- [ ] Start a terminal, menu *Terminal -> New Terminal*, and run the following command `julia`. This will start Julia and we can make our first command:
```
print("Hello World")
```
Bonus question:
- [ ] Try this code in Julia: `😃` 

Julia handles unicode characters [https://docs.julialang.org/en/v1/manual/unicode-input/](https://docs.julialang.org/en/v1/manual/unicode-input/) and that's one of the reasons mathematicians love it!

## Exercise 1-b: Github

- [ ] Create a Github account;
- [ ] Go to [https://github.com/paraynaud/MTH8408-Hiv24](https://github.com/paraynaud/MTH8408-Hiv24);
- [ ] Star ⭐ the repository. This one is just to cheer up the developers of this repo;
- [ ] Make a *Fork*. A *Fork* will create a copy of this repository in your personal space that you can safely modify;
- [ ] In the `paraynaud/MTH8408-Hiv24` repository, you will create an `Issue` entitled `Lab 1: TODOs` and where you copy-paste this readme. You should get a todo-list that can be checked when you advance in this lab. (Use the "pen" symbol at the top of the README to access the code of the README).

In VS Code:
- [ ] Follow this procedure to connect Github and VS Code: [https://code.visualstudio.com/docs/editor/github](https://code.visualstudio.com/docs/editor/github) (install the app and log in).
- [ ] We will now *clone* this repository on your computer. In VS Code:
    * Open the command palette with the key combination of Ctrl + Shift + P ;
    * At the command palette prompt, enter `gitcl`, select the `Git: Clone` command, and press Enter;
    * When prompted for the Repository URL, select clone from GitHub, i.e. `https://github.com/your_username/MTH8408`, then press Enter.

At the end of the day, you should have a copy of this repository on your machine.

Github hosts open-source packages in many languages. Most of the tools you use are hosted there! 
Open-source means everybody can contribute either by creating issues, making new tutorials, suggesting new features, or even developing new features!

## Exercise 2: Basics in Julia

The following references will help us navigate Julia:
- [Julia for Pythonistats](https://www.machinelearningplus.com/julia/julia-programming-language-for-pythonistas-a-practical-tutorial/)
- [MATLAB–Python–Julia cheatsheet](https://cheatsheets.quantecon.org)

In Julia, the documentation is either accessible online [https://docs.julialang.org/](https://docs.julialang.org/en/v1/), ALL the packages are on Github, or you can use `?` in the Julia REPL (terminal).

- [ ] After reading `notebook_0.ipynb`. Write a function that solves the second-order polynomial equation, i.e. `ax² + bx + c = 0`.
- [ ] After reading `notebook_linear_algebra.ipynb`.  Write a function verifying that given a matrix `A` is a symmetric positive definite. Add at least 2 test cases.

The notebook `laboratoire1.ipynb` was used in a linear algebra class and contains additional information. 

## Exercise 3: Julia package manager

You can find more information on `Pkg.jl` in the online doc [https://pkgdocs.julialang.org/v1.2/](https://pkgdocs.julialang.org/v1.2/).

To use a package and the functions in this package, in Julia, we use `using Name_of_the_package`.
Some of these packages are accessible natively, for instance, `LinearAlgebra` or `Pkg`.
However, some other packages need to be manually added.

Julia has a package environment accessible with `]` (everything becomes blue instead of green). You can go back with `RETURN`.

- [ ] Install the package `ADNLPModels`
```
using Pkg; Pkg.add("ADNLPModels")
```
or
```
] add ADNLPModels # this may not work if you open a notebook in VS Code
```
This will add the package `ADNLPModels` in your environment, and you can then do `using ADNLPModels`.
- [ ] It is possible to know the packages installed in your current environment with `status`:
```
Pkg.status()
```
or
```
] status
```
This is especially important to check the versions of the different packages you are using.
- [ ] You can remove a package using `rm`, or ask Julia to update the packages with `update`.
- [ ] To install a specific version of a package using `pin`.
```
] pin ADNLPModels@v0.3.1
```
If this is impossible, because of version constraints between the different packages in your environment, Julia will let you know.
- [ ] Different environments. All the packages we imported previously have been added to your basic environment.
Different scripts might require different versions of packages or loading the environment might be very slow if it contains a lot of packages.
Therefore, Julia has *Project Environments*.
```
using Pkg; Pkg.activate("test_env")
```
or
```
] activate test_env
```
This should create a folder `test_env` that contains a `Project.toml` and a `Manifest.toml`. These 2 files contain your environment description.
Now add a new package
```
] add NLPModels
```
This package is added to both files (with other dependencies).

This way, when you send a script or a notebook to somebody, you can send the .jl and the environment to make them use the right versions of the packages!

## Exercise 4: Optimization

You can find more references for optimization in Julia:
- [https://jump.dev/JuMP.jl/stable/](https://jump.dev/JuMP.jl/stable/) for JuMP-dev;
- [juliasmoothoptimizers.github.io/](https://juliasmoothoptimizers.github.io/) for JuliaSmoothOptimizers.

We can be particularly proud of the JuliaSmoothOptimizers and its numerous packages because it is developed at Polytechnique Montreal in Prof. Dominique Orban's team (don't hesitate to ⭐).

- [ ] After reading `notebook_jump.ipynb`. Try to solve the 2d test problem `f(x₁,x₂) = 100(x₂ - x₁²)² + (1 - x₁)²` with these tools.     

- [ ] After reading `notebook_nlpmodels.ipynb`. Try to solve the 2d test problem `f(x₁,x₂) = 100(x₂ - x₁²)² + (1 - x₁)²` with these tools.

## Exercise 5: Make a Jupyter Notebook

In Julia, there are three ways to run/show codes.
- Code directly in the terminal (practical to test small things);
- Write your code in a file ending with .jl and include in the terminal: `julia> include("name_of_your_file.jl")`;
- Run a Jupyter notebook:
```
] add IJulia
using IJulia
notebook()
```
The last command will start a new window of your favorite browser where you can do everything. Notebooks are user-friendly for communicating codes with explanations.
- [ ] Create a code with a nice title and the usual hello world. Note that the text formatting is in markdown here, see [https://www.markdownguide.org/cheat-sheet/](https://www.markdownguide.org/cheat-sheet/)

The report containing the code and responses to the "lab project" will be a Jupyter Notebook.

## Exercise 1-c: Github Pull Request

For those already there, feel free to `modify` the `README.md` at the source of the MTH8408 repository, `push` it to your repository, and make a `pull request`.

It makes no sense? You can check on the web. We will go back to this next time :).
