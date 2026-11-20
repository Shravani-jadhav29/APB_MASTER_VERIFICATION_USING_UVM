APB_MASTER_VERIFICATION_USING_UVM

APB (Advanced Peripheral Bus) is a low-power, low-bandwidth bus protocol defined in the ARM AMBA specification and is widely used for communication with peripheral devices in System-on-Chip (SoC) designs
# APB Master Verification Using UVM
# APB Master Verification Using UVM

## Introduction

The Advanced Peripheral Bus (APB) is a low-power and low-complexity bus protocol that is part of the ARM AMBA family. It is commonly used to connect peripheral devices such as UART, SPI, GPIO, and Timers in System-on-Chip (SoC) designs.

This project implements a UVM-based verification environment for an APB Master. The objective is to verify the functionality and protocol compliance of the APB Master by validating read/write transactions, reset behavior, wait-state handling, and error response generation.

## Objectives

- Verify APB Read Transactions.
- Verify APB Write Transactions.
- Validate APB Protocol Compliance.
- Verify Reset Functionality.
- Check Wait-State Handling using PREADY.
- Verify Error Conditions using PSLVERR.
- Achieve Functional Coverage Goals.
- Develop a Reusable and Scalable UVM Verification Environment.

## Verification Components

### APB Transaction
Represents APB read and write operations containing address, data, and control information.

### APB Sequence
Generates directed and constrained-random transactions for verification.

### APB Driver
Drives APB transactions from the sequencer to the DUT interface.

### APB Monitor
Captures APB bus activity and converts signal-level transactions into transaction-level objects.

### APB Agent
Encapsulates the driver, sequencer, and monitor components.

### APB Scoreboard
Compares expected and actual transaction data to detect mismatches.

### Coverage Collector
Collects functional coverage information for addresses, transaction types, wait states, and error conditions.

### Environment
Connects all verification components and facilitates communication.

### Test
Controls verification scenarios and configures the environment.

## APB Signals

- PCLK
- PRESETn
- PSEL
- PENABLE
- PADDR
- PWRITE
- PWDATA
- PRDATA
- PREADY
- PSLVERR

## Test Scenarios

### Reset Test
Verifies proper initialization of all APB signals after reset.

### Write Test
Checks write transactions for correct address and data transfer.

### Read Test
Validates read transactions and compares returned data with expected values.

### Back-to-Back Transfer Test
Verifies consecutive APB transactions without protocol violations.

### Wait-State Test
Checks APB operation when slave inserts wait states using PREADY.

### Error Response Test
Validates APB behavior when PSLVERR is asserted.

### Random Transaction Test
Exercises the design using constrained-random transactions.

## Functional Coverage

The coverage model tracks:

- Address Coverage
- Read Coverage
- Write Coverage
- Wait-State Coverage
- Error Coverage
- Address vs Transaction-Type Cross Coverage

## Features

- UVM-Based Verification Environment
- Constrained-Random Verification
- Functional Coverage Collection
- Scoreboard-Based Checking
- Protocol Compliance Verification
- Modular and Reusable Architecture
- Wait-State Verification
- Error Handling Verification

## Tools Used

- SystemVerilog
- Universal Verification Methodology (UVM)
- EDA Playground
- QuestaSim
- Synopsys VCS
- Cadence Xcelium
- GitHub

## Conclusion

This project demonstrates a complete UVM-based verification flow for an APB Master. Using constrained-random stimulus generation, scoreboarding, and functional coverage collection, the environment ensures thorough validation of APB functionality and protocol compliance. The verification architecture is reusable, scalable, and suitable for ASIC, FPGA, and SoC verification projects.


