# CRC
Initiation à la programation C++ via un programme de Contrôle de redondance cyclique,
et à la création d'un projet avec CMake.

## Liens
[Official CMake Documentation](https://cmake.org/cmake/help/v3.14/index.html)  
[An Introduction to Modern CMake](https://cliutils.gitlab.io/modern-cmake/)  
[Effective Modern CMake](https://gist.github.com/mbinna/c61dbb39bca0e4fb7d1f73b0d66a4fd1)  
[Minimal CMake Example](https://github.com/krux02/minimal_cmake_example)  
[Tutorial CMake](http://sirien.metz.supelec.fr/depot/SIR/TutorielCMake/index.html)

## Macros et functions
La différence entre les macro et les fonction est le scope, les macros n'en ont
pas. Ainsi si vous utilisez une variable dans une fonction et que vous souhaitez
la rendre visible à l'exterieur il faut utiliser le mot clé PARENT_SCOPE.

**Attention** : dans le fichier CMakeLists du dépôt, si *showFiles* est déclaré
en macro le paramètre  *allFiles* reprendra automatiquement la valeur de *allFiles*
de la function main, même si on lui passe une autre variable en paramètre. Les macro sont donc à utiliser avec précaution.

Exemple de passage d'argument à une [Function](https://cmake.org/cmake/help/latest/command/function.html#command:function) et de porté des variables :

    set(foo "Foo")
    set(bar "Bar")
    set(fooBar ${foo} ${bar})

    function(myFunction arg1 arg2 arg3)
        message("Foo = ${foo}\nBar = ${bar}\nFooBar = ${fooBar}")
        message("ARGC = ${ARGC}\nARGV0 = ${ARGV0}\nARGV1 = ${ARGV1}\nARGV2 = ${ARGV2}")
        set(foo "bar")
    endfunction(myFunction)

    myFunction(${foo} ${bar} ${fooBar})
    message("\n${foo}")
    set(foo "bar")
    message(${foo})

Retour de la fonction :

    =========================================
    Foo = Foo
    Bar = Bar
    FooBar = Foo;Bar
    ARGC = 4
    ARGV0 = Foo
    ARGV1 = Bar
    ARGV2 = Foo

    Foo
    bar


[Macro](https://cmake.org/cmake/help/v3.10/command/macro.html)

    macro(<name> [arg1 [arg2 [arg3 ...]]])
        COMMAND1(ARGS ...)
        COMMAND2(ARGS ...)
        ...
    endmacro(<name>)
