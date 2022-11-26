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