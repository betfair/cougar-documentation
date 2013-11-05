---
layout: default
---
Getting started with Cougar
===========================

This guide is intended as a 5 minute guide to getting a service up and running with Cougar. Cougar has a rich set of features which we couldn't hope to cover in such a manner, so for other guides and references, please check out our [documentation hub](documentation.html).

We're going to create an initial Cougar based project, define and implement an operation on a service interface, run it and call it.

Basic project structure
-----------------------

Creating the basic project structure and config can be a little tedious, so we're going to use on of the provided cougar archetypes to generate the basic layout:

```
C:\>mvn archetype:generate -DarchetypeGroupId=com.betfair.cougar.archetypes -DarchetypeRepository=https://oss.sonatype.org/content/repositories/snapshots  -DarchetypeArtifactId=simple-service-archetype -DarchetypeVersion=3.0-SNAPSHOT
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] >>> maven-archetype-plugin:2.2:generate (default-cli) @ standalone-pom >>>
[INFO]
[INFO] <<< maven-archetype-plugin:2.2:generate (default-cli) @ standalone-pom <<<
[INFO]
[INFO] --- maven-archetype-plugin:2.2:generate (default-cli) @ standalone-pom ---
[INFO] Generating project in Interactive mode
[INFO] Archetype repository missing. Using the one from [com.betfair.cougar.archetypes:simple-service-archetype:3.0-SNAPSHOT] found in catalog local
Define value for property 'groupId': : wibble
Define value for property 'artifactId': : wibble
Define value for property 'version':  1.0-SNAPSHOT: :
Define value for property 'package':  wibble: :
Confirm properties configuration:
groupId: wibble
artifactId: wibble
version: 1.0-SNAPSHOT
package: wibble
 Y: : Y
```

Enter the values shown when prompted.

Finally, we need to run a little maven magic to get all the files with the right names/content:
```
C:\>cd wibble
C:\wibble>mvn -Prename -Dupper=Wibble -Dlower=wibble install -N
```

Your first service interface
----------------------------

Now we need to define an operation that we can call later, we're going to expose a little echo operation to show you the basics.

Service interfaces are described in an XML document called an IDD (Interface Definition Document), which meets the Cougar IDL Schema. This document is enhanced by extensions which provide transport specific binding information, which can either be held in a seperate document, or added inline. We'll put them inline to make life simple.

TODO

Generate your stubs
-------------------

Simply building your project will generate the required stubs. Compilation will fail in the application module since the new operation hasn't been implemented yet:
```
C:\wibble>mvn install
```

Code your implementation
------------------------

Now we've got our interface stub generated we can implement our new method. We're just going to be implementing the synchronous version of the interface for now, as it's simpler.

Open up blah/blha/blah/SomeServiceImpl.java in your favourite editor (or open the whole project in your IDE) and add the following method body:
```
TODO
```

TODO: what does this all mean

Running your service
--------------------

Before we can run your new service we need to build it:
```
mvn install
```

And now to launch:
```
cd launch
mvn exec:java
```

You will now see a bunch of console output, which should end with the last few lines as follows:
```
XYZ
```

We're now ready to call our operation.


Calling your service
--------------------

Viewing the admin console
-------------------------
