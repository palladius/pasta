## 2022-11-26 b/001

When I run docker in PRODI get this Error:
```
[1/4] Resolving packages...
[2/4] Fetching packages...
error @hotwired/turbo@7.2.4: The engine "node" is incompatible with this module. Expected version ">= 14". Got "12.22.12"
error Found incompatible module.
info Visit https://yarnpkg.com/en/docs/cli/install for documentation about this command.
```

Googling I get this solution:

https://github.com/gilbarbara/react-joyride/issues/131 

Possible solution: use NPM not YARN

## 2022-11-26 b/002

Currently Dockerfile has: 

```Dockerfile
ENTRYPOINT [ "./entrypoint-8080.sh"] 
CMD ["/bin/bash"]
```

This way you always get the heavy configuration, rake db:setup/migration which takes a minute.
Then you enter bash, and if you want to do entrypoint, you do it all over again :/ 
probably from within entrypoint you should just call `rails s`?

Anyway I want to revert it so by default it calls entrypoint ONCE and runs everything.
Unless you give BASH in argument and it just runs bash.