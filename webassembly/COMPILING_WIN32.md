### Compiling the Binaryen Toolchain under Windows with Visual Studio 2015

This is a short tutorial showing how to configure projects and solution files needed to successfully compile Binaryen

with Visual Studio 2015.

#### Prerequisites

Visual Studio 2015 (Community Edition should be fine)

CMake (version used here is v.3.4.1)

Git tools

#### Creating configurations and project files with CMake

First clone the latest sources of Binaryen to your local system

```
git clone https://github.com/WebAssembly/binaryen.git
```

Open CMake-GUI from its installation folder.

<img src="http://fs5.directupload.net/images/160315/eqlyadws.png"/>

Insert the source folder of Binaryen you downloaded previously. [*Where is the source code*]

Also insert the root folder where generated binaries should be located. [*Where to build the binaries*]

<img src="http://fs5.directupload.net/images/160315/mhkgudz7.png"/>

Click *Configure*...

If the folder doesn't exist CMake will ask you for permission to create one.

<img src="http://fs5.directupload.net/images/160315/pkxl66re.png"/>

then choose your compiler toolchain. In this case it should be *Visual Studio 14 2015 Win64*.

Also use the default *native compiler*.

<img src="http://fs5.directupload.net/images/160315/5xp7oi3r.png"/>

After a few moments CMake will generate default compiler settings.

<img src="http://fs5.directupload.net/images/160315/r4933m5j.png"/>

Not click *Generate* to create Project and Solution files for VS2015.

Go to the build folder you set previously and double click the *binaryen.sln* to open it with VS2015.

<img src="http://fs5.directupload.net/images/160315/z5j98rdj.png"/>

By default the **ALL_BUILD** Project is set as *Startup Project*. Just press F6 to build everything.

<img src="http://fs5.directupload.net/images/160315/kwhklbwn.png"/>

In the end you should see a result like this:

<img src="http://fs5.directupload.net/images/160315/c9zz6uzh.png"/>

Have fun with WebAssembly :smile:

