# mqoncp4i

## Working directory for MQ on CP4I PoT

1) First thing to do is to check the **set_properties.sh**
Make sure that you put your primary cluster URL for cluster 1 (xxxxxxxxxxxxxxxxxxxxxxxx).  
If you are using 2 Primary clusters due to more the 10 students 
then add the second primary cluster (yyyyyyyyyyyyyyyyy) 

2) Cluster 2 will be for your CRR cluster.  Enter that url (zzzzzzzzzzzzzzzzz)

3) Last check the **setup.properties_template** to make sure you have the correct storage class selected. 


Now go ahead and run the MQ_setup.sh which will create all the needed scripts and yamls for the student info entered. 
```
Usage:
./MQ_setup.sh -i <student number> -n <student namespace>
```

This example is using student2 with namespace of student2
```
./MQ_setup.sh -i 2 -n student2
```

You will be asked if the Namespace and instance number are correct.  enter y/n

This will then create all build scripts for the MQ labs [streamQ, nativeHA, and unicluster].

The following is the output from the command above:
```
Are these correct?  The instance number is zero filled for numbers 1-9. (Y/N)y
...
[INFO] Build the deployment yamls and test scripts for streamQ labs.  
[INFO] StreamQ build yaml script is complete.
....
[INFO] Build the deployment yamls and test scripts for navtiveHA labs.  
[INFO] nativeHA build yaml script is complete.
....
[INFO] Build the deployment yamls and test scripts for unicluster labs.  
[INFO] unicluster build yaml scripts is complete.
```
