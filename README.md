# Character Static Stack
# Character Static Stack


## Create and run GoogleTest

~~* From the terminal, type in the following command~~

~~git clone https://github.com/google/googletest.git~~

*We will standardize on a particular version of Google Test this semester:
```
wget https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz;
tar zxf v1.15.2.tar.gz;
mv googletest-1.15.2/ googletest;
rm v1.15.2.tar.gz;
```

* In the lower left of the Explorer window you will see Codespaces: and the name of your running codespace which is two words. At the far right you will see a triangle pointing right. Click that icon.
* You will be asked to select a Kit. Set the Kit to **Unspecified**. This only needs to be done once.
* Run unit tests from the command line:
   * At the command line:
   ```
   export CXX=`which clang++-16`;
   echo $CXX;
   cmake -S . -B ./build;
   cmake --build build --target clean;
   cmake --build build;
   ```
   * If you want to enable the debugger for the unit tests use:
   ```
   export CXX=`which clang++-16 -fstandalone-debug -g`
   ```
   * To run the test cases:
   ```
   build/test/TestsToRun
   ```
