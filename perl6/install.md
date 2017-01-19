## Building [Perl6](https://perl6.org/) with Visual C++ 2015

### Prerequisites
---------------
* Visual Studio 2015 (the free [Community Edition](https://go.microsoft.com/fwlink/?LinkId=691978&clcid=0x409) is just fine)
* Perl 5 must be installed (I'd recommend [Strawberry Perl](http://strawberryperl.com/) or via VS2015 Install)
* You must have GIT (either installed separately or via VS2015 Install).

Step 1: [Perl6 source code + configuration]
----------------------------------------------

Open a CMD that contains paths to your Visual C++ toolchain. 

*The easiest way is by using the CMD-Shell from 'Visual Studio Tools' as it automatically calls "vcvarsall.bat" that sets up the complete build environment.*

<img src="https://i.imgsafe.org/10d93ac241.png">

In CMD type in:

> git clone https://github.com/rakudo/rakudo.git

> cd rakudo

> perl Configure.pl --gen-moar --gen-nqp --backends=moar --prefix=C:/bin/Perl6

**Hint**: you can set any other path to be the root of your Perl6 installation by changing the *--prefix* from above.

Now wait for a while...then

Step 2: [Perl6 building + installation]
----------------------------------------

> nmake

> nmake test

> nmake install

Step 3: [Perl6 environment]
----------------------------

> set PATH=%PATH%;C:\bin\Perl6\bin    

This should also be set permanently by using the Windows Environment Settings.

<img src="https://i.imgsafe.org/10c51946a8.png">

Now try to call your perl6 by typing in:

> perl6 -v   

Your should see an output like this:

`This is Rakudo version 2016.12-393-ged482ec9b built on MoarVM version 2016.12-113-gd1da1bac
implementing Perl 6.c.`

Step 4 (Optional): [Installing Panda, Perl6's Module Manager]
-------------------------------------------------------------

> git clone --recursive git://github.com/tadzik/panda.git

> cd panda

> perl6 bootstrap.pl 

And again, wait for a while...then

> set PATH=%PATH%;C:\bin\Perl6\share\perl6\site\bin   # adapt to your root path and also put it in Windows Env-Settings

> panda -v  # you should now get a longer output describing panda's functions.

Step 5 (Optional): [Installing Zef, Perl6' Module Manager]
-----------------------------------------------------------

> git clone https://github.com/ugexe/zef.git

> cd zef

> perl6 -Ilib bin/zef install .

A few moments later ZEF will be installed in your *PERL6_ROOT\share\perl6\site\bin*.

Now it's time to learn about [zef's capabilities](https://github.com/ugexe/zef).


## Congratulations! 

You can now use Perl6 and install modules too! :smile:

**Hint**: If some module installations break because of failing tests you can try to install them by using the *--notest* option.

**Update Info**: Thanks to [@sinan_unur](https://twitter.com/sinan_unur) for valuable [comments](https://news.ycombinator.com/item?id=13438908) regarding Git/Perl56 installation and ZEF module manager.

Have fun!
