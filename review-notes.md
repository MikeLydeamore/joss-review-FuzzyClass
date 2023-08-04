* `caret` library used in the example but not included as part of the install
* The example in the README is poorly documented. I don't know what the package does, what it's supposed to do, what the various matrices are etc. The commenting on these files could be significantly improved.
* Documentation for GauNBFuzzyParam: 
    * parameter `w` talks about `metd == 4` but the parameter `metd` only has documention for 1-3.
    * In my opinion, this would also be better served as a string specifying the name of the technique, but this isn't a requirement.
    * Argument `cores` isn't used in this function, it's only passed through elsewhere. This is fine but should be stated in the documentation, otherwise I expect to have to make a cluster.
* pkgdown site is broken.
* There are no vignettes.
* There is testing, but it is only a spellcheck so no functionality is tested.
* Parallelisation:
    * I can't tell if parallelisation is working. The default values of cores is 2, so the package is either silently creating and destroying the clusters, or it doesn't spawn. It's too fast on my computer for me to see the process pop up.
* There are no contribution guidelines.