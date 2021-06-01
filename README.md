# Integrity check for Generated Code

This is a GitHub action that runs a supplied code generation tool against the
codebase and compares it to the state of the codebase at HEAD.

## Why?

Sometimes we want to check in generated code (e.g. to inspect diffs in pull
requests). This gives us a way to ensure that the generated code in the repo is
the same as the generated code inside CI. No discrepancies.

## Usage

Perhaps we have a `Makefile` inside `build` in our repo that builds some files
in that directory.

```yaml
    steps:
      - uses: actions/checkout@v1
      - name: Install dependencies
        run: sudo apt-get install -y make
      - uses: elisw93/gen-code-integrity@v1.0.0
        with:
          generate-cmd: "make -C build clean all"
          diff-root: "build" 
```

## License

[MIT](/LICENSE)
