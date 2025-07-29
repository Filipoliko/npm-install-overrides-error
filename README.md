# npm-install-overrides-error

First start local NPM registry with Verdaccio:

```bash
npx --registry https://registry.npmjs.org/ verdaccio --config ./verdaccio.yaml
```

Then publish the packages to the local registry:

```bash
./publish.sh
```

Then install the packages with the following command:

```bash
npm install
```

Try different NPM versions (NPM < 11.2 works, while NPM >= 11.2 does not work).

## npm pack

You can also use `npm pack` to create tarballs of the packages instead of publishing them to the registry:

```bash
./pack.sh
```

Change the contents of the `package.json` file.

```json
{
  "name": "web",
  "version": "0.0.0",
  "dependencies": {
    "package-a": "./package-a-1.0.0.tgz",
    "package-b": "./package-b-1.0.0.tgz",
    "package-c": "./package-c-1.0.0.tgz"
  },
  "overrides": {
    "package-b": "./package-b-1.0.0.tgz",
    "package-c": "./package-c-1.0.0.tgz"
  }
}
```

Now you can run `npm install` again and it will fail again, but the error message is a bit less clear.
