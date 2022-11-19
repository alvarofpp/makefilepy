# Makefilepy

<a href="https://pypi.org/project/makefilepy/">
  <img alt="PyPI" src="https://img.shields.io/pypi/v/makefilepy.svg">
</a>

This package allows you to dynamically create Makefile files for various
purposes. One of its applications is in creating Makefile with predefined
commands to be performed in your CI/CD pipeline.

```sh
pip install makefilepy
```

## Documentation

This package has 3 classes:

- `Variable`: variables to be used in your Makefile.
- `Command`: commands to be executed using `make`.
- `Makefile`: the Makefile itself, which will contain the variables and commands.

The package is designed to work intuitively.
Take a look at the examples to better understand how to use each class.

### Examples

You will find examples of how to use the package in the [`examples`](examples) directory.

## Contributing

Contributions are more than welcome. Fork, improve and make a pull request.
For bugs, ideas for improvement or other, please create an [issue][issues].

### Lint

To check the syntax using linter, just run the command below:

```sh
make lint
```

### Tests

To test the package just run the following commands:

```sh
# (first time only) Build the Docker image
make build

# Run tests
make test

# Run tests and check coverage
make test-coverage
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[issues]: https://github.com/alvarofpp/makefilepy/issues
