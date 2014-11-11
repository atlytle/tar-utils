### Simple tar. Without tarbombs.

A simplified interface to the Unix `tar` utility
that stops [tarbombs][1] during extraction and discourages their creation.
Meant to handle 90%+ of everyday tar usage.

##### Companion scripts `mktar` and `xtar`.   

`mktar` tars a single directory:   
    
    mktar dir/ --> dir.tar

`xtar` extracts a tar archive.   
If the archive consists of a single top-level directory:
    
    xtar dir.tar --> dir/

Otherwise the contents are extracted into a temporary directory.
    
    xtar files.tar --> files_tar_/[contents of files.tar]
    
[1]: http://en.wikipedia.org/wiki/Tar_(computing)#Tarbomb    


---

Andrew Lytle (2014)
