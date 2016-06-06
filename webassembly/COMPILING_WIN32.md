### Compiling the Binaryen Toolchain under Windows with Visual Studio 2015

This is a short tutorial showing how to configure projects and solution files needed to successfully compile <a href="https://github.com/WebAssembly/binaryen">Binaryen</a> with Visual C++ Build Tools or Visual Studio 2015.

For compiling WebAssembly files to *asm.js* and running them in a browser visit this <a href="https://github.com/brakmic/brakmic/blob/master/webassembly/TUTORIAL.md">short intro</a>.

#### Prerequisites

* [Option 1] [Visual C++ Build Tools](http://go.microsoft.com/fwlink/?LinkId=691126) (using the **Default** Install option)

* [Option 2] [Visual Studio 2015](https://www.visualstudio.com/en-US/downloads/download-visual-studio-vs.aspx) (Community Edition should be fine)

* [CMake](https://cmake.org/) (version used here is v.3.4.1)

* [https://git-scm.com/download/win](Git tools)

#### Creating configurations and project files with CMake

### Using Command Line:

First, make sure you have `git`, `cmake` and `msbuild` (v14.0, check with `msbuild /version`) in PATH.

Then clone the latest sources of Binaryen to your local system using Command Prompt or PowerShell:

```cmd
git clone https://github.com/WebAssembly/binaryen.git --recursive
```

Build binaryen:

```cmd
cd binaryen

cmake .

cmake --build . --config Release
```

That's it! The compiled executables will be produced in `bin` directory.

Note: after running `cmake .`, you will also find the binaryen.sln, which you can:

* Open with Visual Studio.
* or build with `msbuild binaryen.sln /p:Configuration=Release`

### GUI approach:

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

Now click *Generate* to create Project and Solution files for VS2015.

Go to the build folder you set previously and double click the *binaryen.sln* to open it with VS2015.

<img src="http://fs5.directupload.net/images/160315/z5j98rdj.png"/>

By default the **ALL_BUILD** Project is set as *Startup Project*. Just press F6 to build everything.

<img src="http://fs5.directupload.net/images/160315/kwhklbwn.png"/>

In the end you should see a result like this:

<img src="http://fs5.directupload.net/images/160315/c9zz6uzh.png"/>

Depending on your currently active Build-Config the binaries will either be located under **bin\Debug** or **bin\Release**

<img src="http://fs5.directupload.net/images/160315/axm92wyp.png"/>

Have fun with WebAssembly! :smile:

