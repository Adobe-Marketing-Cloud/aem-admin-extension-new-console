# Adobe Experience Manager 6 Extension: New Administration Console

This is a sample package showing how to add a new AEM 6 admin console. This package provides a UI for managing [Launches](http://docs.adobe.com/content/docs/en/aem/6-0/administer/sites/launches.html) and adds a link in the navigation..

## Building 
 
This project uses Maven for building. Common commands:

From the project directory, run ``mvn clean install content-package:install`` to build the bundle and content package and install to a CQ instance.

## Using with VLT 
 
To use vlt with this project, first build and install the package to your local CQ instance as described above. Then cd to `src/main/content/jcr_root` and run

    vlt --credentials admin:admin co http://localhost:4502/crx/-/jcr:root . --force

Once the working copy is created, you can use the normal ``vlt up`` and ``vlt ci`` commands.