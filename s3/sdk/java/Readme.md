# Create a new Maven Project
```sh
mvn archetype:generate \
-DgroupId=com.mycompany.app \
-DartifactId=my-app \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.4 \
-DinteractiveMode=false
```

```
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=AP_NORTHEAST_3 \
 -DarchetypeVersion=2.25.69 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp
```