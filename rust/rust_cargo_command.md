# Commonly used cargo command in Rust 

`cargo new <project-name>`: Creates a new Rust project with the specified name.

`cargo new <project-name> --vcs none`: Creates a new Rust project with the specified name, without the default Git files and setups. 

`cargo build`: Builds the current Rust project. It compiles the source code and dependencies into an executable or library.

`cargo build --release`: Builds an optimized release version of the project with optimizations enabled. The resulting executable is typically faster but takes longer to compile.

`cargo run`: Builds and runs the current Rust project.

`cargo test`: Runs the tests in the current project.

`cargo clean`: Removes the target directory, which contains the compiled artifacts.

`cargo update`: Updates the dependencies specified in the Cargo.toml file to their latest versions.

`cargo doc`: Generates documentation for the current project and its dependencies.

`cargo doc --open`: Generates documentation for the project and opens it in the default web browser.

`cargo publish`: Publishes a crate to the crates.io registry, making it available for others to use.

`cargo check`: Checks the syntax and type correctness of the code without building an executable. This is faster than cargo build.

`cargo fmt`: Formats the code in the project according to the specified style guidelines.

`cargo bench`: Runs benchmarks for the project. Benchmarks are defined using the #[bench] attribute.

`cargo install`: Installs a Rust binary crate from crates.io or a local directory, making it available for use as a command-line tool.

`cargo search <keyword>`: Searches crates.io for packages matching the specified keyword.

