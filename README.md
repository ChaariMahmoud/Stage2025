
# SafeWasm

**SafeWasm** is a formal verification framework for **WebAssembly (WASM)** programs.  
It translates **WAT (WebAssembly Text Format)** into **Boogie**, enabling automated reasoning with **SMT solving (Z3)** and **bounded model checking (Corral)**, built on the modern **.NET 9.0** platform.

## 🧩 Origin & Motivation

The project originates from the formal verification concepts explored in **Microsoft VeriSol**,  
which translated Solidity smart contracts into Boogie for verification.  
However, **SafeWasm** redefines the vision: instead of focusing on one programming language,  
it uses **WebAssembly (WASM)** as a *universal intermediate representation (IR)* for formal verification.

WebAssembly’s stack-based and deterministic nature makes it ideal for certifiable reasoning,  
allowing verification of programs compiled from various source languages (Rust, C, Go, etc.)  
and across different execution environments — not only blockchains.

## 🌍 Why WebAssembly?

WebAssembly (WASM) provides several properties that make it particularly suitable for formal verification:

- **Portability:** universal compilation target (Rust, C, C++, Go, etc.)  
- **Determinism:** well-defined execution semantics  
- **Safety:** sandboxed linear memory model  
- **Verifiability:** simple, stack-based operational semantics  
- **Adoption:** widely used in blockchain, embedded, and critical systems  

Together, these features make WASM an excellent foundation for scalable and provable verification frameworks.

---

## ✨ Features

### WebAssembly Support 
- Translation of WASM programs to Boogie  
- Support for WASM Text Format (`.wat`) files  
- Stack-based execution model translation  
- Support for complex WASM constructs: loops, conditionals, function calls, and structured control flow  

### Verification Capabilities
- **Inductive verification** (via Boogie + Z3)  
- **Bounded model checking (BMC)** (via Corral)  
- Counterexample generation  
- Transaction / execution sequence analysis  
- Contract invariant inference (future work)  

---

## ⚙️ Verification Pipeline

```
┌────────────┐   ┌───────────────┐   ┌───────────┐   ┌──────────────┐
│  WAT File  │ → │   AST Builder  │ → │   Boogie  │ → │  Boogie VCGen │
└────────────┘   └───────────────┘   └───────────┘   └──────┬───────┘
                                                            │
                                                            v
                                                      ┌───────────┐
                                                      │   Z3 SMT  │
                                                      └────┬──────┘
                                                           │
                                     proves property?       │  fails/unknown/timeout
                                         ✅                 │          ❌
                                         │                  v
                                         v            ┌───────────┐
                                   ┌───────────┐      │ Corral BMC │
                                   │   SUCCESS │      └────┬──────┘
                                   └───────────┘           │
                                                            v
                                                     ┌───────────────┐
                                                     │ Counterexample │
                                                     └───────────────┘
```

SafeWasm translates WAT programs into **Boogie**.  
Verification is performed in two complementary ways:

1. **Boogie + Z3 (SMT-based deductive verification)** to prove properties by discharging verification conditions (VCs).  
2. If Z3 cannot prove a property (e.g., timeout/unknown), **Corral (BMC)** is used to search for a concrete counterexample trace.

---

## 🚀 Key Features

### WebAssembly to Boogie Translation
- Support for **WASM Text Format (.wat)**  
- **AST-based translation** with stack-typed model (`push`, `pop`, `popToTmp`)  
- Control flow constructs: `if`, `loop`, `block`, `br`, `br_if`  
- Arithmetic, logical, and comparison operators  
- Label management for structured flow control  

### Verification Infrastructure
- Automatic generation of **Verification Conditions (VCs)** via Boogie  
- **VC discharge using Z3**  
- **Counterexample search using Corral (BMC)**  
- Modular translation for scalability  
- Support for multiple backends (future): CVC5, IC3/PDR, other BMC engines  
- Detailed verification reports  

### Modular Architecture
- `Parser/` → Parses WAT files and builds an AST  
- `Conversion/` → Translates AST nodes into Boogie statements  
- `Verification/` → Interfaces with Boogie, Z3, and Corral  
- `ToolPaths.cs` → Centralized configuration for Boogie, Z3, Corral, and Binaryen  

---

## 🧠 Research Context

SafeWasm is developed as part of a **doctoral research project** on  
**“Specification and Formal Verification of WebAssembly Programs”**  
conducted at the **Laboratoire de Recherche de l’EPITA (LRE)**,  
under the supervision of **Souheib Baarir**, in collaboration with **Sorbonne Université – EDITE**.

The project aims to design a **certifiable verification condition generator (VCG)**  
and scalable reasoning framework for WebAssembly using Boogie and modern SMT/BMC approaches.

---

## 🧩 Installation

### Prerequisites
- **.NET 9.0 SDK**  
- **Boogie**  
- **Z3** (SMT solver)  
- **Corral** (Boogie BMC / model checker)  
- **Binaryen** or **WABT** tools  

### Build from Source
```bash
git clone https://github.com/ChaariMahmoud/SafeWasm.git
cd SafeWasm/Sources
dotnet build
```

---

## 🧰 External Tools

| Tool | Description | Notes |
|------|-------------|-------|
| **Boogie** | Intermediate verification language + VC generator | Can be installed via .NET or published self-contained |
| **Z3** | SMT solver used to discharge Boogie verification conditions | `apt install z3` |
| **Corral** | **Bounded Model Checker (BMC)** for Boogie programs | Finds concrete counterexample traces |
| **Binaryen / WABT** | WASM parsing/optimization toolchains | Required for AST extraction |

---

## 🧪 Usage

### Basic Command
```bash
dotnet bin/Debug/VeriSol.dll --wasm <file.wat>
```

### Output Files
- **BoogieOutputs/example.bpl** — Generated Boogie code  
- **boogie.txt** — Z3/Boogie verification output  
- **corral.txt** — Corral BMC report / counterexample trace  

---

## 📧 Contact

**Author:** Mahmoud Chaari  
**Email:** [chaarimahmoud55@gmail.com](mailto:chaarimahmoud55@gmail.com)  
**Affiliation:** Laboratoire de Recherche de l’EPITA (LRE) – Sorbonne Université, EDITE  
**Keywords:** WebAssembly, Boogie, Formal Verification, Z3, Corral 

---

> © 2025 Mahmoud Chaari — SafeWasm: A Formal Verification Framework for WebAssembly
