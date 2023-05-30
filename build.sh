rm -r ./bridge/*.wasm
echo "Compiling Rust to WASM 🦀 <-> 🕸️"
rustc --target wasm32-unknown-unknown --crate-type cdylib ./rust/main.rs -o ./bridge/rust_main.wasm
echo "Compiling Go to WASM 🐿️ <-> 🕸️"
GOOS=js GOARCH=wasm go build -o ./bridge/go_main.wasm ./go/main.go
echo "Compiling Zig to WASM ⚡ <-> 🕸️"
zig build-lib -target wasm32-freestanding -dynamic -OReleaseSmall ./zig/main.zig
mv main.wasm ./bridge/zig_main.wasm
rm *.o
echo "Done ✅"
