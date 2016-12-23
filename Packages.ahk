; object to load packages form the packages folder
class Packages {
    ; constructor
    __New() {
    }
    ; destructor
    __Delete() {

    }
    ; load a package by its name (array requierd)
    load(packageName) {
        tempPackageFile := "loadPackage"
        for int, package in packageName {
            include := "packages\" package "\main.ahk"
            FileRead, fileContent, %include%
            FileAppend, %fileContent%, %tempPackageFile%
        }
        ; include does not support variables >.>
        ; # is loaded before the execution of the script...
        #include loadPackage
        sleep, 500
        FileDelete %tempPackageFile%
        FileAppend,% "; Do not edit or remove this file! `n", % tempPackageFile

    }
    ; list all the packages
    list() {

    }
}
