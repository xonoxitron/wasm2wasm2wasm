# wasm2wasm2wasm: Go + Rust + Zig WASM Interop

wasm2wasm2wasm is a project that demonstrates WebAssembly (WASM) interoperation among Go, Rust and Zig modules using JavaScript as the intermediary. The project provides a web-based interface where users can perform addition, subtraction and multiplication operations using Go, Rust and Zig WASM modules.

## Project Structure

The project consists of the following directories and files:

- **go/**: Contains the Go module source code.
  - **go.mod**: Go module configuration file.
  - **main.go**: Go module source code file.

- **rust/**: Contains the Rust module source code.
  - **main.rs**: Rust module source code file.
  - **Cargo.toml**: Cargo manifest file.

 **zig/**: Contains the Zig module source code.

- **main.zig**: Zig module source code file.

- **bridge/**: Contains the JavaScript and HTML files for the web interface.
  - **wasm_exec.js**: JavaScript file necessary for running Go WASM modules.
  - **wasm2wasm2wasm.js**: JavaScript file that handles loading and interoperation among Go, Rust and Zig WASM modules.
  - **wasm2wasm2wasm.html**: HTML file providing the web interface for performing operations.

## Building the Project

To build the project and generate the WASM modules, follow these steps:

1. Compile the Rust module to WASM:

   ```bash
   rustc --target wasm32-unknown-unknown --crate-type cdylib ./rust/main.rs -o ./bridge/rust_main.wasm
   ```

2. Compile the Go module to WASM:

   ```bash
   GOOS=js GOARCH=wasm go build -o ./bridge/go_main.wasm ./go/main.go
   ```

3. Compile the Zig module to WASM:

   ```bash
   zig build-lib -target wasm32-freestanding -dynamic -OReleaseSmall ./zig/main.zig
   ```

## Running the Project

To run the project, you need to serve the files over a web server. You can use any static file server of your choice. Here's an example using the `http-server` package:

1. Install `http-server` globally (if not already installed):

   ```bash
   npm install -g http-server
   ```

2. Serve the project files:

   ```bash
   cd bridge
   http-server
   ```

3. Open your browser and navigate to the provided URL (usually `http://localhost:8080`).

## Interacting with the Web Interface

Once the project is running in your browser, you'll see the web interface with two input fields (a and b) and three buttons for performing addition and subtraction operations.

- **Add with Go WASM**: Calculates the sum of values entered in the 'a' and 'b' fields using the Go WASM module.

- **Sub with Rust WASM**: Calculates the subtraction of values entered in the 'a' and 'b' fields using the Rust WASM module.
  
- **Mul with Rust WASM**: Calculates the multiplication of values entered in the 'a' and 'b' fields using the Zig WASM module.

The result of the operation will be displayed in the 'r' field.

## Understanding the Code

The project consists of three main components: the Go WASM module, the Rust WASM module and the Zig WASM module, which are loaded and interacted with using JavaScript as the intermediary. Here's a brief explanation of each component:

- **Go WASM Module (main.go)**:
  - The `main.go` file contains the Go code for the WASM module.
  - The `add` function performs addition of two numbers and is registered as an exported function using `js.Global().Set`.
  - The `registerCallback` function registers the `add` function as a callback for JavaScript to invoke.
  - The `main` function initializes the Go WASM module, registers the callback, and waits indefinitely for JavaScript calls.

- **Rust WASM Module (main.rs)**:
  - The `main.rs` file contains the Rust code for the WASM module.
  - The `subtract` function performs subtraction of two numbers.
  - The `initialize` function logs a message indicating the initialization of the Rust WASM module.
  - The `extern` block defines the `console_log` function, which allows Rust to log messages to the JavaScript console.

- **Zig WASM Module (main.zig)**:
  - The `main.zig` file contains the Rust code for the WASM module.
  - The `multiply` function performs subtraction of two numbers.

- **JavaScript Interoperability (wasm2wasm2wasm.js)**:
  - The `loadGoWasm` function loads and runs the Go WASM module using the `Go` class and WebAssembly APIs.
  - The `loadRustWasm` function loads and instantiates the Rust WASM module, defining the `console_log` function as an import.
  - The `loadZigWasm` function loads and instantiates the Zig WASM module.
  - The `addWithGo` function is called when the "Add with Go WASM" button is clicked, invoking the Go WASM module's `add` function and updating the result field.
  - The `subtractWithRust` function is called when the "Sub with Rust WASM" button is clicked, invoking the Rust WASM module's `subtract` function and updating the
  - The `multiplyWithZig` function is called when the "Mul with Rust WASM" button is clicked, invoking the Zig WASM module's `multiply` function and updating the result field.

## Conclusion

wasm2wasm2wasm demonstrates how to achieve WASM interoperation among Go, Rust and Zig modules using JavaScript as the bridge. The project provides a clear example of how to load, initialize, and interact with WASM modules from different languages. You can use this project as a starting point for more complex interoperations or as a reference for understanding WASM interop concepts. Feel free to explore and modify the project to suit your needs!
